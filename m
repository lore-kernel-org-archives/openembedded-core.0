Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1Tbb6r-0000hZ-Be
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Nov 2012 19:02:49 +0100
Received: from yow-bashfiel-d3.corp.ad.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qAMHmZW0022723;
	Thu, 22 Nov 2012 09:48:35 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Thu, 22 Nov 2012 12:48:27 -0500
Message-Id: <cover.1353606229.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/2] linux-yocto/kern-tools (v2)
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
X-List-Received-Date: Thu, 22 Nov 2012 18:02:49 -0000

Richard/Saul,

Here's a quick update for some configuration changes that came
in for the x86 BSPs. I've merged and tested them, so there's no
sense sitting on the change.

I also noticed that in my rushing, I sent my update for the
kern-tools without pushing the change to the master repository,
forcing Richard to undo the change .. sorry about that, I assure
you that the revision is really in place this time.

Cheers,

Bruce

The following changes since commit 14f7c9c9d87e1a9b0c20d78d528068fd9f1a27cf:

  Revert "kern-tools: report missing config fragments by name" (2012-11-22 08:59:24 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (2):
  linux-yocto-3.4: gcc optimization config feature
  kern-tools: report missing config fragments by name

 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.4.bb            |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
1.7.10.4



