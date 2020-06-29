Received: from esa2.mentor.iphmx.com (esa2.mentor.iphmx.com [68.232.141.98])
 by mx.groups.io with SMTP id smtpd.web12.14744.1593422183648116685
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2020 02:16:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: mentor.com, ip: 68.232.141.98, mailfrom: ahsan_hussain@mentor.com)
IronPort-SDR: lMQnH16zCQsm7sc4SS+VpCLoAPl9G8OP5Fl2gAKt0y+PV2d29++EICFhwLgwoYsVL9pgoB0jFQ
 MvIuPmNz2ssiltj0/7NvNK6x/FYNcKqg0i5DS+jm1b7O+3zlx/67Acq1pH37OXgTHramww8ECX
 S9VWWLnSq5nKwBWarEHFVBw+FoPuOoqWTo0S5BjiHQ+yM/z2AL0F7PgqKcg3jyUlS7m6XID42g
 kW7Jvh2bRn80clKwRp1m4dmTaI/Vj7RcLk1HI0ArQAImdlGrb4vRPPIqjA0Bf8SCAKMb9BJaQr
 uic=
X-IronPort-AV: E=Sophos;i="5.75,294,1589270400"; 
   d="scan'208";a="50280466"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa2.mentor.iphmx.com with ESMTP; 29 Jun 2020 01:16:23 -0800
IronPort-SDR: r6ser2jp8uamtX264JZg/iiAiIr9wha19tFLnaEzoj7ooHd6IvtuXm9mXx72+J9ni4sWE8PtCt
 zQATPYxnmFfpfx8azgEO8EE8Ms8KFbeZ1mUUnturEZTRp8mRsFLUlccHrjIhpS/s3J07c8ZNMI
 XMOJ/5S9SQyJaAvzKYqhozTOjCf0oTC5YCykoGD3L0duvtKt85/hucVfip5s6a4PTzsD3ulfKf
 ICVsav77jB92yka1qXcZ44HQ4N06tsOcgOH3KBzr/bs6VrNPgIwy3ShuBBbP9TiW0KPCFVuU+K
 QSM=
From: "ahussain" <ahsan_hussain@mentor.com>
To: <openembedded-core@lists.openembedded.org>
CC: Max Krummenacher <max.krummenacher@toradex.com>, Ming Liu
	<ming.liu@toradex.com>, Richard Purdie <richard.purdie@linuxfoundation.org>,
	Jens Rehsack <sno@netbsd.org>
Subject: [openembedded-core][PATCH 0/2] u-boot: backport merging .cfg files for UBOOT_CONFIG
Date: Mon, 29 Jun 2020 14:15:42 +0500
Message-ID: <cover.1593420599.git.ahsan_hussain@mentor.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Return-Path: ahsan_hussain@mentor.com
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3) To
 SVR-IES-MBX-04.mgc.mentorg.com (139.181.222.4)
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Ahsan Hussain <ahsan_hussain@mentor.com>

The functionality for merging config fragment files has been available
in the U-Boot tree (merge_config.sh) but this was not being used for
oe-core's UBOOT_CONFIG flow. These commits would allow the distro
maintainers to configure the bootloader using cfg files instead of
patching the U-Boot tree

The following changes since commit 1a98936830ba468d63e2e49d766add9e9cb75998:

  gstreamer1.0-plugins-bad: add support for vdpau (2020-06-23 04:33:47 -1000)

are available in the Git repository at:

  git://github.com/ahsanhussain/openembedded-core u-boot-cfg-dunfell
  https://github.com/ahsanhussain/openembedded-core/tree/u-boot-cfg-dunfell

Jens Rehsack (1):
  u-boot: avoid blind merging all *.cfg

Ming Liu (1):
  u-boot: support merging .cfg files for UBOOT_CONFIG

 meta/recipes-bsp/u-boot/u-boot.inc | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

-- 
2.25.1

