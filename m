Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RddcA-0005N8-KI
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 09:02:59 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 21 Dec 2011 23:55:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="89233785"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.90])
	by orsmga001.jf.intel.com with ESMTP; 21 Dec 2011 23:55:43 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Dec 2011 23:55:32 -0800
Message-Id: <386789888817b330cbc2930a3acf309ead89c9a9.1324540323.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1324540322.git.sgw@linux.intel.com>
References: <cover.1324540322.git.sgw@linux.intel.com>
In-Reply-To: <cover.1324540322.git.sgw@linux.intel.com>
References: <cover.1324540322.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 26/26] bash: Add SRC_URI Checksums for GPLv2
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
X-List-Received-Date: Thu, 22 Dec 2011 08:03:00 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/bash/bash_3.2.48.bb |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-extended/bash/bash_3.2.48.bb b/meta/recipes-extended/bash/bash_3.2.48.bb
index 1f70263..f10f687 100644
--- a/meta/recipes-extended/bash/bash_3.2.48.bb
+++ b/meta/recipes-extended/bash/bash_3.2.48.bb
@@ -22,6 +22,9 @@ SRC_URI[patch002.sha256sum] = "081bb03c580ecee63ba03b40beb3caf509eca29515b2e8dd3
 SRC_URI[patch003.md5sum] = "15c6653042e9814aa87120098fc7a849"
 SRC_URI[patch003.sha256sum] = "354886097cd95b4def77028f32ee01e2e088d58a98184fede9d3ce9320e218ef"
 
+SRC_URI[md5sum] = "338dcf975a93640bb3eaa843ca42e3f8"
+SRC_URI[sha256sum] = "128d281bd5682ba5f6953122915da71976357d7a76490d266c9173b1d0426348"
+
 inherit autotools gettext
 
 PARALLEL_MAKE = ""
-- 
1.7.6.4



