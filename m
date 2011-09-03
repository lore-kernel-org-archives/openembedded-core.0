Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1QzgbK-00054x-JD
	for openembedded-core@lists.openembedded.org;
	Sat, 03 Sep 2011 05:08:58 +0200
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(dhcp-146-223.ottawa.windriver.com [128.224.146.223])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p8333sL8012398;
	Fri, 2 Sep 2011 20:03:54 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Fri,  2 Sep 2011 23:03:23 -0400
Message-Id: <cover.1315017994.git.bruce.ashfield@windriver.com>
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
X-List-Received-Date: Sat, 03 Sep 2011 03:08:59 -0000

Richard/Saul,

This took a bit longer than I wanted (this was intended for Thursday), but 
since this was potentially the last minor rev bump for yocto 1.1, I wanted 
to build and boot all of the qemu targets, and the -rt targets as well.

While doing this, I noticed that there were still some lurking configuration
cleanups, which are covered under YOCTO #940, so I took the time to ensure
that the machines configure without warnings against 3.0.4. The end configs
are the same (since the options I'm fixing were not translating into the
final .config), but it completes the update to 3.0.x.

The machine SRCREV updates represent the update to 3.0.4, while the meta
branch update contains the following:

Bruce Ashfield (3):
      meta/qemuppc: board description fixes
      meta: remove configuration warnings
      meta: update kver to v3.0.4

Saxena, Rahul (2):
      meta: remove duplicate statement
      meta: remove unused eg20t configuration fragments

The kern-tools fixes contain cleanups and a few generalizations that result 
in easier/more flexible tree generation that I documented for 1.1 and have
been tested for a week now. They won't impact the patching phase validation, so
are safe and good for the release.

I also updated the -rt recipes with the results of the fixes and boot testing.

cc: Tom Zanussi <tom.zanussi@intel.com>
cc: Darren Hart <dvhart@linux.intel.com>

The following changes since commit de5d52711bd810a63a0ad5260b799d6672952c32:

  sanity.bbclass: fix splitting on newlines of SANITY_TESTED_DISTROS (2011-09-02 18:36:20 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib zedd/kernel-oe
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel-oe

Bruce Ashfield (3):
  linux-yocto: generalize kernel config search pattern
  linux-yocto: update to v3.0.4
  linux-yocto: clean configuration for v3.0.4

 meta/classes/kernel-yocto.bbclass                  |    2 +-
 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb    |    8 ++++----
 meta/recipes-kernel/linux/linux-yocto_3.0.bb       |   18 +++++++++---------
 4 files changed, 15 insertions(+), 15 deletions(-)

-- 
1.7.4.1



