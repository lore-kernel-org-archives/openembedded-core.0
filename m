Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1T4Oue-0001k8-Qm
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Aug 2012 06:20:57 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q7N48lSk003086;
	Wed, 22 Aug 2012 21:08:47 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Thu, 23 Aug 2012 00:08:43 -0400
Message-Id: <cover.1345694632.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 0/2] linux-yocto: custom repo fixes
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
X-List-Received-Date: Thu, 23 Aug 2012 04:20:57 -0000

Richard/Saul,

I worked through some custom repository issues over the past day, and
the outcome is two small patches to fix some corner cases. I've tested
these with the standard linux-yocto recipes, with my base linux-yocto-custom,
eternalsrc and the repositories that were showing the error.

(patches are stacked on my yocto base, but that history has no impact).

Cheers,

Bruce

The following changes since commit 19ff55a53b436d463f9577adaed15be77708f0d2:

  routerstationpro: move board off 3.0 and onto the 3.4 kernel (2012-08-22 14:26:10 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (2):
  kernel-yocto: don't require meta branch for custom repos
  kernel-yocto: set master branch to a defined SRCREV

 meta/classes/kernel-yocto.bbclass                  |   17 +++++++++++------
 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 2 files changed, 12 insertions(+), 7 deletions(-)

-- 
1.7.5.4



