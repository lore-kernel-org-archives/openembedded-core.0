Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RNZNI-0003E0-FM
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 01:17:12 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 07 Nov 2011 16:10:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="72146549"
Received: from unknown (HELO shamshir.jf.intel.com) ([10.7.199.75])
	by orsmga001.jf.intel.com with ESMTP; 07 Nov 2011 16:10:50 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Nov 2011 16:10:49 -0800
Message-Id: <4241600df3bdda0f06f71265ceaece89268d001a.1320709417.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <cover.1320709417.git.josh@linux.intel.com>
References: <cover.1320709417.git.josh@linux.intel.com>
In-Reply-To: <cover.1320709417.git.josh@linux.intel.com>
References: <cover.1320709417.git.josh@linux.intel.com>
Subject: [PATCH 12/12] contacts: fix packaging of icons
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
X-List-Received-Date: Tue, 08 Nov 2011 00:17:12 -0000

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/recipes-sato/pimlico/contacts.inc |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-sato/pimlico/contacts.inc b/meta/recipes-sato/pimlico/contacts.inc
index ce990d7..52c65ec 100644
--- a/meta/recipes-sato/pimlico/contacts.inc
+++ b/meta/recipes-sato/pimlico/contacts.inc
@@ -23,7 +23,8 @@ do_install_append () {
 }
 
 FILES_${PN} += "${datadir}/pixmaps/stock_contact.png \
-		${datadir}/pixmaps/stock_person.png"
+		${datadir}/pixmaps/stock_person.png \
+		${datadir}/icons/hicolor"
 
 SRC_URI = "file://stock_contact.png \
            file://stock_person.png"
-- 
1.7.7



