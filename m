Return-Path: <m.otto@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5470C77B7F
	for <webhook@archiver.kernel.org>; Fri, 12 May 2023 10:09:11 +0000 (UTC)
Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
 by mx.groups.io with SMTP id smtpd.web10.20395.1683886143011449535
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 May 2023 03:09:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@phytec.de header.s=a4 header.b=Cfl8YaNu;
 spf=pass (domain: phytec.de, ip: 91.26.50.163, mailfrom: m.otto@phytec.de)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
	q=dns/txt; i=@phytec.de; t=1683886139; x=1686478139;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/SXr85knnt6s2yMunUc1LGfhY35gg5rZvvCaDBOeGVk=;
	b=Cfl8YaNukZqEz+ciLy2Xd7GNvb1Xavu8ArqT3+v+srfPipafArrmgbDVdvPmTLPh
	0jJXPdhNblg/UNib0ieLyCAg1RFwrqm7YdUG70ZAfXa71bJzeje5hDho6kxYc8PA
	w/ex/OC+fDAGZ+iQg/vUiikrowCRoRTgJyE//YCRVvY=;
X-AuditID: ac14000a-917fe70000007ecb-54-645e103bce75
Received: from berlix.phytec.de (Unknown_Domain [172.25.0.12])
	(using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id DF.EE.32459.B301E546; Fri, 12 May 2023 12:08:59 +0200 (CEST)
Received: from augenblix2.phytec.de (172.25.0.11) by Berlix.phytec.de
 (172.25.0.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 12 May
 2023 12:08:59 +0200
From: Maik Otto <m.otto@phytec.de>
To: <openembedded-core@lists.openembedded.org>
Subject: [kirkstone 0/2] openssl: update from 3.0.8 to 3.1.0
Date: Fri, 12 May 2023 12:08:43 +0200
Message-ID: <20230512100845.1243349-1-m.otto@phytec.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.0.11]
X-ClientProxiedBy: Berlix.phytec.de (172.25.0.12) To Berlix.phytec.de
 (172.25.0.12)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphluLIzCtJLcpLzFFi42JZI8nAo2stEJdisGC1kcWdn+/YHRg9zm1c
	wRjAGMVlk5Kak1mWWqRvl8CVceCVSsF+1opVf9tYGxhPsXQxcnJICJhINF3dw9jFyMUhJLCE
	SeLCvZlQzhNGiZNT7zOBVLEJKEk8nLuauYuRg0NEQE/i6j9RkLCwgI3EgS/fGUFsFgFViVlN
	N8DKeQXMJa4v2g61QF5i5qXv7BBxQYmTM5+AxZmB4s1bZzND2BISB1+8ALOFBGQlGh+0scL0
	Tjv3mhnCDpXY+mU70wRG/llIRs1CMmoWklELGJlXMQrlZiZnpxZlZusVZFSWpCbrpaRuYgSF
	mAgD1w7GvjkehxiZOBgPMUpwMCuJ8L5dEp0ixJuSWFmVWpQfX1Sak1p8iFGag0VJnPd+D1Oi
	kEB6YklqdmpqQWoRTJaJg1OqgVGptuNyxSc+7/+XVVQntblUc8yZLj5lSm+J387LJ/58U/x4
	TOX7Bv4pCSxVL/bP7Vo9edOywrALNXNcw6JsVd8npwt2311Z8v9ncEf4g+eeD/Xfu+9Uv7X7
	3rmZs+qmedzwP3i4oqJjc5iorVpOFmf+lI1dyTcbKz8fV5BXCI479DI/0cbu7j0lluKMREMt
	5qLiRADjB+bnHwIAAA==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 May 2023 10:09:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181174

Cherry-pick patches from main and tested on arm32.

Randy MacLeod (1):
  openssl: update from 3.0.8 to 3.1.0

Richard Purdie (1):
  BACKPORT: openssl: Fix reproducibility issue

 .../openssl/openssl/afalg.patch               | 31 -------------------
 .../openssl/openssl/fix_random_labels.patch   | 22 +++++++++++++
 .../{openssl_3.0.8.bb => openssl_3.1.0.bb}    |  4 +--
 3 files changed, 24 insertions(+), 33 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/afalg.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/fix_random_labels.patch
 rename meta/recipes-connectivity/openssl/{openssl_3.0.8.bb => openssl_3.1.0.bb} (98%)

-- 
2.25.1


