Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.9596.1600854416121304826
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2020 02:46:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: yi.zhao@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 08N9jm5i009276
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Wed, 23 Sep 2020 02:46:08 -0700
Received: from localhost (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 23 Sep
 2020 02:45:51 -0700
From: "Yi Zhao" <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <ross@burtonini.com>, <ricardo@foundries.io>
Subject: [PATCH 0/4 V2] dhcpcd fixes
Date: Wed, 23 Sep 2020 17:45:44 +0800
Message-ID: <20200923094548.13448-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [128.224.162.174]
Content-Type: text/plain


Yi Zhao (4):
  dhcpcd: pass --dbdir to EXTRA_OECONF to set database directory
  dhcpcd: set --runstatedir to /run
  dhcpcd: add dhcpcd user to support priviledge separation
  dhcpcd: disable service to start on boot automatically

 meta/recipes-connectivity/dhcpcd/dhcpcd_9.2.0.bb   | 14 ++++++++++++--
 .../dhcpcd/files/dhcpcd@.service                   |  2 +-
 2 files changed, 13 insertions(+), 3 deletions(-)

-- 
2.17.1

