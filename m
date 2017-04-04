Return-Path: <yin.thong.choong@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5F8346010D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Apr 2017 09:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491298177; x=1522834177;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=0UZ4yKKbrik8XlAaNXkseUd5/leJRUrxITRHtBrl20o=;
	b=oUhwxNP8lYNG7+4m3s/XN3D9II9Z4kLQ03W1GP+dMLdKacLht2T0KXra
	9o0C39e+nd1NB2mMKwqBu6O6zl5aAQ==;
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Apr 2017 02:29:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,274,1486454400"; d="scan'208";a="1115160795"
Received: from platypus.jf.intel.com ([10.54.77.139])
	by orsmga001.jf.intel.com with ESMTP; 04 Apr 2017 02:29:35 -0700
From: yin.thong.choong@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Apr 2017 02:29:13 -0700
Message-Id: <1491298154-68270-8-git-send-email-yin.thong.choong@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1491298154-68270-1-git-send-email-yin.thong.choong@intel.com>
References: <1491298154-68270-1-git-send-email-yin.thong.choong@intel.com>
Subject: [PATCH v2 7/8] chkconfig: replace fedorahosted.org SRC_URI with github.com source
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

fedorahosted.org was retired on March 1st, 2017. This is to update
the SRC_URI to point to github.com.

[YOCTO #11226]

Signed-off-by: Choong YinThong <yin.thong.choong@intel.com>
---
 meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb b/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
index e839026..2f1f6c0 100644
--- a/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
+++ b/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
@@ -6,7 +6,7 @@ of the drudgery of manually editing the symbolic links."
 
 RECIPE_NO_UPDATE_REASON = "Version 1.5 requires selinux"
 
-HOMEPAGE = "http://fedorahosted.org/releases/c/h/chkconfig"
+HOMEPAGE = "https://github.com/fedora-sysv"
 
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5574c6965ae5f583e55880e397fbb018"
@@ -16,12 +16,16 @@ PROVIDES += "virtual/update-alternatives"
 
 PR = "r7"
 
-SRC_URI = "http://fedorahosted.org/releases/c/h/chkconfig/${BPN}-${PV}.tar.bz2 \
+S = "${WORKDIR}/${BPN}-${BPN}-${PV}"
+
+UPSTREAM_CHECK_URI = "https://github.com/fedora-sysv/${BPN}/releases"
+
+SRC_URI = "https://github.com/fedora-sysv/chkconfig/archive/chkconfig-${PV}.tar.gz \
            file://replace_caddr_t.patch \
           "
 
-SRC_URI[md5sum] = "c2039ca67f2749fe0c06ef7c6f8ee246"
-SRC_URI[sha256sum] = "18b497d25b2cada955c72810e45fcad8280d105f17cf45e2970f18271211de68"
+SRC_URI[md5sum] = "3f51ac38a234be5278b3a2d9705eda5e"
+SRC_URI[sha256sum] = "bf1e81f0d7cc999b536c9fe7877abf584a4082fd03c9d2597b6f090966579b40"
 
 inherit gettext
 
-- 
2.7.4


