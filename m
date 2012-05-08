Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1SRq43-0002YI-9Y
	for openembedded-core@lists.openembedded.org;
	Tue, 08 May 2012 21:27:15 +0200
Received: from localhost.localdomain (yow-bashfiel-d2.wrs.com
	[128.224.146.167])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q48JHE4n029985;
	Tue, 8 May 2012 12:17:14 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Tue,  8 May 2012 15:23:13 -0400
Message-Id: <cover.1336504721.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.0.4
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 0/1] kernel-yocto: export GUILT_BASE
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
X-List-Received-Date: Tue, 08 May 2012 19:27:15 -0000

Richard/Saul,

As Frans Meulenbroeks noted this morning, guilt wasn't functional
in the devshell. The fix was simple enough, and by ensuring that
GUILT_BASE is exported, it works without any extra steps now.

I wasn't sure if there a better way to call 'up' to the base
method, so I repeated the call to oe_terminal in the do_devshell()
in kernel-yocto.bbclass.

If there's another approach, let me know and I'll respin the patch.

Cheers,

Bruce

The following changes since commit b1867950831ab6edb00b819f4cde81d40007f22e:
  Bruce Ashfield (1):
        meta-yocto/linux-yocto-3.0: update branch mappings for new tools

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (1):
  kernel-yocto: export GUILT_BASE

 meta/classes/kernel-yocto.bbclass |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)



