Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 601D86076F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 06:17:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uBL6HDo1002112
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 22:17:13 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 20 Dec 2016 22:17:12 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 20 Dec 2016 22:17:07 -0800
Message-ID: <cover.1482300982.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0.rc2.dirty
MIME-Version: 1.0
Subject: [PATCH 0/5] Packages Upgrade
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
X-List-Received-Date: Wed, 21 Dec 2016 06:17:12 -0000
Content-Type: text/plain

The following changes since commit 5e21afc9395060b489156d3f90505a372b713f37:

  Revert "selftest/wic: extending test coverage for WIC script options" (2016-12-20 17:06:01 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/pu
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/pu

Robert Yang (5):
  debianutils: 4.8 -> 4.8.1
  mklibs-native: 0.1.41 -> 0.1.43
  quilt: 0.64 -> 0.65
  guile: 2.0.12 -> 2.0.13
  hdparm: 9.48 -> 9.50

 ...002-Recognize-nios2-as-compilation-target.patch | 32 ----------------------
 .../guile/{guile_2.0.12.bb => guile_2.0.13.bb}     |  5 ++--
 ...bs-native_0.1.41.bb => mklibs-native_0.1.43.bb} |  8 ++++--
 .../{quilt-native_0.64.bb => quilt-native_0.65.bb} |  0
 meta/recipes-devtools/quilt/quilt.inc              |  7 ++---
 meta/recipes-devtools/quilt/quilt/install.patch    | 13 ---------
 .../quilt/{quilt_0.64.bb => quilt_0.65.bb}         |  0
 ...-Makefile-use-weak-assignment-for-LDFALGS.patch | 30 ++++++++++++++++++++
 .../hdparm/{hdparm_9.48.bb => hdparm_9.50.bb}      |  8 ++++--
 .../{debianutils_4.8.bb => debianutils_4.8.1.bb}   |  7 +++--
 10 files changed, 49 insertions(+), 61 deletions(-)
 delete mode 100644 meta/recipes-devtools/guile/files/0002-Recognize-nios2-as-compilation-target.patch
 rename meta/recipes-devtools/guile/{guile_2.0.12.bb => guile_2.0.13.bb} (95%)
 rename meta/recipes-devtools/mklibs/{mklibs-native_0.1.41.bb => mklibs-native_0.1.43.bb} (71%)
 rename meta/recipes-devtools/quilt/{quilt-native_0.64.bb => quilt-native_0.65.bb} (100%)
 delete mode 100644 meta/recipes-devtools/quilt/quilt/install.patch
 rename meta/recipes-devtools/quilt/{quilt_0.64.bb => quilt_0.65.bb} (100%)
 create mode 100644 meta/recipes-extended/hdparm/hdparm/0001-Makefile-use-weak-assignment-for-LDFALGS.patch
 rename meta/recipes-extended/hdparm/{hdparm_9.48.bb => hdparm_9.50.bb} (80%)
 rename meta/recipes-support/debianutils/{debianutils_4.8.bb => debianutils_4.8.1.bb} (86%)

-- 
2.11.0.rc2.dirty


