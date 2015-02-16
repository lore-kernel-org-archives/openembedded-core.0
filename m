Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 85C1771634
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Feb 2015 16:23:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1GGNr4a006209; Mon, 16 Feb 2015 16:23:53 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id caIJ3YSeb7We; Mon, 16 Feb 2015 16:23:53 +0000 (GMT)
Received: from ted (5751f4a1.skybroadband.com [87.81.244.161])
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1GGNoNA006206
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 16 Feb 2015 16:23:51 GMT
Received: from richard by ted with local (Exim 4.84_RC1)
	(envelope-from <richard@dan.rpsys.net>)
	id 1YNOSW-0003G6-Sb; Mon, 16 Feb 2015 16:23:44 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Feb 2015 16:23:39 +0000
Message-Id: <1424103819-12481-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Subject: [PATCH] libtool: 2.4.5 -> 2.4.6
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
X-List-Received-Date: Mon, 16 Feb 2015 16:24:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Drop patch merged upstream.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{libtool-2.4.5.inc => libtool-2.4.6.inc}       |  5 +-
 ...btool-cross_2.4.5.bb => libtool-cross_2.4.6.bb} |  0
 ...ool-native_2.4.5.bb => libtool-native_2.4.6.bb} |  0
 ...-t-execute-automake-and-autoconf-on-every.patch | 71 ----------------------
 .../libtool/{libtool_2.4.5.bb => libtool_2.4.6.bb} |  0
 ...libtool_2.4.5.bb => nativesdk-libtool_2.4.6.bb} |  0
 6 files changed, 2 insertions(+), 74 deletions(-)
 rename meta/recipes-devtools/libtool/{libtool-2.4.5.inc => libtool-2.4.6.inc} (89%)
 rename meta/recipes-devtools/libtool/{libtool-cross_2.4.5.bb => libtool-cross_2.4.6.bb} (100%)
 rename meta/recipes-devtools/libtool/{libtool-native_2.4.5.bb => libtool-native_2.4.6.bb} (100%)
 delete mode 100644 meta/recipes-devtools/libtool/libtool/libtool-don-t-execute-automake-and-autoconf-on-every.patch
 rename meta/recipes-devtools/libtool/{libtool_2.4.5.bb => libtool_2.4.6.bb} (100%)
 rename meta/recipes-devtools/libtool/{nativesdk-libtool_2.4.5.bb => nativesdk-libtool_2.4.6.bb} (100%)

diff --git a/meta/recipes-devtools/libtool/libtool-2.4.5.inc b/meta/recipes-devtools/libtool/libtool-2.4.6.inc
similarity index 89%
rename from meta/recipes-devtools/libtool/libtool-2.4.5.inc
rename to meta/recipes-devtools/libtool/libtool-2.4.6.inc
index 5f89c83..25b9304 100644
--- a/meta/recipes-devtools/libtool/libtool-2.4.5.inc
+++ b/meta/recipes-devtools/libtool/libtool-2.4.6.inc
@@ -19,11 +19,10 @@ SRC_URI = "${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz \
            file://fix-resolve-lt-sysroot.patch \
            file://nohardcodepaths.patch \
            file://unwind-opt-parsing.patch \
-           file://libtool-don-t-execute-automake-and-autoconf-on-every.patch \
           "
 
