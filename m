Return-Path: <yin.thong.choong@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B891D77D20
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Apr 2017 02:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491187936; x=1522723936;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=xmGuoxkA9aobi4IqWWIe4FMLajxdCvMnkjXuZvBxubM=;
	b=Px2oVb8kZPF/ipstYo3HekK0/cTsfDW738x/+1GXRbL938JrUaTUkym2
	NNeTgJBk+J4T/35peTo/iG3qyxyQrA==;
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Apr 2017 19:52:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,267,1486454400"; d="scan'208";a="83488939"
Received: from platypus.jf.intel.com ([10.54.77.139])
	by fmsmga005.fm.intel.com with ESMTP; 02 Apr 2017 19:52:14 -0700
From: yin.thong.choong@intel.com
To: openembedded-core@lists.openembedded.org
Date: Sun,  2 Apr 2017 19:51:46 -0700
Message-Id: <1491187907-5752-8-git-send-email-yin.thong.choong@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1491187907-5752-1-git-send-email-yin.thong.choong@intel.com>
References: <1491187907-5752-1-git-send-email-yin.thong.choong@intel.com>
Subject: [PATCH 7/8] chkconfig: replace fedorahosted.org SRC_URI with github.com source
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
X-List-Received-Date: Mon, 03 Apr 2017 02:52:16 -0000

From: Choong YinThong <yin.thong.choong@intel.com>

fedorahosted.org was retired on March 1st, 2017. This is to update
the SRC_URI to point to github.com.

[YOCTO #11226]

Signed-off-by: Choong YinThong <yin.thong.choong@intel.com>
---
 meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb b/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
index e839026..275388b 100644
--- a/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
+++ b/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
@@ -6,7 +6,7 @@ of the drudgery of manually editing the symbolic links."
 
 RECIPE_NO_UPDATE_REASON = "Version 1.5 requires selinux"
 
-HOMEPAGE = "http://fedorahosted.org/releases/c/h/chkconfig"
+HOMEPAGE = "http://downloads.yoctoproject.org/mirror/sources/"
 
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5574c6965ae5f583e55880e397fbb018"
@@ -16,7 +16,7 @@ PROVIDES += "virtual/update-alternatives"
 
 PR = "r7"
 
-SRC_URI = "http://fedorahosted.org/releases/c/h/chkconfig/${BPN}-${PV}.tar.bz2 \
+SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/${BPN}-${PV}.tar.bz2 \
            file://replace_caddr_t.patch \
           "
 
-- 
2.7.4


