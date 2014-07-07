Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DBD7370391
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jul 2014 09:33:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s679Y0OR002241
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Jul 2014 02:34:01 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Mon, 7 Jul 2014 02:34:00 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 7 Jul 2014 02:33:57 -0700
Message-ID: <cover.1404725000.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/3] meta: check IMAGE_ROOTFS_MAXSIZE and KERNEL_IMAGE_MAXSIZE (if set)
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
X-List-Received-Date: Mon, 07 Jul 2014 09:34:01 -0000
Content-Type: text/plain

The following changes since commit c452b098b4c021d4cbeddf5bf13f7fd9b1cc9224:

  Revert "meta-yocto-bsp: oeqa/controllers: add GrubTarget" (2014-07-04 08:45:10 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/size
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/size

Robert Yang (3):
  lib/oe/image.py: check the rootfs size against IMAGE_ROOTFS_MAXSIZE
  kernel.bbclass: update KERNEL_IMAGE_MAXSIZE
  local.conf.sample.extended: add KERNEL_IMAGE_MAXSIZE and
    IMAGE_ROOTFS_MAXSIZE

 meta/classes/kernel.bbclass          |    9 ++++++---
 meta/conf/bitbake.conf               |    4 ++++
 meta/conf/local.conf.sample.extended |    8 ++++++++
 meta/lib/oe/image.py                 |    8 ++++++++
 4 files changed, 26 insertions(+), 3 deletions(-)

-- 
1.7.9.5


