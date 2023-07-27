Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD71EC001DC
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 08:38:48 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.3039.1690447118582364583
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 01:38:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hChnaMbE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-4fe1b00fce2so205302e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 01:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1690447116; x=1691051916;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3fap14J0LXxe8ehwuUYZ1fRkF7Yhgi8Mvi5t02YWSLk=;
        b=hChnaMbEckiakQjJjrVo0eKmB01jouKelM0UntBIGea2ObK2REyX8/SRLuFKdvo2Po
         /at+nfrCRuAkl7GuTXLy4jbFrNZJFpHa+/Qq/yveXyJ1LQcNar9o8rzxgOetW8l4ams9
         LI39R5HVXgqIuZWyL/+IqKAoYrVR1lw6z0kI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690447116; x=1691051916;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3fap14J0LXxe8ehwuUYZ1fRkF7Yhgi8Mvi5t02YWSLk=;
        b=jarKhwbYsZ/3Ugkl3Uo9F2g/6SEQTMeEg8j8kGmRiEe2oiWsfj7+Gt9wtalgBpqK+t
         P/MuWlxUCgUAZjGUFm2ZujIaYSFUNHrB+BuzZQ9QPoeegk/bQT3jlzLrLoHS8XsuUZit
         SinCDggbi+recVTQl6qcgAuNJw5k0h1vAcluuw/Vfp5sOhGBlvi/xtNwDciY7XdBdsLt
         u67WRmQofQW6nhIFxYDbRVZTcMcTOLLXfhB5ps02DXRmkbv4VgGJ+neVz7LzmtwvAnon
         KHBiFSZIj70/92j24faCh25qFkTRtoCjX3pnAOW4B+MSPMG+IlpYxF5+Oa2WxMZ4DrYZ
         bw+A==
X-Gm-Message-State: ABy/qLbYKuIZ0rwu8/dvO8l+9QI6WPQLIF8p+prj44pA6U8b/VYQfR3f
	dRUMXZ54Isk7uVRVb72Hk+s1oA==
X-Google-Smtp-Source: APBJJlGIdjX3PJTgQ5o+uPOQWkVWPdCwRgGf7WW1UekwScwDW+vToLUKhMWq6eNDTp089jpyhtLRwA==
X-Received: by 2002:a05:6512:682:b0:4fb:893e:8ffc with SMTP id t2-20020a056512068200b004fb893e8ffcmr1137694lfe.17.1690447116444;
        Thu, 27 Jul 2023 01:38:36 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:efd1:4b49:509f:a1e1? ([2001:8b0:aba:5f3c:efd1:4b49:509f:a1e1])
        by smtp.gmail.com with ESMTPSA id m14-20020adffa0e000000b003177e9b2e64sm1314287wrr.90.2023.07.27.01.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 01:38:35 -0700 (PDT)
Message-ID: <1a913a55f07b7d094451690c86c14348120a51a3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] ltp: Use bfd linker when lld is distro
 linker default
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Thu, 27 Jul 2023 09:38:35 +0100
In-Reply-To: <20230727075604.2954034-1-raj.khem@gmail.com>
References: <20230727075604.2954034-1-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 08:38:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184922

On Thu, 2023-07-27 at 00:56 -0700, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2: Also fix KVM_LD and remove -fuse-ld=3Dlld
>=20
>  meta/recipes-extended/ltp/ltp_20230516.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-extended/ltp/ltp_20230516.bb b/meta/recipes-ext=
ended/ltp/ltp_20230516.bb
> index e9407d3148e..1efb7637dcf 100644
> --- a/meta/recipes-extended/ltp/ltp_20230516.bb
> +++ b/meta/recipes-extended/ltp/ltp_20230516.bb
> @@ -41,13 +41,15 @@ inherit autotools-brokensep pkgconfig
>  # https://sourceware.org/bugzilla/show_bug.cgi?id=3D18097
>  # https://github.com/linux-test-project/ltp/commit/3fce2064b54843218d085=
aae326c8f7ecf3a8c41#diff-39268f0855c634ca48c8993fcd2c95b12a65b79e8d9fa5ccd6=
b0f5a8785c0dd6R36
>  LDFLAGS:append =3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold'=
, ' -fuse-ld=3Dbfd', '', d)}"
> +LDFLAGS:remove =3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld',=
 '-fuse-ld=3Dlld', '', d)}"
> +LDFLAGS:append =3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld',=
 ' -fuse-ld=3Dbfd', '', d)}"

Why do we need the remove? Nobody would set both ld-is-gold and ls-is-
ldd would they?

I don't really like remove on principle in OE-Core...

Cheers,

Richard

