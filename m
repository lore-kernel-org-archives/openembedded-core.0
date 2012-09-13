Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1TCFO0-0005Bm-NP
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Sep 2012 21:47:41 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q8DJYrhY002911;
	Thu, 13 Sep 2012 12:34:54 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Thu, 13 Sep 2012 15:34:35 -0400
Message-Id: <cover.1347564407.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/2] linux-yocto: consolidated update
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Sep 2012 19:47:41 -0000

Richard/Saul, 

A small ``consolidated'' update this time. Two fixes, one to the build/tools,
one meta branch update for KVM guests.

The tools fix is something that I've been wanting to get to for a month
now .. and I finally did. Matthew Foster reported the strange messages
when working with linux-yocto-custom. It is now fixed, and no more nasty
looking messages. The details of the messages and fix are in the patch.

The second meta/config patch is to embed some fragments for use by a
KVM guest. These will be used by other updates to the tools/scripts
to follow.

Cheers,

Bruce


The following changes since commit 7401ed019196313a7ae7cab0b9f3820356cfee29:

  Update to upstream_tracking.inc (2012-09-12 17:56:58 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (2):
  kernel-yocto: fix kernel configuration audit for custom yocto kernels
  linux-yocto: virtio and KVM guest configuration

 meta/classes/kernel-yocto.bbclass                  |    7 ++++++-
 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb    |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.4.bb       |    2 +-
 4 files changed, 9 insertions(+), 4 deletions(-)

-- 
1.7.5.4



