Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A3A9E7117E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Nov 2014 11:39:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sA4Bd1vq009475; Tue, 4 Nov 2014 11:39:01 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ikUfw31r8efu; Tue,  4 Nov 2014 11:39:01 +0000 (GMT)
Received: from ted (5751f4a1.skybroadband.com [87.81.244.161])
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sA4BcdUf009421
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 4 Nov 2014 11:38:41 GMT
Received: from richard by ted with local (Exim 4.82)
	(envelope-from <richard@dan.rpsys.net>)
	id 1XlcS5-0000J7-Hi; Tue, 04 Nov 2014 11:39:09 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Nov 2014 11:39:02 +0000
Message-Id: <1415101148-1142-2-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.0.2
In-Reply-To: <1415101148-1142-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1415101148-1142-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/8] python-pycurl: 7.19.3.1 -> 7.19.5
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
X-List-Received-Date: Tue, 04 Nov 2014 11:39:40 -0000

Lines in the readme referring to the license moved, license is unchanged.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/python-pycurl_7.19.3.1.bb               | 34 ----------------------
 .../python/python-pycurl_7.19.5.bb                 | 34 ++++++++++++++++++++++
 2 files changed, 34 insertions(+), 34 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python-pycurl_7.19.3.1.bb
 create mode 100644 meta/recipes-devtools/python/python-pycurl_7.19.5.bb

diff --git a/meta/recipes-devtools/python/python-pycurl_7.19.3.1.bb b/meta/recipes-devtools/python/python-pycurl_7.19.3.1.bb
deleted file mode 100644
index 02d0ae9..0000000
--- a/meta/recipes-devtools/python/python-pycurl_7.19.3.1.bb
+++ /dev/null
@@ -1,34 +0,0 @@
-SUMMARY = "Python bindings for libcurl"
-HOMEPAGE = "http://pycurl.sourceforge.net/"
-SECTION = "devel/python"
-LICENSE = "LGPLv2.1+ | MIT"
-LIC_FILES_CHKSUM = "file://README.rst;beginline=148;endline=163;md5=57e5ab0c0f964533fc59d93dec5695bb \
-                    file://COPYING-LGPL;md5=3579a9fd0221d49a237aaa33492f988c \
-                    file://COPYING-MIT;md5=e8200955c773b2a0fd6cea36ea5e87be"
-
-DEPENDS = "curl python"
-RDEPENDS_${PN} = "python-core curl"
-SRCNAME = "pycurl"
-
-SRC_URI = "\
-  http://${SRCNAME}.sourceforge.net/download/${SRCNAME}-${PV}.tar.gz;name=archive \
-  file://no-static-link.patch \
-"
-
-SRC_URI[archive.md5sum] = "6df8fa7fe8b680d93248da1f8d4fcd12"
-SRC_URI[archive.sha256sum] = "c0d673fe99a9de07239eabe77c798f1b043f60c02afaec1430ceaf59d7501a4f"
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit distutils
-
-# need to export these variables for python-config to work
-export BUILD_SYS
-export HOST_SYS
-export STAGING_INCDIR
-export STAGING_LIBDIR
-
-BBCLASSEXTEND = "native"
-
-do_install_append() {
-	rm -rf ${D}${datadir}/share
-}
diff --git a/meta/recipes-devtools/python/python-pycurl_7.19.5.bb b/meta/recipes-devtools/python/python-pycurl_7.19.5.bb
new file mode 100644
index 0000000..a21a426
--- /dev/null
+++ b/meta/recipes-devtools/python/python-pycurl_7.19.5.bb
@@ -0,0 +1,34 @@
+SUMMARY = "Python bindings for libcurl"
+HOMEPAGE = "http://pycurl.sourceforge.net/"
+SECTION = "devel/python"
+LICENSE = "LGPLv2.1+ | MIT"
+LIC_FILES_CHKSUM = "file://README.rst;beginline=166;endline=181;md5=57e5ab0c0f964533fc59d93dec5695bb \
+                    file://COPYING-LGPL;md5=3579a9fd0221d49a237aaa33492f988c \
+                    file://COPYING-MIT;md5=e8200955c773b2a0fd6cea36ea5e87be"
+
+DEPENDS = "curl python"
+RDEPENDS_${PN} = "python-core curl"
+SRCNAME = "pycurl"
+
+SRC_URI = "\
+  http://${SRCNAME}.sourceforge.net/download/${SRCNAME}-${PV}.tar.gz;name=archive \
+  file://no-static-link.patch \
+"
+
+SRC_URI[archive.md5sum] = "47b4eac84118e2606658122104e62072"
+SRC_URI[archive.sha256sum] = "69a0aa7c9dddbfe4cebf4d1f674c490faccf739fc930d85d8990ce2fd0551a43"
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit distutils
+
+# need to export these variables for python-config to work
+export BUILD_SYS
+export HOST_SYS
+export STAGING_INCDIR
+export STAGING_LIBDIR
+
+BBCLASSEXTEND = "native"
+
+do_install_append() {
+	rm -rf ${D}${datadir}/share
+}
-- 
2.0.2


