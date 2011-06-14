Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QWOd0-0001K8-WC
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 10:05:39 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 14 Jun 2011 01:02:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,363,1304319600"; d="scan'208";a="14283921"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.216])
	by orsmga001.jf.intel.com with ESMTP; 14 Jun 2011 01:02:12 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jun 2011 01:01:28 -0700
Message-Id: <3c84597523ccf9fadf476fce7cb1b9909ad3f967.1308037753.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1308037752.git.sgw@linux.intel.com>
References: <cover.1308037752.git.sgw@linux.intel.com>
In-Reply-To: <cover.1308037752.git.sgw@linux.intel.com>
References: <cover.1308037752.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 19/51] jsib-glib: Fix SRC_URI Checksum
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
X-List-Received-Date: Tue, 14 Jun 2011 08:05:40 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-gnome/json-glib/json-glib_0.12.4.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-gnome/json-glib/json-glib_0.12.4.bb b/meta/recipes-gnome/json-glib/json-glib_0.12.4.bb
index 2b8bdf6..5bd9dcd 100644
--- a/meta/recipes-gnome/json-glib/json-glib_0.12.4.bb
+++ b/meta/recipes-gnome/json-glib/json-glib_0.12.4.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 DEPENDS = "glib-2.0"
 
 SRC_URI[archive.md5sum] = "347e1714e4a2ce54298969d5ffec7dca"
-SRC_URI[archive.sha256sum] = "462cd611016ae189d5e3f258dc7741e6a2e8267404b4e3806aaf346d50f1df7e"  
+SRC_URI[archive.sha256sum] = "462cd611016ae189d5e3f258dc7741e6a2e8267404b4e3806aaf346d50f1df7e"
 
 PR = "r0"
 
-- 
1.7.3.4



