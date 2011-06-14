Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QWOcz-0001K6-Rc
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 10:05:38 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 14 Jun 2011 01:02:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,363,1304319600"; d="scan'208";a="14283916"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.216])
	by orsmga001.jf.intel.com with ESMTP; 14 Jun 2011 01:02:12 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jun 2011 01:01:27 -0700
Message-Id: <f244f45c74f4b9c45472e418a8191f687c0cd6b8.1308037753.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1308037752.git.sgw@linux.intel.com>
References: <cover.1308037752.git.sgw@linux.intel.com>
In-Reply-To: <cover.1308037752.git.sgw@linux.intel.com>
References: <cover.1308037752.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 18/51] update-alternatives-dpkg: Fix SRC_URI Checksum
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
X-List-Received-Date: Tue, 14 Jun 2011 08:05:39 -0000

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



