Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE17BC25B7E
	for <webhook@archiver.kernel.org>; Tue,  4 Jun 2024 08:26:59 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.16337.1717489618938537491
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jun 2024 01:26:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KMv0lyh3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-354b722fe81so3250752f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 01:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1717489617; x=1718094417; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XE0R47slwdDYobln0T3pPLArBJmdWMy+6RlHTVnPgxI=;
        b=KMv0lyh3l+HbA8CdJV9VH3tirNoYj3CV11/nGWSJBg33PFpfKx69MdzZIqoCR+PYPD
         nXnp+3Be+ieOiHFb+f0mGbSl50Yc/0Lb4MYmedHvPx6RG+7SC2XmFNbd+qGNBsAC17pX
         tG1/DB+GL46akiuuY3Yjux8eg1YcHtYa1eYV4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717489617; x=1718094417;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XE0R47slwdDYobln0T3pPLArBJmdWMy+6RlHTVnPgxI=;
        b=pLjoWtU1vkBeyPQzE5J9oCTSKL9/R88t5OXi6V6wr2hxxgY8tMHF3IUSaSU+7h9y5r
         oE2byPySc6pK4fVYjLNUckfcDXiZ1fKgHLh7DH6hSbrvsstdQGEITOQB1as6XTE1m/GT
         tC+uSgG6zkGcO71YgMvecFwbcYDQ3e4M7GxEGcy2uSqLIinxcRO0vjjTklWUdmhSQSAZ
         o60nBt3XqYGjrUd3gi2SmrDA1D2ec9V7L3MQjIhQmjR4vrD9qQ05ypIfaLoGD+rdHC8w
         whKOOFm7mqrndR7l8zSJ9zTXeD4eB8LWeYyPNot9wx7aA7333vMC5sMoVLeEnNiBfp0r
         p2SQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/2E3ZwOPNz7w3BmhlTlHakg7vQNEmeLPjAaUKm2XDsTVtqte1+aNC7XnT+AsQwQ0uzSXCUl5V07TFHxiDPxnEykBBEM5fZrVEq30EN2PQWzhgpkFS3NUs
X-Gm-Message-State: AOJu0YzRdtWh2pVw2qMiFWPma19D1Us/PbjS1Ca7p1kXbTqnEfw4/XW3
	sz80G19t77zQODyTK/ggBTrU+mtMaKdISqWsIspSo8sNwrqu13QcpxwUtJmdDik=
