Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1QSX8L-0005au-VA
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Jun 2011 18:22:02 +0200
Received: from localhost.localdomain (yow-bashfiel-d2.ottawa.windriver.com
	[128.224.146.167])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p53GIDwY017405;
	Fri, 3 Jun 2011 09:18:14 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Fri,  3 Jun 2011 12:17:09 -0400
Message-Id: <cover.1307117523.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.0.4
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 0/1] linux-yocto: update target/META SRCREVs
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
X-List-Received-Date: Fri, 03 Jun 2011 16:22:02 -0000

Richard/Saul,

This is a consolidated pull request for the past weeks
changes to Linux yocto. There are a few tweaks to BSP
configs, a new BSP branch and more alignment with the
feature mix the 1.0 (2.6.34) kernel tree.

I've built and booted this on all the appropriate 
qemu targets.

I'll be away from a computer screen from now until
for all day Saturday, so if this waits to merge, it
is fine by me.

The following changes since commit 6b5d323b6c8960a0999dbafa0422fe127fd0fa97:
  Chris Larson (1):
        event: don't catch systemexit from handler execution

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel-oe
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel-oe

Bruce Ashfield (1):
  linux-yocto: update target/meta SRCREVs

 meta/recipes-kernel/linux/linux-yocto_git.bb |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)



