Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1QM15S-0003MN-78
	for openembedded-core@lists.openembedded.org;
	Mon, 16 May 2011 18:56:06 +0200
Received: from localhost.localdomain (yow-bashfiel-d2.ottawa.windriver.com
	[128.224.146.167])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p4GGqbZj009843;
	Mon, 16 May 2011 09:52:37 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Mon, 16 May 2011 12:52:35 -0400
Message-Id: <cover.1305564106.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.0.4
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 0/1] linux-yocto: branch manipulation changes
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
X-List-Received-Date: Mon, 16 May 2011 16:56:06 -0000

Richard/Saul,

Recently a few alternate workflow/use cases have been
looked at recently. While they aren't existing cases, or
ones that were previously supported, they are reasonable
so I've tweaked the tools and processing to support them.

The first change is to allow AUTOREV processing to skip
branch validation (since it doesn't make sense). The second
change allows a repository with only a single BSP branch
and a meta directory to be present .. and the tools can
reconstruct what they need to validate and build the
kernel.

Tested against the new use cases, and existing ones, all
performed properly.

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: zedd/kernel
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Thanks,
    Bruce Ashfield <bruce.ashfield@windriver.com>
---


Bruce Ashfield (1):
  linux-yocto: detect and avoid branch revision checking for AUTOREV

 meta/classes/kernel-yocto.bbclass                  |    7 +++++++
 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 2 files changed, 8 insertions(+), 1 deletions(-)