X-Google-Smtp-Source: AGHT+IEhs5q3JowqDmaYEOuI+2AGL7fsEdVGAcFjoydjrRxzhXygULJIco43yGHaD0qXsGwyh0iP2w==
X-Received: by 2002:a5d:46d2:0:b0:355:148:ea23 with SMTP id ffacd0b85a97d-35e0f316ab9mr8506659f8f.56.1717489617155;
        Tue, 04 Jun 2024 01:26:57 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9a5c:ae3c:1b90:53c1? ([2001:8b0:aba:5f3c:9a5c:ae3c:1b90:53c1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd064afe3sm10672819f8f.97.2024.06.04.01.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 01:26:56 -0700 (PDT)
Message-ID: <25b3eee7c4209e01d08d76cd65770b9c1391067f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RESENDv3][PATCH 3/4] selftest: add few missing
 Upstream-Status found by patchreview
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: martin.jansa@gmail.com, openembedded-core@lists.openembedded.org
Date: Tue, 04 Jun 2024 09:26:55 +0100
In-Reply-To: <20240604081023.38549-3-martin.jansa@gmail.com>
References: <20240604081023.38549-1-martin.jansa@gmail.com>
	 <20240604081023.38549-3-martin.jansa@gmail.com>
Autocrypt: addr=richard.purdie@linuxfoundation.org; prefer-encrypt=mutual; keydata=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
 YNvg==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 08:26:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200310

On Tue, 2024-06-04 at 10:10 +0200, Martin Jansa via
lists.openembedded.org wrote:
> * now patchreview complains only about missing SOBs
>=20
> $ scripts/contrib/patchreview.py -v meta-selftest/
> Found layers meta-selftest
> Missing Signed-off-by tag (/OE/layers/openembedded-core/meta-
> selftest/recipes-test/devtool/devtool-patch-
> overrides/qemuarm/arm.patch)
> Missing Signed-off-by tag (/OE/layers/openembedded-core/meta-
> selftest/recipes-test/devtool/devtool-patch-
> overrides/qemux86/x86.patch)
> Missing Signed-off-by tag (/OE/layers/openembedded-core/meta-
> selftest/recipes-test/devtool/devtool-test-ignored/devtool-test-
> ignored.patch)
> Missing Signed-off-by tag (/OE/layers/openembedded-core/meta-
> selftest/recipes-test/devtool/devtool-test-long-filename/0001-I-ll-
> patch-you-only-if-devtool-lets-me-to-do-it-corr.patch)
> Missing Signed-off-by tag (/OE/layers/openembedded-core/meta-
> selftest/recipes-test/devtool/devtool-upgrade-test1-1.5.3/0001-Add-a-
> note-line-to-the-quick-reference.patch)
> Missing Signed-off-by tag (/OE/layers/openembedded-core/meta-
> selftest/recipes-test/devtool/devtool-upgrade-test1-
> 1.5.3/backported.patch)
> Missing Signed-off-by tag (/OE/layers/openembedded-core/meta-
> selftest/recipes-test/gitrepotest/gitrepotest/0001-testpatch.patch)
> Missing Signed-off-by tag (/OE/layers/openembedded-core/meta-
> selftest/recipes-test/man-db/files/0001-Test-patch-here.patch)
> Missing Signed-off-by tag (/OE/layers/openembedded-core/meta-
> selftest/recipes-test/recipetool/files/add-file.patch)
>=20
> Total patches found: 13
> Patches missing Signed-off-by: 9 (69%)
> Patches with malformed Signed-off-by: 0 (0%)
> Patches missing CVE: 0 (0%)
> Patches missing Upstream-Status: 0 (0%)
> Patches with malformed Upstream-Status: 0 (0%)
> Patches in Pending state: 4 (31%)
>=20
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
> =C2=A0.../devtool/devtool-patch-overrides/qemuarm/arm.patch=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2
> ++
> =C2=A0.../devtool/devtool-patch-overrides/qemux86/x86.patch=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2
> ++
> =C2=A0.../recipes-test/man-db/files/0001-Test-patch-here.patch=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2
> ++
> =C2=A03 files changed, 6 insertions(+)
>=20
> diff --git a/meta-selftest/recipes-test/devtool/devtool-patch-
> overrides/qemuarm/arm.patch b/meta-selftest/recipes-
> test/devtool/devtool-patch-overrides/qemuarm/arm.patch
> index e33a2753f9..f7f729a86c 100644
> --- a/meta-selftest/recipes-test/devtool/devtool-patch-
> overrides/qemuarm/arm.patch
> +++ b/meta-selftest/recipes-test/devtool/devtool-patch-
> overrides/qemuarm/arm.patch
> @@ -1,3 +1,5 @@
> +Upstream-Status: Pending
> +
> =C2=A0--- source.orig	2020-10-06 13:26:10.792688630 +0100
> =C2=A0+++ source	2020-10-06 13:26:18.853424694 +0100
> =C2=A0@@ -1 +1 @@
> diff --git a/meta-selftest/recipes-test/devtool/devtool-patch-
> overrides/qemux86/x86.patch b/meta-selftest/recipes-
> test/devtool/devtool-patch-overrides/qemux86/x86.patch
> index 1a0a175fa8..0aa1affedd 100644
> --- a/meta-selftest/recipes-test/devtool/devtool-patch-
> overrides/qemux86/x86.patch
> +++ b/meta-selftest/recipes-test/devtool/devtool-patch-
> overrides/qemux86/x86.patch
> @@ -1,3 +1,5 @@
> +Upstream-Status: Pending
> +
> =C2=A0--- source.orig	2020-10-06 13:26:10.792688630 +0100
> =C2=A0+++ source	2020-10-06 13:26:18.853424694 +0100
> =C2=A0@@ -1 +1 @@
> diff --git a/meta-selftest/recipes-test/man-db/files/0001-Test-patch-
> here.patch b/meta-selftest/recipes-test/man-db/files/0001-Test-patch-
> here.patch
> index b1d5eab2b8..d4d43904df 100644
> --- a/meta-selftest/recipes-test/man-db/files/0001-Test-patch-
> here.patch
> +++ b/meta-selftest/recipes-test/man-db/files/0001-Test-patch-
> here.patch
> @@ -4,6 +4,8 @@ Date: Fri, 9 Feb 2018 17:37:48 +0200
> =C2=A0Subject: [PATCH] Test patch here!
> =C2=A0
> =C2=A0This is an invalid patch used by oe-selftest
> +
> +Upstream-Status: Pending
> =C2=A0---
> =C2=A0 README | 1 +
> =C2=A0 1 file changed, 1 insertion(+)
>=20


"Pending" implies we're going to do something with these which we're
not. "Inappropriate" might be a better choice?

I mention this mainly as we have an aim of triaging all the Pending
patches over time and can hopefully reduce the numbers.

Having some kind of "TestArtefact" category might be helpful in that
regard...

Cheers,

Richard


