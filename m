Return-Path: <Qi.Chen@windriver.com>
Received: from mail7.windriver.com (mail7.windriver.com [128.224.252.3])
	by mail.openembedded.org (Postfix) with ESMTP id 0D9866BA88
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 07:07:44 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail7.windriver.com (8.14.5/8.14.3) with ESMTP id r7R77itp005636
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 03:07:44 -0400 (EDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Tue, 27 Aug 2013 00:07:43 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 27 Aug 2013 15:07:59 +0800
Message-ID: <cover.1377587203.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/4] runqemu fixes about iptables rules and preconfigured tap
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
X-List-Received-Date: Tue, 27 Aug 2013 07:07:46 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

The following changes since commit 44c3f72684c5c920ce8af1da54a2268047342589:

  lib/oeqa/runtime: smart: add checks for smart output (2013-08-26 16:29:18 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/runqemu-fixes
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/runqemu-fixes

Chen Qi (4):
  runqemu-ifdown: clean up the remaining iptables rules
  runqemu-internal: don't bring down preconfigured tap interface
  runqemu-internal: change the lock acquire/release logic
  runqemu-internal: provide more info if a preconfigured tap is used

 scripts/runqemu-ifdown   |   14 ++++++++++++++
 scripts/runqemu-internal |   20 ++++++++++----------
 2 files changed, 24 insertions(+), 10 deletions(-)

-- 
1.7.9.5


