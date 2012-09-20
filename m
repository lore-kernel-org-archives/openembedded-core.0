Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1TEkqv-0006F5-Hr
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Sep 2012 19:47:53 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q8KHZ72b019013;
	Thu, 20 Sep 2012 10:35:07 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Thu, 20 Sep 2012 13:34:42 -0400
Message-Id: <cover.1348162346.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] linux-yocto/3.4: latency/profiling option consistency
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
X-List-Received-Date: Thu, 20 Sep 2012 17:47:53 -0000

Richard/Saul,

Here's a change from Tom that I've had for a few days, to make 
more BSPs use the common profiling/latency configuration fragments.
Everything checks out fine here.

Cheers,

Bruce

The following changes since commit df5f9a3e6dfcf8e8f57132843a024b44c0bd90fc:

  gtk+: enable gtk+-native (2012-09-20 13:33:50 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (1):
  linux-yocto/3.4: use profiling and latencytop features in yocto bsps

 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.4.bb    |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
1.7.5.4



