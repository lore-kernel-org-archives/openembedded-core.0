Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E2E3160655
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Jun 2013 14:17:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5GEHGjJ018766
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Jun 2013 07:17:16 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Sun, 16 Jun 2013 07:17:16 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 16 Jun 2013 22:16:24 +0800
Message-ID: <cover.1371392062.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Subject: [PATCH 0/2] Some dependency issues
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
X-List-Received-Date: Sun, 16 Jun 2013 14:17:16 -0000
Content-Type: text/plain

The following changes since commit e023620773df82ba1551bec7fb921e4fef01322e:

  bitbake: utils: Fix multiprocessing pool reference (2013-06-14 22:01:09 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib kangkai/trivial-fixes
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/trivial-fixes

Kai Kang (2):
  strace: update depends
  Add needed libx11 library for sato applications

 meta/recipes-devtools/strace/strace_4.7.bb         |    2 +
 .../files/link-with-new-binutils.patch             |   41 +++++++++++++
 .../matchbox-panel-2/matchbox-panel-2_git.bb       |    3 +-
 .../sato-screenshot/files/add-needed-libx11.patch  |   63 ++++++++++++++++++++
 .../sato-screenshot/sato-screenshot_git.bb         |    3 +-
 5 files changed, 110 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-sato/matchbox-panel-2/files/link-with-new-binutils.patch
 create mode 100644 meta/recipes-sato/sato-screenshot/files/add-needed-libx11.patch

-- 
1.7.5.4


