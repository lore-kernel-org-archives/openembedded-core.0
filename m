Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1TwnhR-000530-GH
	for openembedded-core@lists.openembedded.org;
	Sun, 20 Jan 2013 06:44:10 +0100
Received: from yow-bashfiel-d3.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0K5Schr024828;
	Sat, 19 Jan 2013 21:28:38 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Sun, 20 Jan 2013 00:28:28 -0500
Message-Id: <cover.1358659549.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/2] linux-yocto: -stable, -rt and meta changes
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
X-List-Received-Date: Sun, 20 Jan 2013 05:44:10 -0000
X-List-Received-Date: Sun, 20 Jan 2013 05:44:10 -0000

Richard/Saul,

Two more -stable updates for the 3.4 kernel, and a -rt refresh. We also have
some config changes to Intel graphics from Nitin.

Tested here on my normal set of builds, no issues were seen.

This puts 3.4 in an up to date state, and I'll now focus on introducing 
3.8 and removing the 3.0 recipes in my upcoming series.

Cheers,

Bruce

The following changes since commit 349e5bea53b02cabf836b8943541a002ce9ba682:

  guilt: add git 1.8.x support (2013-01-18 13:28:10 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (2):
  linux-yocto/3.4: update to 3.4.26 and 3.4.25-rt37
  linux-yocto/3.4: update intel graphics features/configs

 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb   |    8 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb |    6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.4.bb      |   16 ++++++++--------
 3 files changed, 15 insertions(+), 15 deletions(-)

-- 
1.7.10.4



