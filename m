Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7FF82788EE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2018 15:10:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w2EFAUBb027966
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 14 Mar 2018 08:10:30 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Wed, 14 Mar 2018 08:09:49 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 14 Mar 2018 11:10:26 -0400
Message-ID: <cover.1521040068.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/3] kernel: (mini) consolidated pull request
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
X-List-Received-Date: Wed, 14 Mar 2018 15:10:31 -0000
Content-Type: text/plain

Hi all,

This series is really about fixing the footprint and packaging issues
that were reported after a systemtap configuration change. I've reverted
the addition of DEBUG_KERNEL to the standard kernel's config and things
should go back to normal.

I also packaged a maintainers update (reported by Cal) and a couple of
minor bug fixes in the series.

Cheers,

Bruce

The following changes since commit 5350ee317740751f2417c1794dd39d3880347dbf:

  yocto-uninative: Upgrade to 1.8 version with glibc 2.27 (2018-03-11 06:27:02 -0700)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (3):
  linux-yocto/4.14/4.15: revert "features/systemtap/systemtap.cfg:
    enable CONFIG_KERNEL_DEBUG"
  maintainers: add maintainer for make-mod-scripts
  linux-yocto/4.12: backport bugfixes for x86

 meta/conf/distro/include/maintainers.inc           |  1 +
 meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.12.bb      | 16 ++++++++--------
 meta/recipes-kernel/linux/linux-yocto_4.14.bb      |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.15.bb      |  2 +-
 10 files changed, 17 insertions(+), 16 deletions(-)

-- 
2.5.0


