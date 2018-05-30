Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 96C4A74E1A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2018 08:54:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w4U8saEW004973
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2018 01:54:37 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Wed, 30 May 2018 01:54:36 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 30 May 2018 17:03:47 +0800
Message-ID: <cover.1527670923.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 00/16 V2] meta: various fixes
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
X-List-Received-Date: Wed, 30 May 2018 08:54:36 -0000
Content-Type: text/plain

* V2:
  Rebase to up-to-date master branch and drop already merged patches.

* V1:
  Initial version

// Robert

The following changes since commit 760103cdaed3e820888d8984ec0b76cfc831d534:

  nativesdk-rpm: Add wrappers for nativesdk support (2018-05-29 21:06:03 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/fix_from_wr
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/fix_from_wr

Catalin Enache (1):
  init-install: add timeout for legacy grub

Chen Qi (1):
  populate_sdk_ext.bbclass: add ESDK_MANIFEST_EXCLUDES

Jackie Huang (3):
  rootfs-postcommands: split ssh_allow_empty_password
  dropbear: add default config file to disable root login
  glibc: re-package for libnss-db

Jian Liu (1):
  lsof: fix LSOF_CCV in version.h

Kai Kang (1):
  toolchain-scripts.bbclass: do not extend dependency if extended
    already

Li Wang (1):
  rpcbind: add option to make user able to use fixed port number

Mark Hatle (1):
  base.bbclass: Add buildcfg multilib values

Ovidiu Panait (1):
  openssl-nativesdk: Fix "can't open config file" warning

Robert Yang (3):
  runqemu-extract-sdk: allow install debugfs on rootfs
  oe/copy_buildsystem.py: add SDK_LAYERS_EXCLUDE_PATTERN
  site/powerpc64-linux: add cvs_cv_func_printf_ptr

Shan Hai (1):
  xinetd: add Init Script Actions to xinetd script

Yadi.hu (1):
  busybox: handle syslog

Yuanjie Huang (1):
  gcc-sanitizers: Fix libtool .la files

 meta/classes/base.bbclass                          |  13 ++-
 meta/classes/image.bbclass                         |   2 +-
 meta/classes/populate_sdk_ext.bbclass              |   6 +
 meta/classes/rootfs-postcommands.bbclass           |  25 +++-
 meta/classes/toolchain-scripts.bbclass             |  13 ++-
 meta/conf/bitbake.conf                             |   2 +-
 meta/lib/oe/copy_buildsystem.py                    |  18 +++
 .../openssl/openssl/environment.d-openssl.sh       |   1 +
 meta/recipes-connectivity/openssl/openssl10.inc    |   7 ++
 .../recipes-connectivity/openssl/openssl_1.0.2o.bb |   5 +
 .../recipes-connectivity/openssl/openssl_1.1.0h.bb |  11 ++
 meta/recipes-core/busybox/busybox.inc              |  14 ++-
 meta/recipes-core/dropbear/dropbear.inc            |   3 +
 .../dropbear/dropbear/dropbear.default             |   2 +
 meta/recipes-core/glibc/glibc-package.inc          |   5 +-
 .../initrdscripts/files/init-install.sh            |   2 +
 meta/recipes-devtools/gcc/gcc-sanitizers.inc       |   2 +
 .../files/Configure-fix-LSOF_CCV-assignment.patch  |  31 +++++
 meta/recipes-extended/lsof/lsof_4.89.bb            |   4 +-
 .../rpcbind_add_option_to_fix_port_number.patch    | 130 +++++++++++++++++++++
 meta/recipes-extended/rpcbind/rpcbind_0.2.4.bb     |   1 +
 meta/recipes-extended/xinetd/xinetd/xinetd.init    |  12 +-
 meta/site/powerpc64-linux                          |   2 +
 scripts/runqemu-extract-sdk                        |   4 +-
 24 files changed, 298 insertions(+), 17 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/environment.d-openssl.sh
 create mode 100644 meta/recipes-core/dropbear/dropbear/dropbear.default
 create mode 100644 meta/recipes-extended/lsof/files/Configure-fix-LSOF_CCV-assignment.patch
 create mode 100644 meta/recipes-extended/rpcbind/rpcbind/rpcbind_add_option_to_fix_port_number.patch

-- 
2.7.4


