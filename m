Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0814877A3B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Apr 2017 10:05:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v36A5vEw005950
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Apr 2017 03:05:57 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 6 Apr 2017 03:05:56 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 6 Apr 2017 03:05:49 -0700
Message-ID: <cover.1491473008.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0.rc2.dirty
MIME-Version: 1.0
Subject: [PATCH 0/7 V2] fixes for building in long path (length = 410)
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
X-List-Received-Date: Thu, 06 Apr 2017 10:05:57 -0000
Content-Type: text/plain

* V2:
  Use '/usr/bin/env foo' rather than /usr/bin/foo or /bin/foo as shebang.

// Robert

The following changes since commit 901659a51cd53625a93f57a9c5865e90a07ec09d:

  oeqa/runtime/utils/targetbuildproject: use parent classes defaults tmpdir (2017-04-06 10:13:34 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/long
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/long

Robert Yang (7):
  groff: replace "perl -w" with "use warnings"
  mc: replace "perl -w" with "use warnings"
  valgrind: set ac_cv_path_PERL to /usr/bin/env perl
  m4: do_configure: fix "Argument list too long"
  guile: do_configure: fix "Argument list too long"
  autogen-native: fix POSIX_SHELL and perl
  kmod: set ac_cv_path_DOLT_BASH to /usr/bin/env bash

 .../autogen/autogen-native_5.18.12.bb              |   3 +
 ...2-autoopts-mk-tpl-config.sh-fix-perl-path.patch |  32 +++++
 meta/recipes-devtools/guile/guile_2.0.14.bb        |   3 +
 meta/recipes-devtools/m4/m4-1.4.18.inc             |   3 +
 meta/recipes-devtools/valgrind/valgrind_3.12.0.bb  |   2 +
 .../0001-replace-perl-w-with-use-warnings.patch    | 102 ++++++++++++++++
 meta/recipes-extended/groff/groff_1.22.3.bb        |   3 +
 .../0001-mc-replace-perl-w-with-use-warnings.patch | 129 +++++++++++++++++++++
 meta/recipes-extended/mc/mc_4.8.18.bb              |   3 +
 meta/recipes-kernel/kmod/kmod.inc                  |   2 +
 10 files changed, 282 insertions(+)
 create mode 100644 meta/recipes-devtools/autogen/autogen/0002-autoopts-mk-tpl-config.sh-fix-perl-path.patch
 create mode 100644 meta/recipes-extended/groff/groff-1.22.3/0001-replace-perl-w-with-use-warnings.patch
 create mode 100644 meta/recipes-extended/mc/files/0001-mc-replace-perl-w-with-use-warnings.patch

-- 
2.11.0.rc2.dirty


