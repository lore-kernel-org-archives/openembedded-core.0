Return-Path: <amarnath.valluri@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id DA5E57303D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 08:27:13 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Feb 2017 00:27:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,193,1484035200"; d="scan'208";a="1114017728"
Received: from avallurigigabyte.fi.intel.com ([10.237.72.170])
	by fmsmga001.fm.intel.com with ESMTP; 22 Feb 2017 00:27:14 -0800
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Feb 2017 10:26:45 +0200
Message-Id: <1487752042-19804-14-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1487752042-19804-1-git-send-email-amarnath.valluri@intel.com>
References: <1487752042-19804-1-git-send-email-amarnath.valluri@intel.com>
In-Reply-To: <1486734151-28331-1-git-send-email-amarnath.valluri@intel.com>
References: <1486734151-28331-1-git-send-email-amarnath.valluri@intel.com>
Subject: [PATCH v2 14/25] util-linux: Make sure '${base_bindir}/reset' is part of util-linux-reset package.
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
X-List-Received-Date: Wed, 22 Feb 2017 08:27:14 -0000

update-alternative.bbclass might rename the 'reset' binary when LINK_NAME ==
TARGET, This is true(${base_bindir} == ${bindir}) when 'usrmerge' distro feature
is enabled.  Hence, suffix with * to properly package the renamed binary.

Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>

util-linux
---
 meta/recipes-core/util-linux/util-linux.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index ae60b0a..5934fb5 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -84,7 +84,7 @@ FILES_util-linux-umount = "${base_bindir}/umount.${BPN}"
 FILES_util-linux-readprofile = "${sbindir}/readprofile.${BPN}"
 FILES_util-linux-uuidgen = "${bindir}/uuidgen"
 FILES_util-linux-uuidd = "${sbindir}/uuidd"
-FILES_util-linux-reset = "${base_bindir}/reset"
+FILES_util-linux-reset = "${base_bindir}/reset*"
 FILES_util-linux-partx = "${sbindir}/partx"
 FILES_util-linux-hwclock = "${base_sbindir}/hwclock.${BPN}"
 FILES_util-linux-findfs = "${sbindir}/findfs"
-- 
2.7.4


