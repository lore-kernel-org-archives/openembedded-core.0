Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1QlMZC-0003W2-Et
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 16:55:35 +0200
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(dhcp-146-223.ottawa.windriver.com [128.224.146.223])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6PEpGMP008602;
	Mon, 25 Jul 2011 07:51:17 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Mon, 25 Jul 2011 10:51:15 -0400
Message-Id: <cover.1311605321.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 0/1] machine/qemu: set preferred linux-yocto kernel version
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
X-List-Received-Date: Mon, 25 Jul 2011 14:55:35 -0000

The staging of the linux-yocto-3.0 kernel is taking
precedence over the 2.6.37 variant. We want the known
good 2.6.37 to still be the default for a while longer.

I'm making this change in qemu.inc, if anyone has a 
better idea or alternate preferred approach, let me
know and we can update this change.

The following changes since commit b3dffd26d650444883a2563b25da420d96712e09:

  Merge branch 'master' of git://git.pokylinux.org/poky (2011-07-25 09:03:19 -0400)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (1):
  machine/qemu: set preferred linux-yocto kernel version

 meta/conf/machine/include/qemu.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

-- 
1.7.4.1



