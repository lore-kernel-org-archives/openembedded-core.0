Return-Path: <yin.thong.choong@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 46B6677C5D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Apr 2017 09:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491298177; x=1522834177;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=hWhl2j93QlC189hohx8emk3sVWeBas0YDp/IsUXhFQI=;
	b=u3ehzNkKViV7lvNE84zv77t3oZuK6m8xwSzWXHHXjPA6D8uh2rfhmMwQ
	+FIJmjfikZlTZbq5JXBLJs5riWNUZw==;
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Apr 2017 02:29:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,274,1486454400"; d="scan'208";a="1115160788"
Received: from platypus.jf.intel.com ([10.54.77.139])
	by orsmga001.jf.intel.com with ESMTP; 04 Apr 2017 02:29:35 -0700
From: yin.thong.choong@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Apr 2017 02:29:11 -0700
Message-Id: <1491298154-68270-6-git-send-email-yin.thong.choong@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1491298154-68270-1-git-send-email-yin.thong.choong@intel.com>
References: <1491298154-68270-1-git-send-email-yin.thong.choong@intel.com>
Subject: [PATCH v2 5/8] libnewt: replace fedorahosted.org SRC_URI with pagure.io source
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
X-List-Received-Date: Tue, 04 Apr 2017 09:29:35 -0000

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


