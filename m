Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1BDE66022F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Nov 2017 01:45:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vAU1jhn8021958
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Nov 2017 17:45:43 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Wed, 29 Nov 2017 17:45:42 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 30 Nov 2017 09:45:10 +0800
Message-ID: <cover.1512006081.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/5] fix build when len(TMPDIR) == 410
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
X-List-Received-Date: Thu, 30 Nov 2017 01:45:43 -0000
Content-Type: text/plain

The following changes since commit 33418ed064fe9cff5b4803f09135a81d9170c189:

  runqemu: Also specialcase resolution of '.' to the file's location (2017-11-21 17:58:36 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/long
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/long

Robert Yang (5):
  go-native: fix PATH issue when len(TMPDIR) == 410
  go-native: fix import error when len(TMPDIR) == 410
  ninja: fix for llvm build when len(TMPDIR) == 410
  webkitgtk: fix compile error when len(TMPDIR) == 410
  sqlite3: use 1024 for MAX_PATHNAM

 ...01-cmd-dist-unix.c-bprintf-use-larger-buf.patch | 38 ++++++++++++++++++++++
 .../go/files/0002-cmd-gc-go.h-NSYMB-500-1000.patch | 35 ++++++++++++++++++++
 meta/recipes-devtools/go/go-native.inc             |  5 ++-
 ...src-util.cc-use-larger-kMaxPathComponents.patch | 33 +++++++++++++++++++
 meta/recipes-devtools/ninja/ninja_1.7.2.bb         |  5 ++-
 meta/recipes-sato/webkit/webkitgtk_2.16.6.bb       | 27 +++++++++++++++
 .../0001-sqlite3.c-use-1024-MAX_PATHNAME.patch     | 37 +++++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.21.0.bb      |  1 +
 8 files changed, 179 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/go/files/0001-cmd-dist-unix.c-bprintf-use-larger-buf.patch
 create mode 100644 meta/recipes-devtools/go/files/0002-cmd-gc-go.h-NSYMB-500-1000.patch
 create mode 100644 meta/recipes-devtools/ninja/ninja/0001-src-util.cc-use-larger-kMaxPathComponents.patch
 create mode 100644 meta/recipes-support/sqlite/files/0001-sqlite3.c-use-1024-MAX_PATHNAME.patch

-- 
2.7.4


