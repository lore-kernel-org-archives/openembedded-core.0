Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5F0BB74CAF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 05:43:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6J5hb8c014904
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2018 22:43:37 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Wed, 18 Jul 2018 22:43:36 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 19 Jul 2018 13:47:17 +0800
Message-ID: <cover.1531979156.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] logging: use warning instead warn
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
X-List-Received-Date: Thu, 19 Jul 2018 05:43:37 -0000
Content-Type: text/plain

The following changes since commit b0f2f690a3513e4c9fa30fee1b8d7ac2d7140657:

  systemd-boot: upgrade to 239 (2018-07-18 10:18:42 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/logging-warning
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/logging-warning

Chen Qi (1):
  logging: use warning instead warn

 meta/lib/oe/terminal.py               |  6 +++---
 meta/lib/oeqa/selftest/context.py     |  2 +-
 meta/lib/oeqa/utils/qemurunner.py     |  4 ++--
 scripts/combo-layer                   |  2 +-
 scripts/contrib/verify-homepage.py    |  2 +-
 scripts/lib/devtool/export.py         |  2 +-
 scripts/lib/devtool/import.py         |  8 ++++----
 scripts/lib/devtool/standard.py       | 16 ++++++++--------
 scripts/lib/devtool/upgrade.py        |  6 +++---
 scripts/lib/recipetool/append.py      | 14 +++++++-------
 scripts/lib/recipetool/create.py      |  4 ++--
 scripts/lib/recipetool/create_kmod.py |  2 +-
 scripts/lib/recipetool/create_npm.py  |  6 +++---
 scripts/lib/recipetool/newappend.py   |  4 ++--
 scripts/lib/wic/engine.py             |  2 +-
 scripts/runqemu                       | 16 ++++++++--------
 16 files changed, 48 insertions(+), 48 deletions(-)

-- 
1.9.1


