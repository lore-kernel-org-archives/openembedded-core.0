Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17A1ECD4857
	for <webhook@archiver.kernel.org>; Mon, 25 Sep 2023 18:28:45 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web11.68990.1695666516262353121
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Sep 2023 11:28:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MXB4uPXO;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-1c4c5375329so3870459fac.2
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 11:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695666515; x=1696271315; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XG4Ry80/okwm4f3XsOM5c5GAj5VoOhDcFUxoFW2y2wg=;
        b=MXB4uPXOyxD7Rxx4sKy1MjFPz5yYjdS/4VyWaJ3Klp+L+5pk0n7b6KRYJ3VPwOGGbI
         Zj3tM3r9b400pAMvsHG3jPA2tn6wQTNCKBKrKnLiax3lponqf33VyyCz4Hk+kOLyMCuU
         8jRxl1e7+Q4TL+5tOUsiUgquqoyCxuKHE9KziDrxACn99dL8LGi+GliyeIjIQbQ4Rmid
         Z2THZ8ShGQHPwMsWG74erdgu4ehmmcPFcSPt0iDeW3xBwN3oEo1ZSJu2JN4E8HbkXRxv
         50hxBCnBiZa6Nh/EGbyyXXBa2mBWqgvNcEfNW/bND78ZDA3WbTzSdHn85ifEW72z8X/x
         LfFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695666515; x=1696271315;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XG4Ry80/okwm4f3XsOM5c5GAj5VoOhDcFUxoFW2y2wg=;
        b=E1UDeALtPStrEspt5wJ0gypeaKiLT74ayK/wBRo0HReKYyPAxvpic6MBKMyz6rczoS
         PJQnX8phU2LJut13ppVI3qD5XzdMQIYzjUAIZTggWIdlg2E0jjVFgGqBESyXKCIwx6NH
         8pfVJmlPoRINDWmJslHnbP3dX5H6xxpRk1e7Ma7b4SHz4gEgr9RmCvib0pViBhxzXB91
         JGypAX7MgfJMoCltbPKrDUs/CASxormkrA7jx35TlijQ+pL3lI33N/4+L16bVusVzfz6
         mdRfe8h+8ho9ACu8K3GRSpJDQJyoGkEfpr2u7CodlvQCMke6z+D96tzbarucf8VbWsNs
         IxSQ==
X-Gm-Message-State: AOJu0YyrxccsFIrN6PqiCj+1xfYAgqGbIWa7IXSL7caEG+Bv3dxC00Y+
	8O/ElCb30//n602bZJq7FuOsmjXs/zvePXI+lIQ=
X-Google-Smtp-Source: AGHT+IFdnX4owGUVCDVZDzlM9L1CcCs9ZauLtGjQI6Z244tw3Lw78VXnNu+WVI1CACqMCg4VnhI7rV8Y9tnSwDwS06s=
X-Received: by 2002:a05:6870:7024:b0:1d5:cdf7:bd95 with SMTP id
 u36-20020a056870702400b001d5cdf7bd95mr8664165oae.16.1695666515396; Mon, 25
 Sep 2023 11:28:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230925113508.1087898-1-ross.burton@arm.com>
In-Reply-To: <20230925113508.1087898-1-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 25 Sep 2023 11:28:09 -0700
Message-ID: <CAMKF1sp971nYNu-HUyhtaczD_kW5kz49N18HdrFZQV9VXQyu1g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] webkitgtk: reduce size of -dbg package
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org, nd@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 18:28:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188210

On Mon, Sep 25, 2023 at 4:35=E2=80=AFAM Ross Burton <ross.burton@arm.com> w=
rote:
>
> From: Ross Burton <ross.burton@arm.com>
>
> Unless DEBUG_BUILD is enabled, pass -g1 to massively reduce the size of
> the debug symbols (4.3GB to 700M at time of writing):
>
>   Level 1 produces minimal information, enough for making backtraces in
>   parts of the program that you don't plan to debug. This includes
>   descriptions of functions and external variables, and line number
>   tables, but no information about local variables.
>
> This makes the sstate objects a lot more manageable, and packaging
> faster.  On my machine:
>
>   PKG          TASK                 ABSDIFF  RELDIFF  WALLTIME1 -> WALLTI=
ME2
>   webkitgtk    do_compile           -613.8s   -21.7%    2823.3s -> 2209.5=
s
>   webkitgtk    do_package           -143.4s   -53.6%     267.7s -> 124.3s
>   webkitgtk    do_install            -93.7s   -60.1%     156.0s -> 62.3s
>   webkitgtk    do_populate_sysroot   -51.6s   -86.4%      59.7s -> 8.1s
>
> Cumulative walltime:
>   -892.9s    -26.5%    56:06.3 (3366.3s) -> 41:13.4 (2473.4s)
>

Thanks, we have had it for qtwebengine for a while. Btw. we need
something similar for
./meta-oe/recipes-support/webkitgtk/webkitgtk3_2.42.0.bb

> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-sato/webkit/webkitgtk_2.40.5.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.40.5.bb b/meta/recipes-=
sato/webkit/webkitgtk_2.40.5.bb
> index a0c97aa593c..0c54f202ca5 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.40.5.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.40.5.bb
> @@ -87,6 +87,10 @@ EXTRA_OECMAKE =3D " \
>                   -DUSE_GTK4=3DON \
>                   "
>
> +# Unless DEBUG_BUILD is enabled, pass -g1 to massively reduce the size o=
f the
> +# debug symbols (4.3GB to 700M at time of writing)
> +DEBUG_FLAGS:append =3D "${@oe.utils.vartrue('DEBUG_BUILD', '', ' -g1', d=
)}"
> +
>  # Javascript JIT is not supported on ARC
>  EXTRA_OECMAKE:append:arc =3D " -DENABLE_JIT=3DOFF "
>  # By default 25-bit "medium" calls are used on ARC
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188185): https://lists.openembedded.org/g/openembedde=
d-core/message/188185
> Mute This Topic: https://lists.openembedded.org/mt/101571944/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

