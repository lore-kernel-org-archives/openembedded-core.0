Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web11.3650.1588905035738286298
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2020 19:30:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: changqing.li@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 0482UYX2006797
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 7 May 2020 19:30:35 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Thu, 7 May 2020 19:30:34 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [V2][PATCH 0/2] update default rpm prefer_color
Date: Fri, 8 May 2020 10:30:30 +0800
Message-ID: <1588905032-44016-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

* 0001-lib-oe-package_manager-update-default-rpm-config-_pr.patch
update prefer_color to rpm default value 2

* 0002-rpm-fix-file-conflicts-for-MIPS64-N32.patch
handle 3 ways conflicts when prefer_color is updated to 2

Changqing Li (2):
  lib/oe/package_manager: update default rpm config %_prefer_color
  rpm: fix file conflicts for MIPS64 N32

 meta/lib/oe/package_manager.py                     |  2 -
 ...ction.c-fix-file-conflicts-for-MIPS64-N32.patch | 58 ++++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_4.14.2.1.bb          |  1 +
 3 files changed, 59 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm/files/0001-lib-transaction.c-fix-file-conflicts-for-MIPS64-N32.patch

-- 
2.7.4

