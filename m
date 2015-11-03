Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 562FD76104
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Nov 2015 00:07:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tA307CdC026778
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Nov 2015 16:07:12 -0800
Received: from msp-dhcp23.wrs.com (172.25.34.23) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 2 Nov 2015 16:07:11 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 2 Nov 2015 18:07:06 -0600
Message-ID: <1446509230-116578-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Subject: [PATCH 0/4] [Jethro/master] Fix prelink support
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
X-List-Received-Date: Tue, 03 Nov 2015 00:07:13 -0000
Content-Type: text/plain

Fix prelink support for Jethro/Master.

* Fix glibc defect with it's prelink API
* Fix GCC configuration for PowerPC (32-bit)
* Update to newer prelink release (fix IA32, ARM and MIPS)
* Revert image-prelink being disabled

Changes are availabe in the git repository at:

git://git.yoctoproject.org/poky-contrib mhatle/jethro_prelink


Mark Hatle (4):
  glibc: Fix ld.so / prelink interface for
    ELF_RTYPE_CLASS_EXTERN_PROTECTED_DATA
  gcc: Update default Power GCC settings to use secure-plt
  prelink: Fix various prelink issues on IA32, ARM, and MIPS.
  Revert "local.conf.sample: Disable image-prelink by default"

 meta/conf/local.conf.sample                        |  4 +-
 ...TYPE_CLASS_EXTERN_PROTECTED_DATA-for-prel.patch | 84 ++++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.22.bb              |  1 +
 meta/recipes-devtools/gcc/gcc-common.inc           |  5 ++
 meta/recipes-devtools/gcc/gcc-configure-common.inc |  1 +
 meta/recipes-devtools/gcc/gcc-cross-initial.inc    |  1 +
 meta/recipes-devtools/prelink/prelink_git.bb       |  4 +-
 7 files changed, 95 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-core/glibc/glibc/0028-Clear-ELF_RTYPE_CLASS_EXTERN_PROTECTED_DATA-for-prel.patch

-- 
1.9.3


