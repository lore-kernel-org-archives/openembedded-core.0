Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1Qt3n1-0004u4-E4
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 22:29:39 +0200
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(dhcp-146-223.ottawa.windriver.com [128.224.146.223])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7FKOvC9019821;
	Mon, 15 Aug 2011 13:24:58 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Mon, 15 Aug 2011 16:24:50 -0400
Message-Id: <cover.1313439568.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 0/3] linux-yocto: consolidated pull request
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
X-List-Received-Date: Mon, 15 Aug 2011 20:29:39 -0000

Richard/Saul,

We've had some good mileage on the 3.0.x kernel. I've been building
and booting these boards for weeks now and the meta-intel based BSPs
have all been switching over and all of Darren's -rt work was done
on top of 3.0.

So the big part of this pull request is the removal of the explicit
version preference to 2.6.37. We still have the old versions(s) as
fallbacks, but it does seem to be time to acknowledge that 3.0.x 
should be the default kernel.

As for the timing of the merge, I'll leave this up to you.

The following changes since commit a21ff559e7c93e9da61104f4a33e42e6004189fd:

  Fixup remaining bb.msg.domain users (2011-08-15 17:31:52 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (3):
  linux-yocto: bump version string to 3.0.1
  qemu: change default kernel to 3.0.x
  linux-yocto: meta SRCREV bump

 meta/conf/machine/include/qemu.inc           |    1 -
 meta/recipes-kernel/linux/linux-yocto_3.0.bb |    6 +++---
 2 files changed, 3 insertions(+), 4 deletions(-)

-- 
1.7.4.1



