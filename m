Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id EC0C177E3B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 13:50:49 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Apr 2017 06:50:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,194,1488873600"; d="scan'208";a="955724389"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 13 Apr 2017 06:50:46 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Apr 2017 16:50:12 +0300
Message-Id: <20170413135012.2511-2-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170413135012.2511-1-alexander.kanavin@linux.intel.com>
References: <20170413135012.2511-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 2/2] gpgme: add a dependency on python-unixadmin to Python bindings package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Apr 2017 13:50:50 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-support/gpgme/gpgme_1.8.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/gpgme/gpgme_1.8.0.bb b/meta/recipes-support/gpgme/gpgme_1.8.0.bb
index cb9143aded8..4ddf6ed9996 100644
--- a/meta/recipes-support/gpgme/gpgme_1.8.0.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.8.0.bb
@@ -24,6 +24,9 @@ SRC_URI[sha256sum] = "596097257c2ce22e747741f8ff3d7e24f6e26231fa198a41b2a072e62d
 DEPENDS = "libgpg-error libassuan"
 RDEPENDS_${PN}-cpp += "libstdc++"
 
+RDEPENDS_python2-gpg += "python-unixadmin"
+RDEPENDS_python3-gpg += "python3-unixadmin"
+
 BINCONFIG = "${bindir}/gpgme-config"
 
 # Note select python2 or python3, but you can't select both at the same time
-- 
2.11.0


