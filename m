Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1T8scq-0008Ph-GB
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 14:53:04 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q84Cecwo008783;
	Tue, 4 Sep 2012 05:40:38 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Tue,  4 Sep 2012 08:40:31 -0400
Message-Id: <cover.1346762109.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 0/6] linux-yocto/kern-tools: consolidated pull request
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
X-List-Received-Date: Tue, 04 Sep 2012 12:53:04 -0000

Saul/Richard,

This is largely the same pull request that I sent a week ago, and
I've had things fixed for a bit, but I didn't want to send it 
again during my travel .. and then a long weekend.

So here's the request again. 

It is a content update to 3.4.9 + some tool tweaking for problems 
found by Khem, Matthew Foster and Tom Zanussi. With the tools fixes,
we have all known use cases back up and working.

The content update has been tested for 2 weeks now and is safe,
we do know that the -rt kernel has some issues at the moment, and
once this pull request is sent, I'll do a refresh on -rt and get
that problem fixed.

Cheers,

Bruce

The following changes since commit bb86a22ba6f90902644c11f984ae4c171ba36624:

  yocto-docs/.gitignore: Final fix to ignore mega-manual. (2012-09-04 12:55:03 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (6):
  kern-tools: fix forced branching
  linux-yocto: fix unapplied patch error message
  linux-yocto: check for bad SRCREV before branch checks
  kern-tools: fix non-inheriting branch names
  linux-yocto/3.4: v3.4.9, unionfs, perf and configuration changes
  linux-yocto/3.2/3.4: arm: Fix linking errors with binutils 2.23

 meta/classes/kernel-yocto.bbclass                  |   18 ++++++++++--------
 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb    |    4 ++--
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb    |    8 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb  |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.2.bb       |   12 ++++++------
 meta/recipes-kernel/linux/linux-yocto_3.4.bb       |   16 ++++++++--------
 7 files changed, 32 insertions(+), 30 deletions(-)

-- 
1.7.5.4



