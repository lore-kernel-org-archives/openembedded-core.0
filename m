Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RhxrH-0004fO-Ss
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 07:28:28 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 02 Jan 2012 22:21:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="91752222"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.112])
	by azsmga001.ch.intel.com with ESMTP; 02 Jan 2012 22:21:01 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 22:19:43 -0800
Message-Id: <edca1102896a67b068622f3cedd6f9f53f1890dc.1325571069.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 057/113] glib-2.0: we need zlib
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
X-List-Received-Date: Tue, 03 Jan 2012 06:28:31 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-core/glib-2.0/glib-2.0_2.30.2.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.30.2.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.30.2.bb
index eff43c9..aa6ee3a 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.30.2.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.30.2.bb
@@ -3,7 +3,7 @@ require glib.inc
 PR = "r0"
 PE = "1"
 
-DEPENDS += "libffi python-argparse-native"
+DEPENDS += "libffi python-argparse-native zlib"
 DEPENDS_virtclass-native += "libffi-native python-argparse-native"
 DEPENDS_virtclass-nativesdk += "libffi-nativesdk python-argparse-native zlib-nativesdk"
 
-- 
1.7.6.4



