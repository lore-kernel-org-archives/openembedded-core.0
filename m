Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 747996C062
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 15:51:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r8AFp8x7005281
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 10 Sep 2013 08:51:08 -0700 (PDT)
Received: from yow-bashfiel-d3.corp.ad.wrs.com (128.224.22.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Tue, 10 Sep 2013 08:51:05 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 10 Sep 2013 11:50:57 -0400
Message-ID: <cover.1378827962.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] linux-yocto/3.10: update to v3.10.11
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Sep 2013 15:51:06 -0000
Content-Type: text/plain

Richard/Saul,

I realize we are working our way through the stabilization cycle, and
this -stable update is of particular interest, the patch says it
all:

    Bumping to the 3.10.11 -stable release. Of note in this update is
    the timer_list fix, which broke ssh access in the previous 3.10
    series of updates:

        timer_list: correct the iterator for timer_list

        commit 84a78a6504f5c5394a8e558702e5b54131f01d14 upstream.

    With this, we can revert the two temporary fixes for timer lists.
    ssh access has been directly tested after this update.

And here's my test results:

[/home/bruc...poky/build]> ssh root@192.168.7.2
root@qemux86-64:~# uname -a
Linux qemux86-64 3.10.11-yocto-standard #1 SMP PREEMPT Tue Sep 10 03:29:54 EDT 2013 x86_64 GNU/Linux
root@qemux86-64:~# 

Cheers,

Bruce


The following changes since commit 2ab1bf27f79beadc45e86a26c85fc0b95ae3496f:

  bitbake: prserv: Ensure data is committed (2013-09-08 10:51:56 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (1):
  linux-yocto/3.10: bump kver to 3.10.11

 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |    8 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |    6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      |   18 +++++++++---------
 3 files changed, 16 insertions(+), 16 deletions(-)

-- 
1.7.10.4


