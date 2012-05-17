Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1SUrNt-0001Fc-Ms
	for openembedded-core@lists.openembedded.org;
	Thu, 17 May 2012 05:28:14 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q4H3I7J3025632;
	Wed, 16 May 2012 20:18:07 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed, 16 May 2012 23:17:48 -0400
Message-Id: <cover.1337224240.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 0/3] linux-yocto/tools: consolidated pull request
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
X-List-Received-Date: Thu, 17 May 2012 03:28:14 -0000

Richard/Saul,

Just clearing my queue before I head out of the office next week, and I
want all the stable updates + 3.4 introduction to be clear of these
smaller changes.

These have been cooking for a bit, and are largely configuration cleanup
and factoring done by Tom. The other is a minor license tweak for the 
kern-tools package. Everything builds and looks sane here.

Cheers,

Bruce

(this is based on my poky-contrib, since my oe-core clone to this machine
has stalled and I'm done waiting for it :).

The following changes since commit d4e265661517f8dd4e1648fdc56bac5973f986f6:

  poky.conf: Change WARNS -> ERRORS (2012-05-16 07:35:20 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (3):
  linux-yocto: intel BSP config changes
  kern-tools: update LICENSE field to GPLv2
  linux-yocto: policy cleanups

 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb    |    2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb  |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.2.bb       |    2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

-- 
1.7.5.4



