Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73BD210775E7
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 16:51:25 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19157.1773852679518871559
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 09:51:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ULvsSOav;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43b48ac2727so8349f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 09:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773852678; x=1774457478; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zKP7Ei0IViJE7UhBsLtivpnWIPjglQA1ApbEQqtBUVQ=;
        b=ULvsSOav0syGhD80vHbP9uejjlagV3f33PXD4OgL+x9Ox9xhJPWOcBtSyQpcuh70HH
         imVtNwKASbyL1tizeF0/KW6zuGgxsVAq4HFREyJKOjQbxv9eU2Q1X+bL1wP3ViWWm4My
         WeWaoHV4Weh6MEqwUQX10A86bqpU22vYzlhNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773852678; x=1774457478;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zKP7Ei0IViJE7UhBsLtivpnWIPjglQA1ApbEQqtBUVQ=;
        b=NofdOlgw3XeGYyze8xWcE16iEbQVGs5YkllTii3bZCEm5L+oSwvI6vZperlX/twrsn
         yoa9NB67HI0mPV+yBZSBWi4gvb/pCv7Nk/1DJ3nSHYe2OFjosbXA4ccFBcdX8PPbtQyH
         6569MuXHKWZzw0ya68HNRSmt3jZS4h1G0+4HjHrchw9aqz6TIFi4IXfzS7zxc1PCKpfW
         jG8nRXnvYDXvjbOm7xzhF3rTlqeVybJG8X3mWIJIJ+YoXxw+ERbXmhXCvRh9n/is097U
         39y9Cr62XOPnlD5qHTsU0fGQLczwN/nNzNdOlzNqq5JFTD8dtNSQEZ9YaKVZNiOWUxKw
         puvA==
X-Forwarded-Encrypted: i=1; AJvYcCUXdU5KvSV0Chk5mbZ00JNaXOAi6EscZ/LJ49FEPfIGHM5qoDvEKIx3aUsgF5eD/Sr8g9EEdMqDkLyPEzyyaFpWVw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx9tRna800RxW1Hho2OTbWXlAY00xx3xAqbkNgiXVX/N7TIwEDE
	+UmAoQC4dvJZdulFCG3pGjk4/NTZEhkcS32NeXKRn87dxUUzHoiJCWYhOp86qb4znbM=
X-Gm-Gg: ATEYQzxUKq92wLZBvuLcm5inaXpaOvQZJUb+UwR8NHKlrEtUXuPn4YSSZQshu2Bc67W
	cJBGngAhDTeuZj1Li/Ll7r/vg5BURg6j9vBg1FdYDelXZGFT9948qSmkj0zIXLxcx2LMChf3/za
	uDn5qL59mVqfUjSP55lidTnNfXdagqo/bEXLKyFMOQ0wUoZb7AzSE9gIGWfPwFXB+moVzN9b7LH
	xBBI0WMjH6qPd4TkwOauiqv/a+HozunDSTCle0LpwZYH8AFGfqDAdmxIscoAbLTmBEMTKBMNwk5
	9KDfqbwOUp6PPhDjuUcFEEqHfQPp1h1R7/ur5z8xS/cEyGldH1fekSXGVBW8zQVOiMn1tdaLN/U
	u2efYkp1Vd+UxEwrR2Dn4uUOQF3abl0yySsey16+2o8U0k0yZph+OCjqn5dW6t1vZqe2Q9CejcD
	Irbmj1PENz7hIuuIaH8fOZ46TABW/S7Bq6liRyDtCDi1KfqsVa38xJceTVdbgH5gwGz1qBb57eh
	p0Z7dmTfYw4/V/arObI8Q==
X-Received: by 2002:a05:600c:630a:b0:485:5574:8ccc with SMTP id 5b1f17b1804b1-486f445122amr67457675e9.13.1773852677552;
        Wed, 18 Mar 2026 09:51:17 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b5184b7f7sm8915541f8f.4.2026.03.18.09.51.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 09:51:17 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Mar 2026 17:51:16 +0100
Message-Id: <DH62AM0LD7ST.12CQ28MWFWBFR@smile.fr>
Subject: Re: [OE-core] [openembedded-core][scarthgap][PATCH] tcp-wrappers:
 extend recipe for native/nativesdk builds
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <deeratho@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260309145640.3432992-1-deeratho@cisco.com>
In-Reply-To: <20260309145640.3432992-1-deeratho@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 16:51:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233415

On Mon Mar 9, 2026 at 3:56 PM CET, Deepak Rathore via lists.openembedded.or=
g wrote:
> From: Deepak Rathore <deeratho@cisco.com>
>
> Some SDK dependency chains require tcp-wrappers to be available
> as host/SDK artifacts. The current metadata only partially provides this,
> which can lead to dependency resolution failures when this recipe is pull=
ed
> into SDK-oriented builds.
>
> This change does not alter target package behavior; it only enables requi=
red
> native/nativesdk variants for build and SDK integration paths.
>
> Signed-off-by: Deepak Rathore <deeratho@cisco.com>
>
> diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb b/met=
a/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
> index bcd1d6f792..26eaeab1ac 100644
> --- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
> +++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
> @@ -132,3 +132,4 @@ do_install () {
>  }
> =20
>  FILES:${PN} +=3D "${sysconfdir}/hosts.allow ${sysconfdir}/hosts.deny"
> +BBCLASSEXTEND =3D "native nativesdk"

That effectively create 2 new recipes tcp-wrappers-native and
nativesdk-tcp-wrappers. That is not a trivial change that I can take
without a clear and strong justification.

What "dependency resolution failures" did you see?

Also, can you check that tcp-wrapper-native builds on Fedora 41? This is
the scarthgap supported distro with the most recent GCC : gcc-14 (and it
usually trigger build failures on old/unmaintained packages)

Finally, OE-Core master did remove the recipe for it being really
unmaintained[0]. This is not a good sign :/

[0]: https://git.openembedded.org/openembedded-core/commit/?h=3Dmaster-next=
&id=3De556df28f47e754b53e1f46c97dde2b19fd8fad1

Regards,
--=20
Yoann Congal
Smile ECS


