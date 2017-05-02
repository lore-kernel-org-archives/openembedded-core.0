Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A231B71D7E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 May 2017 12:51:59 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 May 2017 05:52:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,405,1488873600"; d="scan'208";a="1163544036"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 02 May 2017 05:52:00 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 May 2017 15:51:50 +0300
Message-Id: <20170502125151.5095-5-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170502125151.5095-1-alexander.kanavin@linux.intel.com>
References: <20170502125151.5095-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 5/6] btrfs-tools: upgrade to 4.10.2
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
X-List-Received-Date: Tue, 02 May 2017 12:51:59 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../btrfs-tools/{btrfs-tools_4.9.1.bb => btrfs-tools_4.10.2.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_4.9.1.bb => btrfs-tools_4.10.2.bb} (95%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.9.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.10.2.bb
similarity index 95%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_4.9.1.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_4.10.2.bb
index a5e9e2278a8..38062ce58c8 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.9.1.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.10.2.bb
@@ -14,7 +14,7 @@ DEPENDS = "util-linux attr e2fsprogs lzo acl"
 DEPENDS_append_class-target = " udev"
 RDEPENDS_${PN} = "libgcc"
 
-SRCREV = "96485c34ac0329fb0073476f16d2083c64701f29"
+SRCREV = "bd0ab27afbf14370f9f0da1f5f5ecbb0adc654c1"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git"
 
 inherit autotools-brokensep pkgconfig manpages
-- 
2.11.0


