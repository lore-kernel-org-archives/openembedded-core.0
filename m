Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1R3u0g-00088k-H8
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Sep 2011 20:16:34 +0200
Received: from localhost.localdomain (yow-pbarrett-lx.ottawa.windriver.com
	[128.224.146.11])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p8EIBIX5010737;
	Wed, 14 Sep 2011 11:11:19 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed, 14 Sep 2011 14:11:09 -0400
Message-Id: <cover.1316023378.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
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
X-List-Received-Date: Wed, 14 Sep 2011 18:16:35 -0000

Richard/Saul,

Here's a series of changes I've had locally since last week. The
two kernel only ones are simple enough.

  - a configuration split to clean our x86 BSPs
  - a build fix for rt

The net result of the cleanup is zero, since the configs are the
same, so there's no reason not to do it.

I've also had the refactored linux-yocto tasks around for a bit,
they were brought up while reviewing some 1.1 documentation, and
indeed, simplifying the amount of variables required in a linux-yocto
based recipe was a 1.1 goal. The result here is also zero, since we
are just not resetting things needlessly. I've been building with
this for a while, but if you'd rather sit on this until the imminent
spin is done, I won't object.

The following changes since commit ce66e2c6bd117d1a40b547b10b376524f9276d16:

  core-image-minimal: Add missing POKY_EXTRA_IMAGE variable (2011-09-14 01:29:30 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (3):
  linux-yocto: move common tasks to a common location
  linux-yocto: split e100 and e1000 support
  linux-yocto-rt: correct 3.0.3->3.0.4 mismerge for, stop_machine.c

 meta/recipes-kernel/linux/linux-yocto-rt_2.6.34.bb |    8 +-------
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb    |   14 ++++----------
 meta/recipes-kernel/linux/linux-yocto.inc          |    5 +++++
 meta/recipes-kernel/linux/linux-yocto_2.6.37.bb    |   13 +------------
 meta/recipes-kernel/linux/linux-yocto_3.0.bb       |   10 ++--------
 5 files changed, 13 insertions(+), 37 deletions(-)

-- 
1.7.4.1



