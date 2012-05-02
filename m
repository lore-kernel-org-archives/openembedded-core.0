Received: from mail-pz0-f45.google.com ([209.85.210.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SPgir-0000Jb-2O
	for openembedded-core@lists.openembedded.org;
	Wed, 02 May 2012 23:04:29 +0200
Received: by dadv2 with SMTP id v2so493772dad.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 May 2012 13:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=6MWd2tZzG2aJcvycWlJdZtlksvkC+XxcGWDuxlC9lCg=;
	b=SYv0ivd2mqd0UyeLreZN8P7rnbLh+A6M+5UVcX837ZKfy1ou3wJ0wZctu1XzvMg7cj
	AJ8bQdTjdg1TIzhalUxxST0/duOhxTEMa1yzsxzyZbfKiE/gO9YsX6ObIk8O/q9HutIx
	D9aWymBZWJkWBSB3XhetChjr+PYvxtM0WkW4a+6n3uOnZ+EjcP/xMlgrMt7aNIRgSh0L
	TLOLpE6GSRK7tVNEPvxYtzI3VlhT4EsRuisETCzzW8OE/mkx+dZNJaYgYMNAp2x+uN6R
	knA9CAc0YL9RIYOsqmVggeaC9T+1nPuh9iq2FTt73q9Do06/gBvEV3LgEfqmWQAtJD3M
	nBWA==
Received: by 10.68.220.2 with SMTP id ps2mr758053pbc.109.1335992083441;
	Wed, 02 May 2012 13:54:43 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id nt8sm2955141pbb.12.2012.05.02.13.54.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 May 2012 13:54:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 May 2012 13:53:46 -0700
Message-Id: <cover.1335991900.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/7] Misc fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 02 May 2012 21:04:29 -0000

These fixes are independent but feeding into the bigger items
e.g. mips64/sh4 support, supporting xorg-xserver on qemumachines
etc.

The following changes since commit 35b5fb2dd2131d4c7dc6635c14c6e08ea6926457:

  eglibc-package: remove /var (2012-05-01 12:36:18 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib kraj/misc-updates
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/misc-updates

Khem Raj (6):
  unfs-server: Do not use DESTDIR
  xserver-xorg: Fix build on powerpc
  libatomics-ops: Make it build for SH4
  qemu-git: Move to tip of git
  openssl: Fix build for mips64(el)
  uclibc: Return correct endianness for mips64

Yuri Bushmelev (1):
  Enable PARALLEL_MAKE for testing

 meta/recipes-bsp/pciutils/pciutils_3.1.9.bb        |    1 -
 meta/recipes-bsp/pcmciautils/pcmciautils.inc       |    1 -
 meta/recipes-connectivity/iproute2/iproute2.inc    |    1 -
 .../nfs-utils/nfs-utils_1.2.3.bb                   |    1 -
 .../openssl/openssl-1.0.0i/configure-targets.patch |   17 ++---
 .../recipes-connectivity/openssl/openssl_1.0.0i.bb |    2 +-
 meta/recipes-core/eggdbus/eggdbus_0.6.bb           |    1 -
 meta/recipes-core/uclibc/uclibc-config.inc         |    2 +-
 meta/recipes-devtools/autoconf/autoconf_2.68.bb    |    1 -
 .../recipes-devtools/qemu/qemu-git/powerpc_rom.bin |  Bin 0 -> 4096 bytes
 meta/recipes-devtools/qemu/qemu_git.bb             |   18 ++----
 .../unfs-server/unfs-server_2.1+2.2beta47.bb       |    4 +-
 meta/recipes-extended/groff/groff_1.20.1.bb        |    1 -
 meta/recipes-extended/mailx/mailx_12.5.bb          |    1 -
 .../net-tools/net-tools_1.60-23.bb                 |    1 -
 meta/recipes-extended/sat-solver/sat-solver_git.bb |    1 -
 .../fontconfig/fontconfig_2.8.0.bb                 |    1 -
 meta/recipes-graphics/libsdl/libsdl_1.2.15.bb      |    1 -
 meta/recipes-graphics/xcb/libpthread-stubs_0.3.bb  |    1 -
 meta/recipes-graphics/xcb/xcb-util.inc             |    1 -
 .../xorg-xserver/xserver-xorg-1.11.2.inc           |    9 ++-
 .../xserver-xorg-1.11.2/gcc-47-warning.patch       |   33 +++++++++
 .../libatomics-ops/gentoo/sh4-atomic-ops.patch     |   70 ++++++++++++++++++++
 .../pulseaudio/libatomics-ops_1.2.bb               |    6 +-
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    1 -
 meta/recipes-multimedia/speex/speex_1.2rc1.bb      |    1 -
 meta/recipes-support/icu/icu-3.6.inc               |    1 -
 meta/recipes-support/libpcre/libpcre_8.21.bb       |    1 -
 28 files changed, 129 insertions(+), 50 deletions(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu-git/powerpc_rom.bin
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/gcc-47-warning.patch
 create mode 100644 meta/recipes-multimedia/pulseaudio/libatomics-ops/gentoo/sh4-atomic-ops.patch

-- 
1.7.5.4



