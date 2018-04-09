Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 967F374952
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Apr 2018 15:16:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w39FG97g011372
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 9 Apr 2018 08:16:09 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Mon, 9 Apr 2018 08:16:08 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 9 Apr 2018 11:16:04 -0400
Message-ID: <cover.1523286757.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/3] linux-yocto: consolidated pull request
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
X-List-Received-Date: Mon, 09 Apr 2018 15:16:10 -0000
Content-Type: text/plain

Hi all,

Given how close we are to the release, I'm staying away from -stable updates
to the linux-yocto kernels. But I do have one small patch integration and two
minor bug fixes that are worth getting in for the release.

I don't expect any issues with these .. famous last words :D

Cheers,

Bruce

The following changes since commit 29f65bda6d2c9fea4adb125c4857ee64f9312b9f:

  nativesdk-glibc: Split glibc and libcrypt to use libxcrypt instead (2018-04-07 22:34:45 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (3):
  linux-yocto/4.14: add elfutils, util-linux and openssl dependencies
  linux-yocto-tiny/4.14: fix recipe name
  linux-yocto/4.14/4.15: deterministic srcversion

 meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb   |  7 ++-
 meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb   |  4 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb |  7 ++-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.15.b  | 25 -----------
 meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb | 50 ++++++----------------
 meta/recipes-kernel/linux/linux-yocto_4.14.bb      | 21 +++++----
 meta/recipes-kernel/linux/linux-yocto_4.15.bb      | 18 ++++----
 7 files changed, 47 insertions(+), 85 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_4.15.b

-- 
2.5.0


