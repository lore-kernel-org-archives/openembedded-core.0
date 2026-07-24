Return-Path: <shinucha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C30EFC531C9
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 06:13:33 +0000 (UTC)
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13821.1784873611583501024
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 23:13:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=chkhz7oL;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: shinucha@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2351; q=dns/txt;
  s=iport01; t=1784873611; x=1786083211;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=eQOZWIHy1T7JDeFiQlM5u/t7d1iHNHpPXB8/IYPJxn0=;
  b=chkhz7oLI3HJwmODcrMTZ+mtlUopzolJCx7iSSY04SA/fPEE4pYgUWt+
   zikSUYg7O9VYzBtXzmMdjhrcTfPImg/QDvEVGnT7Nq1YyWg6C0DbKV3Nb
   f2ntZCYkzphqNFCa3MuikF+votVIZPEOdDZRjvaK5ZqAqb/vW3pn+UXHz
   Ej4vSP5uHvHS7NvoTkdaLED/EYms5rY1EIk2b4KUIjYddUCYiJu2ESntO
   beaWxh2uWHJvq3VM1hU/xeZHqXZo45iuyxbAcaG5ASkkHXNhdLyIzvjP2
   cdwTs+G7raSh05Rvgif5oc+tTzoajsyfxe+YwcrAAweLouMQI3vHE5An+
   w==;
X-CSE-ConnectionGUID: L0+3IxQ6Rn+EX5g8YyjVNw==
X-CSE-MsgGUID: apS76fXETf+s4lAfvmzznA==
X-IPAS-Result: =?us-ascii?q?A0C/AgDgAGNq/5D/Ja1aglmCV4FTQkmWSp4egX4PAQEBD?=
 =?us-ascii?q?1EEAQGFBY1hAiY1CA4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFgQ4Th?=
 =?us-ascii?q?lyGXTYBRoEMRIMCgnUCAcFIgiyBAd5FgWYBCxQBBYEzhXGHboVxJxuBSUSEf?=
 =?us-ascii?q?oQKgQaFViIEgxwSgXhQj2ZIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4Xg?=
 =?us-ascii?q?QwbBwWBHYEseYRXIx8DOX+BL3VKdy1pARIXgSaDSQKBNwMLGA1IESw3FBkEP?=
 =?us-ascii?q?m4HjWsjgiAgATwcATQBgihAkwASklOhD4QngWafdRozhASmaJkIglmiAYRpg?=
 =?us-ascii?q?WkBOoFZTSMVgyJTGQ9X3AIkNT0CBwIHDgMLkWiBfgEB?=
IronPort-Data: A9a23:rO+1mq3XjC9VoUTF7/bD5c1wkn2cJEfYwER7XKvMYLTBsI5bp2ACz
 GAWXGvTb/jcZWT3LdF+PtngpkMC65XQn9I2HFBq3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 Lsen+WFYAX7g2EubjpJg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGKBl1ZqwIw7hNByJjx
 aEXeAEcbC6lmLfjqF67YrEEasULNsLnOsYb/3pn1zycValgSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUicC/FMEg9/5JYWh+epgGT0czRwo1OOrq1x6G/WpOB0+OW0a4WEJIXSGK25mG6Rv
 lmZoWrJLy0Ud8fDzROL7He+lOnmyHaTtIU6UefQGuRRqFia2mwSBQBQWUaxpviiz0SkWttZJ
 2Qe/S0yqak0skesS7HVRRyzoHeeslgERsBcEuAS7ACL17ra5BufCmEYTzlHLts8u6ceQiQn0
 FKMld7lCTFj9baSU3+18raPsSj0PjAYK2IHbyIIQQYJpd75r+kOYgnnVN1vFuuxy9byAzy1m
 2/MpykljLJVhskOv0mmwW36b/uXjsChZmYICs//BwpJMisRiFaZWrGV
