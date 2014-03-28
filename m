Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 047086EAFA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 09:42:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2S9gwNF004521
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 28 Mar 2014 02:42:58 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Fri, 28 Mar 2014 02:42:57 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Mar 2014 17:42:39 +0800
Message-ID: <cover.1395996041.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 0/6][Part I] wr-misc patches
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
X-List-Received-Date: Fri, 28 Mar 2014 09:43:01 -0000
Content-Type: text/plain

WindRiver patches was sent for YP compliance.

There are total 22 patches, and separate them into 4 parts,
each part is individual which means there is no dependence
between them.

//Hongxu

The following changes since commit 8c3eb5ee4582b6f6d489549290937657f37fc19e:

  packagegroup-toolset-native: Update after ocf-linux -> cryptodev-linux change (2014-03-27 19:53:30 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/wr-misc-patches
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/wr-misc-patches

Baogen Shang (1):
  openssl: Fix pod2man des.pod error on Ubuntu 12.04

Jeff Polk (1):
  qemu: Add addition environment space to boot loader qemu-system-mips

Jiang Lu (1):
  Qemu:Arm:versatilepb: Add memory size checking

Robert Yang (1):
  kmod: fix O_CLOEXEC not supported on old kernel

Ting Liu (1):
  wayland-native: disable unused macro checks to fix build issue on
    Centos5.x

Yue Tao (1):
  initscripts: Avoid restarting rpcbind daemon

 .../openssl-1.0.1e/openssl-fix-des.pod-error.patch | 19 ++++++++
 .../recipes-connectivity/openssl/openssl_1.0.1e.bb |  1 +
 .../initscripts/initscripts-1.0/mountnfs.sh        |  9 ++--
 ...-Arm-versatilepb-Add-memory-size-checking.patch | 40 +++++++++++++++++
 .../qemu/files/qemu-enlarge-env-entry-size.patch   | 31 ++++++++++++++
 meta/recipes-devtools/qemu/qemu_1.7.0.bb           |  4 +-
 ...disable-macro-checks-not-used-for-scanner.patch | 50 ++++++++++++++++++++++
 meta/recipes-graphics/wayland/wayland_1.4.0.bb     |  4 +-
 meta/recipes-kernel/kmod/kmod.inc                  |  1 +
 meta/recipes-kernel/kmod/kmod/fix-O_CLOEXEC.patch  | 38 ++++++++++++++++
 10 files changed, 192 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-fix-des.pod-error.patch
 create mode 100644 meta/recipes-devtools/qemu/files/Qemu-Arm-versatilepb-Add-memory-size-checking.patch
 create mode 100644 meta/recipes-devtools/qemu/files/qemu-enlarge-env-entry-size.patch
 create mode 100644 meta/recipes-graphics/wayland/wayland/disable-macro-checks-not-used-for-scanner.patch
 create mode 100644 meta/recipes-kernel/kmod/kmod/fix-O_CLOEXEC.patch

-- 
1.8.1.2


