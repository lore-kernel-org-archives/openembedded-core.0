Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SHy6s-0003jn-Ij
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Apr 2012 16:01:22 +0200
Received: by wera1 with SMTP id a1so578788wer.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2012 06:52:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=jQNhiAALNTjxtuQqat/5t4YRzAQVmpo63lTOnxZCJcs=;
	b=Lo/Qlw0S/u8MmVZvVAeqaS5ttB8JVds15esnzFdISjp7C1KjJfh62g8688QIp5ca2J
	OrZTk0yn+ibquqoGUF4mbMsLuiuwVOqibHGUn4Y21Nei187GvmpiTAWfqNvVgIMFwc59
	ZK/HDkQq1DSHHgmoArx3ZQWg7VysBtbrRC8MfRmyy/3+Qao5krQmP8c5CNnbTmo8JsHq
	tTUlD0cyEKYtKYExnQQjdX+5bhKOgjKjyX/eLtMg8Rg9Ae+k/kNXCMAth/pZPt2h+nmW
	0lkXbwr4RCtoUr3g/nv1Sq0ALRth+GuvtTNNnCBe4K1emkvaoxJyz/SinvyT6EPX36/a
	0OVw==
Received: by 10.180.104.230 with SMTP id gh6mr16303659wib.22.1334152323833;
	Wed, 11 Apr 2012 06:52:03 -0700 (PDT)
Received: from localhost.localdomain ([89.121.200.106])
	by mx.google.com with ESMTPS id 17sm46830671wis.0.2012.04.11.06.52.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 11 Apr 2012 06:52:03 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Apr 2012 16:51:58 +0300
Message-Id: <ef5c9d2ab1340a0d6ce1bf09a68a20c60e11eef0.1334152146.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1334152146.git.andrei@gherzan.ro>
References: <cover.1334152146.git.andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQkBbWPv2GXWSTpOimCz5+OvcGa7SWPohlLi5fsbdM5oj7+r9NK8FbI3pPtQgeax6jJ3Tntb
Subject: [PATCH 1/1] js185: Integrate version 1.8.5
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Apr 2012 14:01:22 -0000

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/recipes-support/js/files/link_with_gcc.patch |   12 +++----
 meta/recipes-support/js/files/usepic.patch        |   15 ++------
 meta/recipes-support/js/js185_1.0.0.bb            |   36 +++++++++++++++++++++
 3 files changed, 45 insertions(+), 18 deletions(-)
 create mode 100644 meta/recipes-support/js/js185_1.0.0.bb

diff --git a/meta/recipes-support/js/files/link_with_gcc.patch b/meta/recipes-support/js/files/link_with_gcc.patch
index 988df61..1bee233 100644
--- a/meta/recipes-support/js/files/link_with_gcc.patch
+++ b/meta/recipes-support/js/files/link_with_gcc.patch
@@ -1,11 +1,9 @@
-Upstream-Status: Pending
-
-Index: src/config/Linux_All.mk
+Index: js-1.8.5/js/src/ref-config/Linux_All.mk
 ===================================================================
---- src.orig/config/Linux_All.mk	2005-05-10 19:53:44.000000000 +0000
-+++ src/config/Linux_All.mk	2007-06-18 17:20:05.000000000 +0000
-@@ -47,7 +47,7 @@
- OS_CFLAGS = -DXP_UNIX -DSVR4 -DSYSV -D_BSD_SOURCE -DPOSIX_SOURCE -DHAVE_LOCALTIME_R
+--- src.orig/ref-config/Linux_All.mk	2012-04-09 23:43:45.099107032 +0300
++++ src/ref-config/Linux_All.mk	2012-04-09 23:43:56.947106799 +0300
+@@ -48,7 +48,7 @@
+ OS_CFLAGS = -DXP_UNIX -DSVR4 -DSYSV -D_BSD_SOURCE -DPOSIX_SOURCE -DHAVE_LOCALTIME_R -DLINUX
  
  RANLIB = echo
 -MKSHLIB = $(LD) -shared $(XMKSHLIBOPTS)
diff --git a/meta/recipes-support/js/files/usepic.patch b/meta/recipes-support/js/files/usepic.patch
index 91b0923..7098188 100644
--- a/meta/recipes-support/js/files/usepic.patch
+++ b/meta/recipes-support/js/files/usepic.patch
@@ -1,15 +1,8 @@
-Upstream-Status: Inappropriate [embedded specific]
-
-Mips needs -fPIC to compile properly. These tests are broken anyway as they test 
-the build system architecture, not the target. This is a hack.
-
-RP 10/6/2010
-
-Index: src/config/Linux_All.mk
+Index: src/ref-config/Linux_All.mk
 ===================================================================
---- src.orig/config/Linux_All.mk	2010-06-10 22:09:43.000000000 +0100
-+++ src/config/Linux_All.mk	2010-06-10 22:09:55.000000000 +0100
-@@ -90,14 +90,10 @@
+--- src.orig/ref-config/Linux_All.mk	2012-04-09 23:47:06.775103048 +0300
++++ src/ref-config/Linux_All.mk	2012-04-09 23:47:40.267102388 +0300
+@@ -92,14 +92,10 @@
  # Use the editline library to provide line-editing support.
  JS_EDITLINE = 1
  
diff --git a/meta/recipes-support/js/js185_1.0.0.bb b/meta/recipes-support/js/js185_1.0.0.bb
new file mode 100644
index 0000000..c91d9b6
--- /dev/null
+++ b/meta/recipes-support/js/js185_1.0.0.bb
@@ -0,0 +1,36 @@
+DESCRIPTION = "Spidermonkey: a javascript engine written in C"
+HOMEPAGE = "http://www.mozilla.org/js/spidermonkey/"
+SECTION = "libs"
+
+# the package is licensed under either of the following
+LICENSE = "MPL-1 | GPLv2+ | LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://jsapi.h;beginline=4;endline=39;md5=347c6bbf4fb4547de1fa5ad830030063"
+PR = "r0"
+
+DEPENDS = "nspr"
+
+SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/js/js185-1.0.0.tar.gz \
+           file://link_with_gcc.patch \
+           file://usepic.patch \
+          "
+
+SRC_URI[md5sum] = "a4574365938222adca0a6bd33329cb32"
+SRC_URI[sha256sum] = "5d12f7e1f5b4a99436685d97b9b7b75f094d33580227aa998c406bbae6f2a687"
+
+S = "${WORKDIR}/${PN}-${PV}/js/src"
+
+inherit autotools
+
+# Use the configure and avoid autoconf as v2.13 is mandatory
+do_configure_prepend() {
+	rm -f ${S}/configure.in
+}
+
+EXTRA_OEMAKE = "'CC=${CC}' 'LD=${LD}' 'XCFLAGS=${CFLAGS}' 'XLDFLAGS=${LDFLAGS} -Wl,-soname=libjs' \
+                'BUILD_CC=${BUILD_CC}' 'BUILD_CFLAGS=${BUILD_CFLAGS}' 'BUILD_LDFLAGS=${BUILD_LDFLAGS}'"
+
+EXTRA_OECONF = '--with-nspr-libs="-lplds4 -lplc4 -lnspr4" \
+                --prefix=/usr'
+
+PARALLEL_MAKE = ""
+
-- 
1.7.5.4



