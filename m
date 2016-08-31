Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B9D846E668
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 10:31:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7VAVQLl016119 for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 11:31:32 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id JaOY2IT7zE-T
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 11:31:32 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7VAVT34016130
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 11:31:30 +0100
Message-ID: <1472639489.29583.68.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 31 Aug 2016 11:31:29 +0100
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] lttng-ust: Update 2.7.1 -> 2.8.1
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
X-List-Received-Date: Wed, 31 Aug 2016 10:31:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Drop aarch64_be patch which is now upstream.
Update doc patch to apply to latest version.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-kernel/lttng/lttng-ust/lttng-ust-add-support-for-aarch64_be.patch b/meta/recipes-kernel/lttng/lttng-ust/lttng-ust-add-support-for-aarch64_be.patch
deleted file mode 100644
index 9b37a4a..0000000
--- a/meta/recipes-kernel/lttng/lttng-ust/lttng-ust-add-support-for-aarch64_be.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-lttng-ust: add support for aarch64_be
-
-Upstream-Status: Pending
-
-Signed-off-by: Tudor Florea <tudor.florea@enea.com>
-
-diff --ruN a/configure.ac b/configure.ac
---- a/configure.ac	2016-02-18 14:54:54.651713647 +0100
-+++ b/configure.ac	2016-02-18 14:56:11.057865297 +0100
-@@ -240,6 +240,7 @@
- 	s390x) NO_UNALIGNED_ACCESS=1 ;;
-         arm*) NO_UNALIGNED_ACCESS=1 ;;
- 	aarch64) NO_UNALIGNED_ACCESS=1 ;;
-+        aarch64_be) NO_UNALIGNED_ACCESS=1 ;;
- 	mips*) NO_UNALIGNED_ACCESS=1 ;;
- 	tile*) NO_UNALIGNED_ACCESS=1 ;;
- 	*)
diff --git a/meta/recipes-kernel/lttng/lttng-ust/lttng-ust-doc-examples-disable.patch b/meta/recipes-kernel/lttng/lttng-ust/lttng-ust-doc-examples-disable.patch
index b68a989..caf0b8b 100644
--- a/meta/recipes-kernel/lttng/lttng-ust/lttng-ust-doc-examples-disable.patch
+++ b/meta/recipes-kernel/lttng/lttng-ust/lttng-ust-doc-examples-disable.patch
@@ -11,7 +11,7 @@ Index: doc/Makefile.am
 --- a/doc/Makefile.am
 +++ b/doc/Makefile.am
 @@ -1,4 +1,4 @@
--SUBDIRS = . examples
+-SUBDIRS = . man examples
 +SUBDIRS = .
  
  dist_man_MANS = man/lttng-gen-tp.1 \
diff --git a/meta/recipes-kernel/lttng/lttng-ust_git.bb b/meta/recipes-kernel/lttng/lttng-ust_git.bb
index f5a12b1..a642a32 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_git.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_git.bb
@@ -18,13 +18,12 @@ RPROVIDES_${PN} = "lttng2-ust"
 RREPLACES_${PN} = "lttng2-ust"
 RCONFLICTS_${PN} = "lttng2-ust"
 
-SRCREV = "f89c1a3cf2b06a4970b9154c00ff6409870aefb5"
+SRCREV = "514a87f3b64181e384399935a5708a8f85b0cc83"
 PE = "2"
-PV = "2.7.1+git${SRCPV}"
+PV = "2.8.1+git${SRCPV}"
 
-SRC_URI = "git://git.lttng.org/lttng-ust.git;branch=stable-2.7 \
+SRC_URI = "git://git.lttng.org/lttng-ust.git;branch=stable-2.8 \
            file://lttng-ust-doc-examples-disable.patch \
-           file://lttng-ust-add-support-for-aarch64_be.patch \
           "
 
 do_install_append() {



