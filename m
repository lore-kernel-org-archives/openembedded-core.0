Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FD84C369A2
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 22:54:04 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web10.39555.1744412029406662315
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Apr 2025 15:53:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B/czzcAb;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3f8ae3ed8adso1400005b6e.3
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 15:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744412028; x=1745016828; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=osNpJGWKcxRs+wJ8l/qnDD6L8s1z349E7Bn3BoS/3z8=;
        b=B/czzcAbJAa2xZRXBwCPYjKyC5LgVFR4wPE6YogcmR9z5XrMAcEw+8KKWfKunSsHEU
         pSt32M3u7mq2XcbJPCx1VEF0IQhzXcfjKq6zNlpdu7UNtM4nm19YubPV+C8JBdc+vUyk
         B8ZSfb7o/iAljx6kCrnZChO3YunhQL03YCLXUQ70hQCpgF8ByM+3IM5wmLrNFBG7k2Rz
         i3y8U/D5kR8HpaTc61VUMSE//wbCndXCk8mp6E65CrwaKxnCfTmvp3FZvyF/dbGFR3pH
         VyhjBjJv+RoMxM33wL9ADcq07mI1yuqKYrZmPUTFqe+NuGXTGPk+5Ev56EPDqnz8M2wj
         Tpxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744412028; x=1745016828;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=osNpJGWKcxRs+wJ8l/qnDD6L8s1z349E7Bn3BoS/3z8=;
        b=ARACne869CXiLAbnipYW0J0srN7wlXnC9EQgkVzxyoxM2WyzJBxv/ClDoQOEn5w9wK
         1atUv2xZEvQTnyWh+yNve1KUbBDI4Sl2mntXojvs2nlNGlVcsXYprhggV3IX/9sPc424
         FiIb0Fnyq3PLhjD4n3WVI1lohbNNj3uEdPBU5HoPS+sPbihiV1ttZ+yVicHqgfEJ4hUN
         rP6RnG/FyKw+o/R7SjmGiwkWkNv9ToyoGefR0h0w33n71Fc3TmMDaxiUaRrgvgRMPL5h
         5/vagMeLa3FS6lIk3leAZB4xDsbA0SF+k7A1lbMvCAwf172ekTwNOq0gpSUMSRTn4jrD
         UwdQ==
X-Gm-Message-State: AOJu0YwXsu/EE3CR9UlrcTWubkVwGiKylwPWPPOOt4vDJQVs99DFxngc
	KXEUhc5ACb2uSihOvTzw4TDxdygwN62UHtBG2pTc1rT+ob+hDonSiS9x4qQ61ZJYeeR1NvCdCmp
	ESek1tZ7oji7AmuXSYNaq8pOFF9nwgxURZoM=
X-Gm-Gg: ASbGncu7ClR2coWrMqkQHr2RCeAk5kG6WOiveocTlYbWyu+o702LFx9ENebyUsX+wdb
	/3Rbvu/IvbqFqUvtruBnoVa5ZmoNSEyqQwtsxbd+0jUF9MOv+0CP2cWEzRWpVIzbn+ozlvG9UmK
	NCMQICLrmNap+AsiugOkmj
X-Google-Smtp-Source: AGHT+IHT4Np9lYILTqX7eaZIQGqYlrJmrQKEXngRanWcC/DZiGj6N6kAYXhjj768ISTIptWlG1t9RUGiFv1qlY2m7l4=
X-Received: by 2002:a05:6808:308d:b0:3f6:7e4e:96fb with SMTP id
 5614622812f47-4008508609emr3074060b6e.17.1744412028511; Fri, 11 Apr 2025
 15:53:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250412-mesa-25-fixes-v1-0-791840391271@oss.qualcomm.com> <20250412-mesa-25-fixes-v1-2-791840391271@oss.qualcomm.com>
In-Reply-To: <20250412-mesa-25-fixes-v1-2-791840391271@oss.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 11 Apr 2025 15:53:22 -0700
X-Gm-Features: ATxdqUGL9LPUPfzYzHsOtPpTI2BmF03BlIQc_rePzwZsYF-I1RTI7XH2qKLpDxo
Message-ID: <CAMKF1sqFzfsPgr0LJbGY3djKGGBa9hJD6rYNVC+oT9eP9Cjpsw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/7] meson: pass -target and -I to bindgen calls
To: dmitry.baryshkov@oss.qualcomm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 22:54:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214770

On Fri, Apr 11, 2025 at 3:09=E2=80=AFPM Dmitry Baryshkov via
lists.openembedded.org
<dmitry.baryshkov=3Doss.qualcomm.com@lists.openembedded.org> wrote:
>
> In order to properly generate Rust bindings for the target systems, we
> need to pass '-taget foo-linux-gnueabi' flags and a correct include
> target include path (${STAGING_INCDIR}) to the bindgen. Add those
> flags to the generated meson target file.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  meta/classes-recipe/meson.bbclass | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/classes-recipe/meson.bbclass b/meta/classes-recipe/meso=
n.bbclass
> index cbfc45b94bbd076735847134a0976b6b30784d50..ef45a034a767e979a45553ba0=
8e46dc90e34f33f 100644
> --- a/meta/classes-recipe/meson.bbclass
> +++ b/meta/classes-recipe/meson.bbclass
> @@ -93,6 +93,7 @@ cpp_link_args =3D ${@meson_array('LDFLAGS', d)}
>  [properties]
>  needs_exe_wrapper =3D true
>  sys_root =3D '${STAGING_DIR_HOST}'
> +bindgen_clang_arguments =3D ['-target', '${@d.getVar('RUST_HOST_SYS')}',=
 '-I${STAGING_INCDIR}']

I think its better to use ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}
--target=3D${TARGET_SYS}
here

>
>  [host_machine]
>  system =3D '${@meson_operating_system('HOST_OS', d)}'
>
> --
> 2.39.5
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#214764): https://lists.openembedded.org/g/openembedde=
d-core/message/214764
> Mute This Topic: https://lists.openembedded.org/mt/112219030/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

