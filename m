Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1QrYIg-00034B-Vn
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 18:40:07 +0200
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(dhcp-146-223.ottawa.windriver.com [128.224.146.223])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7BGZUrr011772;
	Thu, 11 Aug 2011 09:35:31 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Thu, 11 Aug 2011 12:35:04 -0400
Message-Id: <cover.1313080337.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 0/1] linux-yocto: consoliated pull request
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
X-List-Received-Date: Thu, 11 Aug 2011 16:40:07 -0000

Richard/Saul,

Here's the latest linux-yocto pull request. It includes updates
for rt support (from Darren) as well as some build fixes for 
various issues we've met along the way.

Once this is in place, we are in a position to change the defaults
for the qemu machines. Speak now if there's a problem with this!

cc: Darren Hart <dvhart@linux.intel.com>

The following changes since commit 786033f53cad2a196ae6f3a05574148578ea3894:

  bb/cooker: only emit ConfigFilePathFound for files which were parsed (2011-08-10 13:38:20 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (1):
  linux-yocto: update SRCREVs for preempt-rt support + build fixes

 meta/recipes-kernel/linux/linux-yocto_3.0.bb |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

-- 
1.7.4.1



