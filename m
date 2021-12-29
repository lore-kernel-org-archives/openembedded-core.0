Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56CB6C433EF
	for <webhook@archiver.kernel.org>; Wed, 29 Dec 2021 01:30:58 +0000 (UTC)
Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web09.45840.1640741457216639302
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Dec 2021 17:30:57 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 192.103.53.11,
 mailfrom: kai.kang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 1BT1Ut9P011608
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Dec 2021 17:30:56 -0800
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 28 Dec 2021 17:30:55 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 28 Dec 2021 17:30:55 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 28 Dec 2021 17:30:54 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <randy.macleod@windriver.com>
Subject: [hardknott][PATCH 0/4] Fix CVEs of xserver-xorg
Date: Wed, 29 Dec 2021 09:30:47 +0800
Message-ID: <20211229013051.36342-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Dec 2021 01:30:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160040

From: Kai Kang <kai.kang@windriver.com>


Kai Kang (4):
  xserver-xorg: fix CVE-2021-4008
  xserver-xorg: fix CVE-2021-4009
  xserver-xorg: fix CVE-2021-4010
  xserver-xorg: fix CVE-2021-4011

 .../xserver-xorg/CVE-2021-4008.patch          | 59 +++++++++++++++++++
 .../xserver-xorg/CVE-2021-4009.patch          | 50 ++++++++++++++++
 .../xserver-xorg/CVE-2021-4010.patch          | 39 ++++++++++++
 .../xserver-xorg/CVE-2021-4011.patch          | 40 +++++++++++++
 .../xorg-xserver/xserver-xorg_1.20.10.bb      |  4 ++
 5 files changed, 192 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2021-4008.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2021-4009.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2021-4010.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2021-4011.patch

-- 
2.17.1


