Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.1795.1592374876040526458
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2020 23:21:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: yanfei.xu@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 05H6KP6C004206
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Tue, 16 Jun 2020 23:20:46 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Tue, 16 Jun 2020
 23:20:30 -0700
From: "Xu, Yanfei" <yanfei.xu@windriver.com>
To: <bruce.ashfield@gmail.com>, <openembedded-core@lists.openembedded.org>
CC: <zhe.he@windriver.com>
Subject: [OE-core] [PATCH 0/1] classes/kernel: Use a copy for kernel*.rpm when fs don't support symlink
Date: Wed, 17 Jun 2020 14:20:27 +0800
Message-ID: <20200617062028.5542-1-yanfei.xu@windriver.com>
X-Mailer: git-send-email 2.18.2
MIME-Version: 1.0
Content-Type: text/plain

From: Yanfei Xu <yanfei.xu@windriver.com>

Some explains about this patch:
1.Why does it copy a ${imageType} before postintall?
We should ensure the rpm package contain a iamge named ${imageType} 
before runing on target.
2.Why should we have this patch?
Cause some arm boards always mount their booting partition on /boot 
and then upgrade kernel packages. But if the /boot filesystems don't 
 support symlink, it will fail.


Yanfei Xu (1):
  classes/kernel: Use a copy for kernel*.rpm when fs don't support
    symlink

 meta/classes/kernel.bbclass | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

-- 
2.18.2

