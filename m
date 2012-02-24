Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1S0vaY-0001pA-SH
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 14:53:35 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 24 Feb 2012 05:45:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="111539493"
Received: from dcui-desktop.sh.intel.com ([10.239.36.12])
	by orsmga001.jf.intel.com with ESMTP; 24 Feb 2012 05:44:11 -0800
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Feb 2012 21:44:35 +0800
Message-Id: <82a1c80968b74bba31763add47f217d84043546e.1330091038.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1330091038.git.dexuan.cui@intel.com>
References: <cover.1330091038.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1330091038.git.dexuan.cui@intel.com>
References: <cover.1330091038.git.dexuan.cui@intel.com>
Subject: [PATCH 1/1] task-self-hosted: add hicolor-icon-theme and socat
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
X-List-Received-Date: Fri, 24 Feb 2012 13:53:35 -0000

python-pygtk depends on libgtk and libgtk's recommends have
gdk-pixbuf-loader-{png,jpeg,gif,xpm}, so we have the warnings.
We can add hicolor-icon-theme to fix the warning:
Configuring gdk-pixbuf-loader-png.
gtk-update-icon-cache: No theme index file.
Configuring gdk-pixbuf-loader-jpeg.
gtk-update-icon-cache: No theme index file.
Configuring liberation-fonts.
Configuring gdk-pixbuf-loader-xpm.
gtk-update-icon-cache: No theme index file.
Configuring gdk-pixbuf-loader-gif.
gtk-update-icon-cache: No theme index file.

Add socat for to faciliate proxy setting.

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 meta/recipes-core/tasks/task-self-hosted.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/tasks/task-self-hosted.bb b/meta/recipes-core/tasks/task-self-hosted.bb
index 3c5fad6..586a461 100644
--- a/meta/recipes-core/tasks/task-self-hosted.bb
+++ b/meta/recipes-core/tasks/task-self-hosted.bb
@@ -3,7 +3,7 @@
 #
 
 DESCRIPTION = "Create Basic Image Tasks"
-PR = "r5"
+PR = "r6"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
@@ -109,6 +109,7 @@ RDEPENDS_task-self-hosted-extended = "\
     grep \
     groff \
     gzip \
+    hicolor-icon-theme \
     libaio \
     libusb1 \
     libxml2 \
@@ -161,6 +162,7 @@ RDEPENDS_task-self-hosted-extended = "\
     readline \
     rpm \
     setserial \
+    socat \
     subversion \
     sudo \
     sysstat \
-- 
1.7.6



