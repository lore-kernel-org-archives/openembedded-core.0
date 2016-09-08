Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4C7CC62132
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Sep 2016 15:47:09 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga102.fm.intel.com with ESMTP; 08 Sep 2016 08:47:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,301,1470726000"; 
   d="scan'208";a="6169101"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 08 Sep 2016 08:47:10 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 91FAB6A4006
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Sep 2016 08:46:48 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Sep 2016 18:46:53 +0300
Message-Id: <1473349614-5497-3-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1473349614-5497-1-git-send-email-maxin.john@intel.com>
References: <1473349614-5497-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 3/4] kconfig-frontends: inherit pkgconfig
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
X-List-Received-Date: Thu, 08 Sep 2016 15:47:10 -0000

Instead of build depending on pkgconfig-native, inherit pkgconfig
class which does the same thing.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.12.0.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.12.0.0.bb b/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.12.0.0.bb
index 48a2f93..804186d 100644
--- a/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.12.0.0.bb
+++ b/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.12.0.0.bb
@@ -11,14 +11,14 @@ HOMEPAGE = "http://ymorin.is-a-geek.org/projects/kconfig-frontends"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9b8cf60ff39767ff04b671fca8302408"
 SECTION = "devel"
-DEPENDS += "ncurses flex bison gperf-native pkgconfig-native"
+DEPENDS += "ncurses flex bison gperf-native"
 RDEPENDS_${PN} += "python bash"
 SRC_URI = "http://ymorin.is-a-geek.org/download/${BPN}/${BP}.tar.xz"
 
 SRC_URI[md5sum] = "b939280dcc83f8feabd87a1d5f9b00c2"
 SRC_URI[sha256sum] = "ea2615a62c74bea6ce3b38402f00c7513858f307f6ba7aa9fdbf0bbc12bcf407"
 
-inherit autotools
+inherit autotools pkgconfig
 do_configure_prepend () {
 	mkdir -p scripts/.autostuff/m4
 }
-- 
2.4.0


