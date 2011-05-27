Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QQ1ob-0004KR-8G
	for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 20:31:17 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 27 May 2011 11:28:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,281,1304319600"; 
   d="scan'208";a="8708344"
Received: from unknown (HELO localhost.localdomain) ([10.255.12.244])
	by fmsmga002.fm.intel.com with ESMTP; 27 May 2011 11:28:10 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 May 2011 11:28:07 -0700
Message-Id: <9942aa2e63b9250509eae853935cf1f29414fda1.1306520840.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1306520840.git.sgw@linux.intel.com>
References: <cover.1306520840.git.sgw@linux.intel.com>
In-Reply-To: <cover.1306520840.git.sgw@linux.intel.com>
References: <cover.1306520840.git.sgw@linux.intel.com>
Subject: [PATCH 1/1] gupnp-tools: Add gupnp-av to DEPENDS
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
X-List-Received-Date: Fri, 27 May 2011 18:31:17 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../gupnp/gupnp-tools_0.8.1.bb                     |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-connectivity/gupnp/gupnp-tools_0.8.1.bb b/meta/recipes-connectivity/gupnp/gupnp-tools_0.8.1.bb
index 008d0f7..2ee7462 100644
--- a/meta/recipes-connectivity/gupnp/gupnp-tools_0.8.1.bb
+++ b/meta/recipes-connectivity/gupnp/gupnp-tools_0.8.1.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Tools for GUPnP"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://src/network-light/main.c;beginline=1;endline=21;md5=033bf37c030780c5a72165846b3003f6"
-DEPENDS = "gupnp gtk+ libglade gnome-icon-theme"
+DEPENDS = "gupnp gupnp-av gtk+ libglade gnome-icon-theme"
 
 SRC_URI = "http://gupnp.org/sites/all/files/sources/${BPN}-${PV}.tar.gz"
 
-- 
1.7.3.4



