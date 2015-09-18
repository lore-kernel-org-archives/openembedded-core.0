Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0A63C73243
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 19:21:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8IJLdlo012818
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 18 Sep 2015 12:21:39 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Fri, 18 Sep 2015 12:21:38 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 18 Sep 2015 15:21:36 -0400
Message-ID: <cover.1442603150.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/2] linux-yocto: consolidated pull request
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
X-List-Received-Date: Fri, 18 Sep 2015 19:21:43 -0000
Content-Type: text/plain

Hi all,

It's a rather small 'consolidated' pull request, but there are some other
fixes I'm working on that I just couldn't get done in time for this 
request .. so I'm not going to sit on these two any longer.

The changes to 4.1 are patches we've received to fix the build of some
filsystems (yaffs2, aufs) for the updated kernel, as well as some bluetooth
and driver support changes.

Note: the kern-tools update is required for the linux-4.1 update to work

The changes to the tools address YOCTO #7282, as well as speeding up
the overall patch process. The change is simple, the tools no longer
audit the series to ensure that you are building every patch that is
referenced in the series. They now only consider patches that are 
in addition to the changes that are part of the tree's meta data ..
i.e. patches that are in the SRC_URI.  That removes significant looping
and validation, as well unexpected resume points and 'skipped' patches.

Cheers,

Bruce

The following changes since commit 5b4e380b9b4335f4607d78d97345bbbda4c66e0e:

  bitbake: data_smart: Ensure OVERRIDES dependencies account for contains() (2015-09-18 15:14:04 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (2):
  linux-yocto/4.1: aufs, yaffs2 and driver fixes
  kern-tools: optimize patching peformance

 .../recipes-kernel/kern-tools/kern-tools-native_git.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb        |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb      |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_4.1.bb           | 18 +++++++++---------
 4 files changed, 14 insertions(+), 14 deletions(-)

-- 
2.1.0


