Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 0690677BC1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Nov 2017 14:00:40 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Nov 2017 07:00:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,329,1505804400"; d="scan'208";a="330573703"
Received: from marquiz2.fi.intel.com ([10.237.72.79])
	by fmsmga004.fm.intel.com with ESMTP; 01 Nov 2017 07:00:40 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Nov 2017 16:00:33 +0200
Message-Id: <bbe67d31f10eb0c090acc6f68c4497462af913af.1509544185.git.markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <cover.1509544185.git.markus.lehtonen@linux.intel.com>
References: <cover.1509544185.git.markus.lehtonen@linux.intel.com>
In-Reply-To: <cover.1509544185.git.markus.lehtonen@linux.intel.com>
References: <cover.1509544185.git.markus.lehtonen@linux.intel.com>
Subject: [PATCH 4/6] initscripts: rrecommend initscripts-functions
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
X-List-Received-Date: Wed, 01 Nov 2017 14:00:40 -0000

In order to make that the default provider for initd-functions.

[YOCTO #10944]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/recipes-core/initscripts/initscripts_1.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index 1167735756..91eea4b8c2 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -50,6 +50,8 @@ PACKAGES =+ "${PN}-functions ${PN}-sushell"
 RDEPENDS_${PN} = "initd-functions \
                   ${@bb.utils.contains('DISTRO_FEATURES','selinux','${PN}-sushell','',d)} \
 		 "
+# Recommend pn-functions so that it will be a preferred default provider for initd-functions
+RRECOMMENDS_${PN} = "${PN}-functions"
 RPROVIDES_${PN}-functions = "initd-functions"
 RCONFLICTS_${PN}-functions = "lsbinitscripts"
 FILES_${PN}-functions = "${sysconfdir}/init.d/functions*"
-- 
2.13.6


