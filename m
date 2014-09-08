Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B41847117C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Sep 2014 19:55:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s88JtZt4027414
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 8 Sep 2014 12:55:37 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 8 Sep 2014 12:55:34 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 8 Sep 2014 15:55:20 -0400
Message-ID: <cover.1410205901.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/7] linux-yocto*: consolidated pull request
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
X-List-Received-Date: Mon, 08 Sep 2014 19:55:49 -0000
Content-Type: text/plain

Richard/Saul,

Here's the next round of linux-yocto* changes for the 1.7 release. The 
notable update here, is the introduction of the 3.17-rcX kernel via both
linux-yoct-dev and a named recipe (which uses the same -dev tree for
now).

I've built and booted all the qemu BSPs on this tree, using the kernel-dev
image type. 

The fixes required from that testing are the lttng and perf commits. I'll
drop the perf commit once a fix is available via the upstream kernel. I 
tested both the perf and lttng updates on older and newer kernels without
any issues.

I'm on the road for the next three days, but wanted to get this out for
a preview before being a bit unresponsive, and to let others apply and build
these if they want.

I've done my best here, but I expect we'll find something in the broader
testing.

Cheers,

Bruce

The following changes since commit 1894522f357fdf0b6adb2dcc14f12817628596bd:

  bitbake: tinfoil: add a means of enabling variable history tracking (2014-09-05 10:14:25 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (7):
  linux-yocto/3.10: baytrail i/o updates
  lttng-modules: fix compilation for 3.17-rcX
  perf: fix v3.17 powerpc compilation issues
  linux-yocto: introduce v3.17
  linux-yocto/3.10: update valleyisland-io merge branch
  linux-yocto/3.14: configuration updates and feature merges.
  linux-yocto-dev: bump to v3.17+

 meta/recipes-kernel/linux/linux-yocto-dev.bb       |   2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |   6 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |   6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |   4 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |   4 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb |  21 ++++
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      |  16 +--
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      |  16 +--
 meta/recipes-kernel/linux/linux-yocto_3.17.bb      |  37 ++++++
 ...probes-should-calculate-alignment-and-eve.patch | 127 +++++++++++++++++++++
 ...e-kvm-instrumentation-compile-on-3.17-rc1.patch |  43 +++++++
 .../Update-statedump-to-3.17-nsproxy-locking.patch |  67 +++++++++++
 meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb   |   3 +
 meta/recipes-kernel/perf/perf.bb                   |   5 +
 14 files changed, 330 insertions(+), 27 deletions(-)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto_3.17.bb
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/Fix-noargs-probes-should-calculate-alignment-and-eve.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/Update-kvm-instrumentation-compile-on-3.17-rc1.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/Update-statedump-to-3.17-nsproxy-locking.patch

-- 
1.8.1.2


