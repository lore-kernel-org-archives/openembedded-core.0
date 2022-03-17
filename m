Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1332C433EF
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 21:51:46 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web08.2372.1647553904733776850
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 14:51:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: sakib.sajal@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 22HLpgLU021601
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 14:51:43 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 17 Mar 2022 14:51:42 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 17 Mar 2022 14:51:42 -0700
From: Sakib Sajal <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] perl: generate alternative link for streamzip
Date: Thu, 17 Mar 2022 17:51:33 -0400
Message-ID: <20220317215133.35516-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Mar 2022 21:51:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163436

streamzip is also provided by io-compress-perl, so add
an alternative link for streamzip.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/recipes-devtools/perl/perl_5.34.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl/perl_5.34.0.bb b/meta/recipes-devtools/perl/perl_5.34.0.bb
index 8a1db7ed35..73fd2e0a79 100644
--- a/meta/recipes-devtools/perl/perl_5.34.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.34.0.bb
@@ -220,7 +220,7 @@ ALTERNATIVE_PRIORITY = "100"
 
 ALTERNATIVE:${PN}-misc = "corelist cpan enc2xs encguess h2ph h2xs instmodsh json_pp libnetcfg \
                      piconv pl2pm pod2html pod2man pod2text pod2usage podchecker \
-                     prove ptar ptardiff ptargrep shasum splain xsubpp zipdetails"
+                     prove ptar ptardiff ptargrep shasum splain streamzip xsubpp zipdetails"
 ALTERNATIVE_LINK_NAME[corelist] = "${bindir}/corelist"
 ALTERNATIVE_LINK_NAME[cpan] = "${bindir}/cpan"
 ALTERNATIVE_LINK_NAME[enc2xs] = "${bindir}/enc2xs"
@@ -243,6 +243,7 @@ ALTERNATIVE_LINK_NAME[ptardiff] = "${bindir}/ptardiff"
 ALTERNATIVE_LINK_NAME[ptargrep] = "${bindir}/ptargrep"
 ALTERNATIVE_LINK_NAME[shasum] = "${bindir}/shasum"
 ALTERNATIVE_LINK_NAME[splain] = "${bindir}/splain"
+ALTERNATIVE_LINK_NAME[streamzip] = "${bindir}/streamzip"
 ALTERNATIVE_LINK_NAME[xsubpp] = "${bindir}/xsubpp"
 ALTERNATIVE_LINK_NAME[zipdetails] = "${bindir}/zipdetails"
 
-- 
2.33.0


