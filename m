Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1S26Uj-0002tr-2M
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Feb 2012 20:44:25 +0100
Received: from localhost.localdomain (yow-bashfiel-d2.ottawa.windriver.com
	[128.224.146.167])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q1RJZplb010298;
	Mon, 27 Feb 2012 11:35:51 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Mon, 27 Feb 2012 14:34:13 -0500
Message-Id: <cover.1330371008.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.0.4
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
X-List-Received-Date: Mon, 27 Feb 2012 19:44:25 -0000

Richard/Saul,

Here's a consolidated pull reqeset for the some kernel items.

  - a bump of 3.0 to 3.0.22
  - a bump of 3.2 to 3.2.7
  - A fix for yocto 2032

You can cherry pick the bug fix by itself. As for the version
updates, I've built and booted them on my development machine
and on a clean machine, so they are safe for everything that
I've been able to test.

cc: Darren Hart <dvhart@linux.intel.com>

Cheers,

Bruce

The following changes since commit f420fb3de1f588a51dd6009452c7836903fa9158:
  Richard Purdie (1):
        glib-2.0: Disable fam, we don't depend on it

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (3):
  linux-yocto: update 3.0 kernel to v3.0.22
  linux-yocto: update 3.2 kernel to v3.2.7
  linux-yocto: allow non-branched repositories to check out

 meta/classes/kernel-yocto.bbclass                 |    2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb   |    8 ++++----
 meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb   |    9 +++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb |    6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.0.bb      |   18 +++++++++---------
 meta/recipes-kernel/linux/linux-yocto_3.2.bb      |   19 ++++++++++---------
 6 files changed, 32 insertions(+), 30 deletions(-)



