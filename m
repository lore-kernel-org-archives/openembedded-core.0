Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEC6DC4450A
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 21:59:18 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.128.1784152757423877580
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 14:59:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=GdwS85zC;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20260715215914b913e78b54000207dc-civtiv@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20260715215914b913e78b54000207dc
        for <openembedded-core@lists.openembedded.org>;
        Wed, 15 Jul 2026 23:59:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=8H2LfEfsZev2Bz244Vdd0pGogJOqBtC5RFs73QJva/A=;
 b=GdwS85zC53nZ1N3xf5eVISL7X5sk+2QjrSaogC3eMHMGU4rrFmckfSxEt63gQqXpABX+ts
 0ixLUvEGIkbiqGoO5mAWlD2NFLuP4DbDwf2supBsWRkbkLUt8Cfjr5Mcg3TXOwEQddV4/LHt
 ZYk2JM5W6nZ0knizVqQ/el8tfuyMjURpXy8Y9V6a92pmpOjSAKK5XfAt7ONihhEHRORsTtxL
 ehuoroaWbLvD/uvrA+89k+cnMhSl1+vjF/y9XMI7IWYJqNd7JudCiCRusGeVvYR1FpYpRHeN
 1Aji4S7ZvfTu5Tpbcrcw+zVnYomFjZWFZiZ0EsWJfM3keNPejC18Tcjg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] libxfont: remove recipe
Date: Wed, 15 Jul 2026 23:58:51 +0200
Message-ID: <20260715215851.367313-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 21:59:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241042

From: Peter Marko <peter.marko@siemens.com>

This recipe is obsolete and successor libxfont2 is available.
Nothing in oe-core or meta-openembedded depends on it anymore.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 -
 .../xorg-lib/libxfont_1.5.4.bb                | 25 -------------------
 2 files changed, 26 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 4c6307086c..3fe741520d 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -441,7 +441,6 @@ RECIPE_MAINTAINER:pn-libxdamage = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libxdmcp = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libxext = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libxfixes = "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-libxfont = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libxfont2 = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libxft = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libxi = "Unassigned <unassigned@yoctoproject.org>"
diff --git a/meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb b/meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb
deleted file mode 100644
index 9ec7cc30f5..0000000000
--- a/meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-SUMMARY = "XFont: X Font rasterisation library"
-
-DESCRIPTION = "libXfont provides various services for X servers, most \
-notably font selection and rasterisation (through external libraries \
-such as freetype)."
-
-require xorg-lib-common.inc
-
-LICENSE = "MIT & MIT & BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=a46c8040f2f737bcd0c435feb2ab1c2c"
-
-DEPENDS += "freetype xtrans xorgproto libfontenc zlib"
-PROVIDES = "xfont"
-
-PE = "1"
-
-XORG_PN = "libXfont"
-XORG_EXT = "tar.bz2"
-
-BBCLASSEXTEND = "native"
-
-SRC_URI[sha256sum] = "1a7f7490774c87f2052d146d1e0e64518d32e6848184a18654e8d0bb57883242"
-
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"

