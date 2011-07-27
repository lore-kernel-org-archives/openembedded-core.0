Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1QlvHS-0007IT-Sh
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 05:59:35 +0200
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(dhcp-146-223.ottawa.windriver.com [128.224.146.223])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6R3tF6b016454;
	Tue, 26 Jul 2011 20:55:15 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Tue, 26 Jul 2011 23:55:11 -0400
Message-Id: <cover.1311738733.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 0/1] linux-yocto: update cfgs and enable qemuppc/mips
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
X-List-Received-Date: Wed, 27 Jul 2011 03:59:35 -0000

Richard/Saul,

This SRCREV update continues the 3.0 uprev work. With this the
config audit and 2.6.37 -> 3.0 audit are nearly complete.

More importantly, with this update qemppc and qemumips now boot to
the prompt and can be used for validation.

The following changes since commit a0e0e11b63a693888052b16ceab96e3f0b37d27f:

  poky.conf: explicitly referenced preferred linux-yocto version (2011-07-26 23:37:14 -0400)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib zedd/oe-core-update
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/oe-core-update

Bruce Ashfield (1):
  linux-yocto: update SRCREVs

 meta/recipes-kernel/linux/linux-yocto_3.0.bb |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

-- 
1.7.4.1



