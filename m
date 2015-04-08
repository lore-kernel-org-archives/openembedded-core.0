Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5EA6B73D2B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Apr 2015 10:24:02 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t38AO3dU021354
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Apr 2015 03:24:03 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.236) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Wed, 8 Apr 2015 03:24:03 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 8 Apr 2015 18:24:08 +0800
Message-ID: <cover.1428488582.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/6] Package Upgrades
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
X-List-Received-Date: Wed, 08 Apr 2015 10:24:04 -0000
Content-Type: text/plain

The following changes since commit ca228b117abe3dc40c996a006c9cbea91c17ccea:

  gcc-4.8: Upgrade 4.8.2 -> 4.8.4 (2015-04-08 10:45:28 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/package-upgrade-20150408
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/package-upgrade-20150408

Chen Qi (6):
  curl: upgrade to 7.41.0
  busybox: upgrade to 1.23.2
  kmod: upgrade to 20
  sudo: upgrade to 1.8.13
  sysstat: upgrade to 11.1.3
  xz: upgrade to 5.2.1

 .../{busybox_1.23.1.bb => busybox_1.23.2.bb}       |  4 +--
 meta/recipes-core/busybox/busybox_git.bb           |  4 +--
 meta/recipes-extended/sudo/sudo.inc                | 12 +++------
 .../sudo/{sudo_1.8.11p2.bb => sudo_1.8.13.bb}      |  4 +--
 .../{sysstat_11.0.2.bb => sysstat_11.1.3.bb}       |  4 +--
 .../xz/{xz_5.2.0.bb => xz_5.2.1.bb}                |  4 +--
 meta/recipes-kernel/kmod/kmod.inc                  |  5 ++--
 ...01-Makefile.am-fix-parallel-build-problem.patch | 29 +++++++++++++++++++++
 ...alling-bswap_-instead-of-htobe-and-be-toh.patch | 15 +++++------
 .../kmod/kmod/avoid_parallel_tests.patch           | 30 ++++++++++++++--------
 .../curl/{curl_7.40.0.bb => curl_7.41.0.bb}        |  4 +--
 11 files changed, 72 insertions(+), 43 deletions(-)
 rename meta/recipes-core/busybox/{busybox_1.23.1.bb => busybox_1.23.2.bb} (90%)
 rename meta/recipes-extended/sudo/{sudo_1.8.11p2.bb => sudo_1.8.13.bb} (87%)
 rename meta/recipes-extended/sysstat/{sysstat_11.0.2.bb => sysstat_11.1.3.bb} (40%)
 rename meta/recipes-extended/xz/{xz_5.2.0.bb => xz_5.2.1.bb} (92%)
 create mode 100644 meta/recipes-kernel/kmod/kmod/0001-Makefile.am-fix-parallel-build-problem.patch
 rename meta/recipes-support/curl/{curl_7.40.0.bb => curl_7.41.0.bb} (93%)

-- 
1.9.1


