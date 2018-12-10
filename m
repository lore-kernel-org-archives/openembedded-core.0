Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 67CC660069
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Dec 2018 02:24:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wBA2ORKc009556
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 9 Dec 2018 18:24:28 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Sun, 9 Dec 2018 18:24:27 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 9 Dec 2018 18:24:20 -0800
Message-ID: <cover.1544408339.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Subject: [PATCH 0/4] ccache.bbclass: Refactor it to make it more reliable
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
X-List-Received-Date: Mon, 10 Dec 2018 02:24:27 -0000
Content-Type: text/plain

Hi RP and Ross,

With this refactor, I think that we can even enable ccache by default, it is
useful for debugging recipes which require a lot of time to compile.

// Robert

The following changes since commit 8bc0d2f2197430723f8b2d0785169e48c883eedb:

  mdadm: Drop redundant patches and fix build with clang (2018-12-09 11:08:07 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/ccache
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/ccache

Robert Yang (4):
  base.bbclass: Remove invalid ccache related code
  ccache.bbclass: Refactor it to make it more reliable
  apr/openssl10: Enable ccache for them
  cmake.bbclass/goarch.bbclass: Set CCACHE_DISABLE

 meta/classes/base.bbclass                          |  2 --
 meta/classes/ccache.bbclass                        | 25 +++++++++++++++++++---
 meta/classes/cmake.bbclass                         |  4 ++--
 meta/classes/goarch.bbclass                        |  4 ++++
 meta/conf/bitbake.conf                             | 21 +++++++++++++-----
 meta/conf/layer.conf                               |  1 -
 meta/lib/oe/utils.py                               |  3 +++
 .../openssl/openssl10_1.0.2q.bb                    |  3 ---
 meta/recipes-devtools/ccache/ccache.inc            |  2 ++
 meta/recipes-support/apr/apr_1.6.5.bb              |  1 -
 10 files changed, 49 insertions(+), 17 deletions(-)

-- 
2.10.2


