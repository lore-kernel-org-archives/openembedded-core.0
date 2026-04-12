Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E99AAF3ED6D
	for <webhook@archiver.kernel.org>; Sun, 12 Apr 2026 02:39:18 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.218803.1775961551410084863
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Apr 2026 19:39:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nDcGLbFD;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2b25cf1b5f0so22517355ad.3
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Apr 2026 19:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775961551; x=1776566351; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bCm9J3IZiIK5RISgpn0GKfcx89Wiaa5s0m1/Zc6W7r4=;
        b=nDcGLbFDOr2GT+1VA/dXmXFH+TEcRiShHTCsDzEhlQE/ypU+a4dSvBc0Lb0F93j0Yp
         b8nS5Mh4PddOtcXJxC3w3HUo6JceqZyISgP7xy3ToReSGlNLi+mdBNrvmfH4HU5Rldb3
         OPykiEW8nUkMENk1WmImYm7PFXfPcPZiyhdGHxICxJwySNMZfxznYSaVmupEVeHyRTmI
         +lZs2QsqxkiZp/WP8Vzd1AORp1qQFmPD4u2rePPaZC5kdKDB5f5cbEE485uccfo66dHD
         SXWfzXWAbyqa0NfBtqeIHCp5UoAyAK8rVKyvkXHbkGTwQ+GbOSCJnj6VJ/qNaBWZjTmM
         mHlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775961551; x=1776566351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bCm9J3IZiIK5RISgpn0GKfcx89Wiaa5s0m1/Zc6W7r4=;
        b=CuJ3It+YCSMnpnlpSYR/kHtKC9VsLdc1Yot2BQPAs0FCW6Fp52ZlJrQLt/Co0RUjZf
         Bo1WsxwhB91S7BM8I6IsP7Sr4jQbUXWpX7XEyxMvoixZMkPJH9F98lDF+Uu68iBnSbGZ
         sm2wiKCsId4esHKeU0b2sBATLAThiQsVuJVAW6l7NeaA7cx614C+Ery28pOaFISc/NuE
         5H7fS3yx00s9qPzmT16c+OZXxjb0Z0fPF0tLBB9/8IJWBrU9IvZeIDvI+NyOREh9wMWq
         arJnDpamt12sqv3H2ocvP7TzkZlEAlNgosNs7bgfgwO/O9Lq49YNtgEIv1X1tuPkhq2R
         TQcA==
X-Gm-Message-State: AOJu0Yy+R/UqBcLd41i5v8y4oXw5rksACUduhwc0IqbXdHux5W4qQjxv
	BE1tuWpRqC5yv387xSVKbytDSu8sTfz4Xtrwpb/g150MkHiEBmS+mrL/v9O0dA==
X-Gm-Gg: AeBDietaSAOnWPXC88VT/EH1fqK300Q3eQdQHclGG2qcyrsO904ocG7ZlStG46rpYMl
	cDx/epAZEm67eOizaMqnHPgnfM86Yvj1BPWQym7M3tLemOroLJd5YqSya0y4ILPz96ua0A2RQKs
	xno3G3P1FeI2HLyT2D9GPGgdGpDMMpcO1v+Tn1YeICtuFschfIPdfU7FEKVuLRZMw8JnrQl8SHs
	92PAgUuuRIbiuJyvpRae/pHi3Rm8GbNz/TwNz3fABY//C6thslGJFnTiVEvpvOD0YCj/mSlzeeh
	dRG8o9LUucuUiOVQo0TTP4yoGjXnoA0znMHhX2IAjfCM8pomVq5NDpdiSk3nSpzYduFNYbsiPiR
	Cmcpm0CrmOViyxjLZ/7fyb6q8iyWJJjjl3OrZbiHRSkNbcH9UJzK1l9jNiCm/DwoDbKMQFm5CVH
	jaT7ZW07bfXX5T3YqBre3jFpaw+NMNVR/+VLNXkJXAX9Y6uio=
X-Received: by 2002:a17:903:2f45:b0:2b2:ebed:7af8 with SMTP id d9443c01a7336-2b2ebed7ebamr13124485ad.1.1775961550530;
        Sat, 11 Apr 2026 19:39:10 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4f26cdcsm76956165ad.59.2026.04.11.19.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 19:39:10 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Jinfeng Wang <jinfeng.wang.cn@windriver.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][scarthgap][PATCH 1/2] tzdata/tzcode-native: upgrade 2025c -> 2026a
Date: Sun, 12 Apr 2026 14:38:56 +1200
Message-ID: <20260412023857.2836123-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Apr 2026 02:39:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235050

From: Jinfeng Wang <jinfeng.wang.cn@windriver.com>

Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 217ede26d64901d9a38fc119efa684487714c08a)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 35f22d5a15..71b034d158 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2025c"
+PV = "2026a"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -16,5 +16,5 @@ S = "${WORKDIR}/tz"
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "697ebe6625444aef5080f58e49d03424bbb52e08bf483d3ddb5acf10cbd15740"
-SRC_URI[tzdata.sha256sum] = "4aa79e4effee53fc4029ffe5f6ebe97937282ebcdf386d5d2da91ce84142f957"
+SRC_URI[tzcode.sha256sum] = "f80a17a2eddd2b54041f9c98d75b0aa8038b016d7c5de72892a146d9938740e1"
+SRC_URI[tzdata.sha256sum] = "77b541725937bb53bd92bd484c0b43bec8545e2d3431ee01f04ef8f2203ba2b7"

