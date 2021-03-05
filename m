Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web08.9342.1614933052850343125
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Mar 2021 00:30:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: liezhi.yang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 1258UeFW022741
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 5 Mar 2021 00:30:46 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 5 Mar 2021 00:30:40 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Fri, 5 Mar 2021 00:30:39 -0800
From: "Robert Yang" <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 0/1] rootfs-postcommands.bbclass: Print a warning when login with root is disabled
Date: Fri, 5 Mar 2021 16:49:19 +0800
Message-ID: <cover.1614916931.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit 6db24928d62aeb093a0e6da6619713eaca57a96f:

  recipes-support: Add missing HOMEPAGE and DESCRIPTION for recipes (2021-03-02 20:35:08 +0000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/root
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/root

Robert Yang (1):
  rootfs-postcommands.bbclass: Print a warning when login with root is
    disabled

 meta/classes/rootfs-postcommands.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

-- 
2.17.1

