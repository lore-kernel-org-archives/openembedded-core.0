Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TYVoO-0003ND-UG
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 06:47:04 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 13 Nov 2012 21:32:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,248,1352102400"; d="scan'208";a="246693779"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.71])
	by fmsmga001.fm.intel.com with ESMTP; 13 Nov 2012 21:32:56 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Nov 2012 21:32:43 -0800
Message-Id: <9f4d05e445bfc2cfd8674d678d864470872c9fc7.1352871028.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1352871028.git.sgw@linux.intel.com>
References: <cover.1352871028.git.sgw@linux.intel.com>
In-Reply-To: <cover.1352871028.git.sgw@linux.intel.com>
References: <cover.1352871028.git.sgw@linux.intel.com>
Subject: [PATCH 1/9] packagegroup-self-hosted: add sftp server
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
X-List-Received-Date: Wed, 14 Nov 2012 05:47:05 -0000

Which is needed for integration with Eclispe plugin

Signed-off-by: Saul Wold <sgw@linux.intel.com>
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



