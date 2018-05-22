Return-Path: <changhyeok.bae@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id E7536749CA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2018 14:46:16 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id w19-v6so11045211plq.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2018 07:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=mqDf5FJ9fBzaUXxmlKyZGwZjF9NYp7aY5eHhaKLihQo=;
	b=GjJlHM22jbkHrD4m2K7pG16aF+WFzohqhtkdeV2u4ePFf+Y2vKspux+4VgTvqjreRR
	s4f2IZuhNdZz37bRAQtZSqkaG8eNMU1x1PXu1JrP3VXzqu9yzrqz2mS1Udplos7eTAOF
	UbVlPUyJQnBjLlb9aHiz0jwEVJQbm7kpYuPb+cHl1854010N3nnSMuE1NRThzoIT1Vpw
	gN1VTxzrpo0GV3G5eYvrRNwcjcyhsRlrpmvENO3BpoM0eOgqYqIucntCWPfagMxF1vAM
	8qv5nZ9INBw/yBtTrOrgSPOn9LqGc9Lcr4J9bbBZutxk/zedxj7IWnZx698PEueOhkHE
	8gsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=mqDf5FJ9fBzaUXxmlKyZGwZjF9NYp7aY5eHhaKLihQo=;
	b=MtZDZmOxFX9Ph0Wb4AVKWsyiK1pmFRUf1zpqijOLfVTWIClyFvL8qv6iXhs/tzlbgn
	hJ1eB/isVSm0tSEEjmFHAWvhN0WhlwQIAx6Lj7W9ep20IcGCVx03DxforE5JsYEP9kT8
	LvIjYbx3hORKiO0IA0fENYQ/QfCP/WnFWQpNVf5Dw8nJFirY79do0Io7k78U7Ib2u9gH
	atVJ4gbEm9p8oR5vyq2+SS2E4McQgZo1WGNM7prmcm25OzgFJebKuQS4MO77ZP+S+Q2k
	4UY8XxRnpKClq8Lj5T6djNUMYX37qMf77q7Ivf5ai46XLFj7vhR9KaQTt/TUtQJcAlLn
	LFVQ==
X-Gm-Message-State: ALKqPwfTnrS5AashLklAE6G7llWXBQaPbxoRd4Ssish7CTRZ/G3+j/IM
	b2d3pwV4wYTTS8M4Ldqx/1tXLg==
X-Google-Smtp-Source: AB8JxZosfofnIGasyZgJAgL/hsk16gF43amAlVmsb3UxKfx8l69xZPqPUhyOQNb/MAnDXNIr+3vTNg==
X-Received: by 2002:a17:902:8d81:: with SMTP id
	v1-v6mr10832869plo.136.1527000377524; 
	Tue, 22 May 2018 07:46:17 -0700 (PDT)
Received: from ip-172-31-26-116.ap-northeast-2.compute.internal
	(ec2-52-79-39-246.ap-northeast-2.compute.amazonaws.com.
	[52.79.39.246]) by smtp.gmail.com with ESMTPSA id
	g68-v6sm28690038pfk.53.2018.05.22.07.46.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 22 May 2018 07:46:16 -0700 (PDT)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 May 2018 14:46:10 +0000
Message-Id: <1527000370-17012-1-git-send-email-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] ethtool: update 4.15 -> 4.16
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
X-List-Received-Date: Tue, 22 May 2018 14:46:17 -0000

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch   | 2 +-
 meta/recipes-extended/ethtool/{ethtool_4.15.bb => ethtool_4.16.bb} | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_4.15.bb => ethtool_4.16.bb} (88%)

diff --git a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
index 59299e2..ccb4dd3 100644
--- a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
+++ b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
@@ -19,7 +19,7 @@ index cb61a02..c75b9a9 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -2,7 +2,7 @@ dnl Process this file with autoconf to produce a configure script.
- AC_INIT(ethtool, 4.15, netdev@vger.kernel.org)
+ AC_INIT(ethtool, 4.16, netdev@vger.kernel.org)
  AC_PREREQ(2.52)
  AC_CONFIG_SRCDIR([ethtool.c])
 -AM_INIT_AUTOMAKE([gnu])
diff --git a/meta/recipes-extended/ethtool/ethtool_4.15.bb b/meta/recipes-extended/ethtool/ethtool_4.16.bb
similarity index 88%
rename from meta/recipes-extended/ethtool/ethtool_4.15.bb
rename to meta/recipes-extended/ethtool/ethtool_4.16.bb
index 8538a75..5ccb162 100644
--- a/meta/recipes-extended/ethtool/ethtool_4.15.bb
+++ b/meta/recipes-extended/ethtool/ethtool_4.16.bb
@@ -11,8 +11,8 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[md5sum] = "a4b83b35a4bc7d3646d973b0baf36c78"
-SRC_URI[sha256sum] = "3996127fc22950b865287bd9d28c0aa3fcd44e914a5a4ef01de64872106dc178"
+SRC_URI[md5sum] = "2b50adf06fc1b033951edef5987c32f3"
+SRC_URI[sha256sum] = "25f8fc3a4b2cb2cbfe8741148d8e743127dd7c951df96d8d6dccb88741f8a27d"
 
 inherit autotools ptest
 RDEPENDS_${PN}-ptest += "make"
-- 
2.7.4


