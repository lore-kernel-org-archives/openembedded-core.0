Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CE9597716F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 08:32:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u8C8W8hT019700
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 01:32:08 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 12 Sep 2016 01:32:08 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 12 Sep 2016 01:32:06 -0700
Message-ID: <cover.1473669090.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
MIME-Version: 1.0
Subject: [PATCH 0/2] meta: cleanup d.getVar(var, 1) and d.getVar(var, 0)
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
X-List-Received-Date: Mon, 12 Sep 2016 08:32:09 -0000
Content-Type: text/plain

The following changes since commit 4d268abc2fc892c5d34449f78c8e9f2b1a9d6bac:

  oeqa.runtime.smart: work around smart race issues (2016-09-09 12:12:17 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/getvar
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/getvar

Robert Yang (2):
  meta: cleanup d.getVar(var, 1)
  meta: cleanup d.getVar(var, 0)

 meta/classes/base.bbclass                          |  2 +-
 meta/classes/image.bbclass                         |  2 +-
 meta/classes/kernel.bbclass                        |  8 ++++----
 meta/classes/package.bbclass                       |  2 +-
 meta/classes/package_ipk.bbclass                   |  2 +-
 meta/classes/recipe_sanity.bbclass                 | 22 +++++++++++-----------
 meta/lib/oe/utils.py                               |  4 ++--
 meta/recipes-devtools/apt/apt-native.inc           |  2 +-
 meta/recipes-devtools/cmake/cmake.inc              |  2 +-
 .../kconfig-frontends_3.12.0.0.bb                  |  2 +-
 meta/recipes-devtools/vala/vala.inc                |  2 +-
 meta/recipes-support/boost/boost-1.61.0.inc        |  4 ++--
 12 files changed, 27 insertions(+), 27 deletions(-)

-- 
2.9.0


