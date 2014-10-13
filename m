Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B11856A362
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Oct 2014 03:54:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9D3s95G017814
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 12 Oct 2014 20:54:10 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Sun, 12 Oct 2014 20:54:09 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sun, 12 Oct 2014 23:53:56 -0400
Message-ID: <cover.1413172183.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/3] linux-yocto: 1.7 updates
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
X-List-Received-Date: Mon, 13 Oct 2014 03:54:16 -0000
Content-Type: text/plain

Richard (and patch collecting folks),

Here is what may be the final tweaks that are appropriate for the 1.7
release. I'm holding other changes until after the release (like setting
the qemu default kernel to be v3.17 again, and korg -stable updates),
since time is short.

What we have here are:

  - The update to the full v3.17 release
  - A fix for compilation issues in v3.10
  - A branch validation fix which was breaking the yocto BSP AUTOREV builds

I've built and booted my kernel-dev image, as well as build and booting
sato for the qemu* machines.

Grab what you like from the series.

Cheers,

Bruce

The following changes since commit ccf5a4d2342c4fd40e4e0b332ea7e34e0bf175d4:

  build-appliance-image: Update to dizzy head revision (2014-10-11 08:11:17 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (3):
  linux-yocto/3.10: 8250/8250_dw: fix compile failure due to
    stable/Yocto conflict
  linux-yocto/3.17: v3.17 release and config
  kernel-yocto: fix branch validation for AUTOREV, non machine_meta
    kernels

 meta/classes/kernel-yocto.bbclass                  | 14 ++++++++------
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 14 +++++++-------
 meta/recipes-kernel/linux/linux-yocto_3.17.bb      | 18 +++++++++---------
 6 files changed, 30 insertions(+), 28 deletions(-)

-- 
1.8.1.2


