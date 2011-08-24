Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1QwKU0-0003IL-8o
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Aug 2011 22:55:32 +0200
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(dhcp-146-223.ottawa.windriver.com [128.224.146.223])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7OKoecC009007;
	Wed, 24 Aug 2011 13:50:41 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed, 24 Aug 2011 16:50:24 -0400
Message-Id: <cover.1314218753.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 0/4] linux-yocto: consolidated kernel pull request
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
X-List-Received-Date: Wed, 24 Aug 2011 20:55:32 -0000

Richard/Saul,

Here's a consolidated kernel pull request that fixes a series
of bugs that have been around for a while and fixes some of the
remaining issues from the -rt work that completed last week.

Darren: I also updated the -rt source revs and recipe with some
streamlining that builds on top of changse that merged last week.

The patches have the details of the bugs and fixes.

cc: Darren Hart <dvhart@linux.intel.com>

The following changes since commit f852199ff598069bbecad4146f13377753df1648:

  linux-yocto: update meta SRCREVs for beagleboard config changes (2011-08-24 16:29:22 -0400)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib kernel-oe
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel-oe

Bruce Ashfield (4):
  kern-tools: allow flexible branch points
  linux-yocto-rt: update qemuppc support and streamline variables
  linux-yocto: update machines and default configuration
  linux-yocto/2.6.37: apmd + get time of day fixes

 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb    |   11 ++++-------
 meta/recipes-kernel/linux/linux-yocto_2.6.37.bb    |   12 ++++++------
 meta/recipes-kernel/linux/linux-yocto_3.0.bb       |   14 +++++++-------
 4 files changed, 18 insertions(+), 21 deletions(-)

-- 
1.7.4.1



