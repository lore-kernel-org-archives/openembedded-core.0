Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1QwRl9-0002Ka-04
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Aug 2011 06:41:43 +0200
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(dhcp-146-223.ottawa.windriver.com [128.224.146.223])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7P4alMt005357;
	Wed, 24 Aug 2011 21:36:48 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Thu, 25 Aug 2011 00:36:33 -0400
Message-Id: <cover.1314246387.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 0/1] linux-yocto: sync meta and LINUX_VERSION
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
X-List-Received-Date: Thu, 25 Aug 2011 04:41:43 -0000

Richard/Saul,

When doing some clean build testing on my latest changes (given that
I'm a bit paranoid), I noticed the kernel config audit throwing some
warnings (unset values, etc).

The root cause is that when the config fragments are processed they
are assembled into a file with the version string from the kernel 
tree (which was at v3.0) while the recipe tells the audit to check
against 3.0.x. Which means nothing is checked.

The fix is simple, I've bumped the internal version to 3.0.3 and 
pushed it out. The audits are now clean.

.. and this time, I'm nearly sure I pushed these to the proper branch
and generated a pull against it.

The following changes since commit 9ca6806de9d9df9d901774c1b23a14f28f10a844:

  docuementation/poky-ref-manual/ref-structure.xml: Changed SRCDATE reference (2011-08-24 19:59:55 -0700)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib zedd/kernel-oe
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel-oe

Bruce Ashfield (1):
  linux-yocto: update meta SRCREV to sync version strings

 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb |    4 ++--
 meta/recipes-kernel/linux/linux-yocto_3.0.bb    |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

-- 
1.7.4.1



