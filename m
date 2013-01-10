Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1TtPIt-0001uP-HI
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Jan 2013 22:04:54 +0100
Received: from yow-bashfiel-d3.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0AKnV8v013888;
	Thu, 10 Jan 2013 12:49:31 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Thu, 10 Jan 2013 15:49:15 -0500
Message-Id: <cover.1357850854.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] linux-libc-headers: fix long path name build breakage
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
X-List-Received-Date: Thu, 10 Jan 2013 21:04:56 -0000

Richard/Saul,

Here's a patch to fix the recent autobuilder failures with the updated
linux-libc-headers (3.7) as the default.

I wasn't sure if we needed a PR bump, but I added one anyone. Let
me know if I should respin with it removed.

I'll send this patch upstream for comments as well, but in it's current
form it does get us up and running on the builders.

Until this is accepted, it will be propagated to any > 3.7 kernel headers,
just in case they are used in a long path name configuration.

Cheers,

Bruce

The following changes since commit 66f4c8a674d9f8db958b13866af4d63ab8cbcd44:

  guile: add explicit dependency to avoid parallel build issue (2013-01-09 15:05:26 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (1):
  linux-libc-headers: fix headers install in long path name
    environments

 ...efile.headersinst-install-headers-from-sc.patch |   47 ++++++++++++++++++++
 .../linux-libc-headers/linux-libc-headers_3.7.bb   |    4 ++
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/scripts-Makefile.headersinst-install-headers-from-sc.patch

-- 
1.7.10.4



