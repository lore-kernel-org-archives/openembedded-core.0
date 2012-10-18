Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1TOraH-0004WQ-G8
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Oct 2012 17:00:29 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q9IEl6am010584;
	Thu, 18 Oct 2012 07:47:07 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Thu, 18 Oct 2012 10:47:04 -0400
Message-Id: <cover.1350571171.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 0/1] kernel.bbclass: remove explicit version.h target
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
X-List-Received-Date: Thu, 18 Oct 2012 15:00:29 -0000

Hi all,

I'm doing a quick RFC on a patch to get 3.7 based kernels building
again. 

The patch has the details on the kernel commits that have moved
version.h around, which breaks our builds due to an explicit reference
in kernel.bbclass.

I thought about making the call conditional, but as the patch says,
this introduces a bit more complexity where it might not be 
required. Removing the reference to version.h fixes the build, and 
didn't break any of my older kernel builds (2.6.39, 3.0, 3.2, 3.4)
while still producing version.h.

I can't locate the original reason that version.h was being directly
built, so that's why this is a RFC. I'm hoping someone will yell if
this breaks a use case that I don't know about.

This is stacked on top of my yocto master branch, since it was a 
RFC. I can rebase onto oe-core, or master under test as appropriate.

Cheers,

Bruce

The following changes since commit e6e2b9bd66100c078c029ca7e34829cf1dfb5490:

  documentation: poky-ref-manual - edits to MACHINE type variables. (2012-10-18 12:15:04 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (1):
  kernel.bbclass: remove explicit version.h target

 meta/classes/kernel.bbclass |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

-- 
1.7.5.4



