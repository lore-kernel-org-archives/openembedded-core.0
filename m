Return-Path: <bogdanx.a.voiculescu@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 42A7D6011D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 09:12:30 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 25 Nov 2015 01:12:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,342,1444719600"; d="scan'208";a="859018395"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 25 Nov 2015 01:12:30 -0800
Received: from localhost.localdomain (unknown [10.237.112.98])
	by linux.intel.com (Postfix) with ESMTP id C7BDC6A4083;
	Wed, 25 Nov 2015 01:11:22 -0800 (PST)
From: Bogdan-Alexandru Voiculescu <bogdanx.a.voiculescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Nov 2015 11:18:13 +0200
Message-Id: <1448443093-17539-1-git-send-email-bogdanx.a.voiculescu@intel.com>
X-Mailer: git-send-email 1.9.1
Cc: benjamin.esquivel@intel.com
Subject: [PATCH] uClibc: enable utmp for shadow compatibility
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
X-List-Received-Date: Wed, 25 Nov 2015 09:12:31 -0000

with the enabling of utmpx in busybox and uClibc it was noted that shadow
support for utmpx also needs utmp explicitly enabled in uclibc. this is
a workaround that might be removed once shadow properly supports
--enable-utmpx to check for utmpx configuration instead of utmp like
it does now

[YOCTO #8243]

Signed-off-by: Bogdan-Alexandru Voiculescu <bogdanx.a.voiculescu@intel.com>
Signed-off-by: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
---
 meta/recipes-core/uclibc/uclibc-git/uClibc.distro | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/uclibc/uclibc-git/uClibc.distro b/meta/recipes-core/uclibc/uclibc-git/uClibc.distro
index 6575482..3827b66 100644
--- a/meta/recipes-core/uclibc/uclibc-git/uClibc.distro
+++ b/meta/recipes-core/uclibc/uclibc-git/uClibc.distro
@@ -182,6 +182,8 @@ UCLIBC_HAS_FLOATS=y
 
 # COMPILE_IN_THUMB_MODE is not set
 
+# needed by shadow
+UCLIBC_HAS_UTMP=y
 # needed by systemd
 UCLIBC_HAS_UTMPX=y
 UCLIBC_LINUX_MODULE_26=y
-- 
1.9.1


