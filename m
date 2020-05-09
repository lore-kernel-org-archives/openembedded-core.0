Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.5949.1589007721806537428
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 May 2020 00:02:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: changqing.li@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 04971Diq030642
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Sat, 9 May 2020 00:01:34 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Sat, 9 May 2020 00:01:23 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <alex.kanavin@gmail.com>
Subject: [V3][PATCH 0/2] update default prefer_color to 2
Date: Sat, 9 May 2020 15:01:19 +0800
Message-ID: <20200509070121.57173-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

* 0001-lib-oe-package_manager-update-default-rpm-config-_pr.patch:
don't set default prefer value, use rpm default value 2

* 0002-rpm-fix-file-conflicts-for-MIPS64-N32.patch
fix file conflicts for neither-preferred conditon

Changqing Li (2):
  lib/oe/package_manager: update default rpm config %_prefer_color
  rpm: fix file conflicts for MIPS64 N32

 meta/lib/oe/package_manager.py                |  2 -
 ....c-fix-file-conflicts-for-MIPS64-N32.patch | 61 +++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_4.15.1.bb       |  1 +
 3 files changed, 62 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm/files/0001-lib-transaction.c-fix-file-conflicts-for-MIPS64-N32.patch

-- 
2.24.1

