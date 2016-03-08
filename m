Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6BE4A73172
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Mar 2016 04:34:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u284Y1fD017006
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 7 Mar 2016 20:34:01 -0800
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Mon, 7 Mar 2016 20:34:00 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 7 Mar 2016 23:33:56 -0500
Message-ID: <cover.1457411284.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/3] linux-yocto/4.4: updated pull request
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
X-List-Received-Date: Tue, 08 Mar 2016 04:34:03 -0000
Content-Type: text/plain

Hi all,

Ross pointed out that the AB found some issues with lttng when the refactored
kernel types change was included (missing modules).

I previously sent patch [linux-yocto/kernel-meta: ktype refactoring: move DEBUG_KERNEL,
EXPERT and EMBEDDED], and I've included it in this updated pull
request, but it is unchanged.

The new parts are a backport for wilwifi stability, and a patch that fixes up
the tracing configuration of the "production" kernel type.

I thought about squashing the ftrace fixup, with the refactored patch, but
keeping them separate is better in the history .. since it highlights some of
the issues when we rely on default/selected values.

Cheers,

Bruce

The following changes since commit 5ac3dc76a5afc2ed35b1abfc8e330e0c580eadf0:

  image.bbclass: fix incomplete .rootfs customization (2016-03-07 22:10:54 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (3):
  linux-yocto/kernel-meta: ktype refactoring: move DEBUG_KERNEL, EXPERT  and EMBEDDED
  linux-yocto/4.4: iwlwifi: mvm: don't allow sched scans without matches to be started
  linux-yocto/4.4: explicitly enable ftrace in tracing fragment

 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 18 +++++++++---------
 3 files changed, 13 insertions(+), 13 deletions(-)

-- 
2.5.0


