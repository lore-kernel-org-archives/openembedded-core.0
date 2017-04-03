Return-Path: <yin.thong.choong@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A1CB277D1C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Apr 2017 02:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491187936; x=1522723936;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=hWhl2j93QlC189hohx8emk3sVWeBas0YDp/IsUXhFQI=;
	b=I2UW4+MRt2ltFn7Nu9uSlC0DQZQYSCGivdiWr4JFw2dEkcEqfsP9S9CB
	XjtgG50jH0NlG2Fig4pcyQR4k6kjnA==;
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Apr 2017 19:52:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,267,1486454400"; d="scan'208";a="83488933"
Received: from platypus.jf.intel.com ([10.54.77.139])
	by fmsmga005.fm.intel.com with ESMTP; 02 Apr 2017 19:52:14 -0700
From: yin.thong.choong@intel.com
To: openembedded-core@lists.openembedded.org
Date: Sun,  2 Apr 2017 19:51:44 -0700
Message-Id: <1491187907-5752-6-git-send-email-yin.thong.choong@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1491187907-5752-1-git-send-email-yin.thong.choong@intel.com>
References: <1491187907-5752-1-git-send-email-yin.thong.choong@intel.com>
Subject: [PATCH 5/8] libnewt: replace fedorahosted.org SRC_URI with pagure.io source
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
 meta/recipes-extended/newt/libnewt_0.52.19.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/newt/libnewt_0.52.19.bb b/meta/recipes-extended/newt/libnewt_0.52.19.bb
index a26ce1f..de76ce2 100644
--- a/meta/recipes-extended/newt/libnewt_0.52.19.bb
+++ b/meta/recipes-extended/newt/libnewt_0.52.19.bb
@@ -8,7 +8,7 @@ shared library needed by programs built with newt, as well as a \
 /usr/bin/dialog replacement called whiptail.  Newt is based on the \
 slang library."
 
-HOMEPAGE = "https://fedorahosted.org/newt/"
+HOMEPAGE = "https://releases.pagure.org/newt/"
 SECTION = "libs"
 
 LICENSE = "LGPLv2"
@@ -17,7 +17,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 # slang needs to be >= 2.2
 DEPENDS = "slang popt"
 
-SRC_URI = "https://fedorahosted.org/releases/n/e/newt/newt-${PV}.tar.gz \
+SRC_URI = "https://releases.pagure.org/newt/newt-${PV}.tar.gz \
            file://fix_SHAREDDIR.patch \
            file://cross_ar.patch \
            file://Makefile.in-Add-tinfo-library-to-the-linking-librari.patch \
-- 
2.7.4


