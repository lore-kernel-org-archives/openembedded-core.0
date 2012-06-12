Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1SeaBJ-0000gY-IP
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jun 2012 01:07:25 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q5CMujop010832;
	Tue, 12 Jun 2012 15:56:45 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Tue, 12 Jun 2012 18:56:23 -0400
Message-Id: <cover.1339541557.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [v2: PATCH 0/2] linux-yocto/linux-yocto-rt: updates and 3.4-rt support
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
X-List-Received-Date: Tue, 12 Jun 2012 23:07:26 -0000

Richard/Saul,

v2: changes. 
  - Fixed the machine_machine SRCREV
  - Sent the oe-core vs yocto patch for yaffs2

Original text follows:

When I sent the initial 3.4 kernel and kernel recipes -rt wasn't
building, so I didn't include it. I've since refreshed the patch,
and done build/boot testing. 3.4.1-rt9 is up and running.

I've also got a yaffs2 update, and rc6 cleanup from nitin for the
3.4 kernel repository in this pull request.

cc: Darren Hart <dvhart@linux.intel.com>

Cheers,

Bruce

The following changes since commit 5ed855d12cddf2de535c3f6d05d3dfe85d69d99d:

  openjade-native: Ensure we reautoconf the package (2012-06-12 16:34:30 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (2):
  linux-yocto/3.4: update yaffs2 and drop rc6
  linux-yocto/3.4: create linux-yocto-rt recipe

 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb |   32 +++++++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto_3.4.bb    |   14 +++++-----
 2 files changed, 39 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb

-- 
1.7.5.4



