Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A69E5787B5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jul 2018 02:26:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w6D2QJJQ025486
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2018 19:26:20 -0700
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.399.0; Thu, 12 Jul 2018 19:26:18 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Jul 2018 10:36:20 +0800
Message-ID: <cover.1531449293.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH V4 0/4] meta: various fixes
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
X-List-Received-Date: Fri, 13 Jul 2018 02:26:19 -0000
Content-Type: text/plain

* V4:
  - Fix Paul's comments on populate_sdk_ext.bbclass patch
  - Remove the ones which are already merged.

* V3:
  - Fix RP's comments
    Fix comments for "lsof: fix LSOF_CCV in version.h"
    Fix "rootfs-postcommands: split ssh_allow_empty_password" since it caused a oe-selftest case failed.

  - Drop already merge commits

  - Drop unneeded commit:
    gcc-sanitizers: Fix libtool .la files

  - Drop an incorrect commit which caused oe-selftest failed:
    glibc: re-package for libnss-db
    This one needs rework.

  - Ran "oe-selftest -a" to test it.

* V2:
  Rebase to up-to-date master branch and drop already merged patches.

* V1: Initial version

// Robert

The following changes since commit f9324af88a99eca28b160fa31aa4516fd397e44b:

  distutils3: pass build arguments when doing a clean (2018-07-10 11:10:14 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/fix_from_wr
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/fix_from_wr

Chen Qi (1):
  populate_sdk_ext.bbclass: add SDK_CONF_MANIFEST_EXCLUDE

Kai Kang (1):
  toolchain-scripts.bbclass: do not extend dependency if extended
    already

Mark Hatle (1):
  base.bbclass: Add buildcfg multilib values

Shan Hai (1):
  xinetd: add Init Script Actions to xinetd script

 meta/classes/base.bbclass                       | 13 ++++++++++++-
 meta/classes/populate_sdk_ext.bbclass           |  7 +++++++
 meta/classes/toolchain-scripts.bbclass          | 13 ++++++++++++-
 meta/conf/bitbake.conf                          |  2 +-
 meta/recipes-extended/xinetd/xinetd/xinetd.init | 12 +++++++++++-
 5 files changed, 43 insertions(+), 4 deletions(-)

-- 
2.7.4


