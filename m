Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RXoRl-0005Om-0v
	for openembedded-core@openembedded.org; Tue, 06 Dec 2011 07:24:09 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 05 Dec 2011 22:16:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="83881066"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.199])
	by orsmga002.jf.intel.com with ESMTP; 05 Dec 2011 22:16:15 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Mon,  5 Dec 2011 22:16:13 -0800
Message-Id: <db3b3f53175b5b3d502e194f31ac07b73d7839e8.1323148082.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1323148082.git.sgw@linux.intel.com>
References: <cover.1323148082.git.sgw@linux.intel.com>
In-Reply-To: <cover.1323148082.git.sgw@linux.intel.com>
References: <cover.1323148082.git.sgw@linux.intel.com>
Subject: [PATCH 2/2] wget: Fix wget alternative path to be /usr/bin not /bin
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
X-List-Received-Date: Tue, 06 Dec 2011 06:24:09 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/wget/wget.inc |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/wget/wget.inc b/meta/recipes-extended/wget/wget.inc
index d9eee80..91400cc 100644
--- a/meta/recipes-extended/wget/wget.inc
+++ b/meta/recipes-extended/wget/wget.inc
@@ -3,7 +3,7 @@ SECTION = "console/network"
 LICENSE = "GPL"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-INC_PR = "r10"
+INC_PR = "r11"
 
 inherit autotools gettext update-alternatives
 
@@ -15,6 +15,6 @@ do_install_append () {
 }
 
 ALTERNATIVE_NAME = "wget"
-ALTERNATIVE_LINK = "${base_bindir}/wget"
-ALTERNATIVE_PATH = "${base_bindir}/wget.${PN}"
+ALTERNATIVE_LINK = "${bindir}/wget"
+ALTERNATIVE_PATH = "${bindir}/wget.${PN}"
 ALTERNATIVE_PRIORITY = "100"
-- 
1.7.6.4



