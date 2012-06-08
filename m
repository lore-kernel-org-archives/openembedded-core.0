Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1Sd03k-0008LM-3h
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jun 2012 16:21:04 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q58EAVLO028748;
	Fri, 8 Jun 2012 07:10:31 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Fri,  8 Jun 2012 10:10:15 -0400
Message-Id: <cover.1339164527.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 0/1] linux-yocto/3.2: fix meta SRCREV typo
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
X-List-Received-Date: Fri, 08 Jun 2012 14:21:04 -0000

Richard/Saul,

Argh. I need a brown paper bag .... being focused on 3.4 hid
thsi from me.

Never underestimate the power of a rebase for inserting fat finger
errors that are hidden by local layers.

An extraneous character made it into the 3.2 meta SRCREV, which makes
the fetcher error, even when the kernel isn't being built.

Cheers,

Bruce

The following changes since commit 0612cf3fcb3365e7721a2d5c331f8cd2647ae60b:

  hob2: create a standalone deploy image tool (2012-06-08 12:13:43 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (1):
  linux-yocto/3.2: fix meta SRCREV typo

 meta/recipes-kernel/linux/linux-yocto_3.2.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

-- 
1.7.5.4



