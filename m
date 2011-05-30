Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1QR6XK-0005NI-FP
	for openembedded-core@lists.openembedded.org;
	Mon, 30 May 2011 19:45:54 +0200
Received: from localhost.localdomain (yow-bashfiel-d2.ottawa.windriver.com
	[128.224.146.167])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p4UHg8W2022792;
	Mon, 30 May 2011 10:42:08 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Mon, 30 May 2011 13:41:17 -0400
Message-Id: <cover.1306777062.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.0.4
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 0/1] linux-yocto: update SRCREVs
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
X-List-Received-Date: Mon, 30 May 2011 17:45:55 -0000

Richard/Saul,

Just updating the linux-yocto SRCREVs to pickup the Romley
changes and meta cleanup from TomZ. There's also a config update
for the routerstation pro to enable watchdog support to fix
yocto bug 1111.

cc: Tom Zanussi <tom.zanussi@intel.com>

Cheers,

Bruce


The following changes since commit cdc3397262f588a901364315580256ad39cca0ac:
  Koen Kooi (1):
        bitbake.conf: make OVERRIDES match what people expect

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (1):
  linux-yocto: update meta SRCREV

 meta/recipes-kernel/linux/linux-yocto_git.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)



