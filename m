Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 328B5C4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 22:51:32 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.53638.1701903089247875032
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Dec 2023 14:51:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=C638GygD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40c2308faedso3526705e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 14:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1701903081; x=1702507881; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CtK40oxdoy8rW2NhYkdX5sFz6YSLejhBJ1N91iKWF+U=;
        b=C638GygD7WvrnTPKYJ/Z+dF8KDLuXhih7CvpwdMAxiG1wajqT7E8lGFqKNKBISwFw1
         rLXHo87WJppH2AFodQbzDwMEy5D0txmij4f1E/ZEBCB2QAd08XlNmwyOGESvFhudiBlN
         Ao1Y42hAfdF5+BoB0AZwLYVm/jqgk7T6txaUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701903081; x=1702507881;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CtK40oxdoy8rW2NhYkdX5sFz6YSLejhBJ1N91iKWF+U=;
        b=u04TjjzCLJBQ8ASO0XJ+BoIf9BFYbqvCrn/x3D8lhGg/40o0FiUqz1usNZJbhle7FP
         NGr18h5imnOECw0bD7applkklBhzsFxSp3V+jP/IXjCYfZFpxYU89nhmwLsvXgqbySPt
         xFTO0qqTcR2C+9jNMw0andfMXkvlWye+AzUxiyJ511ftYBWgQzrCfPCGPG751sr+r1tx
         vcUUd2GkovXjCAaedjFRJFHLRcqgjk6klpMRaoldFItaThbeQJqSDdE3ZnVUoJai5FlA
         TLJGjpMtUxAj0d8AF5d3Mv6U37ZnOH55M1VKjXK7J0YIQoH+rYITijfzjgg+4KW1m9xR
         zKXg==
X-Gm-Message-State: AOJu0YwsA7Nxcu988V9kexXF9YugrRxBMNa2I0oJ0d7L73j/0l24POeY
	M7fDsYzd23orLmPkGr7Vn3IX0l1CKITJzPCLbF4=
X-Google-Smtp-Source: AGHT+IG3VHEddXO7tz9VzVRl39jbAL2MrsmOC55AdTh8Xg/QKLk53LT0wBYZFSFz/58OTcm3Z6AvvA==
X-Received: by 2002:a1c:4b07:0:b0:40c:22c7:598d with SMTP id y7-20020a1c4b07000000b0040c22c7598dmr823414wma.179.1701903081378;
        Wed, 06 Dec 2023 14:51:21 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:30b4:b44a:2cc6:3876? ([2001:8b0:aba:5f3c:30b4:b44a:2cc6:3876])
        by smtp.gmail.com with ESMTPSA id g6-20020a5d6986000000b003342e0745absm679584wru.93.2023.12.06.14.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 14:51:21 -0800 (PST)
Message-ID: <36755c646263316c6739d0d2c1739d45a6ec6d4d.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH 1/1] go: ignore CVE-2023-45283 and
 CVE-2023-45284
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: soumya.sambu@windriver.com, openembedded-core@lists.openembedded.org
Date: Wed, 06 Dec 2023 22:51:20 +0000
In-Reply-To: <20231204033603.1720931-1-soumya.sambu@windriver.com>
References: <20231204033603.1720931-1-soumya.sambu@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 22:51:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191937

On Mon, 2023-12-04 at 03:36 +0000, Soumya via lists.openembedded.org
wrote:
> From: Soumya Sambu <soumya.sambu@windriver.com>
>=20
> These CVEs affect path handling on Windows.
>=20
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2023-45283
> https://nvd.nist.gov/vuln/detail/CVE-2023-45284
> https://security-tracker.debian.org/tracker/CVE-2023-45283
> https://security-tracker.debian.org/tracker/CVE-2023-45284
>=20
> Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
> ---
>  meta/recipes-devtools/go/go-1.20.10.inc | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta/recipes-devtools/go/go-1.20.10.inc b/meta/recipes-devto=
ols/go/go-1.20.10.inc
> index 39509ed986..b240da3f86 100644
> --- a/meta/recipes-devtools/go/go-1.20.10.inc
> +++ b/meta/recipes-devtools/go/go-1.20.10.inc
> @@ -16,3 +16,6 @@ SRC_URI +=3D "\
>      file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
>  "
>  SRC_URI[main.sha256sum] =3D "72d2f51805c47150066c103754c75fddb2c19d48c92=
19fa33d1e46696c841dbb"
> +
> +# Microsoft Windows specific CVEs
> +CVE_CHECK_IGNORE +=3D "CVE-2023-45283 CVE-2023-45284"

This should be using CVE_STATUS instead for master.

Cheers,

Richard

