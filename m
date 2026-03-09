Return-Path: <krkapate@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16A9BEA855B
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 05:31:40 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7817.1773034294527283034
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Mar 2026 22:31:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Ws/l7m4U;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: krkapate@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1445; q=dns/txt;
  s=iport01; t=1773034294; x=1774243894;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cvxrbMKbJ8CyZftWvcJMMlgeZt/Kq0HiSauZv4dI34o=;
  b=Ws/l7m4Uz1qXKI/hSwHr76h0g2iH8UM4wdySfKl68JVCqLIG74bOOkIs
   bJeKLxPS4J4Gl3Dv8mEwXkOxJ9jXrj31G1jE7R3HNSUfSL+Nzoqhuf5SI
   1cze8FO5dChpnMPcKE0kbbGmsll1c6BGSS+4pEeObzjrajAdiCRJj5yTw
   ZLlVlaaWiiE/9j3GW5gsX15BSDhzub3ecEKMzlp0Did6ivpN4ssNM/RXk
   UlgOe5neM+2NFzSidNl0y5QOhDjoJvWUdFAYfEeEb+2a4K9m5tzNFhhiS
   7Uku1FilHc2nuBk2ojGS8MtSQMgfsHJxvV2lSePU3q4ANwCRGo/GteWyS
   Q==;
X-CSE-ConnectionGUID: l+1E7JlyS1Ga2A0H9vMexw==
X-CSE-MsgGUID: Xs2E6w57Swy3+X09bHr80A==
X-IPAS-Result: =?us-ascii?q?A0CVBQCuWq5p/5L/Ja1aglmCSA9xXkNJtGiBfw8BAQEPM?=
 =?us-ascii?q?SAEAQGFB40iAiY0CQ4BAgQBAQEBAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDYZdNgEYAS0wXESDAgGCcwOpf4IsgQGDKAHbLIFNAQsUAYE4hTyIG?=
 =?us-ascii?q?XSCS4IvJxuCDYEVg2iECoEGhXcEgiKBDoF/kSxIgR4DWSwBVRMNCgsHBYFmA?=
 =?us-ascii?q?zUSKhVuMh2BIz4XgQsbBwWFPw+IcHRugRODBAMLGA1IESw3FBsEPm4HjXw+g?=
 =?us-ascii?q?jMBgQ6CKQemHKEOkESVOhozhVulEJkGpFmEaIFoPIFZcIM3CUkZD5hxwnAmM?=
 =?us-ascii?q?gI6AgcLAQEDCZFqgX0BAQ?=
IronPort-Data: A9a23:qlUpj6xhTRp+AB++ywZ6t+dmxyrEfRIJ4+MujC+fZmUNrF6WrkUDm
 2caCGvUOf2CZzamcoolbYi38B8P6JeEztNnHlBkq1hgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4iaT/H3Ygf/hWYvajJMscpvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJEV1ZKBH2OJmOjhh/
 KYxcBBccDWOl/3jldpXSsE07igiBNPgMIVavjRryivUSK53B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cPXWjOX9PYH46tOSyhXDneiFVgFmUvqEwpWPUyWSd1ZCzYIeNJ4HWGpU9ckCwl
 nmc0jrmX04hK83Eigrdo3iMnL+XtHauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBVy4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rAnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:h+ZUXqocq0B3Sm7QBqAJ3SQaV5ogeYIsimQD101hICG9vPb2qy
 nIpoV/6faaslcssR0b9OxoW5PwI080i6QU3WB5B97LN2PbUQCTQr2Kg7GP/9SZIVycygaYvp
 0QFJSXz7bLfDxHsfo=
X-Talos-CUID: =?us-ascii?q?9a23=3AW21kh2s/AWmvgabwa/+wsMrT6IshMSTwk1XUMnT?=
 =?us-ascii?q?hJm8zYeW1GEG19bN7xp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3Ak87YTg46IjjWki5BiKXxHGWFxoxY+P6DVl9Qzq4?=
 =?us-ascii?q?ZqpLHBXQhMReH3GyeF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,109,1770595200"; 
   d="scan'208";a="685055478"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 09 Mar 2026 05:31:18 +0000
Received: from sjc-ads-7641.cisco.com (sjc-ads-7641.cisco.com [10.30.221.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id EB10A18000583;
	Mon,  9 Mar 2026 05:31:17 +0000 (GMT)
Received: by sjc-ads-7641.cisco.com (Postfix, from userid 1821000)
	id 982BBCBDE40; Sun,  8 Mar 2026 22:31:17 -0700 (PDT)
From: krkapate@cisco.com
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core] [PATCH] tcl8: fix tclConfig.sh after UNPACKDIR change
Date: Sun,  8 Mar 2026 22:31:15 -0700
Message-Id: <20260309053115.54176-1-krkapate@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.30.221.177, sjc-ads-7641.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 05:31:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232675

From: Krupal Ka Patel <krkapate@cisco.com>

Adapt the  sed command that edits TCL_SRC_DIR in tclConfig.sh
This is needed so that tk in meta-oe is capable of reading
the required header file

Remove buildpath from TCL_BUILD_STUB_LIB_PATH in tclConfig.sh

Signed-off-by: Krupal Ka Patel <krkapate@cisco.com>
---
 meta/recipes-devtools/tcltk8/tcl8_8.6.17.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/tcltk8/tcl8_8.6.17.bb b/meta/recipes-devtools/tcltk8/tcl8_8.6.17.bb
index b97b20abd5..49eadb2af0 100644
--- a/meta/recipes-devtools/tcltk8/tcl8_8.6.17.bb
+++ b/meta/recipes-devtools/tcltk8/tcl8_8.6.17.bb
@@ -55,7 +55,7 @@ do_install() {
 	ln -sf ./tclsh${VER} ${D}${bindir}/tclsh8
 	ln -sf tclsh8.6 ${D}${bindir}/tclsh${VER}
 	sed -i "s;-L${B};-L${STAGING_LIBDIR};g" tclConfig.sh
-	sed -i "s;'${WORKDIR};'${STAGING_INCDIR};g" tclConfig.sh
+	sed -i "s;'${UNPACKDIR};'${STAGING_INCDIR};g" tclConfig.sh
 	install -d ${D}${bindir_crossscripts}
 	install -m 0755 tclConfig.sh ${D}${bindir_crossscripts}
 	install -m 0755 tclConfig.sh ${D}${libdir}
@@ -111,6 +111,7 @@ tcl_package_preprocess() {
 	       -e "s;-L${STAGING_LIBDIR};-L${libdir};g" \
 	       -e "s;${STAGING_INCDIR};${includedir};g" \
 	       -e "s;--sysroot=${RECIPE_SYSROOT};;g" \
+	       -e "s;${B};${libdir};g" ${PKGD}${libdir}/tclConfig.sh \
 	       ${PKGD}${libdir}/tclConfig.sh
 
 	rm -f ${PKGD}${bindir_crossscripts}/tclConfig.sh
-- 
2.35.6


