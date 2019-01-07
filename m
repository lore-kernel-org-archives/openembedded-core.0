Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1F9736C149
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jan 2019 14:34:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x07EY0mW001491
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 7 Jan 2019 06:34:10 -0800
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Mon, 7 Jan 2019 06:33:48 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 7 Jan 2019 09:33:44 -0500
Message-ID: <cover.1546871336.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/3] libc-headers and linux-yocto 4.18 version bumps
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
X-List-Received-Date: Mon, 07 Jan 2019 14:34:36 -0000
Content-Type: text/plain

Hi all,

I've been building this configuration for libc-headers since late December,
but didn't want to send the change until I was back in the office to deal with
any fallout.

I've tested this on all arches, as well as with musl-c, nothing popped up in
my builds.

Note: I've included three aarch64 patches identified by Khem to address some build
isues he's been seeing. 

I'm about to go into a version bump cycle for the kernels (5.x, -dev and removal
of 4.18), so I wanted to get these headers into the tree as a standalone change
before that churn hits.

Cheers,

Bruce

The following changes since commit 6a080d90e5001bde30e8a1ade68a02bcd8a29df3:

  kernel.bbclass: Fix incorrect deploying of fitimage.initramfs (2019-01-07 10:54:13 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (2):
  linux-libc-headers: update to v4.19
  linux-yocto/4.18: update to v4.18.22

He Zhe (1):
  linux-libc-headers: Fix build failure with fixed input and output
    files instead of pipe

 meta/conf/distro/include/tcmode-default.inc        |   2 +-
 ...all_headers.sh-Strip-_UAPI-from-if-define.patch |  39 +++
 ...fixed-input-and-output-files-instead-of-.patch} |  22 +-
 ...-ptrace-Fix-SVE_PT_REGS_OFFSET-definition.patch |  41 +++
 ...isentangle-uapi-asm-ptrace.h-from-uapi-as.patch | 287 +++++++++++++++++++++
 ...-headers_4.18.bb => linux-libc-headers_4.19.bb} |   9 +-
 meta/recipes-kernel/linux-libc-headers/x.mbox      | 174 +++++++++++++
 meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb   |   6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb |   8 +-
 meta/recipes-kernel/linux/linux-yocto_4.18.bb      |  20 +-
 10 files changed, 575 insertions(+), 33 deletions(-)
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-kbuild-install_headers.sh-Strip-_UAPI-from-if-define.patch
 rename meta/recipes-kernel/linux-libc-headers/linux-libc-headers/{0001-scripts-Use-fixed-temporary-file-instead-of-pipe-for.patch => 0001-scripts-Use-fixed-input-and-output-files-instead-of-.patch} (83%)
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0002-arm64-sve-ptrace-Fix-SVE_PT_REGS_OFFSET-definition.patch
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0003-arm64-sve-Disentangle-uapi-asm-ptrace.h-from-uapi-as.patch
 rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_4.18.bb => linux-libc-headers_4.19.bb} (54%)
 create mode 100644 meta/recipes-kernel/linux-libc-headers/x.mbox

-- 
2.5.0