-SRC_URI[md5sum] = "7d30ed9fa6bb11270ebb31639a37bd54"
-SRC_URI[sha256sum] = "509cb49c7de14ce7eaf88993cf09fd4071882699dfd874c2e95b31ab107d6987"
+SRC_URI[md5sum] = "addf44b646ddb4e3919805aa88fa7c5e"
+SRC_URI[sha256sum] = "e3bd4d5d3d025a36c21dd6af7ea818a2afcd4dfc1ea5a17b39d7854bcd0c06e3"
 
 do_compile_prepend () {
 	# Sometimes this file doesn't get rebuilt, force the issue
diff --git a/meta/recipes-devtools/libtool/libtool-cross_2.4.5.bb b/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb
similarity index 100%
rename from meta/recipes-devtools/libtool/libtool-cross_2.4.5.bb
rename to meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb
diff --git a/meta/recipes-devtools/libtool/libtool-native_2.4.5.bb b/meta/recipes-devtools/libtool/libtool-native_2.4.6.bb
similarity index 100%
rename from meta/recipes-devtools/libtool/libtool-native_2.4.5.bb
rename to meta/recipes-devtools/libtool/libtool-native_2.4.6.bb
diff --git a/meta/recipes-devtools/libtool/libtool/libtool-don-t-execute-automake-and-autoconf-on-every.patch b/meta/recipes-devtools/libtool/libtool/libtool-don-t-execute-automake-and-autoconf-on-every.patch
deleted file mode 100644
index 87ffae1..0000000
--- a/meta/recipes-devtools/libtool/libtool/libtool-don-t-execute-automake-and-autoconf-on-every.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 408cfb9c5fa8a666917167ffb806cb19deded429 Mon Sep 17 00:00:00 2001
-From: "Gary V. Vaughan" <gary@gnu.org>
-Date: Fri, 6 Feb 2015 12:58:34 +0000
-Subject: [PATCH] libtool: don't execute automake and autoconf on every
- invocation.
-
-Regression from 2.4.2 was causing noticable slow-down in builds
-that call libtool many times.
-* build-aux/ltmain.in (func_help): Override func_help() from
-gl/build-aux/options-parser to only run automake --version and
-autoconf --version when libtool --help is executed on the command
-line.
-* NO-THANKS: Add Robert Yang.
-Reported by Robert Yang
-
-Signed-off-by: Gary V. Vaughan <gary@gnu.org>
-
-Updated: Change NO-THANKS to THANKS to apply the patch since upstream
-renamed it.
-
-Upstream-Stauts: Backport
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-
----
- THANKS           |    1 +
- build-aux/ltmain.in |    9 ++++++++-
- 2 files changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/THANKS b/THANKS
-index 0ab162d..aa7aa8c 100644
---- a/THANKS
-+++ b/THANKS
-@@ -258,6 +258,7 @@ Robert Garron                       Robert.Garron@Access3000.net
- Robert Millan                       rmh@aybabtu.com
- Robert Ögren                        lists@roboros.com
- Roberto Bagnara                     bagnara@cs.unipr.it
-+Robert Yang                         liezhi.yang@windriver.com
- Roger Cornelius                     rac@tenzing.org
- Roland Mainz                        roland.mainz@nrubsig.org
- Roumen Petrov                       bugtrack@roumenpetrov.info
-diff --git a/build-aux/ltmain.in b/build-aux/ltmain.in
-index 46a0bb5..d5cf07a 100644
---- a/build-aux/ltmain.in
-+++ b/build-aux/ltmain.in
-@@ -127,7 +127,12 @@ usage_message="Options:
- "
- 
- # Additional text appended to 'usage_message' in response to '--help'.
--long_help_message=$long_help_message"
-+func_help ()
-+{
-+    $debug_cmd
-+
-+    func_usage_message
-+    $ECHO "$long_help_message
- 
- MODE must be one of the following:
- 
-@@ -158,6 +163,8 @@ include the following information:
- Report bugs to <@PACKAGE_BUGREPORT@>.
- GNU @PACKAGE@ home page: <@PACKAGE_URL@>.
- General help using GNU software: <http://www.gnu.org/gethelp/>."
-+    exit 0
-+}
- 
- 
- # func_lo2o OBJECT-NAME
--- 
-1.7.9.5
-
diff --git a/meta/recipes-devtools/libtool/libtool_2.4.5.bb b/meta/recipes-devtools/libtool/libtool_2.4.6.bb
similarity index 100%
rename from meta/recipes-devtools/libtool/libtool_2.4.5.bb
rename to meta/recipes-devtools/libtool/libtool_2.4.6.bb
diff --git a/meta/recipes-devtools/libtool/nativesdk-libtool_2.4.5.bb b/meta/recipes-devtools/libtool/nativesdk-libtool_2.4.6.bb
similarity index 100%
rename from meta/recipes-devtools/libtool/nativesdk-libtool_2.4.5.bb
rename to meta/recipes-devtools/libtool/nativesdk-libtool_2.4.6.bb
-- 
2.1.0


