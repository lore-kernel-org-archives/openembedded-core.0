Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D200B719D7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 14:24:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uAGEOagv021740
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 16 Nov 2016 06:24:36 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 16 Nov 2016 06:24:35 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 16 Nov 2016 09:24:30 -0500
Message-ID: <cover.1479306112.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/5] kernel-yocto: consolidated pull request
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
X-List-Received-Date: Wed, 16 Nov 2016 14:24:37 -0000
Content-Type: text/plain

Hi all,

Here is my latest set of updates to the 4.8/4.4 kernels, as well as a couple
of bug fixes to the tools.

I've included short log summaries of the changes that come with the -stable
updates in the commits themselves.

Also of note, now that 4.9 is in the latter part of the -rc cycle, I'll bring
linux-yocto-dev up to date with it, and create a versioned recipe for it, so
it can be the LTS kernel in the 2.3 release.

Cheers,

Bruce

The following changes since commit 9b1bd29ea99aa0dec51e603e4ac28e211af19765:

  maintainers.inc: remove libwnck3 recipe (2016-11-15 15:19:55 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (5):
  linux-yocto/4.8: fix cryptodev compilation error
  linux-yocto/4.8: update to v4.8.6-rt5
  linux-yocto/4.8: update from v4.8.6 -> v4.8.8
  linux-yocto/4.4: update to v4.4.32
  kern-tools: error checking and tree generation fixes

 .../kern-tools/kern-tools-native_git.bb              |  2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb      |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb      |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb    |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb    |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.4.bb         | 20 ++++++++++----------
 meta/recipes-kernel/linux/linux-yocto_4.8.bb         | 20 ++++++++++----------
 7 files changed, 33 insertions(+), 33 deletions(-)

-- 
2.5.0


