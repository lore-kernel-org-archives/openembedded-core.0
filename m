Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DE52F6FEFA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 12:25:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u2UCP8IJ006943
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 05:25:09 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 30 Mar 2016 05:25:08 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Mar 2016 08:24:58 -0400
Message-ID: <cover.1459340441.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Subject: [PATCH 0/9] linux-yocto: consolidated pull request
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
X-List-Received-Date: Wed, 30 Mar 2016 12:25:12 -0000
Content-Type: text/plain

Hi all,

This series is largely a collection of mainline backports to add support for
Borxton/Apollo Lake. I've kept the commit separate on purpose, since we
need the SRCREV granularity to bisect if there are any issues.

The changes have cleanly cherry-picked, are mainline and have passed my sanity
builds. I see yet more backports in my incoming queue today, but getting these
out first has to happen.

Other than those backports, there's one minor configuration tweak for qemuarm64,
and a feature fragment to allow overlayfs to be used similarly to how aufs was
used in the past.

Cheers,

Bruce

The following changes since commit 1ca71e5178ed8514655524f714877e02f6db90af:

  bitbake: cooker: Ensure bbappend order is deterministic (2016-03-30 12:01:29 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (9):
  linux-yocto/4.1: SMBus/iTCO backports
  linux-yocto/qemuarm64: enable 32 bit compatibility
  linux-yocto/4.1: device property backports
  linux-yocto/4.1: i2c: designware: Backport i2c patches
  linux-yocto/4.1: Apollo Lake/Broxton mmc backports
  linux-yocto/4.1: Intel Broxton: pwm backports
  linux-yocto/4.4: drm/i915/skl: Fix DMC load on Skylake J0 and K0
  linux-yocto/4.4: broxton and usb type-c backports
  linux-yocto: add overlayfs feature

 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 16 ++++++++--------
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 18 +++++++++---------
 6 files changed, 23 insertions(+), 23 deletions(-)

-- 
2.5.0


