Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A66A873594
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Feb 2015 05:37:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t1K5bLpR024464
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Feb 2015 21:37:21 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 19 Feb 2015 21:37:21 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 19 Feb 2015 21:37:15 -0800
Message-ID: <cover.1424410597.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/6] Packages upgrade
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
X-List-Received-Date: Fri, 20 Feb 2015 05:37:22 -0000
Content-Type: text/plain

The following changes since commit 530565c6cb77319f4cc49edeea6fec6be997415d:

  glibc: Update to glibc 2.21 release tag (2015-02-19 17:04:19 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/pu
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/pu

Robert Yang (6):
  quilt: 0.63 -> 0.64
  cups: 2.0.1 -> 2.0.2
  git: 2.2.1 -> 2.3.0
  python-git: 0.3.3 -> 0.3.6
  python-gitdb: 0.6.1 -> 0.6.4
  logrotate: 3.8.8 -> 3.8.9

 meta/recipes-devtools/git/git.inc                  |    1 +
 .../git/{git_2.2.1.bb => git_2.3.0.bb}             |    8 ++--
 .../{python-git_0.3.3.bb => python-git_0.3.6.bb}   |    4 +-
 ...python-gitdb_0.6.1.bb => python-gitdb_0.6.4.bb} |    4 +-
 .../{quilt-native_0.63.bb => quilt-native_0.64.bb} |    2 +-
 .../quilt/{quilt-0.63.inc => quilt.inc}            |    4 +-
 .../quilt/{quilt_0.63.bb => quilt_0.64.bb}         |    2 +-
 meta/recipes-extended/cups/cups.inc                |    1 -
 ...1-test-ippserver.c-check-avahi-before-use.patch |   34 --------------
 .../cups/{cups_2.0.1.bb => cups_2.0.2.bb}          |    4 +-
 .../logrotate/act-as-mv-when-rotate.patch          |   48 ++++++++++----------
 .../disable-check-different-filesystems.patch      |   30 ++++++------
 .../logrotate/logrotate/update-the-manual.patch    |   26 +++++++----
 .../{logrotate_3.8.8.bb => logrotate_3.8.9.bb}     |    4 +-
 14 files changed, 75 insertions(+), 97 deletions(-)
 rename meta/recipes-devtools/git/{git_2.2.1.bb => git_2.3.0.bb} (41%)
 rename meta/recipes-devtools/python/{python-git_0.3.3.bb => python-git_0.3.6.bb} (85%)
 rename meta/recipes-devtools/python/{python-gitdb_0.6.1.bb => python-gitdb_0.6.4.bb} (78%)
 rename meta/recipes-devtools/quilt/{quilt-native_0.63.bb => quilt-native_0.64.bb} (51%)
 rename meta/recipes-devtools/quilt/{quilt-0.63.inc => quilt.inc} (92%)
 rename meta/recipes-devtools/quilt/{quilt_0.63.bb => quilt_0.64.bb} (95%)
 delete mode 100644 meta/recipes-extended/cups/cups/0001-test-ippserver.c-check-avahi-before-use.patch
 rename meta/recipes-extended/cups/{cups_2.0.1.bb => cups_2.0.2.bb} (40%)
 rename meta/recipes-extended/logrotate/{logrotate_3.8.8.bb => logrotate_3.8.9.bb} (93%)

-- 
1.7.9.5


