Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1RxJqy-0008FU-DW
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Feb 2012 15:59:36 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 14 Feb 2012 06:51:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="107352375"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.50])
	by orsmga001.jf.intel.com with ESMTP; 14 Feb 2012 06:51:24 -0800
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Date: Tue, 14 Feb 2012 22:51:46 +0800
Message-Id: <60f7eed651c1b82ca4ec0849f2f7deab504035bf.1329230985.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1329230985.git.dexuan.cui@intel.com>
References: <cover.1329230985.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1329230985.git.dexuan.cui@intel.com>
References: <cover.1329230985.git.dexuan.cui@intel.com>
Subject: [PATCH 1/2] mini-x-session: try to use a resolution that's big enough for hob2's window
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
X-List-Received-Date: Tue, 14 Feb 2012 14:59:36 -0000

The patch was tested on VMware Player 4.0.1.

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 .../mini-x-session/files/mini-x-session            |    4 ++++
 .../mini-x-session/mini-x-session_0.1.bb           |    2 ++
 2 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-graphics/mini-x-session/files/mini-x-session b/meta/recipes-graphics/mini-x-session/files/mini-x-session
index 1940e27..f7d6c3b 100644
--- a/meta/recipes-graphics/mini-x-session/files/mini-x-session
+++ b/meta/recipes-graphics/mini-x-session/files/mini-x-session
@@ -25,6 +25,10 @@ for SESSIONFILE in $MINI_X_SESSION_DIR/*; do
     sudo -b -i -u $USERNAME $SESSIONFILE& 
     set -e
 done
+
+# This resolution is big enough for hob2's max window size.
+xrandr -s 1024x768
+
 # Default files to run if $HOME/.mini_x/session or /etc/mini_x/session
 # dont exist. 
 
diff --git a/meta/recipes-graphics/mini-x-session/mini-x-session_0.1.bb b/meta/recipes-graphics/mini-x-session/mini-x-session_0.1.bb
index 9818650..8f28d03 100644
--- a/meta/recipes-graphics/mini-x-session/mini-x-session_0.1.bb
+++ b/meta/recipes-graphics/mini-x-session/mini-x-session_0.1.bb
@@ -2,6 +2,8 @@ DESCRIPTION = "Mini X session files for poky"
 HOMEPAGE = "http://www.yoctoproject.org"
 BUGTRACKER = "http://bugzilla.pokylinux.org"
 
+PR = "r1"
+
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://mini-x-session;endline=5;md5=b6430bffbcf05f9760e72938826b7487"
 
-- 
1.7.6



