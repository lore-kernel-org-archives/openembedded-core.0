Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QcXgU-0004GP-9Y
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 08:58:38 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 30 Jun 2011 23:54:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,456,1304319600"; d="scan'208";a="25080469"
Received: from unknown (HELO swold-MOBL.localdomain) ([10.255.13.111])
	by fmsmga001.fm.intel.com with ESMTP; 30 Jun 2011 23:54:44 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jun 2011 23:54:28 -0700
Message-Id: <568a1ab08ee2cae223b353a41854c9a3c254578e.1309503004.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1309503004.git.sgw@linux.intel.com>
References: <cover.1309503004.git.sgw@linux.intel.com>
In-Reply-To: <cover.1309503004.git.sgw@linux.intel.com>
References: <cover.1309503004.git.sgw@linux.intel.com>
Cc: "Saul Wold \(none\)" <sgw@NHM-EX-FB-F13.>
Subject: [PATCH 1/4] x-load: Update to 1.5.0
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
X-List-Received-Date: Fri, 01 Jul 2011 06:58:39 -0000

From: Saul Wold <sgw@NHM-EX-FB-F13.(none)>

[YOCTO #1197]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-bsp/x-load/x-load_git.bb |   11 +++++------
 1 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-bsp/x-load/x-load_git.bb b/meta/recipes-bsp/x-load/x-load_git.bb
index 600cd87..3f9481c 100644
--- a/meta/recipes-bsp/x-load/x-load_git.bb
+++ b/meta/recipes-bsp/x-load/x-load_git.bb
@@ -5,17 +5,16 @@ FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/x-load-git/${MACHINE
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://README;beginline=1;endline=25;md5=ef08d08cb99057bbb5b9d6d0c5a4396f"
 
-SRCREV = "6f3a26101303051e0f91b6213735b68ce804e94e"
-PV = "1.42+${PR}+git${SRCPV}"
-PR="r13"
+SRCREV = "9f94c6577e3a018b6b75cbe39f32bb331871f915"
+PV = "1.5+${PR}+git${SRCPV}"
+PR="r0"
 
 #SRC_URI = "git://www.sakoman.net/git/x-load-omap3.git;branch=master;protocol=git"
 #SRC_URI = "git://gitorious.org/x-load-omap3/mainline.git;branch=master;protocol=git"
 SRC_URI = "git://gitorious.org/x-loader/x-loader.git;branch=master;protocol=git"
 
-SRC_URI_append_beagleboard = " \
-                              file://name.patch;patch=1 \
-                             "
+SRC_URI_append_beagleboard = " file://name.patch "
+
 S = "${WORKDIR}/git"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
1.7.3.4



