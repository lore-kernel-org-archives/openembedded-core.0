Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 465A160C1A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Dec 2013 02:00:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rBU20LgM017603
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2013 18:00:21 -0800 (PST)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Sun, 29 Dec 2013 18:00:21 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 30 Dec 2013 18:02:24 +0800
Message-ID: <cover.1388397582.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH 0/6] upgrade automake/autogen-native/make/git
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
X-List-Received-Date: Mon, 30 Dec 2013 02:00:20 -0000
Content-Type: text/plain

I have tested these upgrades on the local autobuilder.

// Robert

The following changes since commit 5c95cc221aa55df7c25e3254d30a7a4b70ff5359:

  maintainers.inc: reassign tzcode-native (2013-12-27 19:35:02 +0800)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib robert/upgrade
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/upgrade

Robert Yang (6):
  automake: upgrade to 1.14
  autoconf: remove path_prog_fixes.patch
  autogen-native: upgrade to 5.18.2
  make: remove the obsolete SCCS.patch
  make: upgrade to 4.0
  git: upgrade to 1.8.5.2

 .../autoconf/autoconf/path_prog_fixes.patch        | 128 --------------
 meta/recipes-devtools/autoconf/autoconf_2.69.bb    |   1 -
 ...n-native_5.17.4.bb => autogen-native_5.18.2.bb} |   6 +-
 .../autogen/{files => autogen}/guile.patch         |  48 +++---
 .../increase-timeout-limit.patch                   |   0
 .../automake/automake/path_prog_fixes.patch        |  41 -----
 .../prefer-cpio-over-pax-for-ustar-archives.patch  |  48 ------
 .../{automake_1.13.4.bb => automake_1.14.bb}       |  14 +-
 meta/recipes-devtools/git/git.inc                  |   1 -
 .../git/{git_1.8.4.4.bb => git_1.8.5.2.bb}         |   5 +-
 meta/recipes-devtools/make/files/SCCS.patch        |  17 --
 .../make/make-3.82/expand_MAKEFLAGS.patch          |  39 -----
 .../make-3.82/intermediate-target-bugfix.patch     |  23 ---
 .../make-savannah-bug30612-fix_white_space.patch   |  58 -------
 ...ke-savannah-bug30612-handling_of_archives.patch | 188 ---------------------
 meta/recipes-devtools/make/make.inc                |   3 +-
 .../make/{make_3.82.bb => make_4.0.bb}             |  10 +-
 17 files changed, 41 insertions(+), 589 deletions(-)
 delete mode 100644 meta/recipes-devtools/autoconf/autoconf/path_prog_fixes.patch
 rename meta/recipes-devtools/autogen/{autogen-native_5.17.4.bb => autogen-native_5.18.2.bb} (88%)
 rename meta/recipes-devtools/autogen/{files => autogen}/guile.patch (89%)
 rename meta/recipes-devtools/autogen/{files => autogen}/increase-timeout-limit.patch (100%)
 delete mode 100644 meta/recipes-devtools/automake/automake/path_prog_fixes.patch
 delete mode 100644 meta/recipes-devtools/automake/automake/prefer-cpio-over-pax-for-ustar-archives.patch
 rename meta/recipes-devtools/automake/{automake_1.13.4.bb => automake_1.14.bb} (75%)
 rename meta/recipes-devtools/git/{git_1.8.4.4.bb => git_1.8.5.2.bb} (67%)
 delete mode 100644 meta/recipes-devtools/make/files/SCCS.patch
 delete mode 100644 meta/recipes-devtools/make/make-3.82/expand_MAKEFLAGS.patch
 delete mode 100644 meta/recipes-devtools/make/make-3.82/intermediate-target-bugfix.patch
 delete mode 100644 meta/recipes-devtools/make/make-3.82/make-savannah-bug30612-fix_white_space.patch
 delete mode 100644 meta/recipes-devtools/make/make-3.82/make-savannah-bug30612-handling_of_archives.patch
 rename meta/recipes-devtools/make/{make_3.82.bb => make_4.0.bb} (44%)

-- 
1.8.3.1


