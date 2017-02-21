Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1825360053
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 07:37:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v1L7b2vE011104
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 20 Feb 2017 23:37:02 -0800 (PST)
Received: from pek-lpggp4.wrs.com (128.224.153.77) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 20 Feb 2017 23:37:01 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Tue, 21 Feb 2017 15:36:55 +0800
Message-ID: <cover.1487659929.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [PATCH V4 0/4] upgrade bash and ncurses
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
X-List-Received-Date: Tue, 21 Feb 2017 07:37:10 -0000
Content-Type: text/plain

Changed in V4:
- Rebase bash, to drop backported patch CVE-2016-9401.patch

- Fix ncurses configure failure in beaglebone by removing cf_flags check.

Changed in V3:

- Fix nativesdk-bash compile failure

- Fix ncurses configure failure in beaglebone

//Hongxu


The following changes since commit e436a6398684d2872cb541f1cfb0f67b3618d15a:

  layer.conf: bump version for change in eSDK selftest behaviour (2017-02-19 09:39:03 -0800)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib hongxu/upgrade-20170214
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=hongxu/upgrade-20170214

Hongxu Jia (3):
  bash: update patches for 4.4
  ncurses: 6.0+20160625 -> 6.0+20161126
  ncurses: fix beaglebone do_configure failure

Zheng Ruoqin (1):
  bash: 4.3.30 -> 4.4

 .../ncurses/files/removed-cflags-checking.patch    |  60 +++++++++
 ...ses_6.0+20160625.bb => ncurses_6.0+20161126.bb} |   3 +-
 ...e-builtins-uname-could-not-be-parsed-by-r.patch |  89 +++++++++++++
 .../0001-patch-to-obtain-pkgconfig-sanity.patch    |  28 +++++
 .../recipes-extended/bash/bash/CVE-2016-9401.patch |  50 --------
 ...roc-run-heredoc-run-execscript-run-test-f.patch | 137 ++-------------------
 meta/recipes-extended/bash/bash/fix-run-intl.patch | 110 -----------------
 meta/recipes-extended/bash/bash/test-output.patch  |  20 ++-
 meta/recipes-extended/bash/bash_4.3.30.bb          |  72 -----------
 meta/recipes-extended/bash/bash_4.4.bb             |  66 ++++++++++
 10 files changed, 271 insertions(+), 364 deletions(-)
 create mode 100644 meta/recipes-core/ncurses/files/removed-cflags-checking.patch
 rename meta/recipes-core/ncurses/{ncurses_6.0+20160625.bb => ncurses_6.0+20161126.bb} (72%)
 create mode 100644 meta/recipes-extended/bash/bash/0001-The-loadable-builtins-uname-could-not-be-parsed-by-r.patch
 create mode 100644 meta/recipes-extended/bash/bash/0001-patch-to-obtain-pkgconfig-sanity.patch
 delete mode 100644 meta/recipes-extended/bash/bash/CVE-2016-9401.patch
 delete mode 100644 meta/recipes-extended/bash/bash/fix-run-intl.patch
 delete mode 100644 meta/recipes-extended/bash/bash_4.3.30.bb
 create mode 100644 meta/recipes-extended/bash/bash_4.4.bb

-- 
2.9.3


