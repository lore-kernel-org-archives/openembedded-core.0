Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QKkd2-0001tA-QF
	for openembedded-core@lists.openembedded.org;
	Fri, 13 May 2011 07:09:33 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 12 May 2011 22:06:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,362,1301900400"; d="scan'208";a="746623378"
Received: from unknown (HELO localhost) ([10.255.12.88])
	by orsmga001.jf.intel.com with ESMTP; 12 May 2011 22:06:43 -0700
Message-Id: <477519d3772d2abb55e8277841429fcfe107df4a.1305263078.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305263078.git.sgw@linux.intel.com>
References: <cover.1305263078.git.sgw@linux.intel.com>
Old-Date: Wed, 11 May 2011 17:25:41 +0800
Date: Thu, 12 May 2011 22:06:43 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Ilya Yanok <yanok@emcraft.com>, Jingdong Lu <jingdong.lu@windriver.com>
Subject: [PATCH 5/8] bash: enable update-alternative to use bash as default shell
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
X-List-Received-Date: Fri, 13 May 2011 05:09:33 -0000

From: Jingdong Lu <jingdong.lu@windriver.com>

Signed-off-by: Jingdong Lu <jingdong.lu@windriver.com>
---
 meta/recipes-extended/bash/bash.inc    |    2 +-
 meta/recipes-extended/bash/bash_4.1.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
index e218304..d55e517 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -7,7 +7,7 @@ LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 DEPENDS = "ncurses bison-native"
 
-inherit autotools gettext
+inherit autotools gettext update-alternatives
 
 PARALLEL_MAKE = ""
 
diff --git a/meta/recipes-extended/bash/bash_4.1.bb b/meta/recipes-extended/bash/bash_4.1.bb
index bf8cdad..c146014 100644
--- a/meta/recipes-extended/bash/bash_4.1.bb
+++ b/meta/recipes-extended/bash/bash_4.1.bb
@@ -1,6 +1,6 @@
 require bash.inc
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "${GNU_MIRROR}/bash/${BPN}-${PV}.tar.gz;name=tarball \
            ${GNU_MIRROR}/bash/bash-4.1-patches/bash41-001;apply=yes;striplevel=0;name=patch001 \
-- 
1.7.1.1



