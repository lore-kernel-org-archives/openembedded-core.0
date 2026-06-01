Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3658CD5BD1
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 12:58:39 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27870.1780318709323770264
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 05:58:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WnOve94a;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45ef41adbc1so1835944f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 05:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1780318707; x=1780923507; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wcQfFZI8fAWntnx8LypJ9CrrYgFgik9S0NcZec1NEnM=;
        b=WnOve94aXIp1eKgrWqzzxLQ0XRQ4mzkKFPeooUl7wYyxhzQ52O04qcOzpsdJDeKCF5
         OVOES4yTQ//9usGs13Ka0aHjOM4ofaVto6n95MUG+YUZmBM3oQN3KL8ujoD4Oz7+6O79
         YaRz0vRPYcWqJ0L1X7ZmesQFIZ2Uli+kOy2Fo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780318707; x=1780923507;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wcQfFZI8fAWntnx8LypJ9CrrYgFgik9S0NcZec1NEnM=;
        b=aBda/6GcCrq3wq0hkFrc+iBt09YIKSJKY+ny7dCwW1HvJ6wYfl6tXllG/H8lLGkp+6
         GKPJRiuxR/VK1ksnlnSIKUPNwbzALEJIDNlcMR71cHNApizYmipadBs2eMi3au/4CN7P
         1WBlO2f152o1A0MsoQmb+TDut2g5QLMBMbkxCUfWnbpGNA9KxvBpaszv3SpUD5vE2Zg7
         gswDcwdjDyLHipVFYrc+Dt6/6RiMB+/60yVukEB2Q/0o6FY+LVgGMhGPWwL0d4e3kodl
         WPIP/Pp48m0fSviD3vm6F4kGzp74vusE3sj3XKAK7Jnma4kHU2G99yAnV93hjQQCtjU2
         45YQ==
X-Forwarded-Encrypted: i=1; AFNElJ/GEkbxxobHwhsCpMaRXJGutLDe8Y83D1s7GHhgLEG1zopAD65hCfvQ0tOJmClcM1pwjSP0IMnFUJpiZxFpXKu1Yg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzsTZFyviCEpjZLtVq3SyYgysEdxJeg3uKWW6GjYd4Zh8kks0Jj
	IffdGq7ar5r0FqsFLWZsKZC/Wv1rsFuq6HrhX1wGBhIVZprzEsXMBcamXaGki0gZUouvMJKgTN+
	8jKVf
X-Gm-Gg: Acq92OHS5mtXwPTWPriscThpxz2Ifh9G8LNMEc5i+DX5n4AcGYX+zmYl1xRdDNHLTsU
	rfTGHU8nEin0FytaI3a3tpRHBNlSSO+N6oLLWX8vRxp0D7PyqY46xYrYamfeCLA2bOa270UQQB3
	bDIsPgHa/qzCUeSqYxk6fXfvlLfboFC3DCbxgM+wSqqLMEXahwBI3DN+CzzLaEDK0fvi4JoX4jZ
	J51/G9ANwV/k3yG8PnAHFl180LBaUVVvWWnIKHxXR9sB3l1/1EteLca6xqhCtIxX915tKkYqqPv
	Cx9QvMeT8mrHWdvhN7Ck3Kd+7rIl4yqz07kr4CYsqrAjc0giIW1hNlaVXbGTY547KOmTftHhNxv
	PFS76ObScOLFIdO/6z3iTliD5c7QiUw3bZxwKE360yQB3ik2FBkWcoo8HkF4elLdiL/rgPoHef6
	oOuNkI3KgKBFs4k+mGISb0LICrFKQ6wuO3NUUC7jmWL/4Lb2rL7nTzSbGQVnjngBLs4gm+IXoZ3
	bTXpNq3ASwI3ljEmeAKSKMn
X-Received: by 2002:a05:6000:4284:b0:45f:f142:d56a with SMTP id ffacd0b85a97d-45ff142d72bmr13528629f8f.20.1780318707431;
        Mon, 01 Jun 2026 05:58:27 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:91e5:137:d314:95b7? ([2001:8b0:aba:5f3c:91e5:137:d314:95b7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34c3081sm25362554f8f.15.2026.06.01.05.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 05:58:26 -0700 (PDT)
Message-ID: <d8fc1abd30e80b4d689270bbb21538f6c299e4f7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] qemuboot.bbclass: regenerate .qemuboot.conf
 after do_image
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: sivakumar.bs@gmail.com, openembedded-core@lists.openembedded.org
Date: Mon, 01 Jun 2026 13:58:25 +0100
In-Reply-To: <20260601112329.142238-1-sivakumar.bs@gmail.com>
References: <20260601112329.142238-1-sivakumar.bs@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 12:58:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237830

On Mon, 2026-06-01 at 16:53 +0530, Siva Balasubramanian via lists.openembed=
ded.org wrote:
> do_write_qemuboot_conf was chained after do_rootfs, so it only ran
> when the rootfs was rebuilt. If only the kernel was rebuilt (or any
> change that regenerates the image without invalidating the rootfs
> sstate), the .qemuboot.conf was left stale while new image artifacts
> were deployed with a new timestamp suffix. This caused runqemu to
> reference mismatched or missing artifacts.
>=20
> Move the task to run after do_image instead, so the conf file is
> always consistent with whatever was last deployed.
>=20
> Fixes: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14520
> Signed-off-by: Siva Balasubramanian <sivakumar.bs@gmail.com>
> ---
> =C2=A0meta/classes-recipe/qemuboot.bbclass | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes-recipe/qemuboot.bbclass b/meta/classes-recipe/q=
emuboot.bbclass
> index 56106b1958..47ce16935f 100644
> --- a/meta/classes-recipe/qemuboot.bbclass
> +++ b/meta/classes-recipe/qemuboot.bbclass
> @@ -127,7 +127,7 @@ QB_DRIVE_TYPE ?=3D "/dev/sd"
> =C2=A0inherit image-artifact-names
> =C2=A0
> =C2=A0# Create qemuboot.conf
> -addtask do_write_qemuboot_conf after do_rootfs before do_image
> +addtask do_write_qemuboot_conf after do_image before do_build
> =C2=A0
> =C2=A0def qemuboot_vars(d):
> =C2=A0=C2=A0=C2=A0=C2=A0 build_vars =3D ['MACHINE', 'TUNE_ARCH', 'DEPLOY_=
DIR_IMAGE',

Shouldn't we be fixing the task's dependencies so that it runs at the
right time anything it references changes?=C2=A0

I'm not really seeing how this will improve things if to use your
example, the kernel is rebuilt since you haven't added a dependency on
that...

Cheers,

Richard

