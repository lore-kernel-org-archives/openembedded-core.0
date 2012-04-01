Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <darren@apps.dvhart.com>) id 1SEFDw-0007dv-Mn
	for openembedded-core@lists.openembedded.org;
	Sun, 01 Apr 2012 09:29:16 +0200
Received: by pbcum15 with SMTP id um15so2868544pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Apr 2012 00:20:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=TPJZaoaE4WlVtp3ptE7cH3ZjpfgPB6JrOBQpvJ54Txk=;
	b=bv0dnH6ODtbG8TCtU4XPaoHwewoZzFum7Y6nML4BKcvifheRMaj0yALF15KWYVZ1EG
	ij2jLsw4W4c1wg4Cg2s4VM/fcddBDPdPmJkTwzCMsLiG1mmMeuS4mmd8bpIw8ABNKE2I
	FECr3alCApVlI92t6xj/lyyAteRGH4OMETTo6hQp4YzLEh2gyIrE956EV8dlRvvaRyzZ
	wsJwBaLtdIQjxse7kYeanZ4ZIC+CJ5Bi19kM0eSb2DxZnOtAf6i0AZi/8+mYxU9xHbcV
	niVMHfs1445pfG0sNfTgdS3hFxAMa95yunl+nKyH0ZPVv3xBTk0I4SgLC94VV6R6nymZ
	9N6w==
Received: by 10.68.189.198 with SMTP id gk6mr10748713pbc.114.1333264808994;
	Sun, 01 Apr 2012 00:20:08 -0700 (PDT)
Received: from localhost (static-50-53-99-101.bvtn.or.frontiernet.net.
	[50.53.99.101])
	by mx.google.com with ESMTPS id q8sm11336311pbi.1.2012.04.01.00.20.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 01 Apr 2012 00:20:07 -0700 (PDT)
Sender: Darren Hart <darren@apps.dvhart.com>
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Sun,  1 Apr 2012 00:19:57 -0700
Message-Id: <cover.1333264701.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
X-Gm-Message-State: ALoCoQk2vX7KQFbsjkNuJKllxXS3qO+xNdAAPmqr3WqKdOx6+CBs+cGXuAd/pA7Jqlp9Zwgs41QL
Subject: [PATCH 0/1] tiny: Update linux-yocto-tiny to 3.2
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
X-List-Received-Date: Sun, 01 Apr 2012 07:29:16 -0000

The following changes since commit c97f7f4e4ecd6c431712059c34ebc17b68b055ae:

  cross-canadian.bbclass: fix rpath for sdk executables (2012-03-31 18:00:36 +0100)

are available in the git repository at:
  git://git.infradead.org/users/dvhart/oe-core.git dvhart/tiny
  http://git.infradead.org/users/dvhart/oe-core.git/shortlog/refs/heads/dvhart/tiny

Darren Hart (1):
  tiny: Update linux-yocto-tiny to 3.2

 meta/recipes-kernel/linux/linux-yocto-tiny/ata.cfg |    9 -
 .../recipes-kernel/linux/linux-yocto-tiny/core.cfg |   19 -
 .../linux/linux-yocto-tiny/debug.cfg               |    5 -
 .../linux/linux-yocto-tiny/devtmpfs.cfg            |    6 -
 .../linux/linux-yocto-tiny/e1000.cfg               |    7 -
 .../recipes-kernel/linux/linux-yocto-tiny/ext2.cfg |    1 -
 .../recipes-kernel/linux/linux-yocto-tiny/ext3.cfg |    2 -
 .../recipes-kernel/linux/linux-yocto-tiny/lzma.cfg |    3 -
 meta/recipes-kernel/linux/linux-yocto-tiny/net.cfg |   26 -
 .../linux/linux-yocto-tiny/qemux86/defconfig       |  613 --------------------
 .../linux/linux-yocto-tiny/ramfs.cfg               |    6 -
 .../linux/linux-yocto-tiny/rtc-pc.cfg              |   13 -
 .../linux/linux-yocto-tiny/serial.cfg              |    7 -
 meta/recipes-kernel/linux/linux-yocto-tiny/smp.cfg |    7 -
 meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb  |   39 --
 meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb  |   25 +
 16 files changed, 25 insertions(+), 763 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/ata.cfg
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/core.cfg
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/debug.cfg
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/devtmpfs.cfg
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/e1000.cfg
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/ext2.cfg
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/ext3.cfg
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/lzma.cfg
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/net.cfg
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/qemux86/defconfig
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/ramfs.cfg
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/rtc-pc.cfg
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/serial.cfg
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/smp.cfg
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb

-- 
1.7.5.4



