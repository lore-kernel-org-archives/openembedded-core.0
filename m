Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D266F728CB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 19:08:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t4LJ8wtO025019
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 21 May 2015 12:08:58 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Thu, 21 May 2015 12:08:58 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 21 May 2015 15:08:50 -0400
Message-ID: <cover.1432235097.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
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
X-List-Received-Date: Thu, 21 May 2015 19:09:02 -0000
Content-Type: text/plain

Richard,

This pull request covers configuration and BSP fixes that I've been 
gathering for 3.19 and 3.14.

There are two minor Yocto bug fixes as well:

  linux-yocto-custom: clarify bbappend versus copy in comments
  linux-yocto: drop suggestion of devshell for patch failures

This doesn't contain the 3.14 or 3.19 gcc5 changes, since mips is 
being problematic and the other changes are tied to that arch 
getting sorted out.

Cheers,

Bruce

The following changes since commit 16caaabfcc678b03a0cd88aaeac15f9b8d1c3dad:

  bitbake: bitbake-user-manual-customization.xsl: Pointing to mirrors for XSL files. (2015-05-19 22:09:36 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (7):
  linux-yocto/3.14: cavium and configuration changes
  linux-yocto/3.19: braswell DRM/i915 Graphics fixes
  linux-yocto-custom: clarify bbappend versus copy in comments
  linux-yocto: drop suggestion of devshell for patch failures
  linux-yocto/3.19: Braswell DRM fixes
  linux-yocto/3.19: CONFIG_ATA_BMDMA and gcc5 ARM64
  linux-yocto/3.19: NFC config, Braswell fixes and axxia support

 .../recipes-kernel/linux/linux-yocto-custom.bb         | 10 +++++-----
 meta/classes/kernel-yocto.bbclass                      |  2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb       |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb     |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb     |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_3.14.bb          | 18 +++++++++---------
 meta/recipes-kernel/linux/linux-yocto_3.19.bb          | 18 +++++++++---------
 7 files changed, 31 insertions(+), 31 deletions(-)

-- 
2.1.0


