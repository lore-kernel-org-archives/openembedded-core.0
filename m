Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E193472E35
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Feb 2015 16:31:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t16GV9CA001332
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 6 Feb 2015 08:31:09 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Fri, 6 Feb 2015 08:31:08 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 6 Feb 2015 11:31:00 -0500
Message-ID: <cover.1423237494.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/8] linux-yocto: consolidated pull request
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
X-List-Received-Date: Fri, 06 Feb 2015 16:31:12 -0000
Content-Type: text/plain

Richard/Saul,

Here is my pull request for a round of -stable kernel updates, tool tweaks, and
a preview of 3.19 as the kernel for the 1.8. 

I've built core-image-sato and core-image-kernel-dev for the various kernels,
but of course more coverage is always better (which the autobuilder provides),
I don't expect anything massive to blow up .. but you never know.

I'll follow up with libc, a versioned 3.19 recipe and updates to the yocto
BSPs once this series is shown to be good.

I had to hack together the pull requests parts of this, since my git 2.1.x
is blowing up during generation, so hopefully the commits and banch are
clear.

Cheers,

Bruce

--------------------------------

The following changes since commit 1f53edeaf9ea59dd55459a6d5a93829fb4983839:

  libtool: avoid running automake/autoconf --version (2015-02-05 09:46:11 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel-dev

for you to fetch changes up to 985259afe58317d3ab0146979207f73d7670db29:

  kern-tools: import patch performance improvements (2015-02-05 15:51:02 -0500)

----------------------------------------------------------------
Bruce Ashfield (8):
  kernel-dev: install all modules by default
  linux-yocto/3.14: update to 3.14.29
  linux-yocto/3.10: update to v3.10.65
  linux-yocto/3.17: update to v3.17.8
  linux-yocto: basic octeon III support
  lttng: update to 2.6.0-stable
  linux-yocto-dev: update to v3.19+
  kern-tools: import patch performance improvements

 .../images/core-image-kernel-dev.bb                |   2 +-
 .../kern-tools/kern-tools-native_git.bb            |   2 +-
 meta/recipes-kernel/linux/linux-yocto-dev.bb       |   2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |   8 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |   8 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |   6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |   6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb |   6 +-
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      |  18 +--
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      |  20 ++--
 meta/recipes-kernel/linux/linux-yocto_3.17.bb      |  20 ++--
 ...probes-should-calculate-alignment-and-eve.patch | 130 ---------------------
 ...e-kvm-instrumentation-compile-on-3.17-rc1.patch |  46 --------
 ...modules-replace-KERNELDIR-with-KERNEL_SRC.patch |  35 ++----
 ...tng-modules_2.5.2.bb => lttng-modules_2.6.0.bb} |   6 +-
 15 files changed, 61 insertions(+), 254 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/Fix-noargs-probes-should-calculate-alignment-and-eve.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/Update-kvm-instrumentation-compile-on-3.17-rc1.patch
 rename meta/recipes-kernel/lttng/{lttng-modules_2.5.2.bb => lttng-modules_2.6.0.bb} (85%)

-- 
2.1.0


