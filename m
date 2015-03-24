Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 93D4E73B9F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Mar 2015 18:57:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t2OIvsFN027232
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 24 Mar 2015 11:57:54 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 24 Mar 2015 11:57:54 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 24 Mar 2015 14:57:48 -0400
Message-ID: <cover.1427222980.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/5] linux-yocto: consolidated pull request
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
X-List-Received-Date: Tue, 24 Mar 2015 18:57:55 -0000
Content-Type: text/plain

Hi all,

Here is the latest linux-yocto consolidated pull request. It is a mix of
kernel version -stable imports (CVEs and fixes), kernel configuration 
changes, a documentation update and kernel configuration enhancement.

The -stable updates are routine, and I build/boot tested them here
(with my fixup commits being evidence). These are ready for a round of
autobuilder/soak testing.

The only other change is the addition of the ability to use a defconfig
that is maintained within a kernel tree. This enhacement request came
from the raspberrypi2 maintainers. We went through a few revisions and
test cycles on this (see YOCTO: 7474 for the details). 

The final result has no impact on existing configuration workflows, but
does allow an in-tree config to be copied out into WORKDIR and then
incorporated with other fragments as part of kconfig processing. A new
variable is introduced for specifying the defconfig KBUILD_DEFCONFIG,
and I'll work with Scott to make sure this is documented in the 
appropriate locations.

Cheers,

Bruce


The following changes since commit 369932178fe9e7aa4a6d0e2ef1e2e539be701d02:

  yocto-bsp: Update templates to 3.19 kernel (2015-03-24 10:06:03 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (5):
  kernel-yocto: allow in-tree defconfigs
  linux-yocto/3.19: configuration updates and stable import
  linux-yocto/3.14: integrate korg stable and meta data changes
  linux-yocto/3.19: fixes for Intel core warnings
  skeleton: clarify linux-yocto-custom workflow

 .../recipes-kernel/linux/linux-yocto-custom.bb     |  6 ++--
 meta/classes/kernel-yocto.bbclass                  | 39 ++++++++++++++++++++--
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |  8 ++---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |  6 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 20 +++++------
 meta/recipes-kernel/linux/linux-yocto_3.19.bb      | 20 +++++------
 7 files changed, 69 insertions(+), 36 deletions(-)

-- 
2.1.0


