Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E6A2970022
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Sep 2016 01:08:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u8818pmS022083
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 7 Sep 2016 18:08:51 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 7 Sep 2016 18:08:50 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 7 Sep 2016 21:08:44 -0400
Message-ID: <cover.1473296553.git.bruce.ashfield@windriver.com>
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
X-List-Received-Date: Thu, 08 Sep 2016 01:08:54 -0000
Content-Type: text/plain

Hi all,

Here are some fixes for the minor issues cased by the kern-tools update
and the recent 4.8 kernel introduction.

RP reported a build and footprint time increase for 4.8, that was due to
some missing kernel meta data that (re)enabled DEBUG and for the standard
kernel. commit [kernel-yocto: restore missing configuration meta data]
deals with that issue.

The commits:

  kernel-yocto: restore kernel-meta data detection for SRC_URI elements
  kernel-yocto: allow --allnoconfig and --alldefconfig as KCONFIG_MODES

Fix some issues with the compatibility of existing layers and config
fragment users. I was luckily able to fix the issues without bringing
the complexity that I was removing.

There's a small change to uvesafb to have a longer timeout on some
machines (or virtual machines) to avoid issues when performing QA
testing.

And finally, we have the 4.8-rc5 content update. I'll do one of these
a week until we get to the full 4.8 release. This can be pended for
the M3 build, but it did pass my local sanity testing.

Cheers,

Bruce

The following changes since commit ce4ea7a730a7bec257218533b7c1fcb31134e25b:

  recipetool: create: avoid extra blank lines in output recipe (2016-09-08 00:36:49 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (5):
  kernel-yocto: restore kernel-meta data detection for SRC_URI elements
  kernel-yocto: allow --allnoconfig and --alldefconfig as KCONFIG_MODES
  kernel-yocto: restore missing configuration meta data
  linux-yocto: update to 4.8-rc5
  linux-yocto/4.4/4.8: uvesafb: provide option to specify timeout for
    task completion

 meta/classes/kernel-yocto.bbclass                 | 15 ++++++++++-----
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 18 +++++++++---------
 meta/recipes-kernel/linux/linux-yocto_4.8.bb      | 18 +++++++++---------
 7 files changed, 36 insertions(+), 31 deletions(-)

-- 
2.5.0


