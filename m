Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F508C83F3E
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 15:01:13 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.23751.1693926071602524170
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Sep 2023 08:01:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iKexA30m;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-31dcd553fecso2173246f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 08:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1693926070; x=1694530870; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=f87l0G98/5PMNv90TkErQCG36HbnioA0gahEJSnvtHo=;
        b=iKexA30msQ2ZQ3GITgq/U7E4yA6pY+Hh7+Bv2neOubuFl/kes/HvwzCn4kAR/UvTIm
         JNi2dRgOaXiXDIhSJ/CiBiVyj7Bzu9Mpxsmom1oR0RHDRT8R76Vmph8M1fQ1eaXe6abT
         5LJmYm/rTCyxyN7M2nxMn/uaf9E2iEc5xs3Y8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693926070; x=1694530870;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f87l0G98/5PMNv90TkErQCG36HbnioA0gahEJSnvtHo=;
        b=iCweHe3uIk7DMIBYlFDCJR3LMSoHAXyP6/NyQMWVXktuja8py1fi0b/k/lkCoZkKLX
         RL2aBjJEHnrrfKRwlLdXlfLhxGq1DxPwmDZW1PqqBwmBAZJSs2HhhJ0IAr7TQ+AqHTXy
         Ijv10HXuWCsbGQJh137UgQxZqZEhGXe8kEyCmlhdNpsGJUQJ7izKsQwCkRolbbjGdEtJ
         FSO856qTgh73GY9BQYkZxEjgTfn9GhIibbv2l3h+l9beXB3hbryqrCZP3130Zcc5JUCC
         D/IrJPmH7xboM5riHpMhZy3z/dRpjeb0ez5dFfpQtKqMVTQuaR1J/PrK74GHQvUpcBOm
         BjMA==
X-Gm-Message-State: AOJu0YyPeph+ActCtq64QIfmoS/QkKBLkZsjPExWOgV1FYz7ZDXdUAlZ
	z3iNcIQz36Lo2zi27KmfrtzrDQ==
X-Google-Smtp-Source: AGHT+IEHRtuftfg+OCE6xvdsgmk/JNBgdc3JsbEXJmZpRMHfkBL0sYaxqX57UgATcNV0kAL6OQW3+g==
X-Received: by 2002:adf:e2d2:0:b0:317:5ddb:a8bf with SMTP id d18-20020adfe2d2000000b003175ddba8bfmr60557wrj.29.1693926069922;
        Tue, 05 Sep 2023 08:01:09 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9cbb:8ec6:1cb5:104e? ([2001:8b0:aba:5f3c:9cbb:8ec6:1cb5:104e])
        by smtp.gmail.com with ESMTPSA id a3-20020a056000050300b003179d5aee67sm17635096wrf.94.2023.09.05.08.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 08:01:09 -0700 (PDT)
Message-ID: <d6d5598f23547bbae7cdd739cd2346dbfdf14a1c.camel@linuxfoundation.org>
Subject: Re: [PATCH 8/8] linux-yocto: add gzip-native to DEPENDS
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 05 Sep 2023 16:01:08 +0100
In-Reply-To: <f3349fa06ed7e549e1ae15ac3e18ef779d34f8b8.1693924532.git.bruce.ashfield@gmail.com>
References: <cover.1693924532.git.bruce.ashfield@gmail.com>
	 <f3349fa06ed7e549e1ae15ac3e18ef779d34f8b8.1693924532.git.bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 15:01:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187226

On Tue, 2023-09-05 at 10:37 -0400, bruce.ashfield@gmail.com wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>=20
> When building a compressed kernel image on a host with an older
> gzip, the following error can occur:
>=20
>   ERROR: linux-yocto-6.4.11+git-r0 do_compile: oe_runmake failed
>   ERROR: linux-yocto-6.4.11+git-r0 do_compile: ExecutionError('tmp/work/q=
emux86_64-poky-linux/linux-yocto/6.4.11+git/temp/run.do_compile.1715845', 1=
, None, None)
>   ERROR: Logfile of failure stored in: tmp/work/qemux86_64-poky-linux/lin=
ux-yocto/6.4.11+git/temp/log.do_compile.1715845
>   Log data follows:
>   | DEBUG: Executing shell function do_compile
>   | NOTE: KBUILD_BUILD_TIMESTAMP: Mon Aug 21 15:35:20 UTC 2023
>   | NOTE: make -j 24 CC=3Dx86_64-poky-linux-gcc  -fuse-ld=3Dbfd -fcanon-p=
refix-map -fmacro-prefix-map=3Dtmp/work-shared/qemux86-64/kernel-source=3D/=
usr/src/debug/linux-yocto/6.4.11+git-r0 -fdebug-prefix-map=3Dtmp/work-share=
d/qemux86e
>   |   GEN     Makefile
>   |   DESCEND objtool
>   |   CALL tmp/work-shared/qemux86-64/kernel-source/scripts/checksyscalls=
.sh
>   | make[3]: 'install_headers' is up to date.
>   |   GZIP    arch/x86/boot/compressed/vmlinux.bin.gz
>   | gzip: abort: zlib version less than 1.2.3
>=20
> We can't juse depend on zlib-native, as gzip isn't built by the
> kernel as a tool, so we add gzip-native to our DEPENDS and the
> issue is resolved.
>=20
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-ker=
nel/linux/linux-yocto.inc
> index 0cc303c009..945e7bb9d3 100644
> --- a/meta/recipes-kernel/linux/linux-yocto.inc
> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> @@ -18,7 +18,7 @@ python () {
>          raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel=
 to %s to enable it" % (d.getVar("PN")))
>  }
> =20
> -DEPENDS +=3D "xz-native bc-native"
> +DEPENDS +=3D "xz-native bc-native gzip-native"
>  DEPENDS:append:aarch64 =3D " libgcc"
>  KERNEL_CC:append:aarch64 =3D " ${TOOLCHAIN_OPTIONS}"
>  KERNEL_LD:append:aarch64 =3D " ${TOOLCHAIN_OPTIONS}"

I'm not entirely convinced this was the issue as I saw this myself
locally. A "bitbake virtual/kernel -c clean" made it go away so it was
more that the version of libz in the sysroot changed and an existing
kernel build didn't notice...

Cheers,

Richard


