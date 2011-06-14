Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QWOcw-0001K5-Uy
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 10:05:35 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 14 Jun 2011 01:02:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,363,1304319600"; d="scan'208";a="14283879"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.216])
	by orsmga001.jf.intel.com with ESMTP; 14 Jun 2011 01:02:08 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jun 2011 01:01:18 -0700
Message-Id: <148a6c0dc64837d42f32be8babcb87ed039114f1.1308037753.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1308037752.git.sgw@linux.intel.com>
References: <cover.1308037752.git.sgw@linux.intel.com>
In-Reply-To: <cover.1308037752.git.sgw@linux.intel.com>
References: <cover.1308037752.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 09/51] clutter-box2d_git: Switch SRC_URI to git.gnome.org
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
X-List-Received-Date: Tue, 14 Jun 2011 08:05:35 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-graphics/clutter/clutter-box2d_git.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/clutter/clutter-box2d_git.bb b/meta/recipes-graphics/clutter/clutter-box2d_git.bb
index 4c1c003..bfd46b2 100644
--- a/meta/recipes-graphics/clutter/clutter-box2d_git.bb
+++ b/meta/recipes-graphics/clutter/clutter-box2d_git.bb
@@ -6,7 +6,7 @@ SRCREV = "4799ac10ae8cb7da936a2b999aba58fe62eb1ee3"
 PV = "0.10.1+git${SRCPV}"
 PR = "r0"
 
-SRC_URI = "git://git.clutter-project.org/clutter-box2d.git;protocol=git"
+SRC_URI = "git://git.gnome.org/clutter-box2d.git"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.3.4



