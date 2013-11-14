Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 64E0B6D040
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2013 16:55:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAEGtTYw013125
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 14 Nov 2013 08:55:29 -0800 (PST)
Received: from yow-bashfiel-d3.wrs.com (128.224.147.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Thu, 14 Nov 2013 08:55:29 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 14 Nov 2013 11:55:23 -0500
Message-ID: <cover.1384447700.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/3] linux-yocto: beagleboard, -rt and install fixes
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
X-List-Received-Date: Thu, 14 Nov 2013 16:55:29 -0000
Content-Type: text/plain

Richard/Saul,

Here are two 3.10 kernel updates that I've had in my tree for a
while now, and a fix from this morning for the kernel install
issues being seen on the autobuilder.

The beagleboard changes are for [YOCTO #5211] and [YOCTO #5183],
which means working USB and ethernet.

The install fix addresses [YOCTO #5527], which means we can 
avoid the install of vmlinux in a hard link situation.

Cheers,

Bruce

The following changes since commit ea92671d9823e3667d6ced7ac2af20f991da404d:

  bitbake: cooker: replace "w" file opening mode with "a" mode (2013-11-12 17:01:37 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (3):
  linux-yocto/3.10:  meta: ARM: OMAP3: Add USB PHY driver for
    Beagleboard
  linux-yocto-rt/3.10: fix ntp merge issue
  kernel.bbclass: test for hardlinks before installing

 meta/classes/kernel.bbclass                        | 6 +++++-
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   | 6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb | 3 +--
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 2 +-
 4 files changed, 10 insertions(+), 7 deletions(-)

-- 
1.8.1.2


