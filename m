Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEC96C44518
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 16:48:00 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12675.1784134071865677901
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 09:47:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=atHxpMm8;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-455ee8f529dso602814fac.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 09:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784134071; x=1784738871; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VB1w3RMyoJtvjK8bhEfJYnSBgwA8m1MKVblZgloMj6s=;
        b=atHxpMm8Lxc2qmd2RwUcHZklLUMpU9f+ImbsH0uLcs/HjCGa51T5y6ohCJwN/6euC5
         VblSAjhMFxwm1P2ppyS+ipC+jPF4eP6xPaOj8/ljALO81RuCpdG7AfUp+xg55fr1lXz5
         Up7Q76gbs1VpNSKShJhFSr8pvgTxsdS+acqqDtBxDavMLkVsrcwtkS3GOSXhDDu1Tbeg
         0go93ANEl4VCwdCMnPUZBdOPEHuH9osw1bmu1RXp/gDwg+hIElZR0Tlj3tFd/SvgNQM2
         mrdW5f+CZ25dL+X4Ktzce9djWDDXo8SVLdcoJvWXZ5+kdVDWyiguuLW69SMqL9K6cjCP
         ewZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784134071; x=1784738871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VB1w3RMyoJtvjK8bhEfJYnSBgwA8m1MKVblZgloMj6s=;
        b=DL5U5FQqAxBtRm5wdDYHsMvkSvoleqF+kqiNO8ZQR3bTUEhT28gAg33terkwG5oASn
         2SlAhMjAh//Fhhsx7g48vpIcMYuIET5XEl70UAe4Edo7mtE7Z4zicB23k/SHDfKuf751
         JaF9Taddu1VTHjxGWCMvSQpoIrCsgkQScy0QV29Gtscs7FcxzN0kj6Epw4oD1Bm2MXiS
         /uM0CEPLFkZalcJYUNPySPIv21A8A8FakGkETrlwndpE3TYWgeats5PQBJJsEeqVlez6
         N9K3J7WJHjDbzWuCj0je2usTNkyz0iJUWNKmnpnGH7lnLsxOArtbDXb1xKOf37TcnqQT
         KxaQ==
X-Gm-Message-State: AOJu0YzyCMDYavUFoCICePnUbfdh1W4HERm1p2JIduzZhF8+VVVzbm6J
	wni8e18hP4HXZAAvGIXJw5k8WY37JJlfmY23gCzyEoNmy05KPOinDrqnebXRgw==
X-Gm-Gg: AfdE7ck2YMCq5IzzXq2REfaKE2eA4t+Rf4w6x2uBvF3q2HY+kcXSLcTlgjW2uh9Aga4
	Oy6MJibw2/lXs5Ek7L/TLQTRHZffn1neYWyLPiyA0uYpGngZ296w+83IeH/MqpUn7HfF18Mudt1
	1HVHTJKoe6qQHkk6RrR5+lwrVZnMFWQlxfKWD42GYm4rYty5zwpS2p++gUwIvjkRMCEgjG6vnG2
	QefKmVnI2zi8ElQs2vSytfTNnJCBkPPuzQHyWjpI+zu9QVO1zODXmOcJDAlsgcMNdU6ePuuydBV
	pyL5v838zXn1PnL/tEMzzc9vMRVRP6QCRC+f0FeyI8oa8QxUc235s0eutOzbm2NYQP375YBsdEW
	39SgIfYpIwVmpHaJrcNPx1ZeN9ZKiCQQbK5Vd7d54fhVQPdLN5uQuxwB2a31SKc/y92z3lTkjJh
	VQU2on8YY+
X-Received: by 2002:a05:6870:35d3:b0:455:a205:fcb4 with SMTP id 586e51a60fabf-4562b891c67mr2155727fac.20.1784134070985;
        Wed, 15 Jul 2026 09:47:50 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::eb5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-451b64192adsm17354179fac.18.2026.07.15.09.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 09:47:50 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v2 12/25] gnu-config: Replace deprecated SPDX identifier
Date: Wed, 15 Jul 2026 10:45:08 -0600
Message-ID: <20260715164739.364323-13-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260715164739.364323-1-JPEWhacker@gmail.com>
References: <20260714190405.3328796-1-JPEWhacker@gmail.com>
 <20260715164739.364323-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 16:48:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241005

GPL-3.0-with-autoconf-exception is deprecated. Replace it with
"GPL-3.0-or-later WITH Autoconf-exception-generic-3.0"

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-devtools/gnu-config/gnu-config_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gnu-config/gnu-config_git.bb b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
index 5d82be87da..d5b4189573 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
@@ -2,7 +2,7 @@ SUMMARY = "gnu-configize"
 DESCRIPTION = "Tool that installs the GNU config.guess / config.sub into a directory tree"
 HOMEPAGE = "https://git.savannah.gnu.org/cgit/config.git"
 SECTION = "devel"
-LICENSE = "GPL-3.0-with-autoconf-exception"
+LICENSE = "GPL-3.0-or-later WITH Autoconf-exception-generic-3.0"
 LIC_FILES_CHKSUM = "file://config.guess;beginline=9;endline=29;md5=10922f9231863a06f6efb67691fa46e0"
 
 DEPENDS:class-native = "hostperl-runtime-native"
-- 
2.54.0


