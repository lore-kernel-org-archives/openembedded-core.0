Return-Path: <Dengke.Du@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 406EC6E688
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2016 02:49:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uBG2nLHF008335
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 18:49:23 -0800 (PST)
Received: from pek-lpgtest20.wrs.com (128.224.179.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Thu, 15 Dec 2016 18:49:21 -0800
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Dec 2016 10:49:18 +0800
Message-ID: <cover.1481856470.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/2] fix apr configure error for cross compiling
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
X-List-Received-Date: Fri, 16 Dec 2016 02:49:24 -0000
Content-Type: text/plain

The following changes since commit a92d27acd8f42b61a2fc575311838b45d171f0af:

  oeqa/utils/commands.py: Fix get_bb_vars() when called without arguments (2016-12-14 16:15:04 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib dengke/fix-apr-configure-error-for-cross-compiling
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=dengke/fix-apr-configure-error-for-cross-compiling

Dengke Du (2):
  Revert "subversion: fix "svnadmin create" fail on x86"
  apr: fix off_t size can't match when configure and in target glibc

 .../0001-fix-svnadmin-create-fail-on-x86.patch     | 56 ----------------------
 .../subversion/subversion_1.9.4.bb                 |  1 -
 ..._t-size-doesn-t-match-in-glibc-when-cross.patch | 52 ++++++++++++++++++++
 meta/recipes-support/apr/apr_1.5.2.bb              |  1 +
 4 files changed, 53 insertions(+), 57 deletions(-)
 delete mode 100644 meta/recipes-devtools/subversion/subversion/0001-fix-svnadmin-create-fail-on-x86.patch
 create mode 100644 meta/recipes-support/apr/apr/0001-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch

-- 
2.7.4


