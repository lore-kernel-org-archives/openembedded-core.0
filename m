Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E9F8160620
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2016 01:08:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u9J18JsC002725
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 18 Oct 2016 18:08:19 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 18 Oct 2016 18:08:18 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 18 Oct 2016 21:08:16 -0400
Message-ID: <cover.1476839114.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/2] kernel-yocto: (small) consolidated pull request
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
X-List-Received-Date: Wed, 19 Oct 2016 01:08:21 -0000
Content-Type: text/plain

Hi all,

Here are two patches that I've been carrying that are safe for the
2.2 release. I have other patches/fixes and -stable updates in my
queue, but I'm going to hold them back until after the release in
the name of stability.

We have one configuration cleanup patch, and a kern tools change
to allow patches with things like () ;, etc in their names (I
ran into this when refreshing the preempt-rt series today and it
has patches with () in their name.

Cheers,

Bruce

The following changes since commit 4b94b498e21aeba945fe7e72a6b7c4bb0314fb83:

  bitbake: toaster: Update default release to Morty (2016-10-15 13:21:54 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (2):
  linux-yocto/4.4/4.8: kernel config warning cleanups
  kern-tools: make patches with shell-unsafe characters valid

 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb         | 2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb         | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb       | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb       | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.4.bb            | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.8.bb            | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

-- 
2.5.0


