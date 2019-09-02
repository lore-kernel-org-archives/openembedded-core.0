Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 76A977F389
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Sep 2019 07:45:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x827iq71010028
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Sep 2019 00:45:13 -0700
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Mon, 2 Sep 2019 00:45:04 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 2 Sep 2019 16:11:01 +0800
Message-ID: <cover.1567411673.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/1] build-compare: 2015.02.10 -> 2019.08-14 (Outstanding improvements)
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
X-List-Received-Date: Mon, 02 Sep 2019 07:45:22 -0000
Content-Type: text/plain

The following changes since commit b4673b5befa339b2ffc3c274b105ab96d730ea2d:

  avahi: launch avahi-daemon after connman (2019-08-31 08:44:19 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/pu
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/pu

Robert Yang (1):
  build-compare: 2015.02.10 -> 2019.08-14

 .../build-compare/build-compare_git.bb             |   12 +-
 ...001-Add-support-for-deb-and-ipk-packaging.patch |   64 -
 .../files/Ignore-DWARF-sections.patch              |   17 +-
 .../files/Rename-rpm-check.sh-to-pkg-diff.sh.patch | 1599 --------------------
 ...functions.sh-improve-deb-and-ipk-checking.patch |  117 --
 .../files/functions.sh-remove-space-at-head.patch  |   41 -
 ...nctions.sh-run-rpm-once-to-make-it-faster.patch |  361 -----
 .../pkg-diff.sh-check-for-fifo-named-pipe.patch    |   35 -
 ...-check_single_file-return-at-once-when-sa.patch |   37 -
 ...diff.sh-remove-space-in-the-end-for-ftype.patch |   32 -
 10 files changed, 9 insertions(+), 2306 deletions(-)
 delete mode 100644 meta/recipes-devtools/build-compare/files/0001-Add-support-for-deb-and-ipk-packaging.patch
 delete mode 100644 meta/recipes-devtools/build-compare/files/Rename-rpm-check.sh-to-pkg-diff.sh.patch
 delete mode 100644 meta/recipes-devtools/build-compare/files/functions.sh-improve-deb-and-ipk-checking.patch
 delete mode 100644 meta/recipes-devtools/build-compare/files/functions.sh-remove-space-at-head.patch
 delete mode 100644 meta/recipes-devtools/build-compare/files/functions.sh-run-rpm-once-to-make-it-faster.patch
 delete mode 100644 meta/recipes-devtools/build-compare/files/pkg-diff.sh-check-for-fifo-named-pipe.patch
 delete mode 100644 meta/recipes-devtools/build-compare/files/pkg-diff.sh-check_single_file-return-at-once-when-sa.patch
 delete mode 100644 meta/recipes-devtools/build-compare/files/pkg-diff.sh-remove-space-in-the-end-for-ftype.patch

-- 
2.7.4


