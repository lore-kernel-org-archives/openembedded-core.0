Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1FEDE78CC3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 08:51:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w6R8p3Ig019272
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 01:51:03 -0700
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.399.0; Fri, 27 Jul 2018 01:51:01 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 27 Jul 2018 17:01:14 +0800
Message-ID: <cover.1532682009.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/5] buildtools-tarball: add python3-testtools and python3-subunit
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
X-List-Received-Date: Fri, 27 Jul 2018 08:51:03 -0000
Content-Type: text/plain

The following changes since commit 364449251ffe4ff2c11acaa258edcec244c38818:

  classes/package: fix variable name in comment (2018-07-26 16:55:21 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/bt
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/bt

Robert Yang (5):
  python3-extras: add it for python3-testtools
  python3-pbr: add it for python3-testtools
  python3-testtools: add it for oeqa
  python3-subunit: add it for oeqa
  buildtools-tarball: add python3-testtools and python3-subunit

 meta/recipes-core/meta/buildtools-tarball.bb       |  2 ++
 meta/recipes-devtools/python/python-extras.inc     | 12 ++++++++++
 meta/recipes-devtools/python/python-pbr.inc        | 14 +++++++++++
 meta/recipes-devtools/python/python-subunit.inc    | 14 +++++++++++
 meta/recipes-devtools/python/python-testtools.inc  | 27 ++++++++++++++++++++++
 .../python/python3-extras_1.0.0.bb                 |  2 ++
 meta/recipes-devtools/python/python3-pbr_3.1.1.bb  |  2 ++
 .../python/python3-subunit_1.1.0.bb                |  2 ++
 .../python/python3-testtools_2.2.0.bb              |  2 ++
 9 files changed, 77 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python-extras.inc
 create mode 100644 meta/recipes-devtools/python/python-pbr.inc
 create mode 100644 meta/recipes-devtools/python/python-subunit.inc
 create mode 100644 meta/recipes-devtools/python/python-testtools.inc
 create mode 100644 meta/recipes-devtools/python/python3-extras_1.0.0.bb
 create mode 100644 meta/recipes-devtools/python/python3-pbr_3.1.1.bb
 create mode 100644 meta/recipes-devtools/python/python3-subunit_1.1.0.bb
 create mode 100644 meta/recipes-devtools/python/python3-testtools_2.2.0.bb

-- 
2.7.4


