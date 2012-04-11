Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Florin.Sarbu@windriver.com>) id 1SI3Gj-00033g-Fl
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Apr 2012 21:31:53 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q3BG7vwt013404
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2012 09:07:57 -0700 (PDT)
Received: from otp-fsarbu-l1.corp.ad.wrs.com (128.224.171.127) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Wed, 11 Apr 2012 09:07:57 -0700
From: Florin Sarbu <florin.sarbu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 11 Apr 2012 19:07:53 +0300
Message-ID: <1334160473-7046-1-git-send-email-florin.sarbu@windriver.com>
X-Mailer: git-send-email 1.7.9.1
MIME-Version: 1.0
Subject: [PATCH] vala: Add vala package as a devtool (version 0.12.1)
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
X-List-Received-Date: Wed, 11 Apr 2012 19:31:53 -0000
Content-Type: text/plain

Added the vala package from meta-oe to support future systemd integration.

Signed-off-by: Florin Sarbu <florin.sarbu@windriver.com>
---
 meta/recipes-devtools/vala/vala.inc       |   25 +++++++++++++++++++++++++
 meta/recipes-devtools/vala/vala_0.12.1.bb |    7 +++++++
 2 files changed, 32 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/vala/vala.inc
 create mode 100644 meta/recipes-devtools/vala/vala_0.12.1.bb

diff --git a/meta/recipes-devtools/vala/vala.inc b/meta/recipes-devtools/vala/vala.inc
new file mode 100644
index 0000000..0815c66
--- /dev/null
+++ b/meta/recipes-devtools/vala/vala.inc
@@ -0,0 +1,25 @@
+DESCRIPTION = "Vala is a C#-like language dedicated to ease GObject programming. \
+Vala compiles to plain C and has no runtime environment nor penalities whatsoever."
+SECTION = "devel"
+DEPENDS = "glib-2.0 dbus"
+BBCLASSEXTEND = "native"
+DEPENDS_virtclass-native = "glib-2.0-native dbus-native"
+HOMEPAGE = "http://vala-project.org"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
+INC_PR = "r0"
+
+#
+# WARNING: This source release has specifically been built for OpenEmbedded.
+# Don't update to any upstream release without consulting the recipe maintainer.
+#
+
+SRC_URI = "\
+  http://downloads.freesmartphone.org/sources/vala-${PV}.tar.bz2;name=archive \
+"
+
+inherit autotools
+
+EXTRA_OECONF = "--disable-vapigen"
+
+FILES_${PN}-doc += "${datadir}/devhelp"
diff --git a/meta/recipes-devtools/vala/vala_0.12.1.bb b/meta/recipes-devtools/vala/vala_0.12.1.bb
new file mode 100644
index 0000000..1049ed6
--- /dev/null
+++ b/meta/recipes-devtools/vala/vala_0.12.1.bb
@@ -0,0 +1,7 @@
+require vala.inc
+SRC_URI = "ftp://ftp.gnome.org/pub/GNOME/sources/vala/0.12/vala-${PV}.tar.bz2"
+
+FILES_${PN} += "${datadir}/vala-0.12/vapi"
+
+SRC_URI[md5sum] = "bf35262cc611de447147d01cbac33767"
+SRC_URI[sha256sum] = "d9a2be21bb8ab88eab838e7f3a4d0aaa2a1fddf35615dca32bef6a0051f58ea8"
-- 
1.7.9.1



