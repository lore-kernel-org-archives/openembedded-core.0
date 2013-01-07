Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1TsF5p-0000ws-74
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 16:58:29 +0100
Received: from yow-bashfiel-d3.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r07FhFFm014487;
	Mon, 7 Jan 2013 07:43:15 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Mon,  7 Jan 2013 10:43:02 -0500
Message-Id: <cover.1357572952.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/4] linux-yocto/3.4: linux-libc-headers: version updates
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
X-List-Received-Date: Mon, 07 Jan 2013 15:58:29 -0000

Richard/Saul,

I've separated the version updates to linux-yocto/3.4 and
linux-libc-headers so we can merge them separately from my other
pending items in the linux-yocto merge queue.

I've been building with these since December, and meant to send
them out last week .. but ended up not getting dug out of 
backlogged items until now.

I've added Ross to the cc: since the linux-yocto/3.4 version 
bumps should be considered for danny as well. Ross: if you'd
prefer a separate pull request for danny, yell and I'll create
one for you.

This also has the updated to linux-libc-headers talked about
before the holidays. I've jumped the version to 3.7 for
Marcin's use case, and I've been build and boot testing against
the existing 3.4 userspace as well as my development kernel
on 3.8-rc2. I haven't run into any compatibililty issues, so 
my I've gone and removed the older libc-headers versions, since
we want to have a single reference .. not one per kernel, and
in particular not one per dependent layer.

I'll bump the linux-libc-headers again, once the kernel version
for yocto/oe-core 1.4 has been locked.

Cheers,

Bruce

The following changes since commit 5b658729eff73963262dda4d6c683fdd023b8d04:

  libgdata: finalize recipe removal (2013-01-07 14:43:28 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (3):
  linux-yocto/3.4: integrate v3.4.21, v3.4.22, v3.4.23
  linux-yocto/3.4: update to v3.4.24
  linux-libc-headers: make 3.7 the default and remove older libc-header
    recipes

Marcin Juszkiewicz (1):
  linux-libc-headers: add 3.7 version

 meta/conf/distro/include/tcmode-default.inc            |    2 +-
 .../linux-libc-headers/linux-libc-headers_3.0.8.bb     |    7 -------
 .../linux-libc-headers/linux-libc-headers_3.2.bb       |    6 ------
 .../linux-libc-headers/linux-libc-headers_3.4.3.bb     |    6 ------
 .../linux-libc-headers/linux-libc-headers_3.7.bb       |    4 ++++
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb        |    8 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb      |    6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.4.bb           |   16 ++++++++--------
 8 files changed, 20 insertions(+), 35 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.0.8.bb
 delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.2.bb
 delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.3.bb
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.7.bb

-- 
1.7.10.4



