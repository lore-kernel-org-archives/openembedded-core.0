Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7EE076FF80
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Feb 2018 00:18:24 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id t3so5899761wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Feb 2018 16:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BSRtJA+2XmxkFh3UsKHu7PbR5jlyxeedEmSuCAzcSfQ=;
	b=VAIxNHPSGU8lITIJWysC1MsRUyXfPlvh5PjFCdwY/oWV5dOCqOOqqXBi8ZC7gA4lPl
	EkgHMh/nafs/B7iI11uAOY9s3Gi9YymPmhy3KmJMmA6Nv6dEZ5Fbh2Su0g19Vbni4ch3
	vhvKEQT0PYr/lBXxSwMgMktXv9P42hNa/sxg1fWV5bBeE0d90K5FTgT+NLIaN+r8bM07
	PBkiuDqQRJI0ctSsUN79fiWIizJXX14nNlCzoSCh3dnUBlTMkYh0+KVsiFm1eAtA3rN1
	aMhEDGofIa1Ko83DLJVrUn/oV1aVakmE3nBHfKXb7a2JBYwm2VxNalrmBwYvsRt+qb64
	J6jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=BSRtJA+2XmxkFh3UsKHu7PbR5jlyxeedEmSuCAzcSfQ=;
	b=jJ83fvmQcGhBiZNB4mrn9pZeK8nhUbYYB3cDZ4zEsTWcBtDIN5RckH/9huur4gYA/h
	ZF10G/YEhrtXJ/f5NJk/jE6fW1QgnWRtLlSnPCLPAhppbWSXFz8HjPvcrRvxdiVSXsHp
	nPAlNCj6t292kBQ2gquwtVIREEZ6ze41r5Z5c9pDl9cEjcsx3kH4Ip2NxNV5gVMgmDci
	4F5k5bnFzxLFSNPRsaYgUzDSAZTstqQbJ3nYj+O4wvNSIbpwq70dfLYfKOp4yf86MUIe
	VXWEs4iaFBAXswmpxKkSCBybE/Pu8Iv3N3X5+FQY4YJTNqtH4eH1yocUD9EIpiTtAuBm
	JvKA==
X-Gm-Message-State: APf1xPAJ/bonNLLspxYTje+/NSJtN7j2j6wSlClpm4rUlaYmza0Wdex/
	YhmMTec/E+4D7c5CF2x+uP0+tw==
X-Google-Smtp-Source: AH8x2247qraWlH8qgr4Qblk6XuLOwYmcyyRohFTadUcUrUnglua2NxJfcHsY3J/94c+uRTP8xVa42Q==
X-Received: by 10.28.18.144 with SMTP id 138mr5958652wms.19.1518826704914;
	Fri, 16 Feb 2018 16:18:24 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	32sm18127499wrm.14.2018.02.16.16.18.23
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 16 Feb 2018 16:18:24 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 17 Feb 2018 00:18:24 +0000
Message-Id: <20180217001824.42-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <CAJdd5GYmBp69xaSKm7cgbe2vHm+38HOHFEbHjDQXLO8zAa4Rxg@mail.gmail.com>
References: <CAJdd5GYmBp69xaSKm7cgbe2vHm+38HOHFEbHjDQXLO8zAa4Rxg@mail.gmail.com>
Subject: [PATCH] nativesdk-icecc-toolchain: Fix LIC_FILES_CHKSUM md5
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 17 Feb 2018 00:18:24 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/icecc-toolchain/nativesdk-icecc-toolchain_0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/icecc-toolchain/nativesdk-icecc-toolchain_0.1.bb b/meta/recipes-devtools/icecc-toolchain/nativesdk-icecc-toolchain_0.1.bb
index 91958d7fbc..9d2750e479 100644
--- a/meta/recipes-devtools/icecc-toolchain/nativesdk-icecc-toolchain_0.1.bb
+++ b/meta/recipes-devtools/icecc-toolchain/nativesdk-icecc-toolchain_0.1.bb
@@ -2,7 +2,7 @@
 # Released under the MIT license (see COPYING.MIT for the terms)
 SUMMARY = "Generates Icecream toolchain for SDK"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/icecc-env.sh;beginline=2;endline=20;md5=aafdb7bc2aa7ac5d039fda0c8733983c"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/icecc-env.sh;beginline=2;endline=20;md5=dd6b68c1efed8a9fb04e409b3b287d47"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-- 
2.15.1


