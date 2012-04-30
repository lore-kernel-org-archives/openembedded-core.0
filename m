Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SOz7n-0000AM-5e
	for openembedded-core@lists.openembedded.org;
	Tue, 01 May 2012 00:31:19 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 30 Apr 2012 15:21:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="138453927"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.182])
	by orsmga002.jf.intel.com with ESMTP; 30 Apr 2012 15:21:10 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Apr 2012 15:21:00 -0700
Message-Id: <48ae30247325d44e7faa3528fe3cdb0ef42e4ba4.1335824356.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1335824356.git.sgw@linux.intel.com>
References: <cover.1335824356.git.sgw@linux.intel.com>
In-Reply-To: <cover.1335824356.git.sgw@linux.intel.com>
References: <cover.1335824356.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 16/19] Fix a couple of missing Upstream-Status
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
X-List-Received-Date: Mon, 30 Apr 2012 22:31:19 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 ...b-1.99-gcc-4.7.0-uninitialized-var-errors.patch |    2 +-
 .../qt4/files/qt-mobility-no-opengl.patch          |    2 ++
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-bsp/grub/files/grub-1.99-gcc-4.7.0-uninitialized-var-errors.patch b/meta/recipes-bsp/grub/files/grub-1.99-gcc-4.7.0-uninitialized-var-errors.patch
index 397d11f..f812147 100644
--- a/meta/recipes-bsp/grub/files/grub-1.99-gcc-4.7.0-uninitialized-var-errors.patch
+++ b/meta/recipes-bsp/grub/files/grub-1.99-gcc-4.7.0-uninitialized-var-errors.patch
@@ -1,4 +1,4 @@
-UpstreamStatus: Pending
+Upstream-Status: Pending
 
 This patch quitens this error:
 
diff --git a/meta/recipes-qt/qt4/files/qt-mobility-no-opengl.patch b/meta/recipes-qt/qt4/files/qt-mobility-no-opengl.patch
index aa15683..1724995 100644
--- a/meta/recipes-qt/qt4/files/qt-mobility-no-opengl.patch
+++ b/meta/recipes-qt/qt4/files/qt-mobility-no-opengl.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 diff --git a/examples/declarative-camera/declarative-camera.pro b/examples/declarative-camera/declarative-camera.pro
 index 8164fbc..54fd8ad 100644
 --- a/examples/declarative-camera/declarative-camera.pro
-- 
1.7.7.6



