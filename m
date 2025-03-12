Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62AE5C28B2E
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 17:35:56 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.1147.1741800950100676362
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 10:35:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EReiJvGC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4393dc02b78so337685e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 10:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1741800948; x=1742405748; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+gCHYqMLME1zDE6MTl5yYPDVYPIrhUpLfpGNWdD2e3I=;
        b=EReiJvGCn+xQraRp3ua5FZi4DRfPuC6vmcjhsUHhPGfN3H/tr0Bcg58RG5kJMLYX9O
         hWhopvq41ZyKjWl8QWPxyHm51fNLI/D1Y5MTjFoBngxPOWPK5l/wsC54CP4OJJOdhHBG
         8bECrUMZZ2tMPRRgJuLIrU4k9yiPgobZHUrLQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741800948; x=1742405748;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+gCHYqMLME1zDE6MTl5yYPDVYPIrhUpLfpGNWdD2e3I=;
        b=oblGkEVgoyTj4wO8YhSWgD1U7YHes9XFPfb/YKxtRxFYHWzg//24RXlM3/AnlGsVJ6
         6AXn/syOupQRrnTu4cjuMWyiTpwIzDroC+AjztcPfPV+4lc3jdstyGdiRYC5WA9mfKhB
         QIKJumrWCT4P64L8SRS4FLROSJRxPqol3u+nMjSZhe/jbg7hSJZctJvXXulLRce+4jmx
         ty2Shx5+CmjKm44fGXQ/slkTR1R0ksycX/Kbpe/m30x8fCS31wiwDxdvYbnLPon100OS
         1j7u50UouNhLwt12/IiApW8aQ5Pr2SSNxqAMxEqrBwAexKRAJgW5wwoRcmH8hkGA+GIZ
         8oKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUPexjcvBfcwZPoH9ralkRVxOMKjiqlPapwMGH+eTYZdKeGeav1chdki1ERpM7G30RvZXx4mFDoNStHL8PtYkn+g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwMrhPsaM1oZdVxTdXc6VGrvZDGMuztwakMaLmc3xouqy0695vf
	fFYsB0nvhPCTvEjW6UjwhXdqzctFD2LvjiU4ZMEHXEcnTIa+HkJP5WGzz4Hl3f0=
X-Gm-Gg: ASbGncuxmRa3EkWKlEGr3+TJ5M5XTFSFMtE3NUaQgh4CnyFHzbRRY06OPoQAu8IScYP
	hdusjkdQnnXMYb9hWiXQbjEmTFNwK/r5tkvz7u/dM9ayZfYkKlkaZc/WZf+TEo1QC3o2BN+oX3g
	RJZqQDMgVa7ii9XMFRN2KXq2gnsFGoyEWnIYHgdcincMMDZTKoccZON/7JmWg/4fXMP/j6u3yLV
	erSTiFBaL4yMY+COtetpNAqWBuT/qfntqRpuon3Oeigs77ogrgkgNKXsAansE4z7DKc38Dh8Cga
	KrNdrcjJ6FGKVSnO/L2VQ/n+6/F7RqbfHdMDqS/UqDowMEZ0uqUMSflpOE/3O3vQOUMZ/v9bnwC
	MYdjt8bKd+QC5peBg7HBfsPVdj4LrdNm0QA==
X-Google-Smtp-Source: AGHT+IGZQs16pCmR+XCC4uIV9mlAZJIRxSFX/UtIK9DT6DruYhi7rt24CkuL0LJ6WCVPZ8KGNXTmzQ==
X-Received: by 2002:a05:600c:1c9a:b0:43c:e8ba:e166 with SMTP id 5b1f17b1804b1-43d01c1daebmr78815105e9.22.1741800948476;
        Wed, 12 Mar 2025 10:35:48 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2e47:5514:f110:6855? ([2001:8b0:aba:5f3c:2e47:5514:f110:6855])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d0a74c48esm27261915e9.15.2025.03.12.10.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 10:35:47 -0700 (PDT)
Message-ID: <ad57ccc7a58787ef153e08802fbcaacc1119b0f8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] glib-2.0: address ptest failures
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alex.kanavin@gmail.com, openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>, Mathieu Dubois-Briand
	 <mathieu.dubois-briand@bootlin.com>
Date: Wed, 12 Mar 2025 17:35:47 +0000
In-Reply-To: <20250312123610.4018764-2-alex.kanavin@gmail.com>
References: <20250312123610.4018764-1-alex.kanavin@gmail.com>
	 <20250312123610.4018764-2-alex.kanavin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 17:35:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212661

On Wed, 2025-03-12 at 13:36 +0100, Alexander Kanavin via lists.openembedded=
.org wrote:
> From: Alexander Kanavin <alex@linutronix.de>
>=20
> Particularly:
> - one of the tests requires a C.utf-8 locale
> - another needs .gir files to be installed
>=20
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
> =C2=A0meta/recipes-core/glib-2.0/glib.inc | 3 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib=
-2.0/glib.inc
> index c6e2d6e1a0a..1e22a59ffa7 100644
> --- a/meta/recipes-core/glib-2.0/glib.inc
> +++ b/meta/recipes-core/glib-2.0/glib.inc
> @@ -157,7 +157,8 @@ CODEGEN_PYTHON_RDEPENDS:mingw32 =3D ""
> =C2=A0
> =C2=A0RDEPENDS:${PN}-codegen +=3D "${CODEGEN_PYTHON_RDEPENDS}"
> =C2=A0
> -RDEPENDS:${PN}-ptest +=3D "${PN}-utils"
> +RDEPENDS:${PN}-ptest +=3D "${PN}-utils ${PN}-dev locale-base-c"
> +INSANE_SKIP:${PN}-ptest =3D "dev-deps"
> =C2=A0

Probably needs a libc override as it breaks musl:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/1183

Cheers,

Richard


