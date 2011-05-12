Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QKTgF-0000Fk-Og
	for openembedded-core@lists.openembedded.org;
	Thu, 12 May 2011 13:03:43 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 12 May 2011 04:00:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,357,1301900400"; d="scan'208";a="746178094"
Received: from yocto-build3.sh.intel.com (HELO localhost) ([10.239.48.58])
	by orsmga001.jf.intel.com with ESMTP; 12 May 2011 04:00:56 -0700
Message-Id: <6278a2a6d81fec7d0f5411e5ed86b62cc60ca12e.1305197864.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1305197864.git.edwin.zhai@intel.com>
References: <cover.1305197864.git.edwin.zhai@intel.com>
Old-Date: Thu, 12 May 2011 09:06:57 +0800
Date: Thu, 12 May 2011 19:00:53 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Zhai Edwin <edwin.zhai@intel.com>
Subject: [PATCH 06/54] x11vnc: Add Upstream-Status
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
X-List-Received-Date: Thu, 12 May 2011 11:03:44 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../recipes-graphics/x11vnc/files/endian-fix.patch |    2 ++
 .../x11vnc/files/starting-fix.patch                |    3 +++
 2 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-graphics/x11vnc/files/endian-fix.patch b/meta/recipes-graphics/x11vnc/files/endian-fix.patch
index 0b5e470..f2a538b 100644
--- a/meta/recipes-graphics/x11vnc/files/endian-fix.patch
+++ b/meta/recipes-graphics/x11vnc/files/endian-fix.patch
@@ -6,6 +6,8 @@ instead of LIBVNCSERVER_WORDS_BIGENDIAN, which cuase issue in mips.
 
 Signed-off-by: Yu Ke <ke.yu@intel.com>
 
+Upstream-Status: Pending
+
 diff --git a/libvncserver/main.c b/libvncserver/main.c
 index b6bd930..8bbb7bf 100644
 --- a/libvncserver/main.c
diff --git a/meta/recipes-graphics/x11vnc/files/starting-fix.patch b/meta/recipes-graphics/x11vnc/files/starting-fix.patch
index f59e801..11c55e6 100644
--- a/meta/recipes-graphics/x11vnc/files/starting-fix.patch
+++ b/meta/recipes-graphics/x11vnc/files/starting-fix.patch
@@ -3,6 +3,9 @@ Removing these 2 parameters makes x11vnc works well on poky sato image.
 
 
 Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
+
+Upstream-Status: Inappropriate [configuration]
+
 Index: x11vnc-0.9.12/x11vnc/x11vnc.desktop
 ===================================================================
 --- x11vnc-0.9.12.orig/x11vnc/x11vnc.desktop	2011-03-03 10:33:18.000000000 +0800
-- 
1.7.1



