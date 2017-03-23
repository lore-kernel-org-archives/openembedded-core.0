Return-Path: <amarnath.valluri@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id CED0977AC5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 08:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490258038; x=1521794038;
	h=from:to:cc:subject:date:message-id;
	bh=2ukvAUKn2p5PXeZfAs814ZzP4MDc8RAtovRjKan7zJE=;
	b=U22BdCSPz7mMSIOKvCaqvKEBNZReRO9YMgHmve+n/699om1TkGqs+NPm
	mgVfbUxCKDOLZjSTwJxA7cTF6ZsSdQ==;
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Mar 2017 01:33:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,208,1486454400"; d="scan'208";a="947341983"
Received: from avallurigigabyte.fi.intel.com ([10.237.72.170])
	by orsmga003.jf.intel.com with ESMTP; 23 Mar 2017 01:33:56 -0700
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Mar 2017 10:30:40 +0200
Message-Id: <1490257840-7522-1-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] firmware: use ${nonarch_base_libdir} for firmware installation.
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
X-List-Received-Date: Thu, 23 Mar 2017 08:33:57 -0000

Replace hardcoded '/lib' in kernel firmware installation path with
${nonarch_base_libdir}.

Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 5b5a7a4..d393231 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -343,13 +343,13 @@ FILES_${PN}-sd8797 = " \
   ${nonarch_base_libdir}/firmware/mrvl/sd8797_uapsta.bin \
 "
 FILES_${PN}-sd8801 = " \
-  /lib/firmware/mrvl/sd8801_uapsta.bin \
+  ${nonarch_base_libdir}/firmware/mrvl/sd8801_uapsta.bin \
 "
 FILES_${PN}-sd8887 = " \
-  /lib/firmware/mrvl/sd8887_uapsta.bin \
+  ${nonarch_base_libdir}/firmware/mrvl/sd8887_uapsta.bin \
 "
 FILES_${PN}-sd8897 = " \
-  /lib/firmware/mrvl/sd8897_uapsta.bin \
+  ${nonarch_base_libdir}/firmware/mrvl/sd8897_uapsta.bin \
 "
 
 RDEPENDS_${PN}-sd8686 += "${PN}-marvell-license"
-- 
2.7.4


