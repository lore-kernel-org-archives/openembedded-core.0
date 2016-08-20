Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E77957711B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Aug 2016 04:30:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u7K4UaW9012903
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 19 Aug 2016 21:30:36 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Fri, 19 Aug 2016 21:30:35 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sat, 20 Aug 2016 00:30:33 -0400
Message-ID: <cover.1471667296.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/2] linux-yocto/4.1/4.4: -stable and configuration updates
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
X-List-Received-Date: Sat, 20 Aug 2016 04:30:49 -0000
Content-Type: text/plain

Hi all,

Here are the next set of -stable updates for the linux-yocto kernels. These
contain some CVE fixes that folks have been asking about, so I've queued
and sent them right away.

I built and ran qemuppc against 4.1.30 and wasn't able to see any instability,
but will continue to run stress tests.

4.4.18 was built and booted against qemu*

Cheers,

Bruce

The following changes since commit f038f069977170e323c9c6884c69e0b9e1cf1c6f:

  local.conf.sample: Disable ARM and PPC due to prelink test case failures (2016-08-19 10:23:55 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (2):
  linux-yocto/4.1/4.4: -stable updates and configuration changes
  linux-yocto/4.4: fix configuration warnings

 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 20 ++++++++++----------
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 20 ++++++++++----------
 6 files changed, 32 insertions(+), 32 deletions(-)

-- 
2.5.0


