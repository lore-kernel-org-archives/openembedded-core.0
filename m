Return-Path: <Zubair.Kakakhel@imgtec.com>
Received: from mailapp01.imgtec.com (mailapp01.imgtec.com [195.59.15.196])
	by mail.openembedded.org (Postfix) with ESMTP id 01FE672F87
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Mar 2017 13:52:20 +0000 (UTC)
Received: from hhmail02.hh.imgtec.org (unknown [10.100.10.20])
	by Forcepoint Email with ESMTPS id 2A58331AA9D04
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Mar 2017 13:36:42 +0000 (GMT)
Received: from zkakakhel-linux.le.imgtec.org (192.168.154.45) by
	hhmail02.hh.imgtec.org (10.100.10.21) with Microsoft SMTP Server (TLS)
	id 14.3.294.0; Thu, 2 Mar 2017 13:36:44 +0000
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 2 Mar 2017 13:36:30 +0000
Message-ID: <20170302133630.2958-1-Zubair.Kakakhel@imgtec.com>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
X-Originating-IP: [192.168.154.45]
Subject: [Patch] autoconf: Add configurations for MIPS R6
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
X-List-Received-Date: Thu, 02 Mar 2017 13:52:21 -0000
Content-Type: text/plain

Add configurations for MIPS R6

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>

---
Is this the right way?

Ideally should fetch a new file from

http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.sub;hb=HEAD
---
 .../autoconf/autoconf/0001-add-mips-r6.patch       | 38 ++++++++++++++++++++++
 meta/recipes-devtools/autoconf/autoconf_2.69.bb    |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/0001-add-mips-r6.patch

diff --git a/meta/recipes-devtools/autoconf/autoconf/0001-add-mips-r6.patch b/meta/recipes-devtools/autoconf/autoconf/0001-add-mips-r6.patch
new file mode 100644
index 0000000..508d0e2
--- /dev/null
+++ b/meta/recipes-devtools/autoconf/autoconf/0001-add-mips-r6.patch
@@ -0,0 +1,38 @@
+From 5c10c77d702703a0b7e79a1c28beb01d81cf848b Mon Sep 17 00:00:00 2001
+From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
+Date: Tue, 15 Nov 2016 17:08:46 +0000
+Subject: [PATCH] add mips r6
+
+---
+ build-aux/config.sub | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/build-aux/config.sub b/build-aux/config.sub
+index 59bb593..113c5ab 100755
+--- a/build-aux/config.sub
++++ b/build-aux/config.sub
+@@ -287,8 +287,10 @@ case $basic_machine in
+ 	| mips64vr5900 | mips64vr5900el \
+ 	| mipsisa32 | mipsisa32el \
+ 	| mipsisa32r2 | mipsisa32r2el \
++	| mipsisa32r6 | mipsisa32r6el \
+ 	| mipsisa64 | mipsisa64el \
+ 	| mipsisa64r2 | mipsisa64r2el \
++	| mipsisa64r6 | mipsisa64r6el \
+ 	| mipsisa64sb1 | mipsisa64sb1el \
+ 	| mipsisa64sr71k | mipsisa64sr71kel \
+ 	| mipstx39 | mipstx39el \
+@@ -403,8 +405,10 @@ case $basic_machine in
+ 	| mips64vr5900-* | mips64vr5900el-* \
+ 	| mipsisa32-* | mipsisa32el-* \
+ 	| mipsisa32r2-* | mipsisa32r2el-* \
++	| mipsisa32r6-* | mipsisa32r6el-* \
+ 	| mipsisa64-* | mipsisa64el-* \
+ 	| mipsisa64r2-* | mipsisa64r2el-* \
++	| mipsisa64r6-* | mipsisa64r6el-* \
+ 	| mipsisa64sb1-* | mipsisa64sb1el-* \
+ 	| mipsisa64sr71k-* | mipsisa64sr71kel-* \
+ 	| mipstx39-* | mipstx39el-* \
+-- 
+2.10.2
+
diff --git a/meta/recipes-devtools/autoconf/autoconf_2.69.bb b/meta/recipes-devtools/autoconf/autoconf_2.69.bb
index fd01585..3434038 100644
--- a/meta/recipes-devtools/autoconf/autoconf_2.69.bb
+++ b/meta/recipes-devtools/autoconf/autoconf_2.69.bb
@@ -15,6 +15,7 @@ SRC_URI += "file://check-automake-cross-warning.patch \
             file://add_musl_config.patch \
             file://performance.patch \
             file://AC_HEADER_MAJOR-port-to-glibc-2.25.patch \
+            file://0001-add-mips-r6.patch \
            "
 
 SRC_URI[md5sum] = "82d05e03b93e45f5a39b828dc9c6c29b"
-- 
2.10.2


