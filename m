Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QwFnX-0008Ki-CM
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Aug 2011 17:55:23 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 24 Aug 2011 08:50:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,275,1312182000"; d="scan'208";a="41953291"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.203])
	by azsmga001.ch.intel.com with ESMTP; 24 Aug 2011 08:50:33 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Aug 2011 08:50:26 -0700
Message-Id: <4570c1e4f5ba3f3c2f5be8b46d47efc3921d3e6b.1314200868.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1314200868.git.sgw@linux.intel.com>
References: <cover.1314200868.git.sgw@linux.intel.com>
In-Reply-To: <cover.1314200868.git.sgw@linux.intel.com>
References: <cover.1314200868.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 1/6] libtasn1: update SRC_URI
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
X-List-Received-Date: Wed, 24 Aug 2011 15:55:23 -0000

From: Joshua Lock <josh@linux.intel.com>

libtasn is no longer hosted as a sub-project of gnutls, it has its ftp
directory.

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/recipes-support/gnutls/libtasn1_2.9.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-support/gnutls/libtasn1_2.9.bb b/meta/recipes-support/gnutls/libtasn1_2.9.bb
index 63bb3c8..9a80005 100644
--- a/meta/recipes-support/gnutls/libtasn1_2.9.bb
+++ b/meta/recipes-support/gnutls/libtasn1_2.9.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 
 PR = "r0"
 
-SRC_URI = "ftp://ftp.gnutls.org/pub/gnutls/libtasn1/libtasn1-${PV}.tar.gz"
+SRC_URI = "ftp://ftp.gnu.org/gnu/libtasn1/libtasn1-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "f4f4035b84550100ffeb8ad4b261dea9"
 SRC_URI[sha256sum] = "fac46855fac8b08cf6f5a1b60cebad8e090bac1f06c335a044e84110d0b412c4"
-- 
1.7.6



