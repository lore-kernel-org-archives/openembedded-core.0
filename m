Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id 0F6207F347
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2019 10:10:31 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id u16so16831210wrr.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Sep 2019 03:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=L/ojrPKJ/plk1kkeF9hrma9Jof4ejkZG8+bzwFY3J3Q=;
	b=rVcbSb6vTNnl9aqxS1K46Uulb2eeWf1Vu/f8JJoSgcjsN0mF6JNBqroR0FGeAN+FRb
	lBTOl30Lm0c1h4yyuExDwdwHm6vtTsD8V8EyTOntao7fkg/xc+67L8OECMC1WQvD/cex
	baGpBil4UQzx99BnU4x9CBlEwe1cxUvph9Y6+CrB1jxEI4sVu4JAB4xih5ohIkVd+veh
	u6BM2mHj7E21fvnZL/EIAGBmmbz2214zPjfSMZy4RKhEHB1zHtiVhjhB3X1kIQz6NJ20
	L1LqZA5fHPLdirjLO3sKmpaYofV4NgmJph309PCZ1rFGNu4XehMzTM/kcD1upEHP7pnQ
	LLBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=L/ojrPKJ/plk1kkeF9hrma9Jof4ejkZG8+bzwFY3J3Q=;
	b=hhkhMTsg2V9wrHmWiJPo12ZlqviANJY1/9ROiVk9FPNqF4B2ECwYldA55u1CPO2Pzu
	ce/jwWmxxdCOJTP6r6atKpWUvtTsHlt/X+keVnBlfFCM1ocuehqJzk4BcfsmtQA16bTN
	NxbCzIBEhML9/dneVSW6N3rIITvUSSMGeg30GITXWHnLbQVp1qXj+3abAgHsvuxDTL/w
	IYpZD7z9Xtj6RUQGRwUfiuU+udiVwy4uWrT1SJXnThTAC2M6v+sC1gSoVCTEByS3oUAM
	9yAm4SaY+BtGqW0pc5EA0T0oDtY91aYyZruqC3T9ZSrNrODN3s+lEm0anUW8H86dXFBv
	jifg==
X-Gm-Message-State: APjAAAXJv1MSXRFc9/POpdN5y0oyqxsxB3tYvu8XJSSnq7DIdUgW3B13
	IJcq7Jeo7ZWkjQ7UtADrFa0KO2Lvx8k=
X-Google-Smtp-Source: APXvYqwmPodFUMzUX8Ms+owMzjiWfmYgX6KNRTDxNaiZPEPJRUNKs2c3ch0rjZZhRcoyR+SEn1v08A==
X-Received: by 2002:adf:e452:: with SMTP id t18mr41818384wrm.0.1567505432370; 
	Tue, 03 Sep 2019 03:10:32 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	d12sm3703695wme.33.2019.09.03.03.10.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 03 Sep 2019 03:10:30 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Sep 2019 11:10:28 +0100
Message-Id: <20190903101028.6578-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] libnl: update musl patch header to reflect upstream status
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
X-List-Received-Date: Tue, 03 Sep 2019 10:10:32 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../0001-PATCH-fix-libnl-3.4.0-musl-compile-problem.patch    | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libnl/libnl/0001-PATCH-fix-libnl-3.4.0-musl-compile-problem.patch b/meta/recipes-support/libnl/libnl/0001-PATCH-fix-libnl-3.4.0-musl-compile-problem.patch
index b20a2996234..a14b9b125e5 100644
--- a/meta/recipes-support/libnl/libnl/0001-PATCH-fix-libnl-3.4.0-musl-compile-problem.patch
+++ b/meta/recipes-support/libnl/libnl/0001-PATCH-fix-libnl-3.4.0-musl-compile-problem.patch
@@ -1,8 +1,9 @@
+Band-aid fix, superceded upstream by https://github.com/thom311/libnl/pull/222.
+
 Subject: [PATCH] fix libnl-3.4.0 musl compile problem  
 Avoid in6_addr redefinition
 
-Upstream-Status: Pending
-
+Upstream-Status: Inappropriate [https://github.com/thom311/libnl/pull/222]
 Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
 ---
  include/linux-private/linux/if_bridge.h | 1 -
-- 
2.20.1


