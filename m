Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.5437.1631253514364196506
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Sep 2021 22:58:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: kai.kang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 18A5wV8g031713
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 9 Sep 2021 22:58:31 -0700
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 9 Sep 2021 22:58:30 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Thu, 9 Sep 2021 22:58:30 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 9 Sep 2021 22:58:29 -0700
From: "kai" <kai.kang@windriver.com>
To: <anuj.mittal@intel.com>
CC: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v4 0/1] perl: fix CVE-2021-36770
Date: Fri, 10 Sep 2021 13:58:27 +0800
Message-ID: <20210910055828.38821-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

v4:
* drop the section of code which updates version

Kai Kang (1):
  perl: fix CVE-2021-36770

 .../perl/files/CVE-2021-36770.patch           | 40 +++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.34.0.bb     |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2021-36770.patch

-- 
2.17.1

