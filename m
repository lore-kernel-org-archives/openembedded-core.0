Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9EF6B79002
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 10:26:19 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Aug 2018 03:26:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,273,1531810800"; d="scan'208";a="250964419"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 22 Aug 2018 03:25:31 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 185D05802C8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 03:25:30 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 13:27:21 +0300
Message-Id: <1534933645-30369-3-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1534933645-30369-1-git-send-email-maxin.john@intel.com>
References: <1534933645-30369-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 2/6] pkgconf: upgrade 1.4.2 -> 1.5.3
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
X-List-Received-Date: Wed, 22 Aug 2018 10:26:19 -0000

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-devtools/pkgconf/{pkgconf_1.4.2.bb => pkgconf_1.5.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/pkgconf/{pkgconf_1.4.2.bb => pkgconf_1.5.3.bb} (95%)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf_1.4.2.bb b/meta/recipes-devtools/pkgconf/pkgconf_1.5.3.bb
similarity index 95%
rename from meta/recipes-devtools/pkgconf/pkgconf_1.4.2.bb
rename to meta/recipes-devtools/pkgconf/pkgconf_1.5.3.bb
index ea7b666..2021d1a 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_1.4.2.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_1.5.3.bb
@@ -21,8 +21,8 @@ SRC_URI = "\
     file://pkg-config-native.in \
     file://pkg-config-esdk.in \
 "
-SRC_URI[md5sum] = "678d242b4eef1754bba6a58642af10bb"
-SRC_URI[sha256sum] = "bab39371d4ab972be1d539a8b10b6cc21f8eafc97f617102e667e82bd32eb234"
+SRC_URI[md5sum] = "c21743bca14c882c0f282746168a5edc"
+SRC_URI[sha256sum] = "d3468308553c94389dadfd10c4d1067269052b5364276a9d24a643c88485f715"
 
 inherit autotools update-alternatives
 
-- 
2.4.0


