Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F189EC54E41
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 07:33:30 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.8417.1709105608599023021
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 23:33:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=lITUQj7p;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709105609; x=1740641609;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Coseh2aWYRaEsaBTZC3sPm7rFhchZeil8d+zXsu3Ats=;
  b=lITUQj7pK/6WoggYxy2l24sSyMgNlEKhOujbE5w90erp9sDRGSyUDIm4
   CzqnZQ51c9C1glcOlTS7jN20g4Vlv0cz/5V1D+Vb0/CSZ0mc6WcCqDPue
   vcNSOp+XqRVRb6rphRe5a/6ND9ZtL0bn6eVOmbAaCvyfplMe3IQW81/El
   3fw//+u3xqJpAuu5pJ1gnyRalWaFutIrMl5x4d9fQuF12aL/AcmchRYg9
   2XxBrZw0u0vf9URnz7zd9AV8FGTi6Z2krKSZeA/BW/bytAETHYc+4zYwY
   niyr+kYzkwB5itBrRebVnGrckj7ZR8iayY0RRn/GCk7lAP1oy5Hx92pvw
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="139129160"
X-IronPort-AV: E=Sophos;i="6.06,190,1705330800"; 
   d="scan'208";a="139129160"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 16:33:28 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 593DE12E238
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:26 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 87C7BFD85A
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:25 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 21C062008FF86
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:25 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BF10B1A006A;
	Wed, 28 Feb 2024 15:33:24 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 18/48] liburi-perl: upgrade 5.25 -> 5.27
Date: Wed, 28 Feb 2024 15:32:25 +0800
Message-Id: <1709105575-24259-18-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
References: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28218.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28218.005
X-TMASE-Result: 10--1.954700-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqxafpkpfGLEmr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74ClR2Q+0Fuebkz5vzLEGq8DKsm
	10TThDCKxfbhqGxLk+4Ay6p60ZV62To3UJuRLIoTdB/CxWTRRu+rAZ8KTspSzeFU76KbK3/jSl4
	oT99HKseXXpfPEPdflrLeK1yLua+G0Xj3D/mY/JqROq/gg/L8N77e171wHLUx8xSBrLWKaH/9tn
	7JmSPJXiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 07:33:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196342

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Add missing NAME section to POD of URI::geo
- Add URI::geo

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../perl/{liburi-perl_5.25.bb => liburi-perl_5.27.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/perl/{liburi-perl_5.25.bb => liburi-perl_5.27.bb} (94%)

diff --git a/meta/recipes-devtools/perl/liburi-perl_5.25.bb b/meta/recipes-devtools/perl/liburi-perl_5.27.bb
similarity index 94%
rename from meta/recipes-devtools/perl/liburi-perl_5.25.bb
rename to meta/recipes-devtools/perl/liburi-perl_5.27.bb
index 0305955524..e5db7b3cfe 100644
--- a/meta/recipes-devtools/perl/liburi-perl_5.25.bb
+++ b/meta/recipes-devtools/perl/liburi-perl_5.27.bb
@@ -12,7 +12,7 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/O/OA/OALDERS/URI-${PV}.tar.gz \
            file://0001-Skip-TODO-test-cases-that-fail.patch \
            "
 
-SRC_URI[sha256sum] = "ef61941da09fff2503cea3692c4f2fc48c0e4442486e2a28345cb32d44d0d271"
+SRC_URI[sha256sum] = "11962d8a8a8496906e5d34774affc235a1c95c112d390c0b4171f3e91e9e2a97"
 
 S = "${WORKDIR}/URI-${PV}"
 
-- 
2.34.1


