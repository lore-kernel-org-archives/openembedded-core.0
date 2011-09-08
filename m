Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R1W1E-0003VD-9S
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Sep 2011 06:15:16 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 07 Sep 2011 21:10:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,348,1312182000"; d="scan'208";a="15069519"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.148])
	by AZSMGA002.ch.intel.com with ESMTP; 07 Sep 2011 21:10:11 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Sep 2011 21:10:10 -0700
Message-Id: <968b5b20ecf5bf9372217781135ead2acf8013a2.1315454900.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1315454900.git.sgw@linux.intel.com>
References: <cover.1315454900.git.sgw@linux.intel.com>
In-Reply-To: <cover.1315454900.git.sgw@linux.intel.com>
References: <cover.1315454900.git.sgw@linux.intel.com>
Subject: [PATCH 1/1] python-native: add link for python2
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
X-List-Received-Date: Thu, 08 Sep 2011 04:15:16 -0000

Add link for python2 as some configuration tools search from a python2
and could find the host python instead of the python-native.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../recipes-devtools/python/python-native_2.6.6.bb |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/python/python-native_2.6.6.bb b/meta/recipes-devtools/python/python-native_2.6.6.bb
index 2b00d32..503bd96 100644
--- a/meta/recipes-devtools/python/python-native_2.6.6.bb
+++ b/meta/recipes-devtools/python/python-native_2.6.6.bb
@@ -42,4 +42,7 @@ do_install() {
 	for PYTHSCRIPT in `grep -rIl ${bindir}/python ${D}${bindir}`; do
 		sed -i -e '1s|^#!.*|#!/usr/bin/env python|' $PYTHSCRIPT
 	done
+
+	ln -sf ${D}${bindir}/python ${D}${bindir}/python2
+
 }
-- 
1.7.6



