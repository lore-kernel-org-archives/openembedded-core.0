Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CD8DF615BE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jan 2014 06:52:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s036qLdI013532
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Jan 2014 22:52:21 -0800 (PST)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Thu, 2 Jan 2014 22:52:20 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 3 Jan 2014 14:51:28 +0800
Message-ID: <cover.1388730750.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH V2 0/2] quilt: upgrade to 0.61 and enable ptest support
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
X-List-Received-Date: Fri, 03 Jan 2014 06:52:22 -0000
Content-Type: text/plain

Changes since V1:
1. Add ptest in quilt-0.61.inc.
2. Exclude *.in source files to target.
3. Add patch-wrapper.test test case.
4. Add RDEPENDS_${PN}-ptest in quilt-0.61.inc.
5. Remove unused variable in Makefile.

The following changes since commit 005af45191ded6185c618c708181b31281e43092:

  bitbake: fetch2: avoid printing "no checksum" error message twice (2013-12-22 14:29:13 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/quilt
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/quilt

Chong Lu (2):
  quilt: upgrade to 0.61
  quilt: enable ptest support

 .../quilt/{quilt-0.60.inc => quilt-0.61.inc}       | 28 ++++++++++++++++++----
 .../{quilt-native_0.60.bb => quilt-native_0.61.bb} |  1 -
 meta/recipes-devtools/quilt/quilt/Makefile         | 13 ++++++++++
 meta/recipes-devtools/quilt/quilt/run-ptest        |  5 ++++
 .../quilt/{quilt_0.60.bb => quilt_0.61.bb}         |  4 +---
 5 files changed, 43 insertions(+), 8 deletions(-)
 rename meta/recipes-devtools/quilt/{quilt-0.60.inc => quilt-0.61.inc} (50%)
 rename meta/recipes-devtools/quilt/{quilt-native_0.60.bb => quilt-native_0.61.bb} (98%)
 create mode 100644 meta/recipes-devtools/quilt/quilt/Makefile
 create mode 100755 meta/recipes-devtools/quilt/quilt/run-ptest
 rename meta/recipes-devtools/quilt/{quilt_0.60.bb => quilt_0.61.bb} (95%)

-- 
1.8.1.2


