Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 218F07768B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 14:49:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uBMEnLQu020139
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 22 Dec 2016 06:49:22 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Thu, 22 Dec 2016 06:49:21 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 22 Dec 2016 09:49:18 -0500
Message-ID: <cover.1482415485.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/2] kernel-yocto: 4.9 goodness
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
X-List-Received-Date: Thu, 22 Dec 2016 14:49:23 -0000
Content-Type: text/plain

Hi all,

I'm sending this out so it can get some extra test cycles. I've built and
booted core-image-kernel-dev/sato on qemu* with the 4.9 kernel and 4.9
libc-headers.

I didn't see any issues .. but there always seems to be one lurking.

I'm heading out of town for the holidays, so this commit does not switch
qemu* to use 4.9 by default, but it does put the recipes and trees in
place for upcoming work on new targets and -rt support.

So assuming that the libc-headers change survives some autobuilder cycles,
this should be safe for merge.

Cheers,

Bruce

The following changes since commit d0d260b0b85790ceb136dd6b0445e8e33d038f5e:

  u-boot/beaglebone: Select Beaglebone Black target specifically. (2016-12-17 09:57:37 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (2):
  linux-libc-headers: introduce 4.9 headers
  kernel: introduce linux-yocto v4.9 recipes

 meta/conf/distro/include/tcmode-default.inc        |  2 +-
 ...bc-headers_4.8.bb => linux-libc-headers_4.9.bb} |  6 +--
 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb    | 38 +++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb  | 25 ++++++++++++
 meta/recipes-kernel/linux/linux-yocto_4.9.bb       | 44 ++++++++++++++++++++++
 5 files changed, 110 insertions(+), 5 deletions(-)
 rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_4.8.bb => linux-libc-headers_4.9.bb} (64%)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto_4.9.bb

-- 
2.5.0


