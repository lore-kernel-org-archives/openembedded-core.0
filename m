Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QW168-0002Fx-Ci
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 08:58:08 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 12 Jun 2011 23:54:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,356,1304319600"; d="scan'208";a="17500625"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.216])
	by fmsmga001.fm.intel.com with ESMTP; 12 Jun 2011 23:54:40 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 12 Jun 2011 23:54:29 -0700
Message-Id: <f9a3b9661e7eb64861a8d5669e47669414f29966.1307947593.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1307947593.git.sgw@linux.intel.com>
References: <cover.1307947593.git.sgw@linux.intel.com>
In-Reply-To: <cover.1307947593.git.sgw@linux.intel.com>
References: <cover.1307947593.git.sgw@linux.intel.com>
Subject: [*RFC CONSOLIDATED PULL RFC* 19/23] update-alternatives-dpkg: Fix SRC_URI Checksum
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
X-List-Received-Date: Mon, 13 Jun 2011 06:58:08 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../update-alternatives-dpkg_1.16.0.3.bb           |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/update-alternatives/update-alternatives-dpkg_1.16.0.3.bb b/meta/recipes-devtools/update-alternatives/update-alternatives-dpkg_1.16.0.3.bb
index 5443122..f293177 100644
--- a/meta/recipes-devtools/update-alternatives/update-alternatives-dpkg_1.16.0.3.bb
+++ b/meta/recipes-devtools/update-alternatives/update-alternatives-dpkg_1.16.0.3.bb
@@ -4,5 +4,5 @@ PR = "${INC_PR}.0"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRC_URI[md5sum] = "d1731d4147c1ea3b537a4d094519a6dc"
-SRC_URI[sha256sum] = "1ec1376471b04717a4497e5d7a27cd545248c92116898ce0c53ced8ea94267b5"
+SRC_URI[md5sum] = "0266b06ef9da8278cea008d21e17e5f6"
+SRC_URI[sha256sum] = "69669720020e67629d70aa5325e3c20c05cae7a9fc2d8abd442672c7b29e31d3"
-- 
1.7.3.4



