Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CC61C88E71
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 08:14:25 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15484.1769415260886275550
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jan 2026 00:14:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DMrb/sR8;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769415261; x=1800951261;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YmfyJ9GgAdtdyo61YuPft7mjRTIHsMeN+ZzforxcDaA=;
  b=DMrb/sR8XqiFUTYR/fKt4FkDBYtwD2KaflPeullsjamaRRHUcscS+b5I
   RbBxL7O2ah9/HYechr8nFIHrl5qVCwqAyVNAA0L7xTv8Qd3K4ZcM2Vpg1
   n2/nreKkiNWJwcaQ537j5KagIkjwDoXu6p384NxLfBTn5BYuMCzn0nEiN
   sNQYZj/uUKOeVUc/KCWJst8qsx5kCpn5pRV6fvoutrdwRKMIefCv9beN2
   +vbepvYUg3yRYTpnoesDYgZWLrhYr2HyKoPWz4gtu/xjHVnxeAtM/GjrO
   xTejHMSe/eFH0ks/4b6iE/hQy6HIsH307SVXnXaTa3BFo21a0VVaRYFTv
   A==;
X-CSE-ConnectionGUID: r6zUPTyIRpmnIIsE2K+lKw==
X-CSE-MsgGUID: ASogEOgzTZ+h51HSzEDQFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="227090372"
X-IronPort-AV: E=Sophos;i="6.21,254,1763391600"; 
   d="scan'208";a="227090372"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 17:14:19 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id E0E47146A
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 08:14:18 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 929F310003BF
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 08:14:18 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 52F8E4059A1
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 08:14:16 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] libpam: upgrade 1.7.1 -> 1.7.2
Date: Mon, 26 Jan 2026 16:14:09 +0800
Message-ID: <20260126081409.4554-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 08:14:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229971

1.Changelog:
  https://github.com/linux-pam/linux-pam/releases/tag/v1.7.2

2.Fix do_package QA Issue as default vendordir has been changed
  Refer to this commit https://github.com/linux-pam/linux-pam/commit/aea30822e2fa6f87faf2541da140f69dfdfee728

  ERROR: libpam-1.7.2-r0 do_package: QA Issue: libpam: Files/directories were installed but not shipped in any package:
  /usr/share/pam
  /usr/share/pam/environment
  /usr/share/pam/security
  /usr/share/pam/security/namespace.conf
  /usr/share/pam/security/group.conf
  /usr/share/pam/security/namespace.init
  /usr/share/pam/security/faillock.conf
  /usr/share/pam/security/access.conf
  /usr/share/pam/security/pam_env.conf
  /usr/share/pam/security/pwhistory.conf
  /usr/share/pam/security/time.conf
  /usr/share/pam/security/limits.conf

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../pam/{libpam_1.7.1.bb => libpam_1.7.2.bb}                | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/pam/{libpam_1.7.1.bb => libpam_1.7.2.bb} (97%)

diff --git a/meta/recipes-extended/pam/libpam_1.7.1.bb b/meta/recipes-extended/pam/libpam_1.7.2.bb
similarity index 97%
rename from meta/recipes-extended/pam/libpam_1.7.1.bb
rename to meta/recipes-extended/pam/libpam_1.7.2.bb
index 8fb67983ee..0bd9f5d844 100644
--- a/meta/recipes-extended/pam/libpam_1.7.1.bb
+++ b/meta/recipes-extended/pam/libpam_1.7.2.bb
@@ -24,7 +24,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/Linux-PAM-${PV}.tar.xz \
            file://pam-volatiles.conf \
            "
 
-SRC_URI[sha256sum] = "21dbcec6e01dd578f14789eac9024a18941e6f2702a05cf91b28c232eeb26ab0"
+SRC_URI[sha256sum] = "3d86b6383fb5fd9eb9578d2cd47d92801191f4bf3f9bc61419bfefc8aa1e531a"
 
 DEPENDS = "bison-native flex-native libxml2-native virtual/crypt"
 
@@ -47,7 +47,7 @@ FILES:${PN} = " \
     ${nonarch_libdir}/tmpfiles.d/*.conf \
 "
 FILES:${PN}-dev += "${base_libdir}/security/*.la ${libdir}/*.la ${libdir}/lib*${SOLIBSDEV}"
-FILES:${PN}-runtime = "${sysconfdir} ${sbindir} ${nonarch_libdir}/systemd/system"
+FILES:${PN}-runtime = "${sysconfdir} ${sbindir} ${nonarch_libdir}/systemd/system  ${datadir}/pam" 
 FILES:${PN}-xtests = "${datadir}/Linux-PAM/xtests"
 
 # libpam installs /etc/environment for use with the pam_env plugin. Make sure it is
@@ -165,7 +165,7 @@ CONFFILES:${PN}-runtime += "${sysconfdir}/pam.d/common-auth"
 CONFFILES:${PN}-runtime += "${sysconfdir}/pam.d/common-password"
 CONFFILES:${PN}-runtime += "${sysconfdir}/pam.d/common-session-noninteractive"
 CONFFILES:${PN}-runtime += "${sysconfdir}/pam.d/common-account"
-CONFFILES:${PN}-runtime += "${sysconfdir}/security/limits.conf"
+CONFFILES:${PN}-runtime += "${datadir}/pam/security/limits.conf"
 
 GITHUB_BASE_URI = "https://github.com/linux-pam/linux-pam/releases"
 
-- 
2.43.0


