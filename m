Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A0CA960116
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 06:39:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x0O6d6XQ026237
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2019 22:39:06 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Wed, 23 Jan 2019 22:39:05 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 24 Jan 2019 14:57:27 +0800
Message-ID: <cover.1548312985.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/5] Fixes for ccache
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
X-List-Received-Date: Thu, 24 Jan 2019 06:39:05 -0000
Content-Type: text/plain

The following changes since commit a4edfa4cf451bf412525887b5b24b9db6486ae97:

  remove unused distutils-tools.bbclass (2019-01-23 07:57:02 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/ccache
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/ccache

Robert Yang (5):
  cmake-native: Add --enable-ccache to configure options
  bitbake.conf: Add CCACHE_TOP_DIR to BB_HASHBASE_WHITELIST
  ccache.bbclass: Only let native recipes depend on ccache-native
  ccache: 3.5 -> 3.6
  ccache: Fix Segmentation fault error when gcc -o /dev/null

 meta/classes/ccache.bbclass                        |  5 +-
 meta/conf/bitbake.conf                             |  2 +-
 meta/recipes-devtools/ccache/ccache_3.5.bb         | 11 ---
 meta/recipes-devtools/ccache/ccache_3.6.bb         | 12 ++++
 .../0002-dev.mk.in-fix-file-name-too-long.patch    |  8 +--
 ...mentation-fault-error-when-gcc-o-dev-null.patch | 79 ++++++++++++++++++++++
 meta/recipes-devtools/cmake/cmake-native_3.12.2.bb |  1 +
 7 files changed, 101 insertions(+), 17 deletions(-)
 delete mode 100644 meta/recipes-devtools/ccache/ccache_3.5.bb
 create mode 100644 meta/recipes-devtools/ccache/ccache_3.6.bb
 create mode 100644 meta/recipes-devtools/ccache/files/0003-Fix-Segmentation-fault-error-when-gcc-o-dev-null.patch

-- 
2.7.4


