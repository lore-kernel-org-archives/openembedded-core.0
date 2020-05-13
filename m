Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.2704.1589363374905069157
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2020 02:49:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: changqing.li@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 04D9nCOt003744
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2020 02:49:23 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Wed, 13 May 2020 02:48:49 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 0/6] support persistent /var/tmp
Date: Wed, 13 May 2020 17:48:41 +0800
Message-ID: <20200513094847.14326-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Changqing Li (6):
  bitbake.conf: rename VOLATILE_LOG_DIR to VOLATILE_DIR
  fs-perms-persistent.txt: renamed from fs-perms-persistent-log.txt
  base-files: respect VOLATILE_DIR
  initscripts: respect VOLATILE_DIR
  systemd: respect VOLATILE_DIR
  eudev: respect VOLATILE_DIR

 meta/conf/bitbake.conf                                 | 10 ++++++----
 ...erms-persistent-log.txt => fs-perms-persistent.txt} |  2 --
 meta/recipes-core/base-files/base-files_3.0.14.bb      |  7 ++++---
 .../recipes-core/initscripts/initscripts-1.0/volatiles |  3 ---
 meta/recipes-core/initscripts/initscripts_1.0.bb       |  8 +++++++-
 meta/recipes-core/systemd/systemd_245.5.bb             |  4 +++-
 meta/recipes-core/udev/eudev_3.2.9.bb                  |  3 +++
 7 files changed, 23 insertions(+), 14 deletions(-)
 rename meta/files/{fs-perms-persistent-log.txt => fs-perms-persistent.txt} (95%)

-- 
2.17.1

