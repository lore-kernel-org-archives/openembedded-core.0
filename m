Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AD2B071A32
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 20:10:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v4QKAlDt011906
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 26 May 2017 13:10:48 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Fri, 26 May 2017 13:10:47 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 26 May 2017 16:10:43 -0400
Message-ID: <cover.1495829213.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/3] kernel-yocto: configuration changes/fragments
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
X-List-Received-Date: Fri, 26 May 2017 20:10:49 -0000
Content-Type: text/plain

Hi all,

Just a small pull request to tweak some configuration items in the
kernel meta data.

The first two are configuration warning fixes, and the virtualbox
fragment are the options that Khem had previous sent to allow XFCE
to run under virtualization.

I haven't enabled the virtualbox fragment universally as Khem had
proposed, since it does add DRM and FB as built in options .. which
are not universally required. If there's demand, I can easily include
options like that by default, but I'm holding off for now. In the
mean time, the options can be added via KERNEL_FEATURES.

Cheers,

Bruce

The following changes since commit 5eed6c644f715783edb0d05926373e719442dd6a:

  libpcap: add native package (2017-05-25 23:59:32 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (3):
  linux-yocto/meta: bluetooth: Adds BT_BREDR and BT_LE, which are needed
    as dependencies
  linux-yocto/meta: smp: Add config X86_BIGSMP since its needed when
    NR_CPUS > 8
  kernel/meta: add virtualbox configuration fragment

 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb    | 2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb    | 2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb    | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb  | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb  | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb  | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb       | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.10.bb      | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.4.bb       | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.9.bb       | 2 +-
 12 files changed, 12 insertions(+), 12 deletions(-)

-- 
2.5.0


