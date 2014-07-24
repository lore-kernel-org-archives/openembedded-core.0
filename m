Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 82A767078D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 20:42:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6OKgCIV001356
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 24 Jul 2014 13:42:13 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 24 Jul 2014 13:42:12 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 24 Jul 2014 16:41:46 -0400
Message-ID: <cover.1406234258.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/8] kernel: linux-yocto 3.14, linux-yocto-dev 3.16 and dependencies
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
X-List-Received-Date: Thu, 24 Jul 2014 20:42:19 -0000
Content-Type: text/plain

Richard/Saul,

Here are my consolidated changes for kernel updates.

For 3.14:

  linux-yocto/3.14: vexpress and MVM firmware support                                                                                                                               
  linux-yocto: x86_64: expand kernel stack to 16K                                                                                                                                   
  linux-yocto/3.14: libata and generic CPU modalias handling                                                                                                                        

For linux-yocto-dev:

  linux-yocto-dev: bump to v3.16+                                                                                                                                                   
  lttng-modules: update to 2.5.0                                                                                                                                                    
  kernel: don't copy .so.dbg files into kernel source install                                                                                                                       
  kern-tools: adjust to full history meta-data                                                                                                                                      

And for lttng on ARM:

  lttng-modules: re-enable ARM builds                                                                                                                                               

I've built and booted 3.16 on all the architectures, and also build my
kernel-dev image type (which includes package that often break with
kernel updates, and which I'll submit to oe-core separately). That's
where the .so.db change for kernel.bbclass and the lttng update 
have come from.

Cheers,

Bruce

The following changes since commit 8b7116d25ed6255a03895d835e5a0560858ab496:

  bitbake: Updated the the example 'bitbake -h' output to match the actual output, which has been recently patched to fix the '-S SIGNATURE_HANDLER, --dump-signatures=SIGNATURE_HANDLER' option. (2014-07-22 08:33:25 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (8):
  linux-yocto/3.14: vexpress and MVM firmware support
  lttng-modules: update to 2.5.0
  linux-yocto: x86_64: expand kernel stack to 16K
  linux-yocto-dev: bump to v3.16+
  kernel: don't copy .so.dbg files into kernel source install
  lttng-modules: re-enable ARM builds
  linux-yocto/3.14: libata and generic CPU modalias handling
  kern-tools: adjust to full history meta-data

 meta/classes/kernel.bbclass                        |  2 +-
 .../kern-tools/kern-tools-native_git.bb            |  2 +-
 meta/recipes-kernel/linux/linux-yocto-dev.bb       |  2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |  6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |  4 +-
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 16 ++---
 ...compaction-instrumentation-to-3.16-kernel.patch | 83 ++++++++++++++++++++++
 ...ate-vmscan-instrumentation-to-3.16-kernel.patch | 70 ++++++++++++++++++
 meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb   | 36 ----------
 ...tng-modules_2.4.1.bb => lttng-modules_2.5.0.bb} | 10 +--
 10 files changed, 174 insertions(+), 57 deletions(-)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/Update-compaction-instrumentation-to-3.16-kernel.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/Update-vmscan-instrumentation-to-3.16-kernel.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb
 rename meta/recipes-kernel/lttng/{lttng-modules_2.4.1.bb => lttng-modules_2.5.0.bb} (80%)

-- 
1.8.1.2


