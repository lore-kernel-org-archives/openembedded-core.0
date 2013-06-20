Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 30D3B6A5DA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 03:30:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5K3UE9S015735
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 19 Jun 2013 20:30:15 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Wed, 19 Jun 2013 20:30:14 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <ross.burton@intel.com>
Date: Thu, 20 Jun 2013 11:29:40 +0800
Message-ID: <cover.1371698863.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/3] V2: Some fixes for packages under recipes-devtools
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
X-List-Received-Date: Thu, 20 Jun 2013 03:30:14 -0000
Content-Type: text/plain

V2:
* fix typo
* update upstream-status of python-pygtk/update-dependences-of-defs.c.patch

The following changes since commit e04e6dab0afa8f72bf001b0cc106cd13b7694a91:

  bdwgc-native: Add missing pkgconfig DEPENDS (2013-06-19 18:03:35 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib kangkai/devtools
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/devtools

Kai Kang (3):
  openjade-native: fix build failure
  python-pygobject: disable parallel install
  python-pygtk: fix parallel compile issue

 .../openjade/openjade-1.3.2/fix-regex.patch        |   32 ++++++++++++++++
 .../openjade/openjade-native_1.3.2.bb              |    3 +-
 .../python/python-pygobject_2.27.91.bb             |    2 +
 .../update-dependences-of-defs.c.patch             |   38 ++++++++++++++++++++
 .../recipes-devtools/python/python-pygtk_2.24.0.bb |    3 +-
 5 files changed, 76 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/openjade/openjade-1.3.2/fix-regex.patch
 create mode 100644 meta/recipes-devtools/python/python-pygtk/update-dependences-of-defs.c.patch

-- 
1.7.5.4


