Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A1127783E4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Feb 2018 02:40:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w152eOpR026824
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 4 Feb 2018 18:40:24 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Sun, 4 Feb 2018 18:40:22 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 5 Feb 2018 10:41:02 +0800
Message-ID: <cover.1517798422.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/4] Packages upgrade
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
X-List-Received-Date: Mon, 05 Feb 2018 02:40:24 -0000
Content-Type: text/plain

The following changes since commit a0988c3374e964170d1d24fc230306b887432d31:

  tcmode-default.inc: drop preferred version of gzip-native (2018-01-31 17:01:12 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/pu
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/pu

Robert Yang (4):
  ccache: 3.3.4 -> 3.3.5
  nfs-utils: 2.1.1 -> 2.3.1
  git: 2.15.0 -> 2.16.1
  time: 1.7 -> 1.8

 ...gure-Allow-to-explicitly-disable-nfsidmap.patch |   43 -
 ...nclude-stdint.h-for-UINT16_MAX-definition.patch |   27 -
 .../nfs-utils-1.2.3-sm-notify-res_init.patch       |   36 -
 .../{nfs-utils_2.1.1.bb => nfs-utils_2.3.1.bb}     |    9 +-
 .../ccache/{ccache_3.3.4.bb => ccache_3.3.5.bb}    |    6 +-
 meta/recipes-devtools/git/git.inc                  |    2 +
 meta/recipes-devtools/git/git_2.15.0.bb            |   11 -
 meta/recipes-devtools/git/git_2.16.1.bb            |   11 +
 meta/recipes-extended/time/time-1.7/debian.patch   | 1301 --------------------
 meta/recipes-extended/time/time.inc                |    4 +-
 meta/recipes-extended/time/time_1.7.bb             |   11 -
 meta/recipes-extended/time/time_1.8.bb             |    8 +
 12 files changed, 29 insertions(+), 1440 deletions(-)
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure-Allow-to-explicitly-disable-nfsidmap.patch
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-include-stdint.h-for-UINT16_MAX-definition.patch
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.2.3-sm-notify-res_init.patch
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_2.1.1.bb => nfs-utils_2.3.1.bb} (92%)
 rename meta/recipes-devtools/ccache/{ccache_3.3.4.bb => ccache_3.3.5.bb} (48%)
 delete mode 100644 meta/recipes-devtools/git/git_2.15.0.bb
 create mode 100644 meta/recipes-devtools/git/git_2.16.1.bb
 delete mode 100644 meta/recipes-extended/time/time-1.7/debian.patch
 delete mode 100644 meta/recipes-extended/time/time_1.7.bb
 create mode 100644 meta/recipes-extended/time/time_1.8.bb

-- 
2.7.4


