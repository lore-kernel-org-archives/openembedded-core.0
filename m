Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Q912v-0007ex-Cd
	for openembedded-core@lists.openembedded.org;
	Sun, 10 Apr 2011 22:15:45 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 10 Apr 2011 13:13:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,334,1299484800"; d="scan'208";a="626407012"
Received: from unknown (HELO localhost) ([10.255.12.197])
	by orsmga002.jf.intel.com with ESMTP; 10 Apr 2011 13:13:32 -0700
Message-Id: <2997606fef4064ef65191671ebec4db1f9fa3d91.1302466269.git.sgw@linux.intel.com>
In-Reply-To: <cover.1302466269.git.sgw@linux.intel.com>
References: <cover.1302466269.git.sgw@linux.intel.com>
Old-Date: Sat, 9 Apr 2011 23:51:13 -0700
Date: Sun, 10 Apr 2011 13:13:31 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>,
	Xiaofeng Yan <xiaofeng.yan@windriver.com>
Subject: [PATCH 5/6] qt4-x11-free: add virtual/libgl for opengl dependency
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
X-List-Received-Date: Sun, 10 Apr 2011 20:15:45 -0000

From: Saul Wold <sgw@linux.intel.com>

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-qt/qt4/qt4-x11-free.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt4-x11-free.inc b/meta/recipes-qt/qt4/qt4-x11-free.inc
index 306adb9..ba08dc8 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free.inc
+++ b/meta/recipes-qt/qt4/qt4-x11-free.inc
@@ -4,9 +4,9 @@ DESCRIPTION = "Qt is a versatile cross-platform application framework -- this is
 HOMEPAGE = "http://qt.nokia.com"
 SECTION = "x11/libs"
 PRIORITY = "optional"
-DEPENDS += "virtual/libx11 fontconfig libxft libxext libxrender libxrandr libxcursor"
+DEPENDS += "virtual/libgl virtual/libx11 fontconfig libxft libxext libxrender libxrandr libxcursor"
 
-INC_PR = "r21"
+INC_PR = "r22"
 
 QT_GLFLAGS ?= "-no-opengl"
 QT_GLFLAGS_qemux86 = "-opengl"
-- 
1.7.1.1



