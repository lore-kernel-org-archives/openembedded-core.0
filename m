Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QZTNB-0004T9-Sa
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 21:46:02 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5MJgQuK019346
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 12:42:26 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 22 Jun 2011 12:42:26 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Jun 2011 14:53:50 -0500
Message-ID: <d215f1d253f3ef2ef4f74de36d39334a6939ee5e.1308771739.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1308771739.git.mark.hatle@windriver.com>
References: <cover.1308771739.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 39/40] python: Add python to the dependencies of python modules (v3)
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
X-List-Received-Date: Wed, 22 Jun 2011 19:46:02 -0000
Content-Type: text/plain

If python failed to build for some reason, python-gst and python-pygobject
may still try to build, add python as a dependency to avoid this.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-devtools/python/python-gst_0.10.21.bb |    4 ++--
 .../python/python-pygobject_2.27.91.bb             |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/python/python-gst_0.10.21.bb b/meta/recipes-devtools/python/python-gst_0.10.21.bb
index 888002c..ed89090 100644
--- a/meta/recipes-devtools/python/python-gst_0.10.21.bb
+++ b/meta/recipes-devtools/python/python-gst_0.10.21.bb
@@ -1,9 +1,9 @@
 DESCRIPTION = "Python Gstreamer bindings"
 SECTION = "devel/python"
 LICENSE = "LGPLv2.1"
-DEPENDS = "gstreamer gst-plugins-base python-pygobject"
+DEPENDS = "gstreamer gst-plugins-base python-pygobject python"
 RDEPENDS_${PN} += "python-pygtk"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/gst-python/gst-python-${PV}.tar.bz2 \
            file://python-path.patch"
diff --git a/meta/recipes-devtools/python/python-pygobject_2.27.91.bb b/meta/recipes-devtools/python/python-pygobject_2.27.91.bb
index 0160bbd..9ff2fe7 100644
--- a/meta/recipes-devtools/python/python-pygobject_2.27.91.bb
+++ b/meta/recipes-devtools/python/python-pygobject_2.27.91.bb
@@ -2,10 +2,10 @@ DESCRIPTION = "Python GObject bindings"
 SECTION = "devel/python"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
-DEPENDS = "python-pygobject-native-${PV} glib-2.0"
+DEPENDS = "python python-pygobject-native-${PV} glib-2.0"
 DEPENDS_virtclass-native = "glib-2.0-native"
 RDEPENDS_virtclass-native = ""
-PR = "r1"
+PR = "r2"
 
 MAJ_VER = "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
 
-- 
1.7.3.4



