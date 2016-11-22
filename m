Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 59DC5600B3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 15:59:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uAMFx1O6017262
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 22 Nov 2016 07:59:02 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 22 Nov 2016 07:59:01 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 22 Nov 2016 10:58:53 -0500
Message-ID: <cover.1479830169.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/7] linux-yocto: consolidated pull request
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
X-List-Received-Date: Tue, 22 Nov 2016 15:59:02 -0000
Content-Type: text/plain

Hi all,

I sent some of these previously, but I kept them in this pull request since
the changes are all incremental.

New in this pull request are 4.8.10 and the introduction of 4.9-rcX as the
linux-yocto-dev kernel.

Bruce

The following changes since commit 7c3a47ed8965c3a3eb90a9a4678d5caedbba6337:

  bitbake: toaster: settings set ALLOWED_HOSTS to * in debug mode (2016-11-16 11:38:44 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (7):
  linux-yocto/4.8: fix cryptodev compilation error
  linux-yocto/4.8: update to v4.8.6-rt5
  linux-yocto/4.8: update from v4.8.6 -> v4.8.8
  linux-yocto/4.4: update to v4.4.32
  linux-yocto/4.8: update to v4.8.10
  linux-yocto-dev: update to 4.9-rcX
  kern-tools: error checking and tree generation fixes

 .../kern-tools/kern-tools-native_git.bb              |  2 +-
 meta/recipes-kernel/linux/linux-yocto-dev.bb         |  2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb      |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb      |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb    |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb    |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.4.bb         | 20 ++++++++++----------
 meta/recipes-kernel/linux/linux-yocto_4.8.bb         | 20 ++++++++++----------
 8 files changed, 34 insertions(+), 34 deletions(-)

-- 
2.5.0


