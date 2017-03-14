Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E0C2F77690
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 08:45:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v2E8jk5U029625
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 01:45:48 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 14 Mar 2017 01:45:45 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Mar 2017 01:45:37 -0700
Message-ID: <cover.1489481108.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0.rc2.dirty
MIME-Version: 1.0
Subject: [PATCH 0/8] fixes for building in long path
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
X-List-Received-Date: Tue, 14 Mar 2017 08:45:49 -0000
Content-Type: text/plain

The following changes since commit 86b09a7ed67a43a45c805f44778bed0bfdf57361:

  u-boot: add option to specify FDT argument in extlinux.conf (2017-03-13 09:43:08 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/long
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/long

Robert Yang (8):
  m4: do_configure: fix "Argument list too long"
  guile: do_configure: fix "Argument list too long"
  kmod: set ac_cv_path_DOLT_BASH to /bin/bash
  mc: set ac_cv_path_PERL to /usr/bin/perl
  valgrind: set ac_cv_path_PERL to /usr/bin/perl
  autogen-native: config/libopts.m4
  autogen-native: fix POSIX_SHELL and perl
  oe/path.py: fix for "Argument list too long"

 meta/lib/oe/path.py                                | 10 +++---
 .../autogen/autogen-native_5.18.12.bb              |  4 +++
 ...pts.m4-regenerate-it-from-config-libopts..patch | 39 ++++++++++++++++++++++
 ...2-autoopts-mk-tpl-config.sh-fix-perl-path.patch | 32 ++++++++++++++++++
 meta/recipes-devtools/guile/guile_2.0.14.bb        |  3 ++
 meta/recipes-devtools/m4/m4-1.4.18.inc             |  3 ++
 meta/recipes-devtools/valgrind/valgrind_3.12.0.bb  |  2 ++
 meta/recipes-extended/mc/mc_4.8.18.bb              |  2 ++
 meta/recipes-kernel/kmod/kmod.inc                  |  2 ++
 9 files changed, 93 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-devtools/autogen/autogen/0001-config-libopts.m4-regenerate-it-from-config-libopts..patch
 create mode 100644 meta/recipes-devtools/autogen/autogen/0002-autoopts-mk-tpl-config.sh-fix-perl-path.patch

-- 
2.11.0.rc2.dirty


