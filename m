Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1RM0vl-0002CK-Ip
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Nov 2011 18:18:21 +0100
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(yow-bashfiel-d3.ottawa.windriver.com [128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pA3HC8s5004949;
	Thu, 3 Nov 2011 10:12:08 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Thu,  3 Nov 2011 13:11:26 -0400
Message-Id: <cover.1320340081.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 0/1] linux-yocto: update base to v3.0.8 + meta config changes
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
X-List-Received-Date: Thu, 03 Nov 2011 17:18:22 -0000

Richard/Saul,

Here's a bump to 3.0.8 for the 3.0 kernel, and some config changes from TomZ.
These are destined for master and separate from any point updates to the 1.1
release.

In case anyone cares my -dev kernel also has these changes, and it will take
them to the latest kernel shortly.

This also doesn't bump the preempt-rt branches, since they'll be updated
to the new -rt first, before taking the 3.0.x stable updates.

Built and booted for all the qemu targets.

cc: Tom Zanussi <tom.zanussi@intel.com>
cc: Darren Hart <dvhart@linux.intel.com>

Cheers,

Bruce

The following changes since commit 9b76e6a2cfc5a4d779f3b06e3acc5ff7b8275470:

  meta: glib-2.0: don't apply qsort_r test removable patch for native version (2011-11-02 09:08:28 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (1):
  linux-yocto_3.0: update base to v3.0.8 + meta config changes

 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.0.bb    |   18 +++++++++---------
 2 files changed, 10 insertions(+), 10 deletions(-)

-- 
1.7.4.1



