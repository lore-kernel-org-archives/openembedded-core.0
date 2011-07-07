Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qey6h-0002Ta-40
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 01:35:43 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 07 Jul 2011 16:31:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,496,1304319600"; d="scan'208";a="22846271"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.236])
	by orsmga002.jf.intel.com with ESMTP; 07 Jul 2011 16:31:42 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jul 2011 16:31:34 -0700
Message-Id: <f3b515c630047db337815020dbc60929d659a612.1310081443.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1310081443.git.sgw@linux.intel.com>
References: <cover.1310081443.git.sgw@linux.intel.com>
In-Reply-To: <cover.1310081443.git.sgw@linux.intel.com>
References: <cover.1310081443.git.sgw@linux.intel.com>
Subject: [PATCH 2/8] image.bbclass: add LINGUAS_INSTALL to depends list
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
X-List-Received-Date: Thu, 07 Jul 2011 23:35:43 -0000

[YOCTO #1215]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/image.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 1768a0b..edfb2d6 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -5,7 +5,7 @@ inherit imagetest-${IMAGETEST}
 
 LICENSE = "MIT"
 PACKAGES = ""
-RDEPENDS += "${IMAGE_INSTALL}"
+RDEPENDS += "${IMAGE_INSTALL} ${LINGUAS_INSTALL}"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-- 
1.7.3.4



