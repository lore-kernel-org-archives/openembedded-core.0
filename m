Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EF5A96D132
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Nov 2013 07:56:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id rA97uMQA026173
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Nov 2013 23:56:22 -0800 (PST)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Fri, 8 Nov 2013 23:56:21 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 9 Nov 2013 15:56:18 +0800
Message-ID: <cover.1383982908.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.8.3
MIME-Version: 1.0
Subject: [v2 PATCH 0/2] grub-efi-native: fix build failure on 32bit host
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
X-List-Received-Date: Sat, 09 Nov 2013 07:56:21 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

v2 comments:
1. make the allow-a-compilation-without-mcmodel-large.patch into a standalone commit
2. remove RDEPENDS for grub-efi-native
3. the reason why I put them in 3 files is:
For grub-efi-native, it needs to determine the target arch and the target STAGING_LIBDIR
(used for do_mkimage to generate the target EFI binary) before inherit native class,
if we make them into one bb and use BBCLASSEXTEND, seems no chance to do that, so
grub-efi-native need to be a standalone bb, and the inc is to avoid duplicating
contents.

--
The following changes since commit eac8cb7cacab7f2fb392128aa5ebc2046ca4a793:

  kbd: Fix stdarg related errors on uclibc (2013-11-08 17:31:17 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib jhuang0/d_grub-efi_1109_0
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/d_grub-efi_1109_0

Jackie Huang (2):
  grub-efi-native: fix build failure on 32bit host
  grub-efi: allow compilation without large model support

 ...allow-a-compilation-without-mcmodel-large.patch | 69 ++++++++++++++++++++++
 meta/recipes-bsp/grub/grub-efi-native_2.00.bb      | 54 ++++-------------
 meta/recipes-bsp/grub/grub-efi.inc                 | 43 ++++++++++++++
 meta/recipes-bsp/grub/grub-efi_2.00.bb             | 11 ++++
 4 files changed, 134 insertions(+), 43 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/grub-efi-allow-a-compilation-without-mcmodel-large.patch
 create mode 100644 meta/recipes-bsp/grub/grub-efi.inc
 create mode 100644 meta/recipes-bsp/grub/grub-efi_2.00.bb

-- 
1.8.3


