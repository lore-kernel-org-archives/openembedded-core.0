Return-Path: <Dengke.Du@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7053B60750
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 05:40:16 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uBJ5eHX9007254
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Dec 2016 21:40:17 -0800 (PST)
Received: from pek-lpgtest20.wrs.com (128.224.179.28) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Sun, 18 Dec 2016 21:40:16 -0800
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 19 Dec 2016 13:40:13 +0800
Message-ID: <cover.1482125840.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH V2 0/2] apr: fix off_t size can't match when configure and in target glibc
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
X-List-Received-Date: Mon, 19 Dec 2016 05:40:17 -0000
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


