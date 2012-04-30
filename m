Received: from mail-pz0-f50.google.com ([209.85.210.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SOuq6-0002aW-8M
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Apr 2012 19:56:46 +0200
Received: by dakh32 with SMTP id h32so4082870dak.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2012 10:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=JBYSGw+Gpr6UOS6US8Fvob1gBL4+0BhHRhQf3pyYC6s=;
	b=N42uEJJ/iySTkpkw1pY+ZwLO4/ZJBUtYal/ciVaDdMo99pbat9Rw1pAVYTrb2ZcU6i
	rKeAWEjzZOKTqHqGR3i1xhHUHwtIEBWk1GnlSGvjoIJ+TdbRs5ZnP54qt6aRQBQHSZ6Y
	TenGK8ZkE3qbcdrZWO4uXOg0mIKmlSXB4wj//JcPk+/2VBxAQUfDGe1PUPxcDtTcJhzo
	FfaYi2enTc4EEFEkCTv+Bb7h9Cem8Je5t8vCol9LacS7ac5+nZdIVgQ55KOZmF7uB9Ia
	2E/dbCrRw1m6pS1K32sOre9y49jnXxxofKL5DMDTqWH1fgykz4syjGGYoevMxlKjDI03
	dJFQ==
Received: by 10.68.216.98 with SMTP id op2mr50158833pbc.93.1335808023011;
	Mon, 30 Apr 2012 10:47:03 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id pj1sm16636150pbc.44.2012.04.30.10.47.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Apr 2012 10:47:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Apr 2012 10:46:07 -0700
Message-Id: <cover.1335807802.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 00/10] uclibc updates
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
X-List-Received-Date: Mon, 30 Apr 2012 17:56:46 -0000

This patchset updates uclibc git and 0.9.33 recipes to latest git commits
Some recipes needed fixing for new posix_spawn feature in uclibc_git
fixed some recipes to let them build on SH4 architecture

The following changes since commit b8dc9182ed8959ce5a6aa285c3c7f78df2432ac3:

  qt-4.8.1: Fix compile failures on qemux86 (2012-04-30 10:42:07 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib kraj/uclibc-update
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/uclibc-update

Khem Raj (10):
  uclibc-git: Update to latest git tip
  uclibc-0.9.33: Update to tip of 0.9.33 branch
  glib-2.0: Dont disable iconv for uclibc
  gettext,m4: Add -lrt to LDFLAGS for uclibc
  musicbrainz: Specify libpthread on cmdline for uclibc
  gdb: Dont need lttng-ust for SH4
  gcc-cross.inc: Fix cross testing script
  pcmanfm: Add sh3/sh4 to supported hosts
  gdb: Add support for building gdb target for SH4
  busybox: Pass HOST_CC_ARCH through CONFIG_EXTRA_CFLAGS

 meta/recipes-core/busybox/busybox.inc              |    2 +-
 meta/recipes-core/busybox/busybox_1.19.4.bb        |    2 +-
 meta/recipes-core/gettext/gettext_0.18.1.1.bb      |    6 +-
 meta/recipes-core/glib-2.0/glib-2.0/no-iconv.patch |  106 --
 meta/recipes-core/glib-2.0/glib-2.0_2.30.3.bb      |    5 +-
 meta/recipes-core/uclibc/uclibc_0.9.33.bb          |    4 +-
 meta/recipes-core/uclibc/uclibc_git.bb             |    4 +-
 meta/recipes-devtools/gcc/gcc-cross.inc            |    5 +-
 meta/recipes-devtools/gdb/gdb-common.inc           |    3 +-
 meta/recipes-devtools/gdb/gdb.inc                  |    1 +
 .../gdb/gdb/renesas-sh-native-support.patch        | 1389 ++++++++++++++++++++
 meta/recipes-devtools/m4/m4-1.4.16.inc             |    2 +-
 meta/recipes-devtools/m4/m4-1.4.9.inc              |    2 +-
 meta/recipes-devtools/m4/m4.inc                    |    2 +-
 .../musicbrainz/libmusicbrainz_3.0.3.bb            |    4 +-
 meta/recipes-sato/pcmanfm/pcmanfm_0.9.10.bb        |    2 +-
 16 files changed, 1412 insertions(+), 127 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/no-iconv.patch
 create mode 100644 meta/recipes-devtools/gdb/gdb/renesas-sh-native-support.patch

-- 
1.7.5.4