IronPort-HdrOrdr: A9a23:nx0iZK0VXZuFWUkpAfJ75gqjBJ4kLtp133Aq2lEZdPWaSKOlfq
 eV7ZEmPHDP6Qr5NEtMpTniAtjjfZqjz/5ICOAqVN/INjUO01HHEGgN1+ffKhTbaknDH5ZmpM
 RdWpk7LsHsBl5nisu/ygy5H9E8hOSjysmT9IDjJ7MHd3ASV0mmhD0JbDqmLg==
X-Talos-CUID: 9a23:xGQfT2woIAAGIPd7Go/aBgUwQoN+U23kkk3WYGKIVGk5eayXd3mPrfY=
X-Talos-MUID: 9a23:yO3xwAvtCzqYNuSnNM2njSlZa5lm04mSBgMWzZEvtdeBJz52EmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,182,1779148800"; 
   d="scan'208";a="513796105"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Jul 2026 06:13:30 +0000
Received: from sjc-ads-8046.cisco.com (sjc-ads-8046.cisco.com [171.68.208.84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id 7D72818000214;
	Fri, 24 Jul 2026 06:13:30 +0000 (GMT)
Received: by sjc-ads-8046.cisco.com (Postfix, from userid 1784405)
	id 22262CC160A; Thu, 23 Jul 2026 23:13:30 -0700 (PDT)
From: Shinu Chandran <shinucha@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com, to@cisco.com,
	Shinu Chandran <shinucha@cisco.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core] [scarthgap] [PATCH] vim: add PACKAGECONFIG option for desktop files
Date: Thu, 23 Jul 2026 23:13:24 -0700
Message-Id: <20260724061324.1541029-1-shinucha@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-8046.cisco.com [171.68.208.84];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.68.208.84, sjc-ads-8046.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 06:13:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241900

The recipe currently always inherits mime-xdg and keeps the installed desktop
files. Add a desktop PACKAGECONFIG option so configurations can disable that
desktop integration while preserving the current default behavior.

When desktop support is disabled, remove the generated desktop files during
do_install and avoid inheriting mime-xdg.

Signed-off-by: Shinu Chandran <shinucha@cisco.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 942813bf3f249f80f3154ba8137d172c406bf319)
---
 meta/recipes-support/vim/vim.inc | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index d69a337b4e..f97062aede 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -50,7 +50,7 @@ S = "${WORKDIR}/git"
 
 VIMDIR = "vim${@d.getVar('PV').split('.')[0]}${@d.getVar('PV').split('.')[1]}"
 
-inherit autotools-brokensep update-alternatives mime-xdg pkgconfig
+inherit autotools-brokensep update-alternatives pkgconfig
 
 CLEANBROKEN = "1"
 
@@ -76,9 +76,11 @@ do_configure () {
 PACKAGECONFIG ??= "\
     ${@bb.utils.filter('DISTRO_FEATURES', 'acl selinux', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 gtkgui', '', d)} \
+    desktop \
     nls \
 "
 
+PACKAGECONFIG[desktop] = ""
 PACKAGECONFIG[gtkgui] = "--enable-gui=gtk3,--enable-gui=no,gtk+3"
 PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl,"
 PACKAGECONFIG[x11] = "--with-x,--without-x,xt,"
@@ -88,6 +90,8 @@ PACKAGECONFIG[elfutils] = "--enable-elf-check,,elfutils,"
 PACKAGECONFIG[nls] = "--enable-nls,--disable-nls,,"
 PACKAGECONFIG[sound] = "--enable-canberra,--disable-canberra,canberra,"
 
+inherit_defer ${@bb.utils.contains('PACKAGECONFIG', 'desktop', 'mime-xdg', '', d)}
+
 EXTRA_OECONF = " \
     --disable-gpm \
     --disable-gtktest \
@@ -134,6 +138,11 @@ do_install() {
 	# delete the block.
 	sed -i '/the mouse works just fine/,+4d' ${D}/${datadir}/${BPN}/vimrc
     fi
+
+    if ${@bb.utils.contains('PACKAGECONFIG', 'desktop', 'false', 'true', d)}; then
+        rm -f ${D}${datadir}/applications/vim.desktop
+        rm -f ${D}${datadir}/applications/gvim.desktop
+    fi
 }
 
 PARALLEL_MAKEINST = ""
-- 
2.35.6


