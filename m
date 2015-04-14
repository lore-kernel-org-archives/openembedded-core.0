Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F1C7C7391A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 09:09:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3E993ta009785
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 02:09:03 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 14 Apr 2015 02:09:08 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Apr 2015 02:08:57 -0700
Message-ID: <cover.1429002519.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/6] meta: 6 fixes
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
X-List-Received-Date: Tue, 14 Apr 2015 09:09:02 -0000
Content-Type: text/plain

The following changes since commit 8d207e55031c0b93387e728f4312b8cb34ad5b12:

  libgpg-error 1.18: simplify tupple handling and add armv8b support (2015-04-13 22:32:06 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/6fixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/6fixes

Robert Yang (6):
  libxml2: fix python path and add libxml2-python
  cracklib: add python support back
  libepoxy: DEPENDS on virtual/mesa
  strace: fix build for aarch64
  aspell: inherit binconfig-disabled
  libunwind: fix build with aarch64

 meta/recipes-core/libxml/libxml2.inc               |   19 ++++++-----
 .../strace/sigreturn.c-fix-build-for-aarch64.patch |   34 ++++++++++++++++++++
 meta/recipes-devtools/strace/strace_4.10.bb        |    1 +
 meta/recipes-extended/cracklib/cracklib_2.9.2.bb   |   28 +++++++++++++---
 meta/recipes-graphics/libepoxy/libepoxy_1.2.bb     |    2 +-
 meta/recipes-support/aspell/aspell_0.60.6.1.bb     |    4 ++-
 meta/recipes-support/libunwind/libunwind.inc       |    2 ++
 7 files changed, 74 insertions(+), 16 deletions(-)
 create mode 100644 meta/recipes-devtools/strace/strace/sigreturn.c-fix-build-for-aarch64.patch

-- 
1.7.9.5


