Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EABF760603
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Nov 2017 06:04:04 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vA1645KE026444
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Oct 2017 23:04:05 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 31 Oct 2017 23:04:04 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 31 Oct 2017 23:04:01 -0700
Message-ID: <cover.1509516068.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH 0/3] initscripts: fixes for booting with busybox init
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
X-List-Received-Date: Wed, 01 Nov 2017 06:04:05 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

* check for the existence of /etc/default/rcS
* minor fixes to checkroot.sh
* disable mountall.sh for busybox init

The following changes since commit 5dacc5516718efdf0a470e074a5c05b1ecf8cc15:

  bitbake: main: Give a user readable error if we can't locate topdir (2017-10-31 09:09:21 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/initscripts
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/initscripts

Wenzong Fan (3):
  initscripts: Check for the existence of /etc/default/rcS
  initscripts: minor fixes to checkroot.sh
  initscripts: disable mountall.sh for busybox init

 meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh     |  2 +-
 meta/recipes-core/initscripts/initscripts-1.0/checkfs.sh      |  2 +-
 meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh    |  6 +++---
 meta/recipes-core/initscripts/initscripts-1.0/mountall.sh     |  2 +-
 .../initscripts/initscripts-1.0/read-only-rootfs-hook.sh      |  2 +-
 meta/recipes-core/initscripts/initscripts-1.0/urandom         |  2 +-
 meta/recipes-core/initscripts/initscripts_1.0.bb              | 11 ++++++++---
 7 files changed, 16 insertions(+), 11 deletions(-)

-- 
2.11.0


