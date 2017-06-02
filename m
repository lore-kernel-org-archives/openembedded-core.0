Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwym01.jp.fujitsu.com (mgwym01.jp.fujitsu.com [211.128.242.40])
	by mail.openembedded.org (Postfix) with ESMTP id C441877E5D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Jun 2017 04:47:54 +0000 (UTC)
Received: from yt-mxoi2.gw.nic.fujitsu.com (unknown [192.168.229.69]) by
	mgwym01.jp.fujitsu.com with smtp
	id 32ba_5d67_c49334a8_118d_42c1_96da_e2a0a78f2352;
	Fri, 02 Jun 2017 13:47:50 +0900
Received: from g01jpfmpwyt03.exch.g01.fujitsu.local
	(g01jpfmpwyt03.exch.g01.fujitsu.local [10.128.193.57])
	by yt-mxoi2.gw.nic.fujitsu.com (Postfix) with ESMTP id 23F87AC00EA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Jun 2017 13:47:49 +0900 (JST)
Received: from G01JPEXCHYT14.g01.fujitsu.local
	(G01JPEXCHYT14.g01.fujitsu.local [10.128.194.53])
	by g01jpfmpwyt03.exch.g01.fujitsu.local (Postfix) with ESMTP id
	B724E46E792 for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Jun 2017 13:47:47 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	G01JPEXCHYT14.g01.fujitsu.local (10.128.194.53) with Microsoft SMTP
	Server id 14.3.266.1; Fri, 2 Jun 2017 13:47:48 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 2 Jun 2017 13:49:05 +0900
Message-ID: <1496378945-11362-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <CAMKF1soxS53rTddDtH2YPFW9f82ndW__0PvWUCMisvf5eOPtqw@mail.gmail.com>
References: <CAMKF1soxS53rTddDtH2YPFW9f82ndW__0PvWUCMisvf5eOPtqw@mail.gmail.com>
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-Encrypted: FENCE-Mail/3.1.1
X-TM-AS-MML: disable
Subject: [PATCH v2] lzo: Upgrade 2.09 -> 2.10
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
X-List-Received-Date: Fri, 02 Jun 2017 04:47:56 -0000
Content-Type: text/plain

1. Upgrade lzo from 2.09 to 2.10

2. Update the license checksum due to the date change, not license change.

3. Add a patch to fix the undefined error.

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 ...-pkgconfigdir-to-solve-the-undefine-error.patch | 27 ++++++++++++++++++++++
 .../lzo/{lzo_2.09.bb => lzo_2.10.bb}               |  7 +++---
 2 files changed, 31 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-support/lzo/lzo/0001-Add-pkgconfigdir-to-solve-the-undefine-error.patch
 rename meta/recipes-support/lzo/{lzo_2.09.bb => lzo_2.10.bb} (78%)

diff --git a/meta/recipes-support/lzo/lzo/0001-Add-pkgconfigdir-to-solve-the-undefine-error.patch b/meta/recipes-support/lzo/lzo/0001-Add-pkgconfigdir-to-solve-the-undefine-error.patch
new file mode 100644
index 0000000..5235a15
--- /dev/null
+++ b/meta/recipes-support/lzo/lzo/0001-Add-pkgconfigdir-to-solve-the-undefine-error.patch
@@ -0,0 +1,27 @@
+From e730bfd7c2d3a4b5f3605878599cb9b20d31b1fd Mon Sep 17 00:00:00 2001
+From: Fan Xin <fan.xin@jp.fujitsu.com>
+Date: Fri, 2 Jun 2017 11:52:25 +0900
+Subject: [PATCH] Add pkgconfigdir to solve the undefine error.
+
+Upstream-Status: Pending
+
+Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
+---
+ Makefile.am | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Makefile.am b/Makefile.am
+index e4d383b..c75023d 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -14,6 +14,7 @@ AM_CPPFLAGS = -I$(top_srcdir)/include -I$(top_srcdir)
+ LDADD = src/liblzo2.la
+ lib_LTLIBRARIES =
+ noinst_PROGRAMS =
++pkgconfigdir = $(libdir)/pkgconfig
+ pkgconfig_DATA = lzo2.pc
+ 
+ 
+-- 
+1.9.1
+
diff --git a/meta/recipes-support/lzo/lzo_2.09.bb b/meta/recipes-support/lzo/lzo_2.10.bb
similarity index 78%
rename from meta/recipes-support/lzo/lzo_2.09.bb
rename to meta/recipes-support/lzo/lzo_2.10.bb
index 2978617..490d230 100644
--- a/meta/recipes-support/lzo/lzo_2.09.bb
+++ b/meta/recipes-support/lzo/lzo_2.10.bb
@@ -3,16 +3,17 @@ HOMEPAGE = "http://www.oberhumer.com/opensource/lzo/"
 SECTION = "libs"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://src/lzo_init.c;beginline=5;endline=25;md5=355023835a9b9eeb70ab895395e951ff"
+                    file://src/lzo_init.c;beginline=5;endline=25;md5=9ae697ca01829b0a383c5d2d163e0108"
 
 SRC_URI = "http://www.oberhumer.com/opensource/lzo/download/lzo-${PV}.tar.gz \
            file://0001-Use-memcpy-instead-of-reinventing-it.patch \
+	   file://0001-Add-pkgconfigdir-to-solve-the-undefine-error.patch \
            file://acinclude.m4 \
            file://run-ptest \
            "
 
-SRC_URI[md5sum] = "c7ffc9a103afe2d1bba0b015e7aa887f"
-SRC_URI[sha256sum] = "f294a7ced313063c057c504257f437c8335c41bfeed23531ee4e6a2b87bcb34c"
+SRC_URI[md5sum] = "39d3f3f9c55c87b1e5d6888e1420f4b5"
+SRC_URI[sha256sum] = "c0f892943208266f9b6543b3ae308fab6284c5c90e627931446fb49b4221a072"
 
 inherit autotools ptest
 
-- 
1.9.1


