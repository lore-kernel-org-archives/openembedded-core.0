Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.13146.1594897793400992302
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2020 04:09:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: liezhi.yang@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 06GB9VCv027691
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2020 04:09:42 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Thu, 16 Jul 2020
 04:09:21 -0700
From: "Robert Yang" <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 0/1] openssl: openssl-bin requires openssl-conf to run
Date: Thu, 16 Jul 2020 04:09:20 -0700
Message-ID: <cover.1594897729.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit dbce6baec68d7658453b8c44159e1d1fef746151:

  oeqa/utils/qemurunner: Fix missing pid file tracebacks (2020-07-14 21:41:36 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/openssl
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/openssl

Robert Yang (1):
  openssl: openssl-bin requires openssl-conf to run

 meta/recipes-connectivity/openssl/openssl_1.1.1g.bb | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.17.1

