Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web11.4814.1592567256136673535
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2020 04:47:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: yanfei.xu@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 05JBlTom027524
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Fri, 19 Jun 2020 04:47:30 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Fri, 19 Jun 2020
 04:47:29 -0700
From: "Xu, Yanfei" <yanfei.xu@windriver.com>
To: <bruce.ashfield@gmail.com>, <richard.purdie@linuxfoundation.org>,
        <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH 0/1 v3] classes/kernel: Use a copy of image for kernel*.rpm if fs doesn't support symlinks
Date: Fri, 19 Jun 2020 19:47:26 +0800
Message-ID: <20200619114727.40142-1-yanfei.xu@windriver.com>
X-Mailer: git-send-email 2.18.2
MIME-Version: 1.0
Content-Type: text/plain

From: Yanfei Xu <yanfei.xu@windriver.com>

v1->v2->v3:
1.Put the symlink creation at postinstall script instead of build time. 
2.Add a postremove script for removing image created in postinstall.

Yanfei Xu (1):
  classes/kernel: Use a copy of image for kernel*.rpm if fs doesn't
    support symlinks

 meta/classes/kernel.bbclass | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

-- 
2.18.2

