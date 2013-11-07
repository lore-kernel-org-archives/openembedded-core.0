Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id ABF8B6D3D5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2013 11:24:52 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id rA7BOsmE006458
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Nov 2013 03:24:54 -0800 (PST)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Thu, 7 Nov 2013 03:24:53 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Nov 2013 19:24:51 +0800
Message-ID: <cover.1383822792.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.8.3
MIME-Version: 1.0
Subject: [PATCH 0/1] grub-efi-native: fix build failure on 32bit host
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
X-List-Received-Date: Thu, 07 Nov 2013 11:24:52 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Tested on the follwoing host:
rhel6.2 32bit, gcc 4.4.6
suse 12.2 32bit, gcc 4.7.1
ubuntu 12.04 64bit, gcc 4.6.3
centOS 5.9 64bit, gcc 4.1.2 (still faill since grub require gcc 4.1.3+)

--
The following changes since commit 1dbd65b4d14319e784a66776c1e9943d0179d3ee:

  toolchain-scripts/meta-environment: Further cleanup code duplication (2013-11-06 11:02:03 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib jhuang0/d_grub-efi_1107_1
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/d_grub-efi_1107_1

Jackie Huang (1):
  grub-efi-native: fix build failure on 32bit host

 ...allow-a-compilation-without-mcmodel-large.patch |   69 ++++++++++++++++++++
 meta/recipes-bsp/grub/grub-efi-native_2.00.bb      |   52 ++-------------
 meta/recipes-bsp/grub/grub-efi.inc                 |   44 +++++++++++++
 meta/recipes-bsp/grub/grub-efi_2.00.bb             |    9 +++
 4 files changed, 130 insertions(+), 44 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/grub-efi-allow-a-compilation-without-mcmodel-large.patch
 create mode 100644 meta/recipes-bsp/grub/grub-efi.inc
 create mode 100644 meta/recipes-bsp/grub/grub-efi_2.00.bb

-- 
1.7.4.1


