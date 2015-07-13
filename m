Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5F1016E648
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 10:04:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6DA4Xoq006118
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 03:04:33 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Mon, 13 Jul 2015 03:04:32 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 13 Jul 2015 03:04:28 -0700
Message-ID: <cover.1436781811.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/4] meta: remove invalid ac_cv
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
X-List-Received-Date: Mon, 13 Jul 2015 10:04:34 -0000
Content-Type: text/plain

The following changes since commit e6f66370c6ce15aca18ef64491bab3dc92b80c57:

  classes/sstate.bbclass: Improve checkstatus using connection cache. (2015-07-12 22:53:22 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/ac_cv
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/ac_cv

Robert Yang (4):
  git: remove invalid ac_cv_c_c99_format=yes
  glibc: remove invalid ac_cv_path_KSH
  apt: remove invalid ac_cv_glibc_ver
  xserver-xorg: remove invalid ac_cv_file__usr_share_sgml_X11_defs_ent

 meta/recipes-core/glibc/glibc.inc                  |    1 -
 meta/recipes-devtools/apt/apt.inc                  |   12 ------------
 meta/recipes-devtools/git/git_2.4.4.bb             |    2 +-
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |    1 -
 4 files changed, 1 insertion(+), 15 deletions(-)

-- 
1.7.9.5


