Return-Path: <kamatam@amazon.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E78C3C54798
	for <webhook@archiver.kernel.org>; Sat,  2 Mar 2024 23:23:28 +0000 (UTC)
Received: from smtp-fw-9102.amazon.com (smtp-fw-9102.amazon.com [207.171.184.29])
 by mx.groups.io with SMTP id smtpd.web10.63233.1709421801186319944
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Mar 2024 15:23:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amazon.com header.s=amazon201209 header.b=RRW5UQn1;
 spf=pass (domain: amazon.com, ip: 207.171.184.29, mailfrom: prvs=784dd95fc=kamatam@amazon.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1709421802; x=1740957802;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=pdKOBxQkeKfoIbf32qYuHPqQbmUUDO5ATHB/GtLtGS4=;
  b=RRW5UQn1TzibOZuw2Esar7QtJTB0guh81+fhhtagcqon5GY4+93zG4WM
   62RkEosuMN+ehRFkr4yb7oiXNnWwL8xmVmsdXJqzLxgyltfduTB95xXB/
   TPuNKifFcqKL1FKt9Bj6ICaO0CduNUDTBdCYJ9SV1hB1DTomKuZEYVVYK
   4=;
X-IronPort-AV: E=Sophos;i="6.06,200,1705363200"; 
   d="scan'208";a="401099075"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.214])
  by smtp-border-fw-9102.sea19.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2024 23:23:21 +0000
Received: from EX19MTAUWA001.ant.amazon.com [10.0.38.20:41388]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.55.3:2525] with esmtp (Farcaster)
 id d3dd55d9-934b-4bc0-bb71-5e75f5ac561e; Sat, 2 Mar 2024 23:23:20 +0000 (UTC)
X-Farcaster-Flow-ID: d3dd55d9-934b-4bc0-bb71-5e75f5ac561e
Received: from EX19D010UWA004.ant.amazon.com (10.13.138.204) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Sat, 2 Mar 2024 23:23:19 +0000
Received: from u0acfa43c8cad58.ant.amazon.com (10.88.187.181) by
 EX19D010UWA004.ant.amazon.com (10.13.138.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Sat, 2 Mar 2024 23:23:19 +0000
From: Munehisa Kamata <kamatam@amazon.com>
To: <steve@sakoman.com>
CC: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][nanbield] cherry-pick request
Date: Sat, 2 Mar 2024 15:23:09 -0800
Message-ID: <20240302232309.3801864-1-kamatam@amazon.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.88.187.181]
X-ClientProxiedBy: EX19D044UWB003.ant.amazon.com (10.13.139.168) To
 EX19D010UWA004.ant.amazon.com (10.13.138.204)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Mar 2024 23:23:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196552

Hi Steve,

Could you please cherry-pick the commit cd2072e5d953 ("kernel.bbclass: Set
pkg-config variables for building modules") from the master for nanbield to
avoid the unexpected rebuild at do_compile_kernelmodules()?


Regards,
Munehisa

