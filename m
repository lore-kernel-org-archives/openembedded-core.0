Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0473EC44532
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 14:30:33 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24284.1784644228854107819
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 07:30:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=XaPmAF/9;
 spf=pass (domain: smile.fr, ip: 209.85.218.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c160420289bso1613628766b.0
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 07:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784644227; x=1785249027; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=X3GVfOoOlXmXKdZS2pMoCpNorK3Jag2zIfW43N9sUE4=;
        b=XaPmAF/9nGOs2WbpvPaEduumdH6tXT47a7UG8yGv1EvstO7qJmVP91eI72dxO3PIcO
         eo6Rh33RNuN+20KDPz65Sq68b1L5auNBPoHWFGezzh+/A9gonIZDs4E3mnsCpP5GB0QA
         lT+onSbLRcrSxEiFMWOK4trViYdkWSLK0dy6c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784644227; x=1785249027;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X3GVfOoOlXmXKdZS2pMoCpNorK3Jag2zIfW43N9sUE4=;
        b=FFUnAZaWNGmlgCpG/ddPEdyBGBf9+MWMAKGFYGt0uC3ioNLeWSlLsufkO8Snp+AO//
         heVfijIX1KJRYqKoqDitAfMGaKg+dOtXKKI9qz1dp34705ZZxDdSxJ9sLC+k1C/EnBtO
         WEnjfWZ6ktndNd/jcaSWUNP+quIqnbhxkOtU1vHr3JyPgyzopMWkNOfjMV58M/pCKyzT
         welaj7Qq06z5dufD9577SBWbAvN1d/G2rafsCYDlbWkoFmZ36WC8aObCwhY6Y8ddZo6h
         Y9g5nii9uR4MRKjkNi1bwh77xwMwdcqC4lk092ySYlDE/cWN4if0gNSRSCu9LydSHDCN
         lVKQ==
X-Forwarded-Encrypted: i=1; AHgh+RruwNhnWFkR9HGEJvMBz4e9kS/xO69NsCEYvk3Oc5PUrKk2CuAAVfHS4w69kRiJhbE6z9id6AcAkj4IeBIfm7MndA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyTGHZGJPMtMS+TTnFBDrV+eR7UCj5OYZtwav31rffyMS/XDzOd
	/J+VR+Jfm6Bg3r1B7IjKP+sfaC0hkYSSUTtukJdoBD3VGYFoVXpqq1RZMRDZHnwGBYk=
X-Gm-Gg: AR+sD10NPRp7iDA5uWiDFHWK9xROR/vBdtgK6bTpO0MjmcpzomyXKuQnr8Z9zsoh9ox
	y39HqLeJyi3fI5ctD3l/swqi+81JY8gM0m9DpkKa3zZmPiKvqqlKiZNoaIkXb1nMkbxcNtysttn
	5VC28lTBEXEnA5LM2rQ3lhqp1Xk3caGDTmb1jTUH0iaB88j13uFvILBsmHRDp+z/Ngg5KsVwZkK
	s7vz7Ka4Chf45gMYV7Wss2KrhKamd2dC56vnqDOXqLSFI4JJ/9bOg/tp5U3f0AEMtXBDesQklwk
	mcc069WkF5Wx6cQcbpeFsutxTQInYHlxRoXzRPJZPp+W/AQ94xokLb6qNgsHZEWiaCuC4VlHHUm
	UZd4x8f+luVey8cgSV4qVWu/lPB5S61begPKHK8V31bZcw4qa0oSC9Su4DGj4ZKz1L2NgEeZtXf
	R992iq+GLB28uqFe0mV2pCiZ7Cyi8YZWYOg+nPvVCO0R5rzcAlE3mq1Mdtee0Wqg==
X-Received: by 2002:a17:906:6a1a:b0:c15:ce72:9352 with SMTP id a640c23a62f3a-c16b47d80cdmr786129966b.33.1784644226763;
        Tue, 21 Jul 2026 07:30:26 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c17009adfffsm599687966b.11.2026.07.21.07.30.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 07:30:26 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Jul 2026 16:30:25 +0200
Message-Id: <DK4BKV6WDHSA.2WEWS3ZC4DO23@smile.fr>
Cc: <xe-linux-external@cisco.com>
To: <devanshp@cisco.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][wrynose][PATCH 3/8] openssh: Fix CVE-2026-59998
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260720175518.3546447-1-devanshp@cisco.com>
 <20260720175518.3546447-3-devanshp@cisco.com>
In-Reply-To: <20260720175518.3546447-3-devanshp@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 14:30:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241540

On Mon Jul 20, 2026 at 7:55 PM CEST, Devansh Patel via lists.openembedded.o=
rg wrote:
> From: Devansh Patel <devanshp@cisco.com>
>
> This patch applies the upstream OpenSSH 10.4p1 backport for
> CVE-2026-59998. The upstream fix commit is referenced in [1],
> and the public CVE advisory is referenced in [2].
>
> [1] https://github.com/openssh/openssh-portable/commit/8058c5bdb507591b79=
ec926221fbe6fcc296d432
> [2] https://www.cve.org/CVERecord?id=3DCVE-2026-59998
>
> Signed-off-by: Devansh Patel <devanshp@cisco.com>
> ---
>  .../openssh/openssh/CVE-2026-59998.patch      | 36 +++++++++++++++++++
>  .../openssh/openssh_10.3p1.bb                 |  1 +
>  2 files changed, 37 insertions(+)
>  create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-59=
998.patch
>
> diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-59998.pat=
ch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-59998.patch
> new file mode 100644
> index 0000000000..3e15fe19fa
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-59998.patch
> @@ -0,0 +1,36 @@
> +From 94a089cd331eeea77ffd6fd715e61d281c3b97c3 Mon Sep 17 00:00:00 2001
> +From: "djm@openbsd.org" <djm@openbsd.org>
> +Date: Wed, 24 Jun 2026 06:55:12 +0000
> +Subject: [PATCH] upstream: mention a caveat regarding
> + GSSAPIStrictAcceptorCheck in
> +
> +some environments
> +
> +OpenBSD-Commit-ID: aa7158d8f22cb34063c1c2d3cbcf30a9489847c2
> +
> +CVE: CVE-2026-59998
> +Upstream-Status: Backport [https://github.com/openssh/openssh-portable/c=
ommit/8058c5bdb507591b79ec926221fbe6fcc296d432]
> +
> +Backport Changes:
> +- Omitted the upstream OpenBSD revision and Mdocdate-only hunks in
> +  sshd_config.5 and retained the Wrynose OpenSSH 10.3p1 values because
> +  this stable backport carries only the security-relevant documentation.
> +
> +(cherry picked from commit 8058c5bdb507591b79ec926221fbe6fcc296d432)
> +Signed-off-by: Devansh Patel <devanshp@cisco.com>
> +---
> + sshd_config.5 | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/sshd_config.5 b/sshd_config.5
> +index 3f5e29812..22b9039d2 100644
> +--- a/sshd_config.5
> ++++ b/sshd_config.5
> +@@ -769,6 +769,7 @@ machine's default store.
> + This facility is provided to assist with operation on multi homed machi=
nes.
> + The default is
> + .Cm yes .
> ++This option may not be effective in Windows Active Directory environmen=
ts.

This is a oneline manpage patch for "Windows Active Directory
environments.".

I'm not expert in GSSAPI but can we even trigger this?
If not, I think this should be handled with a CVE_STATUS.

I'll hold this patch in the meantime.

Regards,
--=20
Yoann Congal
Smile ECS

