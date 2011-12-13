Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RaNbo-0007YT-CS
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 09:21:08 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 13 Dec 2011 00:14:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="86612741"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.219])
	by orsmga002.jf.intel.com with ESMTP; 13 Dec 2011 00:14:11 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Dec 2011 00:14:00 -0800
Message-Id: <a00aea68a4cef23eba1469d59061f9433cebb97e.1323763897.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1323763897.git.sgw@linux.intel.com>
References: <cover.1323763897.git.sgw@linux.intel.com>
In-Reply-To: <cover.1323763897.git.sgw@linux.intel.com>
References: <cover.1323763897.git.sgw@linux.intel.com>
Subject: [PATCH 01/10] coreutils: Add SRC_URI Checksums for GPLv2
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
X-List-Received-Date: Tue, 13 Dec 2011 08:21:08 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/coreutils/coreutils_6.9.bb |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/coreutils/coreutils_6.9.bb b/meta/recipes-core/coreutils/coreutils_6.9.bb
index c9aea38..8a47a60 100644
--- a/meta/recipes-core/coreutils/coreutils_6.9.bb
+++ b/meta/recipes-core/coreutils/coreutils_6.9.bb
@@ -27,6 +27,9 @@ SRC_URI_BASE = "${GNU_MIRROR}/coreutils/${BP}.tar.bz2 \
 SRC_URI = "${SRC_URI_BASE} file://fix_for_manpage_building.patch"
 SRC_URI_virtclass-native = "${SRC_URI_BASE}"
 
+SRC_URI[md5sum] = "c9607d8495f16e98906e7ed2d9751a06"
+SRC_URI[sha256sum] = "89c2895ad157de50e53298b22d91db116ee4e1dd3fdf4019260254e2e31497b0"
+
 # [ gets a special treatment and is not included in this
 bindir_progs = "base64 basename cksum comm csplit cut dir dircolors dirname du \
                 env expand expr factor fmt fold groups head hostid id install \
-- 
1.7.6.4



