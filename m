Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qojja-0004Tu-HF
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 00:16:18 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 03 Aug 2011 15:11:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,312,1309762800"; 
   d="scan'208";a="3912933"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.76])
	by AZSMGA002.ch.intel.com with ESMTP; 03 Aug 2011 15:11:47 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Aug 2011 15:10:56 -0700
Message-Id: <e529ac8a91191ed8b859c065efe998c7527861a7.1312407628.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1312407628.git.sgw@linux.intel.com>
References: <cover.1312407628.git.sgw@linux.intel.com>
In-Reply-To: <cover.1312407628.git.sgw@linux.intel.com>
References: <cover.1312407628.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL v2 12/33] libsoup-2.4: Upgrade to 2.34.2
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
X-List-Received-Date: Wed, 03 Aug 2011 22:16:19 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 ...libsoup-2.4_2.34.1.bb => libsoup-2.4_2.34.2.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.34.1.bb => libsoup-2.4_2.34.2.bb} (76%)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.34.1.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.34.2.bb
similarity index 76%
rename from meta/recipes-support/libsoup/libsoup-2.4_2.34.1.bb
rename to meta/recipes-support/libsoup/libsoup-2.4_2.34.2.bb
index f9e8de5..57af8f7 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.34.1.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.34.2.bb
@@ -12,8 +12,8 @@ DEPENDS = "glib-2.0 gnutls libxml2 libproxy sqlite3 libgnome-keyring"
 
 SRC_URI = "${GNOME_MIRROR}/libsoup/2.34/libsoup-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "846779d898c11f97b5de28a79ea82254"
-SRC_URI[sha256sum] = "a2f846af2c4c08e15eacc9879c8c9be4d85f8105f960f96a9ba3dbabd9ee517b"
+SRC_URI[md5sum] = "2454b38681a6e082b613a781a501e721"
+SRC_URI[sha256sum] = "1d70edc48c309528635012269733739f9cd22548913125864318a65d1b6f1261"
 
 S = "${WORKDIR}/libsoup-${PV}"
 
-- 
1.7.3.4



