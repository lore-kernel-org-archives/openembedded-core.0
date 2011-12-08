Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1RYhbv-0001yK-BB
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 18:18:19 +0100
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(dhcp-145-187.ottawa.windriver.com [128.224.145.187])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pB8HBPDk004053;
	Thu, 8 Dec 2011 09:11:25 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Thu,  8 Dec 2011 12:11:20 -0500
Message-Id: <cover.1323364091.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 0/3] linux-yocto: consolidated pull request
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
X-List-Received-Date: Thu, 08 Dec 2011 17:18:19 -0000

Richard/Saul,

Flushing my queue of pending updates. This refreshes the 3.0
base to v3.0.12 and updates our -rt branches to the corresponding
update.

This also pulls in the EFI changes from Darren.

This one should be random carrage return free, built and booted
locally. Smoke tests all pass.

Cheers,

Bruce

cc: Darren Hart <dvhart@linux.intel.com>

The following changes since commit 30301333f8277228ad4d9213cb801a8ac75f6373:

  package.bbclass: Adding license collection (2011-12-08 15:24:32 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (3):
  linux-yocto: v3.0.12 + EFI fixes
  linux-yocto: update META SRCREV for EFI changes
  linux-yocto: update rt branches to 3.0.12 + rt30

 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb |    8 ++++----
 meta/recipes-kernel/linux/linux-yocto_3.0.bb    |   18 +++++++++---------
 2 files changed, 13 insertions(+), 13 deletions(-)

-- 
1.7.4.1



