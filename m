Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1SB859-0000Xf-Fz
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 18:15:19 +0100
Received: from localhost.localdomain (yow-bashfiel-d2.ottawa.windriver.com
	[128.224.146.167])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q2NH6IQj007657;
	Fri, 23 Mar 2012 10:06:19 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Fri, 23 Mar 2012 13:07:45 -0400
Message-Id: <cover.1332522200.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.0.4
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 0/3] linux-libc-headers: 3.2 and linux-libc-headers-yocto movement
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
X-List-Received-Date: Fri, 23 Mar 2012 17:15:19 -0000

Richard/Saul,

As discussed on the mailing list here is a libc-headers series. I've kept it in
three parts so you can pick what you want (except for the minor detail of 
needing to split patch 1/1 to keep 3.1 around if you don't want 2/3).

I've built and booted this on all the emulated targets, and have some other
builds running against larger numbers of packages as well.

Cheers,

Bruce

The following changes since commit bb1d7fad7ff8515939f2b5f0b540b9b09604be3c:
  Richard Purdie (1):
        Revert "bitbake.conf/sstate.bbclass: Change PATH when installing sstate files to avoid issues"

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/libc-headers-oe
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/libc-headers-oe

Bruce Ashfield (3):
  linux-libc-headers: add 3.2 headers and remove 3.1
  linux-libc-headers: set default LINUXLIBCVERSION to 3.2
  linux-libc-headers-yocto: remove from oe-core

 meta/conf/distro/include/tcmode-default.inc        |    2 +-
 .../linux-libc-headers-yocto_git.bb                |   64 --------------------
 .../linux-libc-headers/linux-libc-headers_3.1.bb   |    7 --
 .../linux-libc-headers/linux-libc-headers_3.2.bb   |    6 ++
 4 files changed, 7 insertions(+), 72 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers-yocto_git.bb
 delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.1.bb
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.2.bb



