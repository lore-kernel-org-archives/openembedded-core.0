Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 380117827E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 09:24:44 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v599Oi7T010241
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 9 Jun 2017 02:24:44 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 9 Jun 2017 02:24:44 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Fri, 9 Jun 2017 05:24:40 -0400
Message-ID: <cover.1497000088.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH 0/2] grub/grub-efi: fix conflict & fix librepo typo
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
X-List-Received-Date: Fri, 09 Jun 2017 09:24:45 -0000
Content-Type: text/plain

1. For "grub/grub-efi: fix conflict", the test steps:

vim local.conf
---
MACHINE = "qemux86-64"
IMAGE_INSTALL_append = " grub grub-efi"
---

bitbake core-image-minimal


//Hongxu

The following changes since commit 4a7612c7a12b9a381fb8343ba9586272b889fc15:

  buildhistory: skip tests if GitPython module is missing (2017-06-07 16:00:49 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib hongxu/fix-grub2
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=hongxu/fix-grub2

Hongxu Jia (2):
  grub/grub-efi: fix conflict
  librepo: Fix typo: correct LRO_SSLVERIFYHOST with
    CURLOPT_SSL_VERIFYHOST

 meta/recipes-bsp/grub/grub-efi_2.02.bb             |  7 ++--
 meta/recipes-bsp/grub/grub2.inc                    |  4 ---
 meta/recipes-bsp/grub/grub_2.02.bb                 | 13 +++++--
 ...rrect-LRO_SSLVERIFYHOST-with-CURLOPT_SSL_.patch | 40 ++++++++++++++++++++++
 meta/recipes-devtools/librepo/librepo_git.bb       |  1 +
 5 files changed, 56 insertions(+), 9 deletions(-)
 create mode 100644 meta/recipes-devtools/librepo/librepo/0005-Fix-typo-correct-LRO_SSLVERIFYHOST-with-CURLOPT_SSL_.patch

-- 
2.8.1


