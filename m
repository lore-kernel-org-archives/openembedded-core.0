Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 170856AC23
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Apr 2015 01:55:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3D1t1bk023704
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Apr 2015 18:55:02 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.236) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Sun, 12 Apr 2015 18:55:04 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 13 Apr 2015 09:55:03 +0800
Message-ID: <cover.1428890059.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] kmod: upgrade to 20
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
X-List-Received-Date: Mon, 13 Apr 2015 01:55:01 -0000
Content-Type: text/plain

The following changes since commit a7d8eaef04c9dd6ede8d4efd8c4b776efbe3c767:

  shadow: split files needed for PAM use into separate package (2015-04-09 19:48:04 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/kmod-20
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/kmod-20

Chen Qi (1):
  kmod: upgrade to 20

 meta/recipes-kernel/kmod/kmod.inc                  |  8 +++---
 ...01-Makefile.am-fix-parallel-build-problem.patch | 29 +++++++++++++++++++++
 ...alling-bswap_-instead-of-htobe-and-be-toh.patch | 15 +++++------
 .../kmod/kmod/avoid_parallel_tests.patch           | 30 ++++++++++++++--------
 meta/recipes-kernel/kmod/kmod_git.bb               | 15 -----------
 5 files changed, 57 insertions(+), 40 deletions(-)
 create mode 100644 meta/recipes-kernel/kmod/kmod/0001-Makefile.am-fix-parallel-build-problem.patch

-- 
1.9.1


