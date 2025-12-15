Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA1D3D59D99
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 12:03:04 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46810.1765800178426756056
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Dec 2025 04:02:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UgO8nRJy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-47118259fd8so34003795e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 04:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1765800177; x=1766404977; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M7g4zMyEAvhXIBMoiTq0cr1ug4Xh+E2T1t/yCAfZkQU=;
        b=UgO8nRJypY+yNfnPkpzfL4CcgUkdUlTTbIPfBw7rV16sUeQmQ/Yy9j6L8SNSAGlzHU
         GK6iYqYPuVQaDCQT1D6wvvFljbSNd+c+NFnZvtaQ/cp5lw/TMvlFbE3uxhXxNzQtqt4h
         bhJBNCXCfp3TSN041lcHNH5htBDOcDNwiQ9Mo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765800177; x=1766404977;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M7g4zMyEAvhXIBMoiTq0cr1ug4Xh+E2T1t/yCAfZkQU=;
        b=mSREcyk14bISohj8ibQG3BsTF8KO0w0CFw1guyLY8SD04UeDAkng6lvMvgkk/hjMnB
         SVwlMRhvcmMJ6AH9Xe+84f2F/07IWSsTrIe5V96HJaHZb3r8x7JdQbkxaEHEHueuLjXy
         JP+5H9pwOvFQK9v77ZbI01QjV5vJ1+Cl52smf8wZ+Dic3NVRLMJ/moYX9Iexf1fDG4ZT
         RTLCJcV2ZIfoDDAMdBsLCTz8/OZLSx4Zpfs+cBTZ4J2glppFAXDzzyOvf4FtuYjKNyfr
         HOfwepa0Sg14I4kYK0afwe0ZsW8hSzjY/+hFYw1WGoG/J0ZFPfCLMLgwmastgN8pDGBs
         dm5A==
X-Forwarded-Encrypted: i=1; AJvYcCXlnuciJ4BHi5UEm4BUZSTV3E7orfai1WwZwgxSoPVHnSL42yYqPrrbQYbeIl0LDt7dAOoyeGdixPhBVYKTqi2Eew==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy8R1dOXQSQm5k9nIj/JjVLXDSap/LmH1MeewxSnO/QePey76ik
	NB4KZcZVCSGzYd7E/o1Z3xv8y6j1mA/bROc4KvPXv7huBp30CnVKy/7K1kh7Isbkebo=
X-Gm-Gg: AY/fxX6CKAcitl5H1FrSyS/UtEvIRRT2BOcCcHqGVKq2VKY1/TK20z5BlMPuqIGp7uA
	7eXOUSH0YDDQElrQvoo4MI/tkCG2yExIQzf0Bjfun+K7IFkk/roZBZhONGR85NFpfWGDyTokr6g
	hT1xyFQcmWdw/N/bfPUs+OHRlA13K/0nxFme84IokF+lOgfshfDAgPvpdJQwqZE+0RkIXbdXF7i
	uBZle6ipG9zWq2US8QhDavNsUnuFcxv7uj2l/pibOxOlbMmJqGZHydihlBRfRVFPLcB+NYIBm+X
	tJoXtT4y8sQYf6y3sYiaZlsfmR0EY5vxVkos6ksleX3cPP+HACG5x2jrnkBLQ14a/liAQoNkKM3
	bPnfLrxgIcKutd8Jx3zUI7vDerKSskAIIY7o9izWBwqmh7gh66Hh5BDB4ZBX2SNGHjXXIM6CD5m
	NoFiySE0SeOeoZCmjwRonM913zYTH3K93U1g/IfKyk92WkZn6GIMdUOg2/PvHsAywX2vIrx4VH8
	mQKwbM3Ve5yyg==
X-Google-Smtp-Source: AGHT+IHL1end6jQBXWkAJa2804PuBIatMsorOS4TJdq37+fzWvlKHrhdBCLKxqELdOu3L1P75TCdYg==
X-Received: by 2002:a05:600c:4e91:b0:477:641a:1402 with SMTP id 5b1f17b1804b1-47a8f8ab745mr111239935e9.4.1765800176697;
        Mon, 15 Dec 2025 04:02:56 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:fad4:125a:6e75:b598? ([2001:8b0:aba:5f3c:fad4:125a:6e75:b598])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f4a85a6sm72004565e9.1.2025.12.15.04.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 04:02:56 -0800 (PST)
Message-ID: <bb5eb607ba04438257930310d17513b7b959d343.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v5 4/5] debug_build.inc: override
 MESON_BUILDTYPE for meson.bbclass
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: hongxu.jia@eng.windriver.com, peter.kjellerstedt@axis.com, 
	randy.macleod@windriver.com, raj.khem@gmail.com, 
	openembedded-core@lists.openembedded.org, mathieu.dubois-briand@bootlin.com
Date: Mon, 15 Dec 2025 12:02:55 +0000
In-Reply-To: <20251010075258.2161972-4-hongxu.jia@windriver.com>
References: <20251010075258.2161972-1-hongxu.jia@windriver.com>
	 <20251010075258.2161972-4-hongxu.jia@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 12:03:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227733

On Fri, 2025-10-10 at 15:52 +0800, hongxu via lists.openembedded.org
wrote:
> The debug_build.inc is used to collect debug build configuration,
> override MESON_BUILDTYPE for meson.bbclass when DEBUG_BUILD is
> enabled
>=20
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
> =C2=A0meta/classes-recipe/meson.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 3 +--
> =C2=A0meta/conf/distro/include/debug_build.inc | 3 +++
> =C2=A02 files changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/classes-recipe/meson.bbclass b/meta/classes-
> recipe/meson.bbclass
> index c8b3e1ec29..0944ea03cc 100644
> --- a/meta/classes-recipe/meson.bbclass
> +++ b/meta/classes-recipe/meson.bbclass
> @@ -28,8 +28,7 @@ MESON_INSTALL_TAGS ?=3D ""
> =C2=A0def noprefix(var, d):
> =C2=A0=C2=A0=C2=A0=C2=A0 return d.getVar(var).replace(d.getVar('prefix') =
+ '/', '', 1)
> =C2=A0
> -MESON_BUILDTYPE ?=3D "${@oe.utils.vartrue('DEBUG_BUILD', 'debug',
> 'plain', d)}"
> -MESON_BUILDTYPE[vardeps] +=3D "DEBUG_BUILD"
> +MESON_BUILDTYPE ??=3D "plain"
> =C2=A0MESONOPTS =3D " --prefix ${prefix} \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 --buildtype ${MESON_BUILDTYPE} \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 --bindir ${@noprefix('bindir', d)} \
> diff --git a/meta/conf/distro/include/debug_build.inc
> b/meta/conf/distro/include/debug_build.inc
> index 1062326417..c8e2cf90cf 100644
> --- a/meta/conf/distro/include/debug_build.inc
> +++ b/meta/conf/distro/include/debug_build.inc
> @@ -44,3 +44,6 @@ CXXFLAGS:append:pn-vulkan-validation-layers =3D " -
> DXXH_NO_INLINE_HINTS=3D1"
> =C2=A0# No strip sysroot for cross and native
> =C2=A0INHIBIT_SYSROOT_STRIP:class-cross ?=3D "1"
> =C2=A0INHIBIT_SYSROOT_STRIP:class-native ?=3D "1"
> +
> +# For meson.bbclass
> +MESON_BUILDTYPE ?=3D "debug"

Should we do this only for target by default?

Cheers,

Richard


