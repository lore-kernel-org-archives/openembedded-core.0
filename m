Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 98ADB6080F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jul 2016 18:39:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u67IdApP004931
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 7 Jul 2016 11:39:10 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Thu, 7 Jul 2016 11:39:10 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 7 Jul 2016 14:39:03 -0400
Message-ID: <cover.1467916601.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/6] linux-yocto: consolidated pull request
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
X-List-Received-Date: Thu, 07 Jul 2016 18:39:13 -0000
Content-Type: text/plain

Hi all,

Here is the latest consolidated set of linux yocto 4.1 and 4.4
kernel changes.

We have two korg -stable updates (4.1.27 and 4.4.14), as well as
mainline feature backports. (linux-yocto-dev is now on 4.7-rc6
for anyone that cares).

Sanity and smoke testing have passed in my test builds.

Cheers,

Bruce

The following changes since commit 4e889c04ba518dac492c193224a790a877f43f40:

  scripts/lib/bsp/help.py: Changed help of yocto-bsp to match latest syntax (2016-07-07 13:38:13 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (6):
  linux-yocto/4.1/4.4: x86, power and usb-c mainline backports
  linux-yocto/4.1/4.1: mei, usb and extcon changes
  linux-yocto/4.4: cpumask: Export cpumask_any_but()
  linux-yocto/config: mei, gpio and usb type c
  linux-yocto/4.1: update to 4.1.27
  linux-yocto/4.4: update to v4.4.14

 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 20 ++++++++++----------
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 20 ++++++++++----------
 6 files changed, 31 insertions(+), 31 deletions(-)

-- 
2.5.0


