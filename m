Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T9kq3-0003fY-Ka
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Sep 2012 00:46:19 +0200
Received: by iaky10 with SMTP id y10so2706312iak.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2012 15:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=ulQBUMDSjVAZOHWVZNTxy0h2N8v8kRDSpyx4+qmggH0=;
	b=EXApPjcfYdS2zWUI/hHjya2U0bqHS/u5DkDhHDd7P0Ou0aBGgLh8A6wLl8zgLZtTW4
	ZPZO3sUqyuKittRt6vTW1ZKg6/8haLr80U9hfZbnLpjhyUYwOphfbk3jx/pOQR4MEV4K
	LmeLwtdpuNKc+BdRwKMJClO9xeIu5CvN84NKOWYgR+/ala1iVCWTMY4iNKk65wnJnARb
	VzK7fitGhLQoaCNB1ZJAkc6n+yWoZDzU+52ahcm+kSHrmJruHziEZMB687dFCNOC0YDy
	Hp8Kkia/MAg7y0RaMAJPVGHVr8MpuX7aA+9HAjt1lnQuFvHm57T7Us7IG9n7WDo2ADoM
	U9Ig==
Received: by 10.50.213.39 with SMTP id np7mr5361612igc.51.1346970834416;
	Thu, 06 Sep 2012 15:33:54 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id n5sm8157066igw.13.2012.09.06.15.33.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Sep 2012 15:33:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2012 15:32:48 -0700
Message-Id: <79c3225e4613a32edca699207117f3061e4eb022.1346970617.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <78bc20e7fc534e4452c6a17c6c5d9020ac014eff.1346970617.git.raj.khem@gmail.com>
References: <78bc20e7fc534e4452c6a17c6c5d9020ac014eff.1346970617.git.raj.khem@gmail.com>
In-Reply-To: <cover.1346970617.git.raj.khem@gmail.com>
References: <cover.1346970617.git.raj.khem@gmail.com>
Subject: [PATCH 6/6] machines/x86: Drop redundant glibc configure knobs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Sep 2012 22:46:20 -0000

nptl and thereby tls are not optional anymore

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/include/ia32-base.inc |    5 -----
 meta/conf/machine/qemux86-64.conf       |    3 ---
 meta/conf/machine/qemux86.conf          |    4 ----
 3 files changed, 12 deletions(-)

diff --git a/meta/conf/machine/include/ia32-base.inc b/meta/conf/machine/include/ia32-base.inc
index af583ae..78d4458 100644
--- a/meta/conf/machine/include/ia32-base.inc
+++ b/meta/conf/machine/include/ia32-base.inc
@@ -18,11 +18,6 @@ KERNEL_IMAGETYPE ?= "bzImage"
 SERIAL_CONSOLE ?= "115200 ttyS0"
 
 #
-# glibc-related variables
-#
-GLIBC_ADDONS ?= "nptl"
-
-#
 # kernel-related variables
 #
 PREFERRED_PROVIDER_virtual/kernel ??= "linux-yocto"
diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
index 285054a..8d4bd6f 100644
--- a/meta/conf/machine/qemux86-64.conf
+++ b/meta/conf/machine/qemux86-64.conf
@@ -26,7 +26,4 @@ require conf/machine/include/qemu.inc
 
 MACHINE_FEATURES += "x86"
 
-GLIBC_ADDONS = "nptl"
-GLIBC_EXTRA_OECONF = "--with-tls"
-
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "v86d"
diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.conf
index c81afe5..6edf386 100644
--- a/meta/conf/machine/qemux86.conf
+++ b/meta/conf/machine/qemux86.conf
@@ -26,8 +26,4 @@ require conf/machine/include/qemu.inc
 
 MACHINE_FEATURES += "x86"
 
-GLIBC_ADDONS = "nptl"
-GLIBC_EXTRA_OECONF = "--with-tls"
-
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "v86d"
-
-- 
1.7.9.5



