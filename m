Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8B9106DBEF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 07:24:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAM7O1bI011524
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 21 Nov 2013 23:24:01 -0800 (PST)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Thu, 21 Nov 2013 23:24:00 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 22 Nov 2013 15:23:56 +0800
Message-ID: <cover.1385104509.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.8.3
MIME-Version: 1.0
Cc: phcoder@gmail.com, dvhart@linux.intel.com
Subject: [PATCH 0/2 v4] grub-efi: change to generate EFI image in target package
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
X-List-Received-Date: Fri, 22 Nov 2013 07:24:04 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

v4 comments:
no code changes, only added some detail informations explaining whay the change
is necessary and fix the incorrect Upstream-Status statement for the patch.

--
The following changes since commit ee3e2e5ce15a3bf78c7e9d76d7bf68131f2d3ef7:

  librsvg: upgrade to 2.40.0 (2013-11-20 14:03:06 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib jhuang0/d_grub-efi_1122_0
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/d_grub-efi_1122_0

Jackie Huang (2):
  grub-efi: change to generate EFI image in target package
  grub-efi: allow compilation without large model support

 meta/classes/grub-efi.bbclass                      |  4 +-
 ...allow-a-compilation-without-mcmodel-large.patch | 81 ++++++++++++++++++++++
 .../{grub-efi-native_2.00.bb => grub-efi_2.00.bb}  | 44 +++++++-----
 3 files changed, 108 insertions(+), 21 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/grub-efi-allow-a-compilation-without-mcmodel-large.patch
 rename meta/recipes-bsp/grub/{grub-efi-native_2.00.bb => grub-efi_2.00.bb} (77%)

-- 
1.8.3


