Return-Path: <maxin.john@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 8D6B071B8E
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Oct 2016 11:29:19 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 23 Oct 2016 04:29:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,388,1473145200"; d="scan'208";a="776448958"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 23 Oct 2016 04:29:22 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id B70146A4080
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Oct 2016 04:28:47 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Oct 2016 14:29:51 +0300
Message-Id: <1477222197-3698-4-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1477222197-3698-1-git-send-email-maxin.john@intel.com>
References: <1477222197-3698-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 04/10] orc: Upgrade 0.4.25 -> 0.4.26
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
X-List-Received-Date: Sun, 23 Oct 2016 11:29:19 -0000

New upstream bugfix release

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-devtools/orc/{orc_0.4.25.bb => orc_0.4.26.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/orc/{orc_0.4.25.bb => orc_0.4.26.bb} (84%)

diff --git a/meta/recipes-devtools/orc/orc_0.4.25.bb b/meta/recipes-devtools/orc/orc_0.4.26.bb
similarity index 84%
rename from meta/recipes-devtools/orc/orc_0.4.25.bb
rename to meta/recipes-devtools/orc/orc_0.4.26.bb
index 897493a..e47342f 100644
--- a/meta/recipes-devtools/orc/orc_0.4.25.bb
+++ b/meta/recipes-devtools/orc/orc_0.4.26.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1400bd9d09e8af56b9ec982b3d85797e"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/orc/orc-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "8582a28b15f53110c88d8043d9f55bcf"
-SRC_URI[sha256sum] = "c1b1d54a58f26d483f0b3881538984789fe5d5460ab8fab74a1cacbd3d1c53d1"
+SRC_URI[md5sum] = "8e9bef677bae289d3324d81c337a4507"
+SRC_URI[sha256sum] = "7d52fa80ef84988359c3434e1eea302d077a08987abdde6905678ebcad4fa649"
 
 inherit autotools pkgconfig gtk-doc
 
-- 
2.4.0


