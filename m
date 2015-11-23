Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 47B52606D1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 16:11:03 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 23 Nov 2015 08:10:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,337,1444719600"; d="scan'208";a="827234208"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 23 Nov 2015 08:10:48 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id F19216A4083
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 08:09:40 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Nov 2015 18:11:48 +0200
Message-Id: <1448295108-8321-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1448295108-8321-1-git-send-email-maxin.john@intel.com>
References: <1448295108-8321-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 2/2] pkgconfig: upgrade to version 0.29
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
X-List-Received-Date: Mon, 23 Nov 2015 16:11:04 -0000

0.28 -> 0.29

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-devtools/pkgconfig/pkgconfig.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig.inc b/meta/recipes-devtools/pkgconfig/pkgconfig.inc
index 55ab5c4..c2a1523 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig.inc
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig.inc
@@ -12,8 +12,8 @@ DEPENDS = "glib-2.0"
 DEPENDS_class-native = ""
 DEPENDS_class-nativesdk = ""
 
-SRCREV = "40342dd0ead05d457a2a4e692cf865f50033a709"
-PV = "0.28+git${SRCPV}"
+SRCREV = "5914edfe9604abfedd220103cbac382fc4d268bb"
+PV = "0.29+git${SRCPV}"
 SRC_URI = "git://anongit.freedesktop.org/pkg-config"
 
 S = "${WORKDIR}/git"
-- 
2.4.0


