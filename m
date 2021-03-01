Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web09.12983.1614607971519493272
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Mar 2021 06:12:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: kai.kang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 121EBp8A017714
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 1 Mar 2021 06:11:56 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 1 Mar 2021 06:11:50 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Mon, 1 Mar 2021 06:11:49 -0800
From: "kai" <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>, <kergoth@gmail.com>
CC: <openembedded-core@lists.openembedded.org>, <poky@lists.yoctoproject.org>
Subject: [PATCH v3 0/2] toolchain-scripts.bbclass: customize prompt
Date: Mon, 1 Mar 2021 22:02:27 +0800
Message-ID: <20210301140227.30972-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

v3:
* when SDK_PS1 is empty or not set, no change to PS1 of SDK 
* not set SDK_PS1 by default


Kai Kang (2):
  toolchain-scripts.bbclass: customize prompt string for SDKs
  local.conf.sample.extended: sample value for SDk_PS1

 meta-poky/conf/local.conf.sample.extended | 5 +++++
 meta/classes/toolchain-scripts.bbclass    | 3 +++
 2 files changed, 8 insertions(+)

-- 
2.17.1

