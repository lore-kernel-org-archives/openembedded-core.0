Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2CCCC7025E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 04:39:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7B4dxsv011669
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 10 Aug 2014 21:39:59 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Sun, 10 Aug 2014 21:39:59 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Aug 2014 12:39:52 +0800
Message-ID: <cover.1407731782.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 0/1] puzzles: fix do_compile failed when DEBUG_BUILD
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
X-List-Received-Date: Mon, 11 Aug 2014 04:40:04 -0000
Content-Type: text/plain

Test steps:

1. vim local.conf
...
MACHINE = "qemux86-64"
DEBUG_BUILD = "1"
...

2. bitbake puzzles

//Hongxu

The following changes since commit 870bb8d35547b8313b3a487d7e8b914ab9470e64:

  local.conf.sample.extended: fix example for EXTRA_USERS_PARAMS (2014-08-04 17:38:24 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-puzzles
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-puzzles

Hongxu Jia (1):
  puzzles: fix do_compile failed when DEBUG_BUILD

 .../fix-compiling-failure-with-option-g-O.patch    | 52 ++++++++++++++++++++++
 meta/recipes-sato/puzzles/puzzles_r10116.bb        |  4 +-
 2 files changed, 55 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-sato/puzzles/files/fix-compiling-failure-with-option-g-O.patch

-- 
1.9.1


