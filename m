Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 3D346770AD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Oct 2015 01:43:36 +0000 (UTC)
Received: by payp3 with SMTP id p3so22762107pay.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Oct 2015 18:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=X55qpdDkcL1OC/BD72cKMm5/+CwNz9KFk3W6X3XDnlo=;
	b=K52pN8tUxXhNfYPW7s3Gf0oA0MrLLCc3n3RPPCky2ahMlKjBd24wuVtdYrzGrXGKvv
	H1Yk4VTwl2jjxy6mkbppuXgTqx1OHD2l4RhPbUv5i0WKzYTzu/RjejxBTXxs88wjAEGf
	PBxPnZLoBDrXK1z2f2aHRQn1OuTMuhIm61YwE/Th8PcPsIba26aBEoueVu481dVI5wXQ
	bb42W/Y/OBvBrQt1o0khUGT5LJH4b72fbe0R3e/qA+/5paZjLmeZ/lfuz3IEy0NJtPU0
	KXZetSpN2RytXCl8HWecbmD7FJ5Dq65dlPq7Zlq+nXuzeUUdgNgI7CmXMj/xKUmT2Up9
	3ddQ==
X-Received: by 10.66.144.165 with SMTP id sn5mr7220319pab.122.1444873416768;
	Wed, 14 Oct 2015 18:43:36 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	z6sm11928971pbt.51.2015.10.14.18.43.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 14 Oct 2015 18:43:35 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Oct 2015 18:43:12 -0700
Message-Id: <1444873403-21093-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 00/11] busybox fixes and cleanups + update to 1.24
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
X-List-Received-Date: Thu, 15 Oct 2015 01:43:37 -0000

In anticipation of master re-opening for commits, here's a re-send
of the previous busybox fixes and cleanups patches, plus new patches
to update to 1.24.

Andre McCurdy (11):
  busybox_git: Enable getopt applet
  busybox.inc: don't export EXTRA_OEMAKE
  busybox: move common EXTRA_OEMAKE options into busybox.inc
  busybox.inc: explicitly include CC=${CC} on make command line
  busybox.inc: don't set .config CROSS_COMPILER_PREFIX
  busybox.inc: fix CONFIG_EXTRA_CFLAGS configmangle
  busybox.inc: remove MAKEFLAGS over-ride from EXTRA_OEMAKE
  busybox: move common do_install_ptest() into busybox.inc
  busybox: re-order defconfig to align with busybox 1.24.0
  busybox: update 1.23.2 -> 1.24.0 (and git recipe to latest trunk)
  busybox: disable support for mounting NFS file systems on Linux < 2.6.23

 meta/recipes-core/busybox/busybox.inc              |  20 +-
 .../busybox/0001-Switch-to-POSIX-utmpx-API.patch   | 388 ---------------------
 .../busybox/busybox/0001-chown-fix-help-text.patch |  34 --
 ...ix-double-free-fatal-error-in-INET_sprint.patch |  67 ----
 meta/recipes-core/busybox/busybox/defconfig        |  63 ++--
 meta/recipes-core/busybox/busybox_1.23.2.bb        |  53 ---
 meta/recipes-core/busybox/busybox_1.24.0.bb        |  42 +++
 meta/recipes-core/busybox/busybox_git.bb           |  17 +-
 8 files changed, 101 insertions(+), 583 deletions(-)
 delete mode 100644 meta/recipes-core/busybox/busybox/0001-Switch-to-POSIX-utmpx-API.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/0001-chown-fix-help-text.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/0001-ifconfig-fix-double-free-fatal-error-in-INET_sprint.patch
 delete mode 100644 meta/recipes-core/busybox/busybox_1.23.2.bb
 create mode 100644 meta/recipes-core/busybox/busybox_1.24.0.bb

-- 
1.9.1


