Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7BEDE70149
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 17:53:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u44HrG8v012608
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 4 May 2016 10:53:16 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 4 May 2016 10:53:15 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 4 May 2016 13:53:03 -0400
Message-ID: <cover.1462383941.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 00/11][master][krogoth] kernel-yocto: consolidated pull request
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
X-List-Received-Date: Wed, 04 May 2016 17:53:18 -0000
Content-Type: text/plain

Hi all,

The following is a consolidated set of changes for the 4.1, 4.4 linux-yocto
kernel, as well as the kern-tools.

All of these are bug fixes, minor configuration changes or -stable updates.
I've had most of them queued since before the 2.1 release, but was waiting
for the dust to settle before sending them out.

These are all appropriate for master and krogoth.

Build (and boot) tested on qemu*, all arches.

Bruce

The following changes since commit f7b520878babbaa7527151f22c031ae160512753:

  poky: Switch to post release name/version (2016-04-29 07:58:46 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (11):
  linux-yocto/uvesafb: print error message when task timeout occurs
  linux-yocto/4.4: sched/cgroup: Fix/cleanup cgroup teardown/init
  kern-tools: handle directories with, or without, trailing /
  kernel-yocto: allow branch auditing to be suspended
  linux-yocto/4.1: update to v4.1.22
  linux-yocto/4.1: make ltsi content available
  linux-yocto/4.4: BXT mmc fixes + PUNIT, tubropower, and telemetry
    backport
  linux-yocto/4.4: skylake configuration
  linux-yocto/4.4: broxton enablement and refactoring
  linux-yocto/4.4: bump to v4.4.8
  linux-yocto-rt/4.1: update to rt23

 meta/classes/kernel-yocto.bbclass                  | 23 +++++++++++++---------
 .../kern-tools/kern-tools-native_git.bb            |  2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb    |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb    |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb  |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb  |  4 ++--
 meta/recipes-kernel/linux/linux-yocto.inc          |  1 +
 meta/recipes-kernel/linux/linux-yocto_4.1.bb       | 20 +++++++++----------
 meta/recipes-kernel/linux/linux-yocto_4.4.bb       | 18 ++++++++---------
 9 files changed, 45 insertions(+), 39 deletions(-)

-- 
2.5.0


