Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B1D2D771A2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Apr 2016 06:58:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u366wkaW011990
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Apr 2016 23:58:46 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 5 Apr 2016 23:58:45 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 5 Apr 2016 23:58:39 -0700
Message-ID: <cover.1459925867.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
MIME-Version: 1.0
Subject: [PATCH 0/6] meta: remove unused patches
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
X-List-Received-Date: Wed, 06 Apr 2016 06:58:49 -0000
Content-Type: text/plain

The following changes since commit b2dc5a68e74dafedf7960ef77ad3d73912ed7960:

  bdwgc: use github repo for source location (2016-04-05 11:48:09 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/unused
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/unused

Robert Yang (6):
  rpm: remove two unused patch
  tcl: remove unused fix-configure.patch
  cmake: remove unused dont-run-cross-binaries.patch
  clutter-gst-3.0: remove unused enable-tests.patch
  glibc: remove unused CVE patches
  grub: remove unused 0001-Fix-build-with-glibc-2.20.patch

 .../files/0001-Fix-build-with-glibc-2.20.patch     |   32 -
 meta/recipes-core/glibc/glibc/CVE-2015-8776.patch  |  155 ---
 meta/recipes-core/glibc/glibc/CVE-2015-8777.patch  |  123 ---
 meta/recipes-core/glibc/glibc/CVE-2015-8779.patch  |  262 -----
 .../recipes-core/glibc/glibc/CVE-2015-9761_1.patch | 1039 --------------------
 .../recipes-core/glibc/glibc/CVE-2015-9761_2.patch |  385 --------
 .../cmake/cmake/dont-run-cross-binaries.patch      |   23 -
 .../rpm/rpm/rpm-CVE-2013-6435.patch                |  110 ---
 .../rpm/rpm/rpm-CVE-2014-8118.patch                |   44 -
 .../recipes-devtools/tcltk/tcl/fix-configure.patch |   46 -
 .../clutter/clutter-gst-3.0/enable-tests.patch     |   23 -
 11 files changed, 2242 deletions(-)
 delete mode 100644 meta/recipes-bsp/grub/files/0001-Fix-build-with-glibc-2.20.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-8776.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-8777.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-8779.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-9761_1.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-9761_2.patch
 delete mode 100644 meta/recipes-devtools/cmake/cmake/dont-run-cross-binaries.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-CVE-2013-6435.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-CVE-2014-8118.patch
 delete mode 100644 meta/recipes-devtools/tcltk/tcl/fix-configure.patch
 delete mode 100644 meta/recipes-graphics/clutter/clutter-gst-3.0/enable-tests.patch

-- 
2.8.0


