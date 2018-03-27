Return-Path: <changhyeok.bae@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id EB6B578454
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 00:50:37 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id a16so8213739pfn.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 17:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=MveKfPoo94nFxf2B7xgc4QsYAtNEc3+PgyzkgrLqaB8=;
	b=ddVMPsGknO1vdkNbr3jK6C2In4V8QvHks7Ra0+FuyUnbR44TdHZLm3lRGpWRF7AVST
	Mwpu0SY2bCYS+Z7t4JzGqvqzxKq/WW5Z9Hs3g7BBNhmnGdvQLhXe67vHtp0okLN9k6qY
	r1tcd/rabIgTk/3Hne0unn6XmvjJloRvDCtiTlAVEcHgp1nE1fuTSSWAVKVn8ka1AiNJ
	1Ar0ensHmDjjRWwQhwtA8Hjmo2qimjVDPjbw9Q+CYVvi2EAKHyMnOWfivXogkcTtsF3O
	zyN9ac/BKlrkCpXyKnSokoI0Am4hKldxwvqbhZABMvDy9wkQa78TlRP4hPzTOA1sRm9l
	17YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=MveKfPoo94nFxf2B7xgc4QsYAtNEc3+PgyzkgrLqaB8=;
	b=D3WqWm1WBnZc1l8x0+DfSeBW1/2txmD/oWorhZUEtl7kgubEAeNYJ/5bxIC41emXTj
	5evbPf04MAY2zKNu7iMFsjPO6zgtIkdZCQ5MZQ10AIB1U3fAloqSvatm1HLEk6dy3xTt
	GyAiGt3j7E+mum7EmOuqlWx0MaI1H4OxD35csPIF5x44yuGx/hCUDtvfQNiRC4ST9f0A
	AXCSVhIMlt1W0vQ+E+KU/w2VMKOY6EkKCb7OeG2o+JdW32IUQhnFs85nhMyFqu4doNPc
	CkE6vxKMAftHDjfl7k9imn8nBsBCFKmOJex+tpPJPE8DJmgcOPO7ihMMB4RedrAqLRD9
	QQBw==
X-Gm-Message-State: AElRT7HqqI3dW5QY4lYKxU1kai8z14gHLhpuNkFJpzbjXWDSmGV/HZWd
	c4tWyDLaANLfkVYhLzFkV3SU8xtF
X-Google-Smtp-Source: AG47ELveRm+s7cPlg1FyO2jG/zqwxO13Ep1tWlveSjY8t/Hi+GHrZGKL6mV1I4DkToYcl0JCNKYnWA==
X-Received: by 10.99.127.27 with SMTP id a27mr29348779pgd.18.1522111838853;
	Mon, 26 Mar 2018 17:50:38 -0700 (PDT)
Received: from ip-172-31-22-0.ap-northeast-2.compute.internal
	(ec2-52-78-229-153.ap-northeast-2.compute.amazonaws.com.
	[52.78.229.153])
	by smtp.gmail.com with ESMTPSA id a82sm24547pfj.153.2018.03.26.17.50.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 26 Mar 2018 17:50:38 -0700 (PDT)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Mar 2018 00:50:30 +0000
Message-Id: <1522111830-49947-2-git-send-email-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1522111830-49947-1-git-send-email-changhyeok.bae@gmail.com>
References: <1522111830-49947-1-git-send-email-changhyeok.bae@gmail.com>
Subject: [PATCH 2/2] ethtool: update 4.13 -> 4.15
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
X-List-Received-Date: Tue, 27 Mar 2018 00:50:38 -0000

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 .../ethtool/ethtool/avoid_parallel_tests.patch      | 21 +++++++++++++++------
 .../ethtool/{ethtool_4.13.bb => ethtool_4.15.bb}    |  4 ++--
 2 files changed, 17 insertions(+), 8 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_4.13.bb => ethtool_4.15.bb} (88%)

diff --git a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
index de38104..59299e2 100644
--- a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
+++ b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
@@ -1,3 +1,8 @@
+From d069dada68b063e386cdb61707f0b22fb1799029 Mon Sep 17 00:00:00 2001
+From: Tudor Florea <tudor.florea@enea.com>
+Date: Wed, 28 May 2014 18:59:54 +0200
+Subject: [PATCH] ethtool: use serial-tests config needed by ptest.
+
 ptest needs buildtest-TESTS and runtest-TESTS targets.
 serial-tests is required to generate those targets.
 
@@ -5,12 +10,16 @@ Signed-off-by: Tudor Florea <tudor.florea@enea.com>
 Upstream-Status: Inappropriate
 (default automake behavior incompatible with ptest)
 
-Index: ethtool-4.13/configure.ac
-===================================================================
---- ethtool-4.13.orig/configure.ac
-+++ ethtool-4.13/configure.ac
-@@ -2,7 +2,7 @@ dnl Process this file with autoconf to p
- AC_INIT(ethtool, 4.13, netdev@vger.kernel.org)
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index cb61a02..c75b9a9 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -2,7 +2,7 @@ dnl Process this file with autoconf to produce a configure script.
+ AC_INIT(ethtool, 4.15, netdev@vger.kernel.org)
  AC_PREREQ(2.52)
  AC_CONFIG_SRCDIR([ethtool.c])
 -AM_INIT_AUTOMAKE([gnu])
diff --git a/meta/recipes-extended/ethtool/ethtool_4.13.bb b/meta/recipes-extended/ethtool/ethtool_4.15.bb
similarity index 88%
rename from meta/recipes-extended/ethtool/ethtool_4.13.bb
rename to meta/recipes-extended/ethtool/ethtool_4.15.bb
index c862a57..8538a75 100644
--- a/meta/recipes-extended/ethtool/ethtool_4.13.bb
+++ b/meta/recipes-extended/ethtool/ethtool_4.15.bb
@@ -11,8 +11,8 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[md5sum] = "2ba44eb0ca96752392e9bf8dc83ba302"
-SRC_URI[sha256sum] = "d311c4b557c44c5248ac5436b9e19c391a60d8e4830b6a7f41be16d89c0556de"
+SRC_URI[md5sum] = "a4b83b35a4bc7d3646d973b0baf36c78"
+SRC_URI[sha256sum] = "3996127fc22950b865287bd9d28c0aa3fcd44e914a5a4ef01de64872106dc178"
 
 inherit autotools ptest
 RDEPENDS_${PN}-ptest += "make"
-- 
2.7.4


