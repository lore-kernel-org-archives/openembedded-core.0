Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 72325786D3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jan 2018 13:50:47 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Jan 2018 05:50:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,407,1511856000"; d="scan'208";a="21965685"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 24 Jan 2018 05:50:49 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 95057580385
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jan 2018 05:50:48 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Jan 2018 15:52:33 +0200
Message-Id: <1516801953-19706-3-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1516801953-19706-1-git-send-email-maxin.john@intel.com>
References: <1516801953-19706-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 3/3] screen: upgrade to version 4.6.2
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
X-List-Received-Date: Wed, 24 Jan 2018 13:50:48 -0000

4.6.1 -> 4.6.2

As suggested by AUH

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-extended/screen/{screen_4.6.1.bb => screen_4.6.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/screen/{screen_4.6.1.bb => screen_4.6.2.bb} (93%)

diff --git a/meta/recipes-extended/screen/screen_4.6.1.bb b/meta/recipes-extended/screen/screen_4.6.2.bb
similarity index 93%
rename from meta/recipes-extended/screen/screen_4.6.1.bb
rename to meta/recipes-extended/screen/screen_4.6.2.bb
index bcd83a2..7a33c31 100644
--- a/meta/recipes-extended/screen/screen_4.6.1.bb
+++ b/meta/recipes-extended/screen/screen_4.6.2.bb
@@ -26,8 +26,8 @@ SRC_URI = "${GNU_MIRROR}/screen/screen-${PV}.tar.gz \
            file://0001-configure.ac-fix-configure-failed-while-build-dir-ha.patch \
           "
 
-SRC_URI[md5sum] = "132c893aabfaf2020074790215c8cacd"
-SRC_URI[sha256sum] = "aba9af66cb626155d6abce4703f45cce0e30a5114a368bd6387c966cbbbb7c64"
+SRC_URI[md5sum] = "a0f529d3333b128dfaa324d978ba73a8"
+SRC_URI[sha256sum] = "1b6922520e6a0ce5e28768d620b0f640a6631397f95ccb043b70b91bb503fa3a"
 
 inherit autotools texinfo
 
-- 
2.4.0


