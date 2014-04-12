Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BE39C65D9E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Apr 2014 04:10:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s3C4AQBW021980
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 11 Apr 2014 21:10:26 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Fri, 11 Apr 2014 21:10:25 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sat, 12 Apr 2014 00:10:10 -0400
Message-ID: <cover.1397275530.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] linux-yocto/3.14: aufs, edgerouter and -rt
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
X-List-Received-Date: Sat, 12 Apr 2014 04:10:27 -0000
Content-Type: text/plain

Richard,

Stemming from a thread about defconfigs not being applied, I realized that
in my final integration of aufs the patch which actually linked it into 
the kernel build was dropped. As such, it hasn't been building for the
past week or so.

I've restored that patch, and built for all arches, so aufs is active again.

We also have a minor config update to get rid of a warning that was reported
with the RTC in the edgerouter during boot.

And finally, we got lucky and a 3.14 -rt was released today. The changes
are completely isolated on the preempt-rt/* branches and cannot impact
any existing BSPs. So there's no reason to not merge them, and introduce
the 3.14 variant of the recipe. I've already built and booted -rt on 
the qemu boards, so it is sane and ready to go.

Cheers,

Bruce

The following changes since commit e63348fb8cc827d0472981e80e9884ceaafc9ffd:

  ref-manual: Edits to DISK_SIGNATURE variable. (2014-04-11 18:22:51 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (1):
  linux-yocto/3.14: aufs, edgerouter config and -rt

 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   | 27 ++++++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 16 ++++++-------
 3 files changed, 37 insertions(+), 10 deletions(-)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb

-- 
1.8.1.2


