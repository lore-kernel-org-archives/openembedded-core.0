Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F04F865F28
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 May 2014 15:08:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s45EAEMr016784
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 5 May 2014 07:10:14 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Mon, 5 May 2014 07:10:13 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 5 May 2014 10:10:06 -0400
Message-ID: <cover.1399297986.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/6] linux-yocto: consolidated pull request
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
X-List-Received-Date: Mon, 05 May 2014 15:08:26 -0000
Content-Type: text/plain

Richard/Saul,

Here's a consolidated pull request for kernel updates and small fixes
that I've queued since the 1.6 release.

The quoting issue was reporting on the mailing list, and I realized
that my fix for it had never been sent, so I dusted it off and here
it is. 

As a side effect of that fix, and the fact that there's no way to tell
between a full defconfig and a saved alldefconfig by inspection .. that
offering some guidance in the example custom recipe would be nice.

Everything else is are the -stable and SRCREV updates.

Cheers,

Bruce

The following changes since commit 7b78c364b7de901f97cd8dbe56d5e02f545bf3d3:

  cleanup-workdir: Fix crosssdk reference after addition of PN (2014-05-05 09:05:42 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (6):
  kernel-yocto: quote kconfig mode check
  linux-yocto-custom: provide defconfig guidance
  linux-yocto/3.4: update to v3.4.88
  linux-yocto/3.10: update to v3.10.38
  linux-yocto/3.14: update to v3.14.2
  linux-yocto/3.10: mei.cfg: enable Intel chipsets

 .../recipes-kernel/linux/linux-yocto-custom.bb         | 10 ++++++++++
 meta/classes/kernel-yocto.bbclass                      |  2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb       |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb       |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb        |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb     |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb     |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb      |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.10.bb          | 18 +++++++++---------
 meta/recipes-kernel/linux/linux-yocto_3.14.bb          | 18 +++++++++---------
 meta/recipes-kernel/linux/linux-yocto_3.4.bb           | 16 ++++++++--------
 11 files changed, 58 insertions(+), 48 deletions(-)

-- 
1.8.1.2


