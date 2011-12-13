Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RaNbq-0007YW-B9
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 09:21:10 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 13 Dec 2011 00:14:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="86612752"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.219])
	by orsmga002.jf.intel.com with ESMTP; 13 Dec 2011 00:14:13 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Dec 2011 00:14:03 -0800
Message-Id: <94cd70bbac9ecff0473bee747089a02d0234fefb.1323763897.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1323763897.git.sgw@linux.intel.com>
References: <cover.1323763897.git.sgw@linux.intel.com>
In-Reply-To: <cover.1323763897.git.sgw@linux.intel.com>
References: <cover.1323763897.git.sgw@linux.intel.com>
Subject: [PATCH 04/10] findutils: Add SRC_URI Checksums for GPLv2
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
X-List-Received-Date: Tue, 13 Dec 2011 08:21:10 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../recipes-extended/findutils/findutils_4.2.31.bb |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-extended/findutils/findutils_4.2.31.bb b/meta/recipes-extended/findutils/findutils_4.2.31.bb
index 0889f0f..bd455a5 100644
--- a/meta/recipes-extended/findutils/findutils_4.2.31.bb
+++ b/meta/recipes-extended/findutils/findutils_4.2.31.bb
@@ -13,6 +13,9 @@ PR = "r1"
 SRC_URI = "${GNU_MIRROR}/findutils/findutils-${PV}.tar.gz \
            file://gnulib-extension.patch"
 
+SRC_URI[md5sum] = "a0e31a0f18a49709bf5a449867c8049a"
+SRC_URI[sha256sum] = "e0d34b8faca0b3cca0703f6c6b498afbe72f0ba16c35980c10ec9ef7724d6204"
+
 inherit autotools gettext
 
 # diffutils assumes non-glibc compilation with uclibc and
-- 
1.7.6.4



