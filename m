Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EC7A078870
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jan 2018 08:11:28 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w0C8BTEM009329
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 12 Jan 2018 00:11:29 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 12 Jan 2018 00:11:29 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 12 Jan 2018 03:11:21 -0500
Message-ID: <cover.1515744181.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH 0/6] improve reproducibility of 6 recipes
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
X-List-Received-Date: Fri, 12 Jan 2018 08:11:29 -0000
Content-Type: text/plain

Fix build path issue of these recipes to improve reproducibility

Build success on qemux86-64 with multilib enabled.

//Hongxu

The following changes since commit 364f8bcfcbd04e722490f363ad36a15fb7066ba7:

  linux-firmware: Bump revision to 65b1c68c (2018-01-11 10:26:07 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/reproduce
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/reproduce

Hongxu Jia (6):
  wget: improve reproducibility
  python-xcbgen: improve reproducibility
  openssl/nativesdk-openssl: improve reproducibility
  python3-core: improve reproducibility
  python-core/python-dev: improve reproducibility
  kbd-ptest: improve reproducibility

 .../openssl/0001-improve-reproducibility.patch     | 50 ++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.2m.bb | 11 ++++
 meta/recipes-core/kbd/kbd_2.0.4.bb                 |  7 +++
 meta/recipes-devtools/python/python3_3.5.3.bb      | 13 ++++-
 meta/recipes-devtools/python/python_2.7.13.bb      |  7 ++-
 meta/recipes-extended/wget/wget.inc                |  3 ++
 .../wget/wget/0002-improve-reproducibility.patch   | 61 ++++++++++++++++++++++
 meta/recipes-extended/wget/wget_1.19.2.bb          |  1 +
 meta/recipes-graphics/xorg-proto/xcb-proto_1.12.bb |  2 +-
 9 files changed, 152 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/0001-improve-reproducibility.patch
 create mode 100644 meta/recipes-extended/wget/wget/0002-improve-reproducibility.patch

-- 
2.8.1


