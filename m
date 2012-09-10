Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1TB8eo-0004bL-Lc
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Sep 2012 20:24:27 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q8AIBqbu007192;
	Mon, 10 Sep 2012 11:11:52 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Mon, 10 Sep 2012 14:11:40 -0400
Message-Id: <cover.1347300360.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] linux-yocto: 3.4 kernel updates
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
X-List-Received-Date: Mon, 10 Sep 2012 18:24:27 -0000

Richard/Saul,

Here's a small bump to 3.4.10 (32 commits) and an update to
pickup some configuration changes from TomZ (no impact on existing
features). All in all, it's a nice set of small fixes, with no risk.

Cheers,

Bruce

cc: Tom Zanussi <tom.zanussi@intel.com>

The following changes since commit 21816355c00eadb2273d61b456f06239ca300b47:

  bitbake: cooker: fix handling of exceptions during exception handling (2012-09-10 13:14:08 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (1):
  linux-yocto/3.4: v3.4.10 and uprobes/kprobes configuration updates

 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb |    8 ++++----
 meta/recipes-kernel/linux/linux-yocto_3.4.bb    |   16 ++++++++--------
 2 files changed, 12 insertions(+), 12 deletions(-)

-- 
1.7.5.4



