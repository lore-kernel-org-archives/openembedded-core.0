Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B998DC43602
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 13:23:53 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69539.1782998628486875609
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2026 06:23:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=NoeJtgtO;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-475881b9a4bso1834898f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 06:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782998626; x=1783603426; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CXp4EZfNg6bXiKzLrYrRhXWoho+LCCN/XcKct0EPEnk=;
        b=NoeJtgtO+1XtIiJ9T96Fr3GgTZnbNcuU6ez+JTQ5+u5z8gCdBk25pwzbWj7/ZmT25l
         kxsrArlaZ/q/vZZTsS/Gbi6dGmyYrOyN4bhtvY2rmLEYPieU8cmD5FAbwGt0d4kGX8JY
         3mj9cwM5em4LSVn0BQ2nq3OxmP9kLrzRGf5jo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782998626; x=1783603426;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CXp4EZfNg6bXiKzLrYrRhXWoho+LCCN/XcKct0EPEnk=;
        b=ihhTpbLhsf5yblxCx2ZTxKzR9DTYA9LrfIgd7tOTi+rikYKNMUIJ1LNeqz5ElatMVb
         WNosCwh9Jo9yFQEgSZunrzgPYiLCtxAe7u0IP97A9WQKBaVnB2X0fNmxKrzCBO4ahGCw
         cNgqHHCC1suvFQ7yrS5YJmrPwe6yNxuRKFkcLaErvZB1ykfIKFbHUDpxiZtG1KvvQcm1
         njnIXiTJ6xC1/XQcpdu0O0uTYDdGo92C75x8xS+5z2P7xyCKeNkW0DNwWw2P5aEZNXYd
         Q6rPIORP/6ny6Zj25dGt6igkS4wmYeQI5Uh1DeviHOUMvOjrKXFLZBfleo6LlsIsmhc8
         oZNg==
X-Forwarded-Encrypted: i=1; AHgh+RqdrgS1zyy6kU3Ez722Yj5FY8/P7CI6z3vDaCyruhY17qVxhILBN/jaorfyusty/PGhBhzTOuSshjhtwO3x9NpXNw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx4H2ka0Y9/lQ4dE2VGaBLiVbATy4n3ix86eRicvImmgVYe8gy6
	BG8bfcaQjBDrjhFPnZgLMATexCRILDhcCPLdQxQFlRdrSMxok0tSlsT2vYBzpWMG7og=
X-Gm-Gg: AfdE7cmr0bN2jvJqUwrXz5SkHS9WAqTs/beuzln31BncB4DbWSqguDHir73yfMmY2T7
	McgY77Cb8SgH5BiGXb339kcsvtO4FCwC5iDXO8h35dwItscJM6jXO5WndmCfvNdVtPMSxYc6pX1
	/4ovDEfpBv6Uth9eJtISZZDI3KCKbAe7d7jO5PTKA96JpSr7gYOhMqo2Hy3MmiRKXLrf7oP/tIA
	EzbXfkuzwtUP3UII4iT4hC8ZxdDhisao7TEgrN7keDqfwULzMD5/u1KPvwHrOh46UjzvhAHffVR
	PmZsM2xhpWZpfmIQ+1LVree1wnR3QoctVcNFeKfuN9FgWTa6wKHVKjoLMrY8sv4wJWaEmXtz2mq
	0P4Ht8qt2d8VGOURqIx1SOviPJKs/C7lG5RwW03ggHwO/8fs0Our1sdoioZxSi2hwgeiesyj0+/
	KY5AJWBbPMc2A56xhK1xnzptfrbZQ8Sj5ae8bCX94SbheYZe0ntGbDJuDiZersvsIdEr+Ek806Y
	tVCTg==
X-Received: by 2002:a5d:5f56:0:b0:470:390c:1e73 with SMTP id ffacd0b85a97d-477b39839cbmr8308453f8f.18.1782998626511;
        Thu, 02 Jul 2026 06:23:46 -0700 (PDT)
