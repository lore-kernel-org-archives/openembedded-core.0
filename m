Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1SoyKf-0004wO-9o
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jul 2012 16:56:02 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q6BEic1s003278;
	Wed, 11 Jul 2012 07:44:38 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed, 11 Jul 2012 10:44:19 -0400
Message-Id: <cover.1342017706.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 0/1] linux-yocto/3.0: perf script fixes
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
X-List-Received-Date: Wed, 11 Jul 2012 14:56:10 -0000

Richard/Saul,

Here are Tom's perf script fixes ported to the 3.0 kernel.

Cheers,

Bruce

cc: tom.zanussi@intel.com

The following changes since commit 6382732a7516c67cb1a3e3e438b06f4fc43efa4e:

  libgomp: add libgomp (openmp) library, and build for powerpc targets by default (2012-07-11 11:35:53 +0100)

are available in the git at: repository
  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (1):
  linux-yocto/3.0: perf scripting support

 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb |    4 ++--
 meta/recipes-kernel/linux/linux-yocto_3.0.bb    |   12 ++++++------
 2 files changed, 8 insertions(+), 8 deletions(-)

-- 
1.7.5.4



