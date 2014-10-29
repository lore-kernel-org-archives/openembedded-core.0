Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9F38C6E67C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Oct 2014 05:54:56 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9T5stKY017049
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 28 Oct 2014 22:54:55 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 28 Oct 2014 22:54:55 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <mark.hatle@windriver.com>,
	<paul.eggleton@linux.intel.com>
Date: Wed, 29 Oct 2014 13:54:48 +0800
Message-ID: <cover.1414561710.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/3] fix man-pages confliction and smart install with --attempt failed
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
X-List-Received-Date: Wed, 29 Oct 2014 05:55:01 -0000
Content-Type: text/plain

1. vim local.conf
...
IMAGE_INSTALL_append = "shadow man-pages hdparm"
EXTRA_IMAGE_FEATURES += "doc-pkgs"
...

2. bitbake core-image-minimal

//Hongxu

The following changes since commit dacc4ce59e48129a1a1e5316e10780f7358e29ef:

  nativesdk-cmake: Adjust toolchain paths dynamically (2014-10-24 21:59:46 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-man-pages
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-man-pages

Hongxu Jia (3):
  man-pages/shadow: resolve man pages confliction
  python-smartpm: report warn rather than error during install with
    --attempt
  rootfs.py: tweak inner warn message catching

 meta/lib/oe/rootfs.py                              |  2 +-
 .../python/python-smartpm/smart-attempt.patch      | 27 +++++++++++++++++++---
 meta/recipes-extended/man-pages/man-pages_3.71.bb  |  7 ++++++
 meta/recipes-extended/shadow/shadow.inc            |  4 ++++
 4 files changed, 36 insertions(+), 4 deletions(-)

-- 
1.9.1


