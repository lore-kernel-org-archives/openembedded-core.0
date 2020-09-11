Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web12.3981.1599788733274388648
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 18:45:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: kai.kang@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 08B1jVox025860
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 18:45:32 -0700 (PDT)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Thu, 10 Sep 2020 18:45:31 -0700
From: "kai" <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2 0/1] dhcpcd: 9.1.4 -> 9.2.0
Date: Fri, 11 Sep 2020 09:45:28 +0800
Message-ID: <20200911014529.5996-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

v2:
* forgot to add the systemd service files

Kai Kang (1):
  dhcpcd: 9.1.4 -> 9.2.0

 .../{dhcpcd_9.1.4.bb => dhcpcd_9.2.0.bb}      | 19 +++++++++++++++----
 .../dhcpcd/files/dhcpcd.service               | 10 ++++++++++
 .../dhcpcd/files/dhcpcd@.service              | 15 +++++++++++++++
 3 files changed, 40 insertions(+), 4 deletions(-)
 rename meta/recipes-connectivity/dhcpcd/{dhcpcd_9.1.4.bb => dhcpcd_9.2.0.bb} (61%)
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/dhcpcd.service
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/dhcpcd@.service

-- 
2.17.1

