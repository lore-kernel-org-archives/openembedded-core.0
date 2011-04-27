Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QEzEk-0005Qv-RA
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Apr 2011 09:32:39 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 27 Apr 2011 00:30:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,273,1301900400"; d="scan'208";a="739028655"
Received: from unknown (HELO localhost) ([10.255.12.245])
	by orsmga001.jf.intel.com with ESMTP; 27 Apr 2011 00:30:09 -0700
Message-Id: <a568d2a443836171855faa595a6e37e693acf2a0.1303889119.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303889119.git.sgw@linux.intel.com>
References: <cover.1303889119.git.sgw@linux.intel.com>
Old-Date: Tue, 26 Apr 2011 15:47:50 -0700
Date: Wed, 27 Apr 2011  0:30:09 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Wed, 27 Apr 2011 09:50:50 +0200
Cc: Darren Hart <dvhart@linux.intel.com>, Chris Larson <clarson@kergoth.com>,
	Antonio Ospite <ospite@studenti.unina.it>
Subject: [PATCH 47/52] clutter-box2d: add DEPENDS for clutter-1.6
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
X-List-Received-Date: Wed, 27 Apr 2011 07:32:39 -0000

From: Saul Wold <sgw@linux.intel.com>

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../clutter/clutter-box2d-1.6_0.10.0.bb            |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-graphics/clutter/clutter-box2d-1.6_0.10.0.bb b/meta/recipes-graphics/clutter/clutter-box2d-1.6_0.10.0.bb
index cad8cfc..ad94aa5 100644
--- a/meta/recipes-graphics/clutter/clutter-box2d-1.6_0.10.0.bb
+++ b/meta/recipes-graphics/clutter/clutter-box2d-1.6_0.10.0.bb
@@ -2,6 +2,8 @@ require clutter-box2d.inc
 
 PR = "r0"
 
+DEPENDS += "clutter-1.6"
+
 SRC_URI = "http://source.clutter-project.org/sources/clutter-box2d/0.10/clutter-box2d-${PV}.tar.bz2 \
            file://fix-disable-introspection.patch"
 
-- 
1.7.1.1



