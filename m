Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1Sm4ym-0007lC-0v
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 17:25:28 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q63FELja005061;
	Tue, 3 Jul 2012 08:14:21 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Tue,  3 Jul 2012 11:14:11 -0400
Message-Id: <cover.1341327589.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 0/4] linux-yocto: consolidated pull request
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
X-List-Received-Date: Tue, 03 Jul 2012 15:25:28 -0000

Richard/Saul,

Here's a collection of updates and fixes from the past week.
Built and boot tested here.

There's only one that may be slightly interesting, that's my
addition of the qemumipsel as a machine mapping. You may or may
not want this change, but the kernel meta data change was 
trivial and should have been done a while ago, so that part I'll
keep even if you don't want the branch mapping.

The routine updates are:
  
  - configuration audit updates
  - 3.4.4 -stable update
  - -rt refresh to 3.4.4-rt-13

I also fixed linux-yocto-tiny to have kernel configuration
audit reports again, there was a missing KMETA mapping in the 
recipe. There's some output from the audit that we need to look
into, but that will be dealt with separately. 

I've built and booted this on every qemu target I could get
my hands on .. but the matrix is increasing with multiple
variants, kernel versions and recipes :)

cc: Darren Hart <dvhart@linux.intel.com>

Cheers,

Bruce

The following changes since commit 644ad4bf1e30fcee4b9d5abb819046d1f2193d27:

  documentation/bsp-guide/bsp.xml: Yocto term paring (2012-07-02 16:47:45 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (4):
  linux-yocto/3.4: add qemumipsel machine mapping
  linux-yocto/3.4: v3.4.4 + configuration updates
  linux-yocto/3.4: update preempt-rt to 3.4.4-rt13
  linux-yocto-tiny: add KMETA specification

 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb   |    8 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb |    2 ++
 meta/recipes-kernel/linux/linux-yocto_3.4.bb      |   17 +++++++++--------
 3 files changed, 15 insertions(+), 12 deletions(-)

-- 
1.7.5.4



