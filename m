Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id AF03A71A3A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2017 07:02:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v1E72MxL030858
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 13 Feb 2017 23:02:22 -0800
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 13 Feb 2017 23:02:21 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Tue, 14 Feb 2017 02:02:16 -0500
Message-ID: <cover.1487055395.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH V3 0/4] upgrade bash and ncurses
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
X-List-Received-Date: Tue, 14 Feb 2017 07:02:24 -0000
Content-Type: text/plain

Changed in V3:

- Fix nativesdk-bash compile failure

- Fix ncurses configure failure in beaglebone

//Hongxu

The following changes since commit e758547db9048d4aa1c1415d6af8072f519fae24:

  nss: Fix nss-native so the checksum doesn't change with BUILD_ARCH (2017-02-09 10:52:03 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib hongxu/upgrade-20170214
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=hongxu/upgrade-20170214

Hongxu Jia (3):
  bash: update patches for 4.4
  ncurses: 6.0+20160625 -> 6.0+20161126
  ncurses: fix beaglebone do_configure failure

Zheng Ruoqin (1):
  bash: 4.3.30 -> 4.4

 ...ses_6.0+20160625.bb => ncurses_6.0+20161126.bb} |   4 +-
 ...e-builtins-uname-could-not-be-parsed-by-r.patch |  89 +++++++++++++
 .../0001-patch-to-obtain-pkgconfig-sanity.patch    |  28 +++++
 ...roc-run-heredoc-run-execscript-run-test-f.patch | 137 ++-------------------
 meta/recipes-extended/bash/bash/fix-run-intl.patch | 110 -----------------
 meta/recipes-extended/bash/bash/test-output.patch  |  20 ++-
 meta/recipes-extended/bash/bash_4.3.30.bb          |  71 -----------
 meta/recipes-extended/bash/bash_4.4.bb             |  66 ++++++++++
 8 files changed, 212 insertions(+), 313 deletions(-)
 rename meta/recipes-core/ncurses/{ncurses_6.0+20160625.bb => ncurses_6.0+20161126.bb} (77%)
 create mode 100644 meta/recipes-extended/bash/bash/0001-The-loadable-builtins-uname-could-not-be-parsed-by-r.patch
 create mode 100644 meta/recipes-extended/bash/bash/0001-patch-to-obtain-pkgconfig-sanity.patch
 delete mode 100644 meta/recipes-extended/bash/bash/fix-run-intl.patch
 delete mode 100644 meta/recipes-extended/bash/bash_4.3.30.bb
 create mode 100644 meta/recipes-extended/bash/bash_4.4.bb

-- 
2.8.1


