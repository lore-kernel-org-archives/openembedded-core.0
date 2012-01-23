Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1RpOEv-0004Ba-SF
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jan 2012 19:03:34 +0100
Received: from localhost.localdomain (yow-bashfiel-d2.ottawa.windriver.com
	[128.224.146.167])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q0NHtg9u014983;
	Mon, 23 Jan 2012 09:55:43 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Mon, 23 Jan 2012 12:54:31 -0500
Message-Id: <cover.1327341147.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.0.4
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 0/1] linux-yocto/qemuppc: fix console and ethernet
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
X-List-Received-Date: Mon, 23 Jan 2012 18:03:34 -0000

Richard/Saul,

As was discussed on the mailing list ethernet wasn't working out
of the box on the 3.0 kernel (but it was in 3.2, hence why my
boots missed it). I bundled this together with a console fix. 

The commit says it all:

[
  Two issues are fixed with this commit, the ability to use the keyboard
  on a graphical qemu boot and enabling ethernet by default on a 3.0
  kernel.

  The keyboard is fixed via the same method as the other simulations with
  the addition of console=tty on the qemu command line.

  Ethernet is fixed by adding a dependency of PCNET32 to the qemuppc
  configuration, which allows us to build ethernet directly into the image.
]

Cheers,

Bruce

The following changes since commit 4ad01bdf3f9cea8b2f42b925fa2b644d96ba1a82:
  Richard Purdie (1):
        gcc-package-cross.inc: Mark do_package* tasks as noexec

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/qemuppc
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/qemuppc

Bruce Ashfield (1):
  linux-yocto/qemuppc: fix console and ethernet

 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.0.bb    |    2 +-
 scripts/runqemu-internal                        |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)



