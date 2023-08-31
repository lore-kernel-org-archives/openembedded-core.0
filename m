Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB6DDC6FA8F
	for <webhook@archiver.kernel.org>; Thu, 31 Aug 2023 02:32:52 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.8410.1693449164425773137
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 19:32:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="131427029"
X-IronPort-AV: E=Sophos;i="6.02,215,1688396400"; 
   d="scan'208";a="131427029"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 11:32:42 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id ADECFE852E
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:32:37 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id EB6BED3F25
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:32:36 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 712926BEF6;
	Thu, 31 Aug 2023 11:32:36 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libconvert-asn1-perl: upgrade 0.33 -> 0.34
Date: Thu, 31 Aug 2023 10:32:25 +0800
Message-Id: <1693449145-27694-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27846.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27846.004
X-TMASE-Result: 10-2.586500-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrWq/snXbxpCA2/UwdvFG5Is8L
	GTNFqWKa4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2ToUdFbHYUawpE0
	UftPg/VMcfwGQIbwrkOKmKbaPnYD+5UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO3x/F
	0UMEoTu47JiEubuRHuwgJ4mnyA9ytjdZ0KapxrovBDsQm0XyB4TU15vFRyqEadhzMk/JnrPe7Tw
	gLnpfwepVxn8LO+WlcMT5+PnZPZTPIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 02:32:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186935

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
  * Fixes: #47 2nd - Debug output using print instead of printf
  * Fixes #47 Debug output using print instead of printf
  * ASN1.pod: fix minor typo

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ibconvert-asn1-perl_0.33.bb => libconvert-asn1-perl_0.34.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/perl/{libconvert-asn1-perl_0.33.bb => libconvert-asn1-perl_0.34.bb} (91%)

diff --git a/meta/recipes-extended/perl/libconvert-asn1-perl_0.33.bb b/meta/recipes-extended/perl/libconvert-asn1-perl_0.34.bb
similarity index 91%
rename from meta/recipes-extended/perl/libconvert-asn1-perl_0.33.bb
rename to meta/recipes-extended/perl/libconvert-asn1-perl_0.34.bb
index d82692c033..6e9f881773 100644
--- a/meta/recipes-extended/perl/libconvert-asn1-perl_0.33.bb
+++ b/meta/recipes-extended/perl/libconvert-asn1-perl_0.34.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://README.md;beginline=91;endline=97;md5=ceff7fd286eb6d8
 
 SRC_URI = "https://cpan.metacpan.org/authors/id/T/TI/TIMLEGGE/Convert-ASN1-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "1fdf004520c79e3a244cf9688616293516c11793d746c761f367496eb3d06076"
+SRC_URI[sha256sum] = "a628d7c9d390568fb76359975fa03f626ce57f10dc17980e8e3587d7713e4ee7"
 
 S = "${WORKDIR}/Convert-ASN1-${PV}"
 
-- 
2.34.1


