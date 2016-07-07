Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D75F46013D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jul 2016 01:37:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u671b7WT007686
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Jul 2016 18:37:07 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 6 Jul 2016 18:37:06 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Jul 2016 18:36:59 -0700
Message-ID: <cover.1467855356.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
MIME-Version: 1.0
Subject: [PATCH 0/7] Packages Upgrade
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
X-List-Received-Date: Thu, 07 Jul 2016 01:37:07 -0000
Content-Type: text/plain

The following changes since commit 53fcfe4348a2ca727844f2b0bd3fca2902cbdda0:

  lib/oeqa: add Galculator to SDK and runtime tests (2016-07-01 16:08:54 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/pu
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/pu

Robert Yang (7):
  debianutils: 4.7 -> 4.8
  e2fsprogs: 1.43 -> 1.43.1
  git: 2.8.4 -> 2.9.0
  gmp: 6.1.0 -> 6.1.1
  libpcre: 8.38 -> 8.39
  wget: 1.17.1 -> 1.18
  file: 5.27 -> 5.28

 .../{e2fsprogs_1.43.bb => e2fsprogs_1.43.1.bb}     |   4 +-
 meta/recipes-devtools/file/file/host-file.patch    |  32 ----
 .../file/{file_5.27.bb => file_5.28.bb}            |   3 +-
 meta/recipes-devtools/git/git_2.8.4.bb             |  11 --
 meta/recipes-devtools/git/git_2.9.0.bb             |  11 ++
 .../wget/{wget_1.17.1.bb => wget_1.18.bb}          |   4 +-
 .../{debianutils_4.7.bb => debianutils_4.8.bb}     |   6 +-
 ...user-provided-flags-to-the-auto-detected-.patch |   0
 .../gmp/{gmp-6.1.0 => gmp-6.1.1}/amd64.patch       |   0
 .../{gmp-6.1.0 => gmp-6.1.1}/use-includedir.patch  |   0
 .../gmp/{gmp_6.1.0.bb => gmp_6.1.1.bb}             |   4 +-
 .../libpcre/libpcre/CVE-2016-3191.patch            | 174 ---------------------
 .../libpcre/{libpcre_8.38.bb => libpcre_8.39.bb}   |   7 +-
 13 files changed, 23 insertions(+), 233 deletions(-)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.43.bb => e2fsprogs_1.43.1.bb} (98%)
 delete mode 100644 meta/recipes-devtools/file/file/host-file.patch
 rename meta/recipes-devtools/file/{file_5.27.bb => file_5.28.bb} (94%)
 delete mode 100644 meta/recipes-devtools/git/git_2.8.4.bb
 create mode 100644 meta/recipes-devtools/git/git_2.9.0.bb
 rename meta/recipes-extended/wget/{wget_1.17.1.bb => wget_1.18.bb} (53%)
 rename meta/recipes-support/debianutils/{debianutils_4.7.bb => debianutils_4.8.bb} (86%)
 rename meta/recipes-support/gmp/{gmp-6.1.0 => gmp-6.1.1}/0001-Append-the-user-provided-flags-to-the-auto-detected-.patch (100%)
 rename meta/recipes-support/gmp/{gmp-6.1.0 => gmp-6.1.1}/amd64.patch (100%)
 rename meta/recipes-support/gmp/{gmp-6.1.0 => gmp-6.1.1}/use-includedir.patch (100%)
 rename meta/recipes-support/gmp/{gmp_6.1.0.bb => gmp_6.1.1.bb} (87%)
 delete mode 100644 meta/recipes-support/libpcre/libpcre/CVE-2016-3191.patch
 rename meta/recipes-support/libpcre/{libpcre_8.38.bb => libpcre_8.39.bb} (91%)

-- 
2.9.0


