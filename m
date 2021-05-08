Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.3814.1620459684471970385
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 May 2021 00:41:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: kai.kang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 1487fKep012787
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 8 May 2021 00:41:20 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Sat, 8 May 2021 00:41:19 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.4 via Frontend Transport; Sat, 8 May 2021 00:41:18 -0700
From: "kai" <kai.kang@windriver.com>
To: <tonyb@cybernetics.com>
CC: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 0/1] Fix grub fails to boot failure
Date: Sat, 8 May 2021 15:41:13 +0800
Message-ID: <20210508074114.1064-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Hi Tony,

I met the same failure with you. I tried with removing '-O2' and it works
for me. So I send it out.

Kai Kang (1):
  grub2.inc: remove '-O2' from CFLAGS

 meta/recipes-bsp/grub/grub2.inc | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.17.1

