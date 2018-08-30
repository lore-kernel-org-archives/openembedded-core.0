Return-Path: <diego.rondini@kynetics.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id BB4BD793CF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 13:42:37 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id s10-v6so6547976edb.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 06:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kynetics-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=u4JyJxzS2jreVg6IZEFmzCVIWFjjipC1OH/HMEWBNt0=;
	b=VOJHcPgTJHAtiOPM8Jh+g77IA98NaLRNtmcb+lwLkg2MCd/74XwLEbhn624g8XYHQ8
	V3GFA+AG600hKIXsG+jmHSDhvPNX98O+a7BhNsPYWeyW8ydLmQlWAFzGCcwUFUIsVLRS
	nRrSC5LXPfsTc76kS/09Yzw7we2HTeSMGpvT/80F/XSPxDiFeX/llsPaLiSsKw2dNP1k
	tHDdUuCzrX4KMFJVC6siyzvmcYhckjukhB/RVTypq54oL5y04ln5SdDYMfSA2HIWYiga
	AIPLLsD/aDlFzH7v+Tjy7BmoCOrHmiHSZIaGFZELc34+/jWyk5S1JpUEr21kz+enRx69
	gu4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=u4JyJxzS2jreVg6IZEFmzCVIWFjjipC1OH/HMEWBNt0=;
	b=JOuh/jHlNOCDraRhYAD9t/CMrTk0NNty/djKRqgAp/Xf4ToJAW7VLjH0JtW0XYLt04
	GYuHGIIc6EL1NK2FDb+b5SyhA4PcEM4Bk/eH7iLW0x19YC/+DtvQV81c1bl15nWRS8Q/
	F6FvYan3RPH0iyCSn4dAAVb3mZkOO8emjrIzSlT8IgSwhtbI6IG3m7L48LOEMq9ik1VI
	ktFLAUL6ab3Ebf6c+gj8mGJSs1WiMnu3GR2A1GpDfzgR+VagzNZbKIJz+C1LqDqqrJgO
	D/o/tT7NFAKuswu0ebPle7o4TrK3l4xaEt2c/YsKECyoVnj71ZCe3KZyfyWIKhcUvWSG
	UyuA==
X-Gm-Message-State: APzg51AuW+PEs+rK+Fwq2D2nk6JRDj8C0NsUaizDNVAVzYe53xJphlrf
	GCHw4mRVnbX0vU/2ZqVNW7IPevq/lqk=
X-Google-Smtp-Source: ANB0VdbkUBuEKQoTAO6EGTdm3zDHuU3Zmp/ZlqfEt5ahtaXNuFlPqXwfzOhSkoCNJsd4u9bQPrwgKg==
X-Received: by 2002:a50:a5e8:: with SMTP id
	b37-v6mr13154510edc.268.1535636558033; 
	Thu, 30 Aug 2018 06:42:38 -0700 (PDT)
Received: from ip-172-31-7-228.eu-west-1.compute.internal
	(ec2-54-171-5-113.eu-west-1.compute.amazonaws.com. [54.171.5.113])
	by smtp.gmail.com with ESMTPSA id
	e30-v6sm2895766ede.91.2018.08.30.06.42.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 30 Aug 2018 06:42:37 -0700 (PDT)
From: Diego Rondini <diego.rondini@kynetics.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Aug 2018 13:41:59 +0000
Message-Id: <1535636519-3244-1-git-send-email-diego.rondini@kynetics.com>
X-Mailer: git-send-email 2.7.4
Cc: Gregory Vimont <gregory.vimont@softbankrobotics.com>
Subject: [meta-oe][rocko][sumo][PATCH] tbb: check the version of the cross gcc instead of host gcc
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
X-List-Received-Date: Thu, 30 Aug 2018 13:42:38 -0000

From: Gregory Vimont <gregory.vimont@softbankrobotics.com>

When cross compiling on linux with gcc, the host gcc was used instead of
the cross gcc to set compilation flags according to gcc version.

Signed-off-by: Gregory Vimont <gregory.vimont@softbankrobotics.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
The reason of the backport is to fix a crash, details here:
http://lists.openembedded.org/pipermail/openembedded-devel/2018-August/120116.html
---
 meta-oe/recipes-support/tbb/tbb.bb                 |  1 +
 .../tbb/tbb/0002-linux-Fix-gcc-version-check.patch | 57 ++++++++++++++++++++++
 2 files changed, 58 insertions(+)
 create mode 100644 meta-oe/recipes-support/tbb/tbb/0002-linux-Fix-gcc-version-check.patch

