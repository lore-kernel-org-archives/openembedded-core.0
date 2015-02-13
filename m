Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DBD5A73420
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 08:59:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t1D8x8iq009464
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 00:59:09 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 13 Feb 2015 00:59:08 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Feb 2015 00:59:07 -0800
Message-ID: <cover.1423817921.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] syslinux: support ext2/3/4 device
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
X-List-Received-Date: Fri, 13 Feb 2015 08:59:15 -0000
Content-Type: text/plain

The following changes since commit 6bf5cbbcac80ee818cc932d69227e70e41ce02d3:

  libtool: Fix option parsing performance regression (2015-02-10 22:36:09 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/syslinux
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/syslinux

Robert Yang (1):
  syslinux: support ext2/3/4 device

 ...01-linux-syslinux-support-ext2-3-4-device.patch |   84 ++++
 ...002-linux-syslinux-implement-open_ext2_fs.patch |  141 +++++++
 ...-linux-syslinux-implement-install_to_ext2.patch |  116 ++++++
 ...inux-add-ext_file_read-and-ext_file_write.patch |   91 +++++
 ...inux-syslinux-implement-handle_adv_on_ext.patch |  127 ++++++
 ...nux-implement-write_to_ext-and-add-syslin.patch |  215 ++++++++++
 ...slinux-implement-ext_construct_sectmap_fs.patch |   84 ++++
 ...r-syslinuxext-implement-syslinux_patch_bo.patch |  427 ++++++++++++++++++++
 ...inux-syslinux-implement-install_bootblock.patch |   50 +++
 meta/recipes-devtools/syslinux/syslinux_6.03.bb    |   11 +-
 10 files changed, 1345 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/syslinux/syslinux/0001-linux-syslinux-support-ext2-3-4-device.patch
 create mode 100644 meta/recipes-devtools/syslinux/syslinux/0002-linux-syslinux-implement-open_ext2_fs.patch
 create mode 100644 meta/recipes-devtools/syslinux/syslinux/0003-linux-syslinux-implement-install_to_ext2.patch
 create mode 100644 meta/recipes-devtools/syslinux/syslinux/0004-linux-syslinux-add-ext_file_read-and-ext_file_write.patch
 create mode 100644 meta/recipes-devtools/syslinux/syslinux/0005-linux-syslinux-implement-handle_adv_on_ext.patch
 create mode 100644 meta/recipes-devtools/syslinux/syslinux/0006-linux-syslinux-implement-write_to_ext-and-add-syslin.patch
 create mode 100644 meta/recipes-devtools/syslinux/syslinux/0007-linux-syslinux-implement-ext_construct_sectmap_fs.patch
 create mode 100644 meta/recipes-devtools/syslinux/syslinux/0008-libinstaller-syslinuxext-implement-syslinux_patch_bo.patch
 create mode 100644 meta/recipes-devtools/syslinux/syslinux/0009-linux-syslinux-implement-install_bootblock.patch

-- 
1.7.9.5


