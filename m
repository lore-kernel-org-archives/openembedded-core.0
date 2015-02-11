Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F0950732F0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Feb 2015 10:10:31 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t1BAAVb3010144
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Feb 2015 02:10:32 -0800 (PST)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 11 Feb 2015 02:10:31 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 11 Feb 2015 18:06:45 +0800
Message-ID: <cover.1423648455.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] perl / PathTools: don't filter out blib from @INC
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
X-List-Received-Date: Wed, 11 Feb 2015 10:10:37 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

If $TOPDIR includes the string "blib", filter it out from @INC may empty
the @INC and cause build errors like:

  Can't locate ExtUtils/MakeMaker.pm in @INC \
  (you may need to install the ExtUtils::MakeMaker module) \
  (@INC contains: .) at Makefile.PL

The following changes since commit 231d4a9d3d89af4b1b5f6ea439c630e4cac82079:

  bitbake: bitbake-user-manual: Removed errant writer note line. (2015-02-10 23:09:32 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/perl
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/perl

Wenzong Fan (1):
  perl / PathTools: don't filter out blib from @INC

 ...-PathTools-don-t-filter-out-blib-from-INC.patch | 33 ++++++++++++++++++++++
 meta/recipes-devtools/perl/perl-native_5.20.0.bb   |  4 ++-
 meta/recipes-devtools/perl/perl_5.20.0.bb          |  1 +
 3 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/perl/perl-5.20.0/perl-PathTools-don-t-filter-out-blib-from-INC.patch

-- 
1.9.1


