Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3A68F78A71
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jul 2018 04:02:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w63423J2022997
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Jul 2018 21:02:03 -0700
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.399.0; Mon, 2 Jul 2018 21:02:02 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 3 Jul 2018 12:11:52 +0800
Message-ID: <cover.1530591075.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/5] Recipes upgrade
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
X-List-Received-Date: Tue, 03 Jul 2018 04:02:03 -0000
Content-Type: text/plain

The following changes since commit ae48ee6627e6c1c4f1fcc4ead40edc968e64f7fe:

  multilib: Fix issues with some cross-canadian toolchain sysroots (2018-07-02 17:13:19 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/up
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/up

Robert Yang (5):
  automake: 1.15.1 -> 1.16.1
  e2fsprogs: 1.43.8 -> 1.44.2
  git: 2.16.1 -> 2.17.0
  nfs-utils: 2.1.1 -> 2.3.1
  ccache: 3.3.5 -> 3.4.2

 ...gure-Allow-to-explicitly-disable-nfsidmap.patch |  40 -------
 ...nclude-stdint.h-for-UINT16_MAX-definition.patch |  27 -----
 .../nfs-utils-1.2.3-sm-notify-res_init.patch       |  37 ------
 .../nfs-utils/nfs-utils-musl-limits.patch          | 133 +++++++++++++++++++++
 .../nfs-utils/nfs-utils-musl-res_querydomain.patch |  22 ++++
 .../{nfs-utils_2.1.1.bb => nfs-utils_2.3.1.bb}     |  12 +-
 ...utomake-Add-default-libtool_tag-to-cppasm.patch |  18 +--
 ...tion-in-shebangs-with-modern-use-warnings.patch |  68 +++--------
 .../automake/automake/buildtest.patch              |  20 +++-
 .../automake/new_rt_path_for_test-driver.patch     |  22 +++-
 .../automake/automake/performance.patch            |  19 ++-
 .../automake/automake/python-libdir.patch          |  19 ++-
 .../{automake_1.15.1.bb => automake_1.16.1.bb}     |   4 +-
 meta/recipes-devtools/ccache/ccache_3.3.5.bb       |  12 --
 meta/recipes-devtools/ccache/ccache_3.4.2.bb       |  11 ++
 .../0002-dev.mk.in-fix-file-name-too-long.patch    |  15 +--
 ...te-man-page-in-the-make-install-from-git-.patch |  33 -----
 meta/recipes-devtools/e2fsprogs/e2fsprogs.inc      |   2 +-
 ...ix-build-failure-in-swapfs.c-on-big-endia.patch |  40 -------
 ...fs-enable-the-metadata_csum-and-64bit-fea.patch |  12 +-
 .../{e2fsprogs_1.43.8.bb => e2fsprogs_1.44.2.bb}   |   3 +-
 meta/recipes-devtools/git/git.inc                  |  12 +-
 meta/recipes-devtools/git/git_2.16.1.bb            |  11 --
 meta/recipes-devtools/git/git_2.17.0.bb            |  11 ++
 24 files changed, 283 insertions(+), 320 deletions(-)
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure-Allow-to-explicitly-disable-nfsidmap.patch
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-include-stdint.h-for-UINT16_MAX-definition.patch
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.2.3-sm-notify-res_init.patch
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-musl-limits.patch
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-musl-res_querydomain.patch
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_2.1.1.bb => nfs-utils_2.3.1.bb} (92%)
 rename meta/recipes-devtools/automake/{automake_1.15.1.bb => automake_1.16.1.bb} (89%)
 delete mode 100644 meta/recipes-devtools/ccache/ccache_3.3.5.bb
 create mode 100644 meta/recipes-devtools/ccache/ccache_3.4.2.bb
 delete mode 100644 meta/recipes-devtools/ccache/files/Revert-Create-man-page-in-the-make-install-from-git-.patch
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-libext2fs-fix-build-failure-in-swapfs.c-on-big-endia.patch
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.43.8.bb => e2fsprogs_1.44.2.bb} (97%)
 delete mode 100644 meta/recipes-devtools/git/git_2.16.1.bb
 create mode 100644 meta/recipes-devtools/git/git_2.17.0.bb

-- 
2.7.4


