Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 018BD73CF7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Apr 2016 09:22:13 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u379ME9S022081
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Apr 2016 02:22:14 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.210) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 7 Apr 2016 02:22:13 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Apr 2016 17:22:57 +0800
Message-ID: <cover.1460020929.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] grub2: fix do_configure failure when largefile is not in DISTRO_FEATURES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Apr 2016 09:22:18 -0000
Content-Type: text/plain

The following changes since commit 5ebea1114d54120d5ff5d8a6cd148110d0fda23f:

  build-appliance-image: Update to master head revision (2016-04-06 23:54:57 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/grub2-largefile
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/grub2-largefile

Chen Qi (1):
  grub2: fix do_configure failure when largefile is not in
    DISTRO_FEATURES

 ...-configure.ac-support-disabling-largefile.patch | 44 ++++++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc                    |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0001-configure.ac-support-disabling-largefile.patch

-- 
1.9.1


