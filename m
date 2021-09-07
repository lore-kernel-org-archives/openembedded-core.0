Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web08.33111.1631004396067498620
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Sep 2021 01:46:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: liezhi.yang@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 1878kYWS013458
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 7 Sep 2021 01:46:35 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 1878kYMU014124
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 7 Sep 2021 01:46:34 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 7 Sep 2021 01:46:34 -0700
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 7 Sep 2021 01:46:33 -0700
From: "Robert Yang" <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 0/1] assimp: Remove it
Date: Tue, 7 Sep 2021 17:17:03 +0800
Message-ID: <cover.1631006167.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit 70de1dbb660461bdf0613494f53ec4c78738ae2a:

  vim: Add packageconfig for sound notification support (2021-09-06 09:49:13 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/assimp
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/assimp

Robert Yang (1):
  assimp: Remove it

 meta/conf/distro/include/maintainers.inc      |    1 -
 ...hared-lib-from-_IMPORT_CHECK_TARGETS.patch |   32 -
 ...hub.com-assimp-assimp-issues-2733-up.patch | 1664 -----------------
 .../use-GNUInstallDirs-where-possible.patch   |  257 ---
 meta/recipes-graphics/vulkan/assimp_5.0.1.bb  |   26 -
 5 files changed, 1980 deletions(-)
 delete mode 100644 meta/recipes-graphics/vulkan/assimp/0001-assimp-remove-shared-lib-from-_IMPORT_CHECK_TARGETS.patch
 delete mode 100644 meta/recipes-graphics/vulkan/assimp/0001-closes-https-github.com-assimp-assimp-issues-2733-up.patch
 delete mode 100644 meta/recipes-graphics/vulkan/assimp/use-GNUInstallDirs-where-possible.patch
 delete mode 100644 meta/recipes-graphics/vulkan/assimp_5.0.1.bb

-- 
2.17.1

