Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1QZV4p-0005la-EG
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 23:35:11 +0200
Received: from localhost.localdomain (yow-bashfiel-d2.ottawa.windriver.com
	[128.224.146.167])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5MLVTBj005219;
	Wed, 22 Jun 2011 14:31:30 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed, 22 Jun 2011 17:29:18 -0400
Message-Id: <cover.1308777703.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.0.4
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	koen@dominion.thruhere.net, saul.wold@intel.com
Subject: [PATCH 0/2] linux-yocto: consolidated merge request
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
X-List-Received-Date: Wed, 22 Jun 2011 21:35:11 -0000

Hi,

This pull request contains the first iteration of the
base configuration changes discussed on the list about
two weeks ago, and a common USB fix that was identified
during the beagleboard refresh.

  94fa015 meta: add taskstats experimental feature group
  4fb2ed5 meta: enable freezer support
  88d619e meta: enable fuse and cuse as modules
  f465827 meta: add namespaces + experimental configs
  fbdd376 meta: add devtmpfs config group
  b04f6d9 meta: re-enable cgroups options in the standard kernel

I've built the relevant qemu targets with the changes,
and my sanity tests have all passed here.

cc: Koen Kooi <koen@dominion.thruhere.net>
cc: Daren Hart <dvhart@linux.intel.com>

Cheers,

Bruce


The following changes since commit 46378aec555f08f133bf601be01dacf4bd0b7f05:
  Bruce Ashfield (1):
        linux-yocto/meta-yocto: update SRCREVs for utrace merge

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/oe-core
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/oe-core

Bruce Ashfield (2):
  linux-yocto: update meta SRCREV for new config groups
  linux-yocto: update meta and yocto/standard SRCREVs

 meta/recipes-kernel/linux/linux-yocto_2.6.37.bb |   19 ++++++++++---------
 1 files changed, 10 insertions(+), 9 deletions(-)



