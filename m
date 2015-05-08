Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3059373F63
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 May 2015 03:36:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t483aGiX028680
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 7 May 2015 20:36:16 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Thu, 7 May 2015 20:36:16 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 7 May 2015 23:36:11 -0400
Message-ID: <cover.1431055930.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/4] linux-yocto: build fixes and BSP support
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
X-List-Received-Date: Fri, 08 May 2015 03:36:20 -0000
Content-Type: text/plain

Richard,

Here's the second revision of this series. I've included the braswell and
qemumips fixes again, since they are still outstanding from an older
pull request.

On top of those, I have two fixes for KBUILD_DEFCONFIG processing and
in-tree configs (reported on the mailing list), and a fix for the race
condition that was likely breaking Martin's builds. Ross managed to
reproduce the error locally, and that got me on the right track to find
the race condition.

I never did see the error locally, but the ordering fix should be
correct, and it is worth getting into the mix IMHO.

I've also built this for qemux86, and there are no configuration warnings,
so that issue should be solved as well.

Bruce

The following changes since commit 4a711028c709d4bb1421e1637ae3fb0ac404fb45:

  oe-selftest: devtool: add a proper test to see if tap devices exist (2015-05-07 14:59:43 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (4):
  linux-yocto/3.19: Braswell support and bug fixes
  linux-yocto/3.14: fix qemumips build error
  linux-yocto: fix race between checkout and meta data generation
  kernel-yocto: propagate in tree defconfigs to WORKDIR

 meta/classes/kernel-yocto.bbclass                  | 13 +++++++------
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 16 ++++++++--------
 meta/recipes-kernel/linux/linux-yocto_3.19.bb      | 16 ++++++++--------
 6 files changed, 27 insertions(+), 26 deletions(-)

-- 
2.1.0


