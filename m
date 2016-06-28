Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5DDD26FFA4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2016 02:41:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u5S2f55O023814
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 27 Jun 2016 19:41:05 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Mon, 27 Jun 2016 19:41:05 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 27 Jun 2016 22:40:56 -0400
Message-ID: <cover.1467081584.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
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
X-List-Received-Date: Tue, 28 Jun 2016 02:41:09 -0000
Content-Type: text/plain

Hi all,

Nothing terribly earth shattering in this update, just a consolidated
set of kernel and configuration changes I've been gathering.

Cheers,

Bruce

The following changes since commit 84cce1d49ddb75025ec454d758fbc8d369920122:

  e2fsprogs: remove the extra dot from the recipe filename (2016-06-21 13:00:17 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (8):
  linux-yocto/4.1: tpm2, pinctrl, powercap and watchdog backports
  linux-yocto/4.1: SPI, MFD, alsa and perf backports
  linux-yocto/4.1: driver, mmc and power backports
  linux-yocto/4.1: pstate backports
  linux-yocto/4.4: sensor driver backports
  linux-yocto/4.1/4.4: tpm, telemetry, acpi and cpuid changes
  linux-yocto/4.x: vfat feature cleanup
  linux-yocto: bxt and input configuration changes

 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 18 +++++++++---------
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 18 +++++++++---------
 6 files changed, 25 insertions(+), 25 deletions(-)

-- 
2.5.0


