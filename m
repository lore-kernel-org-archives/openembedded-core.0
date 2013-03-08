Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ddalex@intel.com>) id 1UDzkK-0003Uq-UF
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Mar 2013 17:02:14 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 08 Mar 2013 07:45:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,809,1355126400"; d="scan'208";a="297823488"
Received: from adamian-desktop.rb.intel.com ([10.237.105.51])
	by fmsmga001.fm.intel.com with ESMTP; 08 Mar 2013 07:45:35 -0800
Received: by adamian-desktop.rb.intel.com (Postfix, from userid 1000)
	id 889C0560DE8; Fri,  8 Mar 2013 17:45:35 +0200 (EET)
From: Alex DAMIAN <alexandru.damian@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Mar 2013 17:45:28 +0200
Message-Id: <1362757528-9240-2-git-send-email-alexandru.damian@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1362757528-9240-1-git-send-email-alexandru.damian@intel.com>
References: <1362757528-9240-1-git-send-email-alexandru.damian@intel.com>
Cc: Alexandru DAMIAN <alexandru.damian@intel.com>
Subject: [PATCH 2/2] Coreutils 6.9 depends on libattr
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
X-List-Received-Date: Fri, 08 Mar 2013 16:02:18 -0000

From: Alexandru DAMIAN <alexandru.damian@intel.com>

We have a build dependency, so list it out.
---
 meta/recipes-core/coreutils/coreutils_6.9.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/coreutils/coreutils_6.9.bb b/meta/recipes-core/coreutils/coreutils_6.9.bb
index c0778ba..f712692 100644
--- a/meta/recipes-core/coreutils/coreutils_6.9.bb
+++ b/meta/recipes-core/coreutils/coreutils_6.9.bb
@@ -9,6 +9,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://src/ls.c;beginline=4;endline=16;md5=15ed60f67b1db5fedd5dbc37cf8a9543"
 PR = "r5"
+DEPENDS = "attr"
 DEPENDS_class-native = "gettext-native"
 
 inherit autotools gettext
-- 
1.7.10.4



