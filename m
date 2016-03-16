Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5379C73178
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Mar 2016 16:48:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u2GGmMw0025174
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 16 Mar 2016 09:48:22 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 16 Mar 2016 09:48:21 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 16 Mar 2016 12:48:16 -0400
Message-ID: <cover.1458146315.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/5] linux-yocto/4.1: consolidated pull request
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
X-List-Received-Date: Wed, 16 Mar 2016 16:48:27 -0000
Content-Type: text/plain

Hi all,

This is the consolidated pull request for the 4.1 yocto kernel tree. There's
one build fix: [linux-yocto/4.1: usb: add usb_otg_caps to usb_gadget structure.],
and the others are feature backports for BSP support.

I've built 4.1 for x86, ppc and ARM.

Bruce

The following changes since commit 8debfea81e69d038bd2d56314b272cb74f5582ed:

  local.conf.sample: Disable prelink by default (2016-03-13 22:09:05 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (5):
  linux-yocto/4.1: usb backports for Apollo Lake/Broxton
  linux-yocto/4.1: Thermal: Enable Broxton SoC thermal reporting device
  linux-yocto/4.1: powercap/RAPL: Backport powercap/RAPL
  linux-yocto/4.1: Intel Broxton and Sunrisepoint-H: pinctrl and drm
  linux-yocto/4.1: usb: add usb_otg_caps to usb_gadget structure.

 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 18 +++++++++---------
 3 files changed, 13 insertions(+), 13 deletions(-)

-- 
2.5.0


