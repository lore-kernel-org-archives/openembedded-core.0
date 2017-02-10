Return-Path: <gthomas@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id B87006079F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 06:05:09 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 4A1EA68A01C; Fri, 10 Feb 2017 06:05:08 +0000 (GMT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=ALL_TRUSTED,BAYES_05,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id E6A0068A019;
	Fri, 10 Feb 2017 06:05:05 +0000 (GMT)
Received: by zeus.mlbassoc.com (Postfix, from userid 1000)
	id 819C7674025C; Fri, 10 Feb 2017 07:05:05 +0100 (CET)
From: Gary Thomas <gary@mlbassoc.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Feb 2017 07:05:03 +0100
Message-Id: <1486706703-22189-1-git-send-email-gary@mlbassoc.com>
X-Mailer: git-send-email 2.7.4
Cc: Gary Thomas <gary@mlbassoc.com>
Subject: [PATCH] usbutils: allow udev-hwdb to be optional
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
X-List-Received-Date: Fri, 10 Feb 2017 06:05:10 -0000

Use RRECOMMENDS for the udev hardware data base, to allow for this
to be suppressed if desired (saves many MB - useful for smaller systems)

Signed-off-by: Gary Thomas <gary@mlbassoc.com>
---
 meta/recipes-bsp/usbutils/usbutils_008.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/usbutils/usbutils_008.bb b/meta/recipes-bsp/usbutils/usbutils_008.bb
index cb79360..d3c5bd5 100644
--- a/meta/recipes-bsp/usbutils/usbutils_008.bb
+++ b/meta/recipes-bsp/usbutils/usbutils_008.bb
@@ -21,5 +21,5 @@ inherit autotools gettext pkgconfig distro_features_check
 
 FILES_${PN}-dev += "${datadir}/pkgconfig"
 
-RDEPENDS_${PN} = "udev-hwdb"
+RRECOMMENDS_${PN} = "udev-hwdb"
 RDEPENDS_${PN}-ptest = "libboost-system libboost-thread"
-- 
2.7.4