diff --git a/meta-oe/recipes-support/tbb/tbb.bb b/meta-oe/recipes-support/tbb/tbb.bb
index bad9481..f870104 100644
--- a/meta-oe/recipes-support/tbb/tbb.bb
+++ b/meta-oe/recipes-support/tbb/tbb.bb
@@ -13,6 +13,7 @@ PV = "${PRDATE}+${SRCPV}"
 SRC_URI = "git://github.com/01org/tbb;branch=${BRANCH} \
            file://cross-compile.patch \
            file://0001-mallinfo-is-glibc-specific-API-mark-it-so.patch \
+           file://0002-linux-Fix-gcc-version-check.patch \
            file://tbb.pc \
 "
 
diff --git a/meta-oe/recipes-support/tbb/tbb/0002-linux-Fix-gcc-version-check.patch b/meta-oe/recipes-support/tbb/tbb/0002-linux-Fix-gcc-version-check.patch
new file mode 100644
index 0000000..9824b61
--- /dev/null
+++ b/meta-oe/recipes-support/tbb/tbb/0002-linux-Fix-gcc-version-check.patch
@@ -0,0 +1,57 @@
+From aee098f1bf0511c6b5544de3170a9e8b51673b60 Mon Sep 17 00:00:00 2001
+From: Pierre Le Magourou <plemagourou@softbankrobotics.com>
+Date: Tue, 23 Jan 2018 15:25:50 +0100
+Subject: [PATCH] linux.gcc: Fix cross compilation error.
+
+When cross compiling on linux with gcc, the host gcc was used instead of
+the cross gcc to set compilation flags according to gcc version.
+
+When the cross gcc was in version 5.X and the host gcc in version 7.X,
+tbb was compiled with the -flifetime-dse=1 flag that does not exist on
+gcc 5.X.
+---
+ build/linux.gcc.inc | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/build/linux.gcc.inc b/build/linux.gcc.inc
+index 5c1889c..a4d6698 100644
+--- a/build/linux.gcc.inc
++++ b/build/linux.gcc.inc
+@@ -41,29 +41,29 @@ LINK_FLAGS = -Wl,-rpath-link=. -rdynamic
+ C_FLAGS = $(CPLUS_FLAGS)
+ 
+ # gcc 4.2 and higher support OpenMP
+-ifneq (,$(shell gcc -dumpversion | egrep  "^(4\.[2-9]|[5-9])"))
++ifneq (,$(shell $(CC) -dumpversion | egrep  "^(4\.[2-9]|[5-9])"))
+     OPENMP_FLAG = -fopenmp
+ endif
+ 
+ # gcc 4.8 and later support RTM intrinsics, but require command line switch to enable them
+-ifneq (,$(shell gcc -dumpversion | egrep  "^(4\.[8-9]|[5-9])"))
++ifneq (,$(shell $(CC) -dumpversion | egrep  "^(4\.[8-9]|[5-9])"))
+     RTM_KEY = -mrtm
+ endif
+ 
+ # gcc 4.0 and later have -Wextra that is used by some our customers.
+-ifneq (,$(shell gcc -dumpversion | egrep  "^([4-9])"))
++ifneq (,$(shell $(CC) -dumpversion | egrep  "^([4-9])"))
+     TEST_WARNING_KEY += -Wextra
+ endif
+ 
+ # gcc 5.0 and later have -Wsuggest-override option
+ # enable it via a pre-included header in order to limit to C++11 and above
+-ifneq (,$(shell gcc -dumpversion | egrep  "^([5-9])"))
++ifneq (,$(shell $(CC) -dumpversion | egrep  "^([5-9])"))
+     INCLUDE_TEST_HEADERS = -include $(tbb_root)/src/test/harness_preload.h
+ endif
+ 
+ # gcc 6.0 and later have -flifetime-dse option that controls
+ # elimination of stores done outside the object lifetime
+-ifneq (,$(shell gcc -dumpversion | egrep  "^([6-9])"))
++ifneq (,$(shell $(CC) -dumpversion | egrep  "^([6-9])"))
+     # keep pre-contruction stores for zero initialization
+     DSE_KEY = -flifetime-dse=1
+ endif
+-- 
+2.15.1
+
-- 
2.7.4


