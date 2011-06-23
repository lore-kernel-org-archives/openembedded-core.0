Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QZjBV-0007iQ-LZ
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Jun 2011 14:39:01 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 23 Jun 2011 05:35:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,413,1304319600"; d="scan'208";a="21913824"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by fmsmga001.fm.intel.com with ESMTP; 23 Jun 2011 05:35:26 -0700
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jun 2011 20:33:58 +0800
Message-Id: <2674d3f40b95dc565351d36a6fdb798334acbd20.1308832259.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1308832259.git.edwin.zhai@intel.com>
References: <cover.1308832259.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1308832259.git.edwin.zhai@intel.com>
References: <cover.1308832259.git.edwin.zhai@intel.com>
Subject: [PATCH 1/1] clutter: Use new git repo
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
X-List-Received-Date: Thu, 23 Jun 2011 12:39:02 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

clutter move its git server from clutter-project.org to gnome.org

[YOCTO #1040] got fixed

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 meta/recipes-graphics/clutter/clutter_git.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/clutter/clutter_git.bb b/meta/recipes-graphics/clutter/clutter_git.bb
index cb5f476..76a26a6 100644
--- a/meta/recipes-graphics/clutter/clutter_git.bb
+++ b/meta/recipes-graphics/clutter/clutter_git.bb
@@ -7,7 +7,7 @@ SRCREV = "e957e277b8a4893ce8c99e94402036d42a8b3748"
 PV = "1.0.0+git${SRCPV}"
 PR = "r9"
 
-SRC_URI = "git://git.clutter-project.org/clutter.git;protocol=git;branch=master \
+SRC_URI = "git://git.gnome.org/clutter;protocol=git;branch=master \
            file://enable_tests-654c26a1301c9bc5f8e3e5e3b68af5eb1b2e0673.patch;patch=1;rev=654c26a1301c9bc5f8e3e5e3b68af5eb1b2e0673 \
            file://enable_tests.patch;patch=1;notrev=654c26a1301c9bc5f8e3e5e3b68af5eb1b2e0673 "
 S = "${WORKDIR}/git"
-- 
1.7.1



