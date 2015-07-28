Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4ADD67634C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 02:12:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6S2CWFS025324
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 19:12:33 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Mon, 27 Jul 2015 19:12:17 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Jul 2015 19:12:23 -0700
Message-ID: <cover.1438049511.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/9] Packages Upgrade
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
X-List-Received-Date: Tue, 28 Jul 2015 02:12:34 -0000
Content-Type: text/plain

The following changes since commit 27d068d05239c26a3848eb101571acab54635e37:

  harfbuzz: upgrade to 1.0.1 (2015-07-27 23:28:23 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/PU
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/PU

Robert Yang (9):
  git: 2.4.4 -> 2.4.6
  file: 5.23 -> 5.24
  libuser: 0.61 -> 0.62
  less: 478 -> 479
  cracklib: 2.9.4 -> 2.9.5
  gnupg: 2.1.5 -> 2.1.6
  help2man-native: 1.46.4 -> 1.47.1
  man-pages: 4.00 -> 4.01
  pax-utils: 1.0.3 -> 1.0.5

 ...h-long-options-and-explicitly-number-them.patch |  116 --------------------
 .../file/0002-fix-bug-with-5.23-long-options.patch |   26 -----
 .../file/{file_5.23.bb => file_git.bb}             |   17 ++-
 meta/recipes-devtools/git/git_2.4.4.bb             |   11 --
 meta/recipes-devtools/git/git_2.4.6.bb             |   11 ++
 ...-native_1.46.4.bb => help2man-native_1.47.1.bb} |    4 +-
 .../{pax-utils_1.0.3.bb => pax-utils_1.0.5.bb}     |    4 +-
 .../{cracklib_2.9.4.bb => cracklib_2.9.5.bb}       |    4 +-
 .../less/{less_478.bb => less_479.bb}              |    4 +-
 .../libuser/{libuser_0.61.bb => libuser_0.62.bb}   |    4 +-
 .../{man-pages_4.00.bb => man-pages_4.01.bb}       |   13 +--
 .../gnupg/{gnupg_2.1.5.bb => gnupg_2.1.6.bb}       |    4 +-
 12 files changed, 35 insertions(+), 183 deletions(-)
 delete mode 100644 meta/recipes-devtools/file/file/0001-Fix-bug-with-long-options-and-explicitly-number-them.patch
 delete mode 100644 meta/recipes-devtools/file/file/0002-fix-bug-with-5.23-long-options.patch
 rename meta/recipes-devtools/file/{file_5.23.bb => file_git.bb} (64%)
 delete mode 100644 meta/recipes-devtools/git/git_2.4.4.bb
 create mode 100644 meta/recipes-devtools/git/git_2.4.6.bb
 rename meta/recipes-devtools/help2man/{help2man-native_1.46.4.bb => help2man-native_1.47.1.bb} (79%)
 rename meta/recipes-devtools/pax-utils/{pax-utils_1.0.3.bb => pax-utils_1.0.5.bb} (83%)
 rename meta/recipes-extended/cracklib/{cracklib_2.9.4.bb => cracklib_2.9.5.bb} (91%)
 rename meta/recipes-extended/less/{less_478.bb => less_479.bb} (88%)
 rename meta/recipes-extended/libuser/{libuser_0.61.bb => libuser_0.62.bb} (88%)
 rename meta/recipes-extended/man-pages/{man-pages_4.00.bb => man-pages_4.01.bb} (81%)
 rename meta/recipes-support/gnupg/{gnupg_2.1.5.bb => gnupg_2.1.6.bb} (89%)

-- 
1.7.9.5