Received: from localhost (2a01cb001331aa00c56cc01f8c3c1c95.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:c56c:c01f:8c3c:1c95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477dd94cec5sm8575697f8f.19.2026.07.02.06.23.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 06:23:45 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Jul 2026 15:23:45 +0200
Message-Id: <DJO49GU0WA4X.1VP2TKKQHWUVY@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH] openssh: CVE-2026-35387 patch also
 fixes CVE-2026-35414
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <olivier.benjamin@bootlin.com>, <mathieu.dubois-briand@bootlin.com>,
 <thomas.petazzoni@bootlin.com>, <pascal.eberhard@se.com>,
 <wahid.essid@se.com>, "Theo Gaige (Schneider Electric)"
 <tgaige.opensource@witekio.com>
To: <benjamin.robin@bootlin.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260702-openssh-cve-2026-35414-v1-1-bb863c2c82f5@bootlin.com>
In-Reply-To: <20260702-openssh-cve-2026-35414-v1-1-bb863c2c82f5@bootlin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 13:23:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240048

On Thu Jul 2, 2026 at 3:15 PM CEST, Benjamin Robin via lists.openembedded.o=
rg wrote:
> An explanation can be found on debian repository:
> https://salsa.debian.org/ssh-team/openssh/-/commit/ae190b6440b7c599d75952=
7965334eeb49cc75b3

That does not look obvious to me... Can you send a v2 with the
explanation spelt out please?

Thanks!

>
> Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootli=
n.com>
> ---
>  .../{CVE-2026-35387.patch =3D> CVE-2026-35414-CVE-2026-35387.patch}     =
  | 2 +-
>  meta/recipes-connectivity/openssh/openssh_9.6p1.bb                      =
| 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-35387.pat=
ch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-35414-CVE-2026-3538=
7.patch
> similarity index 99%
> rename from meta/recipes-connectivity/openssh/openssh/CVE-2026-35387.patc=
h
> rename to meta/recipes-connectivity/openssh/openssh/CVE-2026-35414-CVE-20=
26-35387.patch
> index c4806bd9935c..4839d76fa808 100644
> --- a/meta/recipes-connectivity/openssh/openssh/CVE-2026-35387.patch
> +++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-35414-CVE-2026-3=
5387.patch
> @@ -14,7 +14,7 @@ Reported by Christos Papakonstantinou of Cantina and Sp=
earbit.
> =20
>  OpenBSD-Commit-ID: c790e2687c35989ae34a00e709be935c55b16a86
> =20
> -CVE: CVE-2026-35387
> +CVE: CVE-2026-35414 CVE-2026-35387
>  Upstream-Status: Backport [https://github.com/openssh/openssh-portable/c=
ommit/fd1c7e131f331942d20f42f31e79912d570081fa]
>  Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witeki=
o.com>
>  ---
> diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/re=
cipes-connectivity/openssh/openssh_9.6p1.bb
> index ea158b56b419..4193bc8a5b41 100644
> --- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
> @@ -35,7 +35,7 @@ SRC_URI =3D "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH=
/portable/openssh-${PV}.tar
>             file://CVE-2025-61985.patch \
>             file://CVE-2025-61984_CVE-2026-35386.patch \
>             file://CVE-2026-35385.patch \
> -           file://CVE-2026-35387.patch \
> +           file://CVE-2026-35414-CVE-2026-35387.patch \
>             file://CVE-2026-35388.patch \
>             "
>  SRC_URI[sha256sum] =3D "910211c07255a8c5ad654391b40ee59800710dd8119dd536=
2de09385aa7a777c"
>
> ---
> base-commit: 2814f0962f56c8d1afa4de76d2895ba9b5cb767d
> change-id: 20260702-openssh-cve-2026-35414-07494753183a
>
> Best regards,
> -- =20
> Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>


--=20
Yoann Congal
Smile ECS


