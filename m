Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B849FC52D76
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 01:10:31 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.46587.1722215420520138463
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jul 2024 18:10:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TSQK+7GB;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722215421; x=1753751421;
  h=from:to:cc:subject:date:message-id;
  bh=S/St7tJMRa+Ibw487xAyEIi2vjnlBsIeuvr8P7mcrU4=;
  b=TSQK+7GBULeu+whlPtsXLjUAorkaRUGccplt9Yhcx07PeridZ6TNtdnP
   a0R0h0yPfgov96cn0V6TEsZ8sEBSCSMyI9SHKyc2XXyXJIUePrA/PZPJj
   ogJh5NL7sjjVfXkVsRZjzR4IqYoHCjSuYtzLTJ8kmtULcbtR3iEsMZfGX
   0VnlOzgxmuF9fAj3d5RgYHdR7tDx8e8IWlhkNmlT1Z2eeCrW9gmMHesaw
   SF1OqwbQGglA142bJoie3cn4oOMafqX0VwD8yvbdgu+ypJkXarqFhy6jB
   oU5gfS3mFblCQnBtWBIBuiKODXbyQS2AT96QptFogXXD6wwjg8G+kZhZd
   A==;
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="148298370"
X-IronPort-AV: E=Sophos;i="6.09,245,1716217200"; 
   d="scan'208";a="148298370"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 10:10:19 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 122BECA1F4
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:16 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 41C65D5B5A
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:15 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id ADB4E82D52
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:14 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 613071A0002;
	Mon, 29 Jul 2024 09:10:14 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 01/33] asciidoc: upgrade 10.2.0 -> 10.2.1
Date: Mon, 29 Jul 2024 09:09:36 +0800
Message-Id: <1722215408-27541-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28560.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28560.003
X-TMASE-Result: 10-2.122100-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yYL5ja7E+OhyTfK5j0EZbyv5V4X/65Dwb/o1
	c6H9DbojyZOSZAP0UD4Myw6hMrtYUO1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQ32S
	61JcPB8c3lq3YEgY6Jjrmb2Z4b9ZLkfRhdidsajMURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO0X9r
	pBZuBDbcijvPBgU7xBKmA1VO1dtdmTrI00Lyi6o8w8sB3cFAxs6+H8Q0AvwtVOSbvWEQDDsEf1A
	QPBjR3fkkW3ugHQ8ZwrpqzaOQNzd/IMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 01:10:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202575

From: Wang Mingyu <wangmy@fujitsu.com>

.Bug fixes
- Fix deprecation warning on escaping table separators

.Miscellaneous
- Include manpage source files to sdist archive
- Fix setting up debian backports in Dockerfile

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../asciidoc/{asciidoc_10.2.0.bb => asciidoc_10.2.1.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/asciidoc/{asciidoc_10.2.0.bb => asciidoc_10.2.1.bb} (94%)

diff --git a/meta/recipes-extended/asciidoc/asciidoc_10.2.0.bb b/meta/recipes-extended/asciidoc/asciidoc_10.2.1.bb
similarity index 94%
rename from meta/recipes-extended/asciidoc/asciidoc_10.2.0.bb
rename to meta/recipes-extended/asciidoc/asciidoc_10.2.1.bb
index e112eb513d..1065acdb8e 100644
--- a/meta/recipes-extended/asciidoc/asciidoc_10.2.0.bb
+++ b/meta/recipes-extended/asciidoc/asciidoc_10.2.1.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=aaee33adce0fc7cc40fee23f82f7f101 \
                     "
 
 SRC_URI = "git://github.com/asciidoc/asciidoc-py;protocol=https;branch=main"
-SRCREV = "545b79b8d7dae70d12bf0657359bdd36de0c5c26"
+SRCREV = "21e33efe96ba9a51d99d1150691dae750afd6ed1"
 
 DEPENDS = "libxml2-native libxslt-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
 
-- 
2.34.1


