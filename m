Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B5C3A6CDCB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 10:01:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAMA11S8015430
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 22 Nov 2013 02:01:02 -0800 (PST)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Fri, 22 Nov 2013 02:01:00 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 22 Nov 2013 18:00:57 +0800
Message-ID: <cover.1385113330.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.8.3
MIME-Version: 1.0
Cc: phcoder@gmail.com, dvhart@linux.intel.com
Subject: [PATCH 0/2 v5] grub-efi: change to generate EFI image in target package
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
X-List-Received-Date: Fri, 22 Nov 2013 10:01:03 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

v5 comments:
Replace the patch "allow a compilation without mcmodel=large" with the one
provided by Vladimir Serbinenko <phcoder@gmail.com>.

--
The following changes since commit ee3e2e5ce15a3bf78c7e9d76d7bf68131f2d3ef7:

  librsvg: upgrade to 2.40.0 (2013-11-20 14:03:06 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib jhuang0/d_grub-efi_v5_1122_1
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/d_grub-efi_v5_1122_1

Jackie Huang (2):
  grub-efi: change to generate EFI image in target package
  grub-efi: allow compilation without large model support

 meta/classes/grub-efi.bbclass                      |   4 +-
 ...allow-a-compilation-without-mcmodel-large.patch | 141 +++++++++++++++++++++
 .../{grub-efi-native_2.00.bb => grub-efi_2.00.bb}  |  44 ++++---
 3 files changed, 168 insertions(+), 21 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/grub-efi-allow-a-compilation-without-mcmodel-large.patch
 rename meta/recipes-bsp/grub/{grub-efi-native_2.00.bb => grub-efi_2.00.bb} (77%)

-- 
1.8.3


