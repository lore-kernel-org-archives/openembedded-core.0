Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SLH75-0005g9-4R
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Apr 2012 18:55:15 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 20 Apr 2012 09:45:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="156167904"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.163])
	by fmsmga002.fm.intel.com with ESMTP; 20 Apr 2012 09:45:42 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Apr 2012 09:45:19 -0700
Message-Id: <cc6a5f53b85395a57d7435291c3aa34d5f6c2f86.1334940120.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1334940120.git.sgw@linux.intel.com>
References: <cover.1334940120.git.sgw@linux.intel.com>
In-Reply-To: <cover.1334940120.git.sgw@linux.intel.com>
References: <cover.1334940120.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 28/43] qt4-x11-free: enable -accessibility and -sm
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
X-List-Received-Date: Fri, 20 Apr 2012 16:55:15 -0000

From: Robert Yang <liezhi.yang@windriver.com>

Is it possible to enable the "-sm -accessibility" in oe-core, please?
There is a meta-kde layer which requires the "-sm -accessibility", but
they are disabled in meta/recipes-qt/qt4/qt4.inc:

QT_DISTRO_FLAGS ?= "-no-accessibility -no-sm"

I checked the log of the qt4, can't find the related log for
"-no-accessibility -no-sm".

Another way is use the bbappend, but it would be great if it can be
enabled in oe-core.

This only enables for qt4-x11, doesn't enable for qt4-embedded, and
have done testing on: qemux86, qemuarm, qemumips, qemuppc.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-qt/qt4/qt4-x11-free.inc |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt4-x11-free.inc b/meta/recipes-qt/qt4/qt4-x11-free.inc
index 072c522..a59198d 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free.inc
+++ b/meta/recipes-qt/qt4/qt4-x11-free.inc
@@ -13,6 +13,9 @@ QT_GLFLAGS_qemuppc = "-opengl"
 QT_CONFIG_FLAGS += "-no-xinerama -no-xkb"
 QT_BASE_LIB  ?= "libqt"
 
+# required by kdelibs4
+QT_DISTRO_FLAGS = "-accessibility -sm"
+
 inherit qt4x11
 
 do_install_append() {
-- 
1.7.7.6



