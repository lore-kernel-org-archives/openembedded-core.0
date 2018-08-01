Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 94BA178D9E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Aug 2018 08:03:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7183hqL006601
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Aug 2018 01:03:43 -0700
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.399.0; Wed, 1 Aug 2018 01:03:42 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 1 Aug 2018 16:14:00 +0800
Message-ID: <cover.1533111205.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/4] Recipes upgrade
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
X-List-Received-Date: Wed, 01 Aug 2018 08:03:42 -0000
Content-Type: text/plain

The following changes since commit 51a09ba2729a840a9f2f87b68c7f50a3e6ac0d04:

  gcc-7.3: Backport fixes for std::pair high memory usage (2018-07-31 22:55:31 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/pu
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/pu

Robert Yang (4):
  python-pbr: 3.1.1 -> 4.2.0
  python3-subunit: 1.1.0 -> 1.3.0
  python3-testtools: 2.2.0 -> 2.3.0
  e2fsprogs: 1.44.2 -> 1.44.3

 .../e2fsprogs/e2fsprogs/ptest.patch                | 49 ++++++++++++----------
 .../{e2fsprogs_1.44.2.bb => e2fsprogs_1.44.3.bb}   |  2 +-
 meta/recipes-devtools/python/python-pbr.inc        |  4 +-
 meta/recipes-devtools/python/python-subunit.inc    |  6 +--
 meta/recipes-devtools/python/python-testtools.inc  |  4 +-
 .../{python3-pbr_3.1.1.bb => python3-pbr_4.2.0.bb} |  0
 ...3-subunit_1.1.0.bb => python3-subunit_1.3.0.bb} |  0
 ...sttools_2.2.0.bb => python3-testtools_2.3.0.bb} |  0
 8 files changed, 36 insertions(+), 29 deletions(-)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.44.2.bb => e2fsprogs_1.44.3.bb} (98%)
 rename meta/recipes-devtools/python/{python3-pbr_3.1.1.bb => python3-pbr_4.2.0.bb} (100%)
 rename meta/recipes-devtools/python/{python3-subunit_1.1.0.bb => python3-subunit_1.3.0.bb} (100%)
 rename meta/recipes-devtools/python/{python3-testtools_2.2.0.bb => python3-testtools_2.3.0.bb} (100%)

-- 
2.7.4


