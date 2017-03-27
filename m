Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 88D8877A40
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 10:39:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v2RAdFB9007606
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 03:39:15 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 27 Mar 2017 03:39:14 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Mar 2017 03:39:12 -0700
Message-ID: <cover.1490611084.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0.rc2.dirty
MIME-Version: 1.0
Subject: [PATCH 0/2] oe-find-native-sysroot: make it work with RSS
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
X-List-Received-Date: Mon, 27 Mar 2017 10:39:14 -0000
Content-Type: text/plain

The following changes since commit 78928016f4cf38cf6751cb089200bf950d07ae93:

  classes: Replace "if test" file tests with POSIX file tests (2017-03-27 11:08:28 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/rssfix
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/rssfix

Robert Yang (2):
  oe-run-native: OLDPATH -> OLD_PATH
  oe-find-native-sysroot: work with RSS

 scripts/oe-find-native-sysroot | 56 ++++++++++++++++++++++++++++--------------
 scripts/oe-run-native          | 17 ++++++++-----
 scripts/runqemu-export-rootfs  |  2 +-
 scripts/runqemu-extract-sdk    |  2 +-
 4 files changed, 50 insertions(+), 27 deletions(-)

-- 
2.11.0.rc2.dirty


