Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id ADA1B65CD0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 May 2015 01:34:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t411YLts005778
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 30 Apr 2015 18:34:21 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Thu, 30 Apr 2015 18:34:21 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 30 Apr 2015 21:34:15 -0400
Message-ID: <cover.1430443583.git.bruce.ashfield@windriver.com>
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
X-List-Received-Date: Fri, 01 May 2015 01:34:23 -0000
Content-Type: text/plain

Here is the latest consolidated pull request for the supported linux-yocto
kernels.

 - We have a refresh of the 3.14-rt support
 - bluetooh configuration changes for common-pc/qemux86
 - braswell BSP features and fixes
 - Introduction of the 4.1-rc1 -dev kernel (and associated perf fix).

I've built and booted these on my local machines and qemu, and
everything was sane.

The -dev kernel obviously isn't something for deployment yet, but
it builds, and forms the base for follow up config changes, features
and development work. I built and booted core-image-kernel dev with
the 4.1 changes in place.

Cheers,

Bruce

The following changes since commit db409697db2ea0931cdcd2015d089b6b0ea39bbb:

  bitbake: bitbake: reset build mtime cache before the build (2015-04-29 10:59:54 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (5):
  linux-yocto/3.14: refresh -rt support
  linux-yocto: add core bluetooth support to qemux86* and common-pc*
  linux-yocto/3.19: Braswell support and bug fixes
  perf: fix build (and feature tests) for 4.1-rcX
  linux-yocto-dev: introduce 4.1-rc development kernel

 meta/recipes-kernel/linux/linux-yocto-dev.bb       |  2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 18 +++++++++---------
 meta/recipes-kernel/linux/linux-yocto_3.19.bb      | 18 +++++++++---------
 meta/recipes-kernel/perf/perf.bb                   |  3 +++
 7 files changed, 29 insertions(+), 26 deletions(-)

-- 
2.1.0


