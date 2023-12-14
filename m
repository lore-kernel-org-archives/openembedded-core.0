Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30E01C4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 13:23:28 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.21804.1702560200661222183
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 05:23:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=efLYeXCU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40c46d6784eso41493235e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 05:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1702560199; x=1703164999; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yzY5nUq2gSbBl0N1iARQihZEXR13r+mCGWr3g78HW5M=;
        b=efLYeXCUqs/88b5ZmFe/MkhBmYqiN48QTOWkx7IZthqn7JDZgoxdotdv87ljOsinci
         MmWJ25pbJBuaFcOE6zdTiXH79tXyiFCWKguvJHvWrSZlv0bwFCgVqm7GhnlnUCUZVpDk
         zfK1VQnXEOTosSEePZm+NnDat8aMo0tSA4PXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702560199; x=1703164999;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yzY5nUq2gSbBl0N1iARQihZEXR13r+mCGWr3g78HW5M=;
        b=wjJvS3Thtq3YIalUpOgsMlVL6ac9XDAvWfu89Iohz16BBI/Knys0mSt2qsP4qINOfq
         jt21LCfNsl+ZYQJZ5x13NIg+cwQelfNsP4pORIPYBTXXmpVFvTSVBxaB1TQZY2axHr1J
         AWYz/u7J8EdEyqvfH4PLnDbKCvCkV5ZFA1JN4blgySpvLAOCr7EdU2aXY8fQa5EOTqbS
         XLCID9DGFabYQgXf6n59EQTs0omdvBQtshSAQUWti+yn9wz+Ojk8ds692oxcf9i4BC/F
         jzJ1hNv7p3wrGDZhePEdaiTzeiNPaBv9O4+qCj0SpV1jxu9YD5md6gHZxJdXBtz/GW/g
         ZOEA==
X-Gm-Message-State: AOJu0YyEoh1Sc9xi3eUnPWH56uBD8hGOsk8WQ9VjdClvIHqDvoU9q6KG
	c9FrpwMvl6C8nRdipqiA1TkEvA==
X-Google-Smtp-Source: AGHT+IFgqdg2pJCuEj/OOKLa36/w1RRpn/ZqRd5bOdgZwgH2rjpsRw7YP93ECh+5lQHGRlAzBvyovQ==
X-Received: by 2002:a05:600c:492f:b0:40b:5e21:ec28 with SMTP id f47-20020a05600c492f00b0040b5e21ec28mr5225081wmp.90.1702560198998;
        Thu, 14 Dec 2023 05:23:18 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:e972:7f32:1182:98d2? ([2001:8b0:aba:5f3c:e972:7f32:1182:98d2])
        by smtp.gmail.com with ESMTPSA id fm14-20020a05600c0c0e00b00407b93d8085sm27038911wmb.27.2023.12.14.05.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 05:23:18 -0800 (PST)
Message-ID: <2a45421d4e4cbcf17df57df128af58346e576fed.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3] strace: Disable bluetooth support by
 default
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yoann Congal <yoann.congal@smile.fr>, 
	openembedded-core@lists.openembedded.org
Cc: Tim Orling <ticotimo@gmail.com>, Martin Jansa <martin.jansa@gmail.com>, 
	Ross Burton <ross.burton@arm.com>
Date: Thu, 14 Dec 2023 13:23:16 +0000
In-Reply-To: <20231213085657.2552223-1-yoann.congal@smile.fr>
References: <20231213085657.2552223-1-yoann.congal@smile.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 13:23:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192368

On Wed, 2023-12-13 at 09:56 +0100, Yoann Congal wrote:
> The bluetooth support adds a bluez5 dependency (and,recursively, a lot
> of other stuff). Disable it by default to avoid having to build all of
> this when it is not needed.
>=20
> This decrease the number of tasks run for a core-image-minimal build by
> ~1000 (-21%).
>=20
> To re-enable bluetooth support in strace, add "bluez" to strace
> PACKAGECONFIG. For example, in local.conf:
>   PACKAGECONFIG:append:pn-strace =3D " bluez"
>=20
> Fixes [YOCTO #15323]
>=20
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> Suggested-by: Ross Burton <ross.burton@arm.com>
> ---
> v1->v2:
> * Fixed local.conf example (thanks Tim)
> * Added Suggested-by: Ross (thanks Ross)
> * Removed an extra empty line
> v2->v3:
> * Added missing leading space in local.conf suggestion (thanks Martin)
> ---
>  meta/recipes-devtools/strace/strace_6.6.bb | 4 ----
>  1 file changed, 4 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/strace/strace_6.6.bb b/meta/recipes-de=
vtools/strace/strace_6.6.bb
> index a3de7941cf..eeffe477b3 100644
> --- a/meta/recipes-devtools/strace/strace_6.6.bb
> +++ b/meta/recipes-devtools/strace/strace_6.6.bb
> @@ -22,10 +22,6 @@ inherit autotools ptest
>  # Not yet ported to rv32
>  COMPATIBLE_HOST:riscv32 =3D "null"
> =20
> -PACKAGECONFIG:class-target ??=3D "\
> -    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)=
} \
> -"
> -
>  PACKAGECONFIG[bluez] =3D "ac_cv_header_bluetooth_bluetooth_h=3Dyes,ac_cv=
_header_bluetooth_bluetooth_h=3Dno,bluez5"
>  PACKAGECONFIG[libunwind] =3D "--with-libunwind,--without-libunwind,libun=
wind"

Thanks. I've tweaked the version I queued in master-next to leave a
comment in the recipe about why we've done this so someone in a few
years time understands.

Cheers,

Richard

