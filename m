Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1RBCJu-00067p-6g
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Oct 2011 23:14:34 +0200
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(dhcp-145-174.ottawa.windriver.com [128.224.145.174])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p94L8t8q008797;
	Tue, 4 Oct 2011 14:08:55 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Tue,  4 Oct 2011 17:08:53 -0400
Message-Id: <cover.1317762176.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 0/1] linux-yocto: update live boot configuration
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
X-List-Received-Date: Tue, 04 Oct 2011 21:14:34 -0000

Richard/Saul,

Apologies to anyone that prefers these to be pushed out on top of oe-core,
but my machine with those repos went down today and I wanted to get these
out quickly, so this is based on top of my yocto/poky tree. I've also had
to do this on top of my master branch (hence why you see the distro
version patch), if we do need this on another branch let me know and I'll
spend the time to re-create my environment on another machine to get
things staged differently.

This is a series of changes from Tom to synchronize live boot settings
across more machines, which are nicely isolated to a few boards.

Cheers,

Bruce

cc: Tom Zanussi <tom.zanussi@intel.com>

The following changes since commit c88b9915267f9a89983bb58faf3c30fe1dcdab43:

  poky.conf: Increment DISTRO_VERSION (2011-10-04 18:33:54 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (1):
  linux-yocto: update live boot configuration

 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.0.bb    |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
1.7.4.1



