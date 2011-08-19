Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1QuHZi-0005jt-ID
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Aug 2011 07:24:58 +0200
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(dhcp-146-223.ottawa.windriver.com [128.224.146.223])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7J5KA7q005178;
	Thu, 18 Aug 2011 22:20:12 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Fri, 19 Aug 2011 01:20:03 -0400
Message-Id: <cover.1313730559.git.bruce.ashfield@windriver.com>
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
X-List-Received-Date: Fri, 19 Aug 2011 05:24:58 -0000

Richard/Saul,

Here's a consolidated set of changes that I've been testing with
for the past few days. The patches are pretty much self explanitory.

1/3:  linux-yocto: restoring LINUX_VERSION ?= "3.0"

After discussions on the mailing list, we are going to go back to the
1.0 model and not cycle the version string of the recipe. We'll revisit
this post 1.1.

2/3  linux-yocto: move more default values into linux-yocto.inc

While working on documentation for extending linux-yocto, I moved some
variables into the .inc file to simply recipes based on linux-yocto.
I haven't updated some other recipes yet (like the -rt one), but will
do that once I can test them.

3/3 linux-yocto: update SRCREVs for 3.0.3

Updating the SRCREVs to pickup 3.0.3, this also picks up the meta branch
updates for emgd and hpet.

cc: Tom Zanussi <tom.zanussi@intel.com>
cc: Darren Hart <dvhart@linux.intel.com>

The following changes since commit 978cdd5cb5b445f1cf406296444cb57cd8aa526a:

  kernel: restore crtsavres.o to enable building external modules on powerpc (2011-08-17 15:56:07 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib zedd/kernel-oe
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel-oe

Bruce Ashfield (3):
  linux-yocto: restoring LINUX_VERSION ?= "3.0"
  linux-yocto: move more default values into linux-yocto.inc
  linux-yocto: update SRCREVs for 3.0.3

 meta/recipes-kernel/linux/linux-yocto.inc    |    7 +++++++
 meta/recipes-kernel/linux/linux-yocto_3.0.bb |   21 ++++++++-------------
 2 files changed, 15 insertions(+), 13 deletions(-)

-- 
1.7.4.1



