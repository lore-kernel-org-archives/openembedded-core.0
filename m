Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9AD016BF37
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Dec 2018 06:42:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wBC6gMep001347
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2018 22:42:22 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Tue, 11 Dec 2018 22:42:22 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Dec 2018 14:59:54 +0800
Message-ID: <cover.1544597612.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/6 V2] ccache.bbclass: Refactor it to make it more reliable
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
X-List-Received-Date: Wed, 12 Dec 2018 06:42:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

* V2
  - Fix comments from Martin Jansa and Martin Hundebøll.
  - Fix RP's comments:
    1) Add comments for ccache related code in base.bbclass
    2) Remove all ccache-native's dependencies so that all recipes can depend on
       and use it.
  - Update test_ccache_tool in oeqa

* V1
  - Initial version

// Robert

The following changes since commit 8bc0d2f2197430723f8b2d0785169e48c883eedb:

  mdadm: Drop redundant patches and fix build with clang (2018-12-09 11:08:07 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/ccache
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/ccache

Robert Yang (6):
  ccache-native: Remove dependencies
  ccache.bbclass: Refactor it to make it more reliable
  apr/openssl10: Enable ccache for them
  cmake.bbclass/goarch.bbclass: Set CCACHE_DISABLE
  base.bbclass: Add comments for gcc links to ccache
  oeqa/selftest/cases: Update test_ccache_tool

 meta/classes/base.bbclass                          |  4 ++++
 meta/classes/ccache.bbclass                        | 25 +++++++++++++++++++---
 meta/classes/cmake.bbclass                         |  4 ++--
 meta/classes/goarch.bbclass                        |  4 ++++
 meta/conf/bitbake.conf                             |  6 +-----
 meta/conf/layer.conf                               |  1 -
 meta/lib/oe/utils.py                               |  3 ++-
 meta/lib/oeqa/selftest/cases/buildoptions.py       | 10 ++++-----
 .../openssl/openssl10_1.0.2q.bb                    |  3 ---
 meta/recipes-devtools/ccache/ccache.inc            | 13 ++++++++++-
 meta/recipes-devtools/ccache/ccache_3.4.2.bb       |  4 ++--
 meta/recipes-support/apr/apr_1.6.5.bb              |  5 -----
 12 files changed, 54 insertions(+), 28 deletions(-)

-- 
2.7.4


