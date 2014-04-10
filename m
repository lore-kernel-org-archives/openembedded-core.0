Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id ABFAB65E85
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Apr 2014 15:12:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s3AFCnbj002828
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 10 Apr 2014 08:12:49 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 10 Apr 2014 08:12:48 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 10 Apr 2014 11:12:30 -0400
Message-ID: <cover.1397142033.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/6] linux-yocto/3.4/3.10/3.14: updates
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
X-List-Received-Date: Thu, 10 Apr 2014 15:12:52 -0000
Content-Type: text/plain

Richard,

While we are working throught he -rc releases, I've been sitting
on korg -stable updates and as many changes I can .. since I know we
don't want any destabilization.

What I've collected here is pretty much the minimum set of updates
that I could gather. 

They are config udpates that won't globally impact BSPs, or are 
-stable updates that contain important fixes for booting a few boards.
Everything else, I have queued for post 1.6.

Cheers,

Bruce

The following changes since commit db80f796e78746014a0f9497638e5c6fd2953ef0:

  README.hardware: update with Texas Instruments Beaglebone instructions (2014-04-10 10:13:55 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (6):
  linux-yocto/3.10: v3.10.35 and emenlow boot fixes
  linux-yocto/3.4: update to v3.4.85
  linux-yocto/3.10: intel-common: Add preempt-rt ktype targets
  linux-yocto/3.14: intel configuration fixes
  linux-yocto/3.14: beagleboard black: USB, DRM config tweaks
  linux-yocto/3.10: intel BSP configuration updates

 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb    |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb  |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 18 +++++++++---------
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      |  2 +-
 meta/recipes-kernel/linux/linux-yocto_3.4.bb       | 16 ++++++++--------
 8 files changed, 33 insertions(+), 33 deletions(-)

-- 
1.8.1.2


