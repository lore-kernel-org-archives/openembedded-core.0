Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 396BD607A5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 00:53:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vAE0rx3W022220
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 16:53:59 -0800 (PST)
Received: from pek-lpg-core1.windriver.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Mon, 13 Nov 2017 16:53:58 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Nov 2017 01:58:40 +0800
Message-ID: <cover.1510595883.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 00/10] Packages upgrade
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
X-List-Received-Date: Tue, 14 Nov 2017 00:53:59 -0000
Content-Type: text/plain

The following changes since commit a17f3ec910366e9e7551fa24fbc07929b9584341:

  dhcp: fix build issue with libxml2 support (2017-11-10 14:44:31 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/pu
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/pu

Robert Yang (10):
  autoconf-archive: 2016.09.16 -> 2017.09.28
  debianutils: 4.8.1.1 -> 4.8.3
  e2fsprogs: 1.43.5 -> 1.43.7
  file: 5.31 -> 5.32
  git: 2.13.3 -> 2.15.0
  liberror-perl: 0.17024 -> 0.17025
  logrotate: 3.12.3 -> 3.13.0
  less: 487 -> 527
  libsdl2: 2.0.5 -> 2.0.7
  strace: 4.18 -> 4.19

 ...016.09.16.bb => autoconf-archive_2017.09.28.bb} |  6 +--
 .../e2fsprogs/e2fsprogs/reproducible-doc.patch     | 21 ---------
 .../{e2fsprogs_1.43.5.bb => e2fsprogs_1.43.7.bb}   |  3 +-
 .../recipes-devtools/file/file/debian-742262.patch |  7 +--
 .../file/{file_5.31.bb => file_5.32.bb}            |  2 +-
 meta/recipes-devtools/git/git_2.13.3.bb            | 11 -----
 meta/recipes-devtools/git/git_2.15.0.bb            | 11 +++++
 ...or-perl_0.17024.bb => liberror-perl_0.17025.bb} |  4 +-
 .../strace/strace/Makefile-ptest.patch             | 17 +++-----
 .../strace/{strace_4.18.bb => strace_4.19.bb}      |  4 +-
 .../less/{less_487.bb => less_527.bb}              |  4 +-
 .../{logrotate_3.12.3.bb => logrotate_3.13.0.bb}   |  4 +-
 .../libsdl2/libsdl2/fix-build-failure-on-ppc.patch | 50 ----------------------
 .../recipes-graphics/libsdl2/libsdl2/linkage.patch | 46 --------------------
 .../libsdl2/{libsdl2_2.0.5.bb => libsdl2_2.0.7.bb} |  8 ++--
 ...debianutils_4.8.1.1.bb => debianutils_4.8.3.bb} |  8 ++--
 16 files changed, 41 insertions(+), 165 deletions(-)
 rename meta/recipes-devtools/autoconf-archive/{autoconf-archive_2016.09.16.bb => autoconf-archive_2017.09.28.bb} (62%)
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/reproducible-doc.patch
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.43.5.bb => e2fsprogs_1.43.7.bb} (97%)
 rename meta/recipes-devtools/file/{file_5.31.bb => file_5.32.bb} (96%)
 delete mode 100644 meta/recipes-devtools/git/git_2.13.3.bb
 create mode 100644 meta/recipes-devtools/git/git_2.15.0.bb
 rename meta/recipes-devtools/perl/{liberror-perl_0.17024.bb => liberror-perl_0.17025.bb} (83%)
 rename meta/recipes-devtools/strace/{strace_4.18.bb => strace_4.19.bb} (93%)
 rename meta/recipes-extended/less/{less_487.bb => less_527.bb} (89%)
 rename meta/recipes-extended/logrotate/{logrotate_3.12.3.bb => logrotate_3.13.0.bb} (95%)
 delete mode 100644 meta/recipes-graphics/libsdl2/libsdl2/fix-build-failure-on-ppc.patch
 delete mode 100644 meta/recipes-graphics/libsdl2/libsdl2/linkage.patch
 rename meta/recipes-graphics/libsdl2/{libsdl2_2.0.5.bb => libsdl2_2.0.7.bb} (89%)
 rename meta/recipes-support/debianutils/{debianutils_4.8.1.1.bb => debianutils_4.8.3.bb} (87%)

-- 
2.7.4


