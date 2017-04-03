Return-Path: <yin.thong.choong@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8879B71D79
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Apr 2017 02:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491187936; x=1522723936;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=diz9ju5jsRHwSEIW5SyqTVqcpPRTXtH0bNRLFem9VPE=;
	b=vDy7xGRkojyoY344jElPPRaPx5CLRIJzyvrQkAAIxu30pydiTEo7YpfQ
	4zxEgwUKIMEAm+qMrLcxkDHTPlO9BA==;
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Apr 2017 19:52:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,267,1486454400"; d="scan'208";a="83488927"
Received: from platypus.jf.intel.com ([10.54.77.139])
	by fmsmga005.fm.intel.com with ESMTP; 02 Apr 2017 19:52:13 -0700
From: yin.thong.choong@intel.com
To: openembedded-core@lists.openembedded.org
Date: Sun,  2 Apr 2017 19:51:42 -0700
Message-Id: <1491187907-5752-4-git-send-email-yin.thong.choong@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1491187907-5752-1-git-send-email-yin.thong.choong@intel.com>
References: <1491187907-5752-1-git-send-email-yin.thong.choong@intel.com>
Subject: [PATCH 3/8] libuser: replace fedorahosted.org SRC_URI with pagure.io source
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
X-List-Received-Date: Mon, 03 Apr 2017 02:52:15 -0000

From: Choong YinThong <yin.thong.choong@intel.com>

fedorahosted.org was retired on March 1st, 2017. This is to
update the SRC_URI to point to pagure.io. pagure.io is a
replacement for fedorahosted.

[YOCTO #11226]

Signed-off-by: Choong YinThong <yin.thong.choong@intel.com>
---
 meta/recipes-extended/libuser/libuser_0.62.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/libuser/libuser_0.62.bb b/meta/recipes-extended/libuser/libuser_0.62.bb
index 6960d71..1765346 100644
--- a/meta/recipes-extended/libuser/libuser_0.62.bb
+++ b/meta/recipes-extended/libuser/libuser_0.62.bb
@@ -1,8 +1,8 @@
 SUMMARY = "user and group account administration library"
 DESCRIPTION = "The libuser library implements a standardized interface for manipulating and administering user \
 and group accounts"
-HOMEPAGE = "https://fedorahosted.org/libuser/"
-BUGTRACKER = "https://fedorahosted.org/libuser/newticket"
+HOMEPAGE = "https://pagure.io/libuser"
+BUGTRACKER = "https://pagure.io/libuser/issues"
 
 LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
 
 SECTION = "base"
 
-SRC_URI = "https://fedorahosted.org/releases/l/i/libuser/libuser-${PV}.tar.xz \
+SRC_URI = "https://releases.pagure.org/libuser/libuser-${PV}.tar.xz \
            file://0001-Check-for-issetugid.patch \
            file://0002-remove-unused-execinfo.h.patch \
            file://0001-modules-files.c-parse_field-fix-string-formating-in-.patch \
-- 
2.7.4


