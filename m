Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1SRPIr-0000BH-Pw
	for openembedded-core@lists.openembedded.org;
	Mon, 07 May 2012 16:52:46 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q47Egpt4022301;
	Mon, 7 May 2012 07:42:51 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Mon,  7 May 2012 10:42:45 -0400
Message-Id: <cover.1336400779.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 0/1] linux-yocto/3.2: queued config and driver fixes
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
X-List-Received-Date: Mon, 07 May 2012 14:52:47 -0000

Richard/Saul,

I'm clearning out my queued fixes for the 3.2 kernel before following
up with my new functional changes and the 3.4 kernel recipe. These
have been brewing for a week, and will be used for async layer releases

The following changes since commit 7a49d88d22395afffb211045049a17b906219d82:

  Hob: Clear the building status if command failed (2012-05-07 11:03:01 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (1):
  linux-yocto/3.2: configuration and pch merge

 meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb   |    6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb |    4 ++--
 meta/recipes-kernel/linux/linux-yocto_3.2.bb      |   14 +++++++-------
 3 files changed, 12 insertions(+), 12 deletions(-)

-- 
1.7.5.4



