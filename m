Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3122F6BE3A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Dec 2018 09:02:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wBS920Zq012408
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Dec 2018 01:02:10 -0800
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Fri, 28 Dec 2018 01:01:49 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Dec 2018 01:01:46 -0800
Message-ID: <cover.1545987662.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Subject: [PATCH 0/3] valgrind/bluez5/perl: Fix race issues when parallel build
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
X-List-Received-Date: Fri, 28 Dec 2018 09:02:19 -0000
Content-Type: text/plain

The following changes since commit caa776bdcf8ea34c857f45970370bf771075f4bc:

  testimage.bbclass: remove boot parameter systemd.log_target (2018-12-27 22:50:01 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/race
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/race

Robert Yang (3):
  valgrind: Fix a race issue for libcoregrind.a
  bluez5: Fix a race issue for tools
  perl: Fix race issue for cpan/Pod-Simple

 meta/recipes-connectivity/bluez5/bluez5.inc        |  1 +
 ...01-Makefile.am-Fix-a-race-issue-for-tools.patch | 32 +++++++++++++++
 meta/recipes-devtools/perl/perl-native_5.24.4.bb   |  1 +
 ...kefile.SH-Pod-Simple-requires-Getopt-Long.patch | 34 ++++++++++++++++
 meta/recipes-devtools/perl/perl_5.24.4.bb          |  1 +
 ...ncies-between-libcoregrind-.a-and-m_main..patch | 45 ++++++++++++++++++++++
 meta/recipes-devtools/valgrind/valgrind_3.14.0.bb  |  1 +
 7 files changed, 115 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-Makefile.am-Fix-a-race-issue-for-tools.patch
 create mode 100644 meta/recipes-devtools/perl/perl/0001-Makefile.SH-Pod-Simple-requires-Getopt-Long.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-Fix-dependencies-between-libcoregrind-.a-and-m_main..patch

-- 
2.10.2


