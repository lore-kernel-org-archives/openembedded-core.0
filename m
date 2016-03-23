Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EDBCF60125
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 15:09:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u2NF97Kv018500
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 23 Mar 2016 08:09:07 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 23 Mar 2016 08:09:05 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 23 Mar 2016 11:08:59 -0400
Message-ID: <cover.1458745322.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/5] kernel: consolidated pull request (linux-yocto-4.1 and perf)
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
X-List-Received-Date: Wed, 23 Mar 2016 15:09:09 -0000
Content-Type: text/plain

Hi all,

In this series I have two sets of backports, and one configuration change to
linux-yocto.

The config change addresses YOCTO 9269, and is as follows:

  [PATCH 1/5] linux-yocto: ktypes/standard: Add tmpfs-posix-acl feature]

    This enables the CONFIG_TMPFS_POSIX_ACL, which is wanted by things like
    systemd. We also explicitly enable the features's dependencies and
    options selected by the feature for clarity.

The backports are mainline cherry-picks, and have built safely on a number of
boards ofr me.

  [PATCH 2/5] linux-yocto/4.1: device property : Backport device property patches
  [PATCH 3/5] linux-yocto/4.1: MFD backports

The two perf fixes are addressing some issues with the python scripts that perf
ships. They were either runtime broken (missing modules), or were generating
QA warnings. These address [YOCTO #8991] and [YOCTO #9069].

I've executed the python scripts on target, and everything looks sane!

Cheers,

Bruce

The following changes since commit 2f2f784727a1617c2b9ce0bb86730ba301238e06:

  parselogs: add new whitelist entries to address 4.4.3 issues (2016-03-22 08:54:34 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (5):
  linux-yocto: ktypes/standard: Add tmpfs-posix-acl feature
  linux-yocto/4.1: device property : Backport device property patches
  linux-yocto/4.1: MFD backports
  perf: fix python scripts QA errors
  perf: package python modules into perf-python

 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 16 ++++++++--------
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      |  2 +-
 meta/recipes-kernel/perf/perf.bb                  | 10 ++++++++--
 7 files changed, 21 insertions(+), 15 deletions(-)

-- 
2.5.0


