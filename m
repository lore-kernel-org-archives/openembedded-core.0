Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 779EFC43334
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 08:38:43 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.3270.1657183116078839986
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 01:38:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Dzq4UyiX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id n185so10186536wmn.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 01:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=sSEK70Q/cLJxnq61+sDAj+HpiYh6s3xH4L4snVEMDhM=;
        b=Dzq4UyiXTK7uAKO2s+9QwYTgTJHHUXhTEmR8XeYsWB3xCzb3b65Z2rbtWUKEckHkEH
         6Wx0llSWPKHru99Kkrv6ZVrECT9+hVqhDWUSdwFniPbzcFmSgReBA2pmDOrRngi3tk5D
         aOvfQdVgXvc6D1C+cq2Yjx772KJHDJee2PVkc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=sSEK70Q/cLJxnq61+sDAj+HpiYh6s3xH4L4snVEMDhM=;
        b=bmgZvpbR8tBvkxbDy2TexBnAVoYTbM4wbnkhm012q52D8bw3KEYxHT/F4lvJfX7RpH
         4uFkTf4Tko1uHdbeUmoocnrIagapJcPNFFy19BJRSJYWEefclX98l5ADqwVYfrii6eS1
         l+Pmc59eTKYQUKqehA0x3q4+N+n2RfB0J+6RTcIo9uRll0gnQISb9m9mJPdOVIFxAycG
         eyhoSLHnlkCQlJUmUTzF/ibkseZyL18P38e+8j73Mmeu1kynvuwfA5OEo7NSdNYIISrr
         BNkxeQTX0qg2OzN0SplpWtp+ptHJGzIRBOYT46VGK5GaB+YDfEQU78C1PoB2IuIYDAgx
         ++hg==
X-Gm-Message-State: AJIora8cW0P/bMfPmLOi0WHtrF6C39uwxGlB5L5VJSmtVi6IpVvIAC3u
	6UVczCp/4xSpYfJMDd8l0UsPVg==
X-Google-Smtp-Source: 
 AGRyM1uTmfKzEQsnZqzwGyohJG8nlnaVBIXuh8oT2ywAKwA5Me/gd11z4hs/nUnWy6ri4F9uhXqi1w==
X-Received: by 2002:a05:600c:3847:b0:3a1:db24:b7c9 with SMTP id
 s7-20020a05600c384700b003a1db24b7c9mr3157668wmr.24.1657183114321;
        Thu, 07 Jul 2022 01:38:34 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e441:58cf:44fd:9058?
 ([2001:8b0:aba:5f3c:e441:58cf:44fd:9058])
        by smtp.gmail.com with ESMTPSA id
 r23-20020a05600c321700b003a03564a005sm23149317wmp.10.2022.07.07.01.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 01:38:34 -0700 (PDT)
Message-ID: 
 <054612390f09ab87115bdf160682495e8e06c4f8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] ltp: Remove -mfpmath=sse on x86
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Thu, 07 Jul 2022 09:38:33 +0100
In-Reply-To: <20220707035911.2153302-1-raj.khem@gmail.com>
References: <20220707035911.2153302-1-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Jul 2022 08:38:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167762

On Wed, 2022-07-06 at 20:59 -0700, Khem Raj wrote:
> Fixes build errors seen with clang
> error: the 'sse' unit is not supported with this instruction set
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-extended/ltp/ltp_20220527.bb | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-extended/ltp/ltp_20220527.bb b/meta/recipes-ext=
ended/ltp/ltp_20220527.bb
> index b3ef8f59105..034b62b321e 100644
> --- a/meta/recipes-extended/ltp/ltp_20220527.bb
> +++ b/meta/recipes-extended/ltp/ltp_20220527.bb
> @@ -19,6 +19,7 @@ EXTRA_OECONF:append:libc-musl =3D " LIBS=3D-lfts "
>  # is set to -O0 or frame pointers have been enabled by -fno-omit-frame-p=
ointer
>  # earlier in CFLAGS, etc.
>  CFLAGS:append:x86-64 =3D " -fomit-frame-pointer"
> +TUNE_CCARGS:remove:x86 =3D "-mfpmath=3Dsse"
> =20
>  CFLAGS:append:powerpc64 =3D " -D__SANE_USERSPACE_TYPES__"
>  CFLAGS:append:mipsarchn64 =3D " -D__SANE_USERSPACE_TYPES__"

I really don't like remove operations in OE-Core. If it is
incompatible, why is it there in the first place? Does that need to be
clang only?

Cheers,

Richard


