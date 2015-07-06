Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7B65075D63
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jul 2015 10:35:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t66AZaYD020237
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Jul 2015 03:35:36 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 6 Jul 2015 03:35:35 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 6 Jul 2015 03:35:33 -0700
Message-ID: <cover.1436178756.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/2] gcc-target 5.1: fix for libcc1
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
X-List-Received-Date: Mon, 06 Jul 2015 10:35:41 -0000
Content-Type: text/plain

The following changes since commit dd09fab685de2eaf04aa5ab60f8220b89c1deae9:

  tune-core2.inc: set X86ARCH32 to i686 (instead of i586) (2015-07-02 23:08:27 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/gcc
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/gcc

Robert Yang (2):
  gcc: remove EXTRA_OECONF_INTERMEDIATE
  gcc-target 5.1: fix for libcc1

 meta/recipes-devtools/gcc/gcc-4.8.inc              |   10 ----
 meta/recipes-devtools/gcc/gcc-4.9.inc              |   10 ----
 meta/recipes-devtools/gcc/gcc-5.1.inc              |   11 +----
 ...ibcc1-fix-libcc1-s-install-path-and-rpath.patch |   51 ++++++++++++++++++++
 meta/recipes-devtools/gcc/gcc-configure-common.inc |    1 -
 meta/recipes-devtools/gcc/gcc-target.inc           |    5 ++
 meta/recipes-devtools/gcc/gcc_5.1.bb               |    6 +++
 7 files changed, 63 insertions(+), 31 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0039-libcc1-fix-libcc1-s-install-path-and-rpath.patch

-- 
1.7.9.5


