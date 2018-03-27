Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 39BE071A82
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 15:03:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w2RF3KgQ016092
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 27 Mar 2018 08:03:20 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Tue, 27 Mar 2018 08:03:20 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 27 Mar 2018 11:03:12 -0400
Message-ID: <cover.1522162765.git.bruce.ashfield@windriver.com>
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
X-List-Received-Date: Tue, 27 Mar 2018 15:03:21 -0000
Content-Type: text/plain

Hi all,

This pull request is a series of -stable updates (more Spectre/meltdown
included), and some fixes for the fsl_mpc h/w reference board that will
allow us to update the reference to v4.14+.

We also have a configuration tweak to the wifi fragments, which will
result in more reuse, but won't impact the default configurations.

Note: I haven't included the re-written kernel-devsrc changes, since
I've never been able to reproduce the multilib issue with the ssl
dependency. The devsrc changes will have to be looked at after the
release.

Cheers,

Bruce

The following changes since commit 80c7ca2c28959d08a59d960d318d8360392bd488:

  kernel-dev: Clean up of "bsp_name" placeholder. (2018-03-25 09:41:13 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (7):
  linux-yocto/4.12: update to v4.12.21
  mpc8315e-rdb: fix broken ethernet
  linux-yocto/4.12: add ssl and utils native dependencies
  linux-yocto/meta: improve wifi driver granularity
  linux-yocto/4.12: intel-socfpga, intel-pmc-core and ish support for
    CoffeeLake board
  linux-yocto/4.14: update to v4.14.30
  linux-yocto/4.15: update to v4.15.13

 meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.12.bb      | 22 ++++++++++++----------
 meta/recipes-kernel/linux/linux-yocto_4.14.bb      | 20 ++++++++++----------
 meta/recipes-kernel/linux/linux-yocto_4.15.bb      | 20 ++++++++++----------
 9 files changed, 50 insertions(+), 48 deletions(-)

-- 
2.5.0


