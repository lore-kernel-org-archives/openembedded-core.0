Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web08.33199.1631005253294837909
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Sep 2021 02:00:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: liezhi.yang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 18790p9I010168
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 7 Sep 2021 02:00:52 -0700
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 7 Sep 2021 02:00:51 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Tue, 7 Sep 2021 02:00:51 -0700
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 7 Sep 2021 02:00:50 -0700
From: "Robert Yang" <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [hardknott][PATCH 0/1] assimp: Remove it
Date: Tue, 7 Sep 2021 17:31:20 +0800
Message-ID: <cover.1631006990.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit e3a7eaf9fe1420b2525e14f0c0f2936e7818b8a3:

  build-appliance-image: Update to hardknott head revision (2021-09-01 16:28:21 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/assimp-hardknott
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/assimp-hardknott

Robert Yang (1):
  assimp: Remove it

 meta/conf/distro/include/maintainers.inc      |    1 -
 ...MP_LIB_INSTALL_DIR-to-search-library.patch |   68 -
 ...hub.com-assimp-assimp-issues-2733-up.patch | 1664 -----------------
 meta/recipes-graphics/vulkan/assimp_5.0.1.bb  |   23 -
 4 files changed, 1756 deletions(-)
 delete mode 100644 meta/recipes-graphics/vulkan/assimp/0001-Use-ASSIMP_LIB_INSTALL_DIR-to-search-library.patch
 delete mode 100644 meta/recipes-graphics/vulkan/assimp/0001-closes-https-github.com-assimp-assimp-issues-2733-up.patch
 delete mode 100644 meta/recipes-graphics/vulkan/assimp_5.0.1.bb

-- 
2.17.1

