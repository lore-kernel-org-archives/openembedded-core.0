Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E40CE783B4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Feb 2018 01:28:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w151S92q026355
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 4 Feb 2018 17:28:09 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Sun, 4 Feb 2018 17:28:06 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 4 Feb 2018 20:27:58 -0500
Message-ID: <cover.1517793934.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH V2 0/5] improve reproducibility of 5 recipes
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
X-List-Received-Date: Mon, 05 Feb 2018 01:28:10 -0000
Content-Type: text/plain

Changed in V2:

- Rebase on top of targeted branch master a0988c3374

//Hongxu

The following changes since commit 385944254d0ef88bd6450a221a54cbcb40020b42:

  tcmode-default.inc: drop preferred version of gzip-native (2018-01-31 17:01:20 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/reproduce
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/reproduce

Hongxu Jia (5):
  python-xcbgen: improve reproducibility
  openssl/nativesdk-openssl: improve reproducibility
  python3-core: improve reproducibility
  python-core/python-dev: improve reproducibility
  kbd-ptest: improve reproducibility

 .../openssl/0001-improve-reproducibility.patch     | 50 ++++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.2m.bb | 11 +++++
 meta/recipes-core/kbd/kbd_2.0.4.bb                 |  7 +++
 meta/recipes-devtools/python/python3_3.5.3.bb      | 13 +++++-
 meta/recipes-devtools/python/python_2.7.14.bb      |  7 ++-
 meta/recipes-graphics/xorg-proto/xcb-proto_1.12.bb |  2 +-
 6 files changed, 87 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/0001-improve-reproducibility.patch

-- 
2.8.1


