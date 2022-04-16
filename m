Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F5B6C4167E
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:58 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web09.17415.1650106230758723198
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 03:50:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: liezhi.yang@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 23GAoNoK022994
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Sat, 16 Apr 2022 03:50:23 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 23GAoMf9010032
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 16 Apr 2022 03:50:23 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sat, 16 Apr 2022 03:50:22 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sat, 16 Apr 2022 03:50:22 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Sat, 16 Apr 2022 03:50:22 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <anuj.mittal@intel.com>
Subject: [hardknott][PATCH 0/1] libxshmfence: Correct LICENSE to HPND
Date: Sat, 16 Apr 2022 03:50:21 -0700
Message-ID: <cover.1650106095.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164538

The following changes since commit bcef80623f015c006778edee5cf40dad063e51db:

  wic: Use custom kernel path if provided (2022-03-15 23:00:09 +0800)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/license-hardknott
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/license-hardknott

Richard Purdie (1):
  libxshmfence: Correct LICENSE to HPND

 meta-selftest/recipes-test/recipeutils/recipeutils-test_1.2.bb | 2 +-
 meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb             | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.35.1


