Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1QpYRF-0001xd-FR
	for openembedded-core@lists.openembedded.org;
	Sat, 06 Aug 2011 06:24:41 +0200
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(dhcp-146-223.ottawa.windriver.com [128.224.146.223])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p764K9SF002298;
	Fri, 5 Aug 2011 21:20:10 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Sat,  6 Aug 2011 00:19:48 -0400
Message-Id: <cover.1312604261.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 0/4] Richard/Saul,
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
X-List-Received-Date: Sat, 06 Aug 2011 04:24:41 -0000

Here's a collection of fixes that have been cooking here for the week.
Build, boot and regression testing has been completed. With these the
3.0 kernel tree is bumped to 3.0.1, and some use cases have been updated
to support building arbitrary repos (for x32 dev testing) and for 
building multiple machines (and kernel types) out of a single branch
(-rt n450 support).

The patches themselves contain the details.

build and boot testing was done on the qemu* targets. With these changes
it should be possible to start switching the prefernce to the 3.0.x
kernel, and we can begin doing that next week.

The following changes since commit 29208d2e353ba2f0b1c9b5d59014a2ea71dde078:

  local.conf.sample: Comment out BBMASK by default (2011-08-05 17:19:51 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (4):
  linux-yocto: pass KMACHINE to updateme, not MACHINE
  linux-yocto: allow configuration of arbitrary branches
  linux-yocto: update atom-pc preempt-rt definition
  linux-yocto: merge v3.0.1

 meta/classes/kernel-yocto.bbclass                  |   16 ++++------------
 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.0.bb       |   14 +++++++-------
 3 files changed, 12 insertions(+), 20 deletions(-)

-- 
1.7.4.1



