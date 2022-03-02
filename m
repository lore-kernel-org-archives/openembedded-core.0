Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 446C4C433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 07:13:01 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web10.4944.1646205180412409699
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 23:13:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: liezhi.yang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 2227Cwls016424
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 1 Mar 2022 23:12:59 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 1 Mar 2022 23:12:58 -0800
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 1 Mar 2022 23:12:58 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 0/3] 3 fixes for deterministic build
Date: Tue, 1 Mar 2022 23:12:55 -0800
Message-ID: <cover.1646204967.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Mar 2022 07:13:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162591

The following changes since commit 7f7eb82ce47ede6ec6f50cbcb56cbfbe10e8d20c:

  insane.bbclass: Update insane.bbclass to work on FIPS enabled hosts (2022-03-01 23:44:29 +0000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/deterministic
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/deterministic

Robert Yang (3):
  quilt: Disable external sendmail for deterministic build
  perl: Makefile.PL: Fix _PATH_LOG for deterministic build
  cups: Add --with-dbusdir to EXTRA_OECONF for deterministic build

 ...Makefile.PL-Fix-_PATH_LOG-for-determ.patch | 34 +++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.34.0.bb     |  1 +
 meta/recipes-devtools/quilt/quilt.inc         |  3 +-
 meta/recipes-extended/cups/cups.inc           |  1 +
 4 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/perl/files/0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch

-- 
2.31.1


