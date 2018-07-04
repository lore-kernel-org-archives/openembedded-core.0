Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 47A2678480
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jul 2018 02:37:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w642bm11023888
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 3 Jul 2018 19:37:53 -0700
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.399.0; Tue, 3 Jul 2018 19:37:44 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 4 Jul 2018 10:47:39 +0800
Message-ID: <cover.1530672257.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/2 V2] Recipes upgrade
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
X-List-Received-Date: Wed, 04 Jul 2018 02:37:55 -0000
Content-Type: text/plain

* V2:
  - Remove the ones already on master-next
  - Upgrade git to 2.18 rathar than 2.17
  - Fix nfs-utils' build with glibc, I had tested it with glibc, then musl in
    V1, but after I fixed it with musl, I forgot to test with glibc again, now
    I tested with both glibc and musl.

// Robert

The following changes since commit 59a0a05235d80c86251cf45d7142bfc57f2e70d2:

  multilib: Tweak previous cross-canadian multilib fix (2018-07-04 00:01:37 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/up_2
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/up_2

Robert Yang (2):
  git: 2.16.1 -> 2.18.0
  nfs-utils: 2.1.1 -> 2.3.1

 ...gure-Allow-to-explicitly-disable-nfsidmap.patch |  40 -------
 ...nclude-stdint.h-for-UINT16_MAX-definition.patch |  27 -----
 .../nfs-utils-1.2.3-sm-notify-res_init.patch       |  37 ------
 .../nfs-utils/nfs-utils-musl-limits.patch          | 133 +++++++++++++++++++++
 .../nfs-utils/nfs-utils-musl-res_querydomain.patch |  22 ++++
 .../{nfs-utils_2.1.1.bb => nfs-utils_2.3.1.bb}     |  13 +-
 meta/recipes-devtools/git/git.inc                  |  12 +-
 meta/recipes-devtools/git/git_2.16.1.bb            |  11 --
 meta/recipes-devtools/git/git_2.18.0.bb            |  11 ++
 9 files changed, 175 insertions(+), 131 deletions(-)
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure-Allow-to-explicitly-disable-nfsidmap.patch
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-include-stdint.h-for-UINT16_MAX-definition.patch
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.2.3-sm-notify-res_init.patch
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-musl-limits.patch
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-musl-res_querydomain.patch
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_2.1.1.bb => nfs-utils_2.3.1.bb} (92%)
 delete mode 100644 meta/recipes-devtools/git/git_2.16.1.bb
 create mode 100644 meta/recipes-devtools/git/git_2.18.0.bb

-- 
2.7.4


