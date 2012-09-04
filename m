Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1T8v6G-0004Hi-R9
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 17:31:37 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q84FJAOJ005974;
	Tue, 4 Sep 2012 08:19:10 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Tue,  4 Sep 2012 11:19:08 -0400
Message-Id: <cover.1346771668.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
Cc: openembedded-core@lists.openembedded.org, dvhart@linux.intel.com,
	saul.wold@intel.com
Subject: [PATCH 0/1] linux-yocto-rt: update and boot fixes
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
X-List-Received-Date: Tue, 04 Sep 2012 15:31:37 -0000

Richard/Saul,

This is an update to the -rt branches that fixes up some merge
issues which were preventing the -rt boards from sucessfully
booting (hangs in the timekeeping code).

Built and booted here, so it's better than before, and it's
worth updating this ASAP, even while more testing happens, since
any issues can be dealt with via incremental patches.

Cheers,

Bruce

cc: Kishore Bodke <kishore.k.bodke@intel.com>
cc: Darren Hart <dvhart@linux.intel.com>

The following changes since commit e731ff2881ef13e742889ef6e535f1cf89bbc1ef:

  udev: Remove files moved to udev-extraconf (2012-09-04 15:41:16 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib zedd/kernel-rt
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel-rt

Bruce Ashfield (1):
  linux-yocto-rt: update to 3.4.9-rt17

 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

-- 
1.7.5.4



