Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B26786C73F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 01:40:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAK1eC7o025327
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2013 17:40:12 -0800 (PST)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Tue, 19 Nov 2013 17:40:11 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Nov 2013 09:40:08 +0800
Message-ID: <cover.1384854113.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.8.3
MIME-Version: 1.0
Subject: [PATCH 0/2 v3] grub-efi: change to generate EFI image in target package
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
X-List-Received-Date: Wed, 20 Nov 2013 01:40:12 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

v3 comments:
Drop the original solution to generate and deploy EFI image in the -native
packae and change to do that in taret package, and the -native one only
provides the grub-mkimage binary. No need 3 files anymore, make them in
one bb.

--
The following changes since commit 0eb947454e1c92467283e6f1adeca67c7c57698b:

  python: Fix ptest not working problems (2013-11-18 13:04:13 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib jhuang0/d_grub-efi_1119_0
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/d_grub-efi_1119_0

Jackie Huang (2):
  grub-efi: change to generate EFI image in target package
  grub-efi: allow compilation without large model support

 meta/classes/grub-efi.bbclass                      |  4 +-
 ...allow-a-compilation-without-mcmodel-large.patch | 69 ++++++++++++++++++++++
 .../{grub-efi-native_2.00.bb => grub-efi_2.00.bb}  | 44 ++++++++------
 3 files changed, 96 insertions(+), 21 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/grub-efi-allow-a-compilation-without-mcmodel-large.patch
 rename meta/recipes-bsp/grub/{grub-efi-native_2.00.bb => grub-efi_2.00.bb} (77%)

-- 
1.8.3


