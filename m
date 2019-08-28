Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E04F37ED03
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 10:39:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7SAdDW0022777
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 03:39:24 -0700
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Wed, 28 Aug 2019 03:39:03 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 28 Aug 2019 19:04:55 +0800
Message-ID: <cover.1566990265.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/2] Recipes upgrade
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
X-List-Received-Date: Wed, 28 Aug 2019 10:39:33 -0000
Content-Type: text/plain

The following changes since commit 9b1c150573ffd0e68d37772d5f47482d86ddde6d:

  commands.py: fix typo (2019-08-27 22:52:41 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/pu
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/pu

Robert Yang (2):
  ccache: 3.7.1 -> 3.7.3
  nfs-utils: 2.3.3 -> 2.4.1

 ...-Do-not-pass-null-pointer-to-freeaddrinfo.patch |  32 -----
 ...le.am-fix-undefined-function-for-libnsm.a.patch |  22 ++--
 ...1-Makefile.am-update-the-path-of-libnfs.a.patch |  50 --------
 ...re.ac-Do-not-fatalize-Wmissing-prototypes.patch |   9 +-
 .../bugfix-adjust-statd-service-name.patch         |  30 +++--
 .../nfs-utils/nfs-utils-musl-limits.patch          | 133 ---------------------
 .../nfs-utils/nfs-utils-musl-res_querydomain.patch |  23 +---
 .../{nfs-utils_2.3.3.bb => nfs-utils_2.4.1.bb}     |  10 +-
 .../ccache/{ccache_3.7.1.bb => ccache_3.7.3.bb}    |   4 +-
 9 files changed, 43 insertions(+), 270 deletions(-)
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Do-not-pass-null-pointer-to-freeaddrinfo.patch
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Makefile.am-update-the-path-of-libnfs.a.patch
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-musl-limits.patch
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_2.3.3.bb => nfs-utils_2.4.1.bb} (92%)
 rename meta/recipes-devtools/ccache/{ccache_3.7.1.bb => ccache_3.7.3.bb} (45%)

-- 
2.7.4


