Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 89D2860124
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Nov 2015 08:47:22 +0000 (UTC)
Received: by padhx2 with SMTP id hx2so108436220pad.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Nov 2015 00:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=MlXkIH0e32JBW7SA+TqL2raZvKE+UsRDLfyjNZUUOSc=;
	b=nGMy+gsJj4PnSZ1fapOsmaw0w8HK1v/hh0xM0887ms6S3t4ESku2wX+Ez1B8/bo3+A
	IriElo+0OrkoW6JA4JkUPDvK03xWAL4izz8Lva/FL36q4Su04kLJh8uVyhANNxY1J0O2
	aSGd6/MZ43kVjCE0zcPZ1EkLvcfo4zNV5m6BJnFmNSlGoRtXa2a2q+h2YbElqiBv0yAc
	Z1VNvKf1U5Y79KbMmcqokCPu6xvqbdE9KKqF/rEQAe+L6vfzbOYj9YQFkyIRLg+FIQ/S
	0YCj1j2GexqgGPfgdjn2IkOUWyFGLsc/nAqFBiWX9xndGlyBX0siQgah29PslCjNKfKG
	3Pxg==
X-Received: by 10.68.179.69 with SMTP id de5mr15577133pbc.113.1446799641953;
	Fri, 06 Nov 2015 00:47:21 -0800 (PST)
Received: from e6520.gateway.sonic.net
	(173-228-90-44.dsl.dynamic.fusionbroadband.com. [173.228.90.44])
	by smtp.gmail.com with ESMTPSA id
	yz3sm12533923pbb.37.2015.11.06.00.47.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 06 Nov 2015 00:47:20 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Nov 2015 00:47:00 -0800
Message-Id: <1446799631-7037-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 00/11] busybox fixes and cleanups + update 1.23.2 -> 1.24.1
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
X-List-Received-Date: Fri, 06 Nov 2015 08:47:22 -0000

Andre McCurdy (11):
  busybox_git: Enable getopt applet
  busybox.inc: don't export EXTRA_OEMAKE
  busybox: move EXTRA_OEMAKE etc into busybox.inc
  busybox.inc: explicitly include CC=${CC} on make command line
  busybox.inc: don't set .config CROSS_COMPILER_PREFIX
  busybox.inc: fix CONFIG_EXTRA_CFLAGS configmangle
  busybox.inc: remove MAKEFLAGS over-ride from EXTRA_OEMAKE
  busybox: re-order defconfig to align with busybox 1.24.1
  busybox: update 1.23.2 -> 1.24.1
  busybox: disable support for mounting NFS file systems on Linux < 2.6.23
  busybox: enable resize applet

 meta/recipes-core/busybox/busybox.inc              |  20 +-
 .../busybox/0001-Switch-to-POSIX-utmpx-API.patch   | 388 ---------------------
 .../busybox/busybox/0001-chown-fix-help-text.patch |  34 --
 ...ix-double-free-fatal-error-in-INET_sprint.patch |  67 ----
 meta/recipes-core/busybox/busybox/defconfig        |  63 ++--
 meta/recipes-core/busybox/busybox/resize.cfg       |   2 +
 meta/recipes-core/busybox/busybox_1.23.2.bb        |  53 ---
 meta/recipes-core/busybox/busybox_1.24.1.bb        |  43 +++
 meta/recipes-core/busybox/busybox_git.bb           |  18 +-
 9 files changed, 105 insertions(+), 583 deletions(-)
 delete mode 100644 meta/recipes-core/busybox/busybox/0001-Switch-to-POSIX-utmpx-API.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/0001-chown-fix-help-text.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/0001-ifconfig-fix-double-free-fatal-error-in-INET_sprint.patch
 create mode 100644 meta/recipes-core/busybox/busybox/resize.cfg
 delete mode 100644 meta/recipes-core/busybox/busybox_1.23.2.bb
 create mode 100644 meta/recipes-core/busybox/busybox_1.24.1.bb

-- 
1.9.1


