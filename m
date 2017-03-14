Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3DA03776D5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 13:31:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v2EDVKfb009270
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 14 Mar 2017 06:31:20 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 14 Mar 2017 06:31:19 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 14 Mar 2017 09:31:11 -0400
Message-ID: <cover.1489498044.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/7] linux-yocto: kernel version bumps
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
X-List-Received-Date: Tue, 14 Mar 2017 13:31:26 -0000
Content-Type: text/plain

Hi all,

This is my queue of version bumps, -rt integrations and configuration changes.
I've built and booted the various kernel variants, but the matrix is fairly large
for this number of updates :D

Note: I'm also preparing to remove 4.8 from the tree, and will follow up with
that shortly. It appears that 4.1, 4.4 and 4.9 have users .. so we'll be
going with a larger than normal number of kernels for this upcoming release.
I'm hoping to get it back down to three versions for the fall release.

Cheers,

Bruce

The following changes since commit b1f09df0f664052e39d939b759a63b05d767b8ec:

  bitbake: ConfHandler: Use the same regular expression for all variable names (2017-03-13 09:43:40 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (7):
  linux-yocto/4.9: bump to v4.9.13
  linux-yocto/4.10: update to v4.10.1
  linux-yocto/4.9: integrate -rt9
  linux-yocto/4.9/4.10: add Intel Memory Protection Extensions
  linux-yocto/4.10: update to v4.10.2
  linux-yocto/4.4: update to v4.4.53
  linux-yocto/4.1: update to v4.1.38

 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb    |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb    |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb    |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb  |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb  |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb  |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.1.bb       | 20 ++++++++++----------
 meta/recipes-kernel/linux/linux-yocto_4.10.bb      | 20 ++++++++++----------
 meta/recipes-kernel/linux/linux-yocto_4.4.bb       | 20 ++++++++++----------
 meta/recipes-kernel/linux/linux-yocto_4.9.bb       | 20 ++++++++++----------
 12 files changed, 64 insertions(+), 64 deletions(-)

-- 
2.5.0


