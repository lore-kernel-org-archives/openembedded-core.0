Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TYlYI-0000K7-Ox
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 23:35:29 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 14 Nov 2012 14:21:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,252,1352102400"; d="scan'208";a="168490596"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.71])
	by AZSMGA002.ch.intel.com with ESMTP; 14 Nov 2012 14:21:08 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Nov 2012 14:21:03 -0800
Message-Id: <aac29a103ef154865f559858e6dab4c21a3393f4.1352931528.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1352931528.git.sgw@linux.intel.com>
References: <cover.1352931528.git.sgw@linux.intel.com>
In-Reply-To: <cover.1352931528.git.sgw@linux.intel.com>
References: <cover.1352931528.git.sgw@linux.intel.com>
Subject: [PATCH 10/10] packagegroup-self-hosted: add sftp server
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Nov 2012 22:35:36 -0000

Which is needed for integration with Eclispe plugin

(From OE-Core rev: c96ec6723ba289d40f4901ecaa5464b9b73aaa6e)

Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../packagegroups/packagegroup-self-hosted.bb      |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index 19f5a16..6dcc44a 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -4,7 +4,7 @@
 
 SUMMARY = "Self-hosting"
 DESCRIPTION = "Packages required to run the build system"
-PR = "r12"
+PR = "r13"
 LICENSE = "MIT"
 
 inherit packagegroup
@@ -131,6 +131,7 @@ RDEPENDS_packagegroup-self-hosted-extended = "\
     nfs-utils \
     nfs-utils-client \
     openssl \
+    openssh-sftp-server \
     opkg \
     opkg-utils \
     patch \
-- 
1.7.7.6



