Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7B43D60111
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Apr 2016 07:34:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u377YXTj026785
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Apr 2016 00:34:33 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 7 Apr 2016 00:34:32 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Apr 2016 00:34:29 -0700
Message-ID: <cover.1460014426.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/3] meta: 3 fixes for nativesdk recipes
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
X-List-Received-Date: Thu, 07 Apr 2016 07:34:33 -0000
Content-Type: text/plain

The following changes since commit 5ebea1114d54120d5ff5d8a6cd148110d0fda23f:

  build-appliance-image: Update to master head revision (2016-04-06 23:54:57 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/3fixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/3fixes

Robert Yang (3):
  libsolv: fix installed-vs-shipped for nativesdk
  bdwgc: installed-vs-shipped for nativesdk
  apr-util: fix path in rules.mk for nativesdk

 .../0001-CMakeLists.txt-fix-MAN_INSTALL_DIR.patch  | 37 ++++++++++++++++++++++
 meta/recipes-extended/libsolv/libsolv_git.bb       |  4 ++-
 meta/recipes-support/apr/apr-util_1.5.4.bb         |  8 ++---
 meta/recipes-support/bdwgc/bdwgc_7.4.2.bb          |  2 +-
 4 files changed, 45 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-extended/libsolv/libsolv/0001-CMakeLists.txt-fix-MAN_INSTALL_DIR.patch

-- 
2.7.4


