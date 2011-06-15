Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1QWhRJ-0004BU-Jp
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Jun 2011 06:10:49 +0200
Received: from localhost.localdomain (yow-bashfiel-d2.ottawa.windriver.com
	[128.224.146.167])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5F47H0x011907;
	Tue, 14 Jun 2011 21:07:18 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed, 15 Jun 2011 00:05:33 -0400
Message-Id: <cover.1308110508.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.0.4
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 0/1] linux-yocto: update meta branch SRCREV
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
X-List-Received-Date: Wed, 15 Jun 2011 04:10:50 -0000

Richard/Saul,

The patch really says it all, so I'm repeating it here:

[    
  Updating the meta SRCREV to fix a bad commit which resulted in the
  tree being dirty after checkpoint, and hence a failure during the
  patch phase. The meta commits never modify code outside the 'meta'
  directory tree, a rule that was broken with this bad commit.

  Without this fix, you may see an error like:

  | [INFO] doing kernel configme
  | [INFO] Finding user(s) of branch "yocto/standard/fsl-mpc8315e-rdb"
  | [INFO] Branch meta-temp used by fsl-mpc8315e-rdb-standard.scc
  | [INFO] collecting configs in ./meta/meta-series
  | [INFO] checking out yocto/standard/fsl-mpc8315e-rdb
  | error: Your local changes to the following files would be overwritten by checkout:
  | 	arch/powerpc/boot/dts/mpc8315erdb.dts
  | Please, commit your changes or stash them before you can switch branches.
  | Aborting
  | [ERROR] Checkout of yocto/standard/fsl-mpc8315e-rdb failed
  | Error running the meta series for collecting config data
  | config of meta-temp (fsl-mpc8315e-rdb-standard.scc) failed
]

The linux-yocto tree was fixed a few days ago, and the dust has settled
enough (I hope) on the recipe renames that this can now go out.

The following changes since commit 7aa7673459376aff911cef820c9417c998d1aa96:
  Bruce Ashfield (1):
        meta-yocto/linux-yocto: update to match the renamed linux-yocto recipes

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (1):
  linux-yocto: update meta branch SRCREV

 meta/recipes-kernel/linux/linux-yocto_2.6.37.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)



