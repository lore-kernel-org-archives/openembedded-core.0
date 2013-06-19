Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 89B40601AF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2013 12:04:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5JC4kqg024971
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2013 05:04:46 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Wed, 19 Jun 2013 05:04:46 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Jun 2013 19:57:14 +0800
Message-ID: <cover.1371642926.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Subject: [PATCH 0/3] Some fixes for packages under recipes-devtools
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
X-List-Received-Date: Wed, 19 Jun 2013 12:04:46 -0000
Content-Type: text/plain

The following changes since commit 1dd643b142c69ac9035e29bff11d02201638dc65:

  licences: Add SGI license (2013-06-17 16:45:37 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib kangkai/devtools
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/devtools

Kai Kang (3):
  openjade-native: fix build failure
  python-pygobject: disable parallel install
  python-pygtk: fix parallel compile issue

 .../openjade/openjade-1.3.2/fix-regex.patch        |   32 +++++++++++++++++
 .../openjade/openjade-native_1.3.2.bb              |    3 +-
 .../python/python-pygobject_2.27.91.bb             |    2 +
 .../update-dependences-of-defs.c.patch             |   36 ++++++++++++++++++++
 .../recipes-devtools/python/python-pygtk_2.24.0.bb |    3 +-
 5 files changed, 74 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/openjade/openjade-1.3.2/fix-regex.patch
 create mode 100644 meta/recipes-devtools/python/python-pygtk/update-dependences-of-defs.c.patch

-- 
1.7.5.4


