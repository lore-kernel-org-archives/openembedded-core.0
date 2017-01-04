Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 887E86AC4B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jan 2017 03:22:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v043MitG029272
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 3 Jan 2017 19:22:45 -0800
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.184) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 3 Jan 2017 19:22:43 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 4 Jan 2017 11:22:43 +0800
Message-ID: <cover.1483500113.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] busybox: upgrade to 1.26.1
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
X-List-Received-Date: Wed, 04 Jan 2017 03:22:45 -0000
Content-Type: text/plain

The following changes since commit dbb247cac5fbf7b037e4955f9793828451723924:

  bitbake: cookerdata: Convert multiconfig to use BB_CURRENT_MC (2016-12-22 12:36:40 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/busybox-1.26.1
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/busybox-1.26.1

Chen Qi (1):
  busybox: upgrade to 1.26.1

 ...e-the-behaviour-of-c-parameter-to-match-u.patch |  73 -----------
 ...biproute-handle-table-ids-larger-than-255.patch | 134 -------------------
 ...-n-flushes-pattern-space-terminates-early.patch |  72 -----------
 .../busybox/busybox/CVE-2016-2147.patch            |  57 --------
 .../busybox/busybox/CVE-2016-2147_2.patch          |  32 -----
 .../busybox/busybox/CVE-2016-2148.patch            |  74 -----------
 .../busybox-1.24.1-truncate-open-mode.patch        |  81 ------------
 .../busybox/busybox-1.24.1-unzip-regression.patch  | 143 ---------------------
 .../busybox/busybox/busybox-1.24.1-unzip.patch     | 118 -----------------
 .../busybox/busybox/busybox-cross-menuconfig.patch |  71 ----------
 .../busybox-kbuild-race-fix-commit-d8e61bb.patch   |  53 --------
 .../busybox/busybox-udhcpc-no_deconfig.patch       |  75 ++++++-----
 .../commit-applet_tables-fix-commit-0dddbc1.patch  |  61 ---------
 ...lem_on_mips64_n64_big_endian_musl_systems.patch |  90 -------------
 .../busybox/busybox/makefile-fix-backport.patch    |  40 ------
 .../{busybox_1.24.1.bb => busybox_1.26.1.bb}       |  18 +--
 meta/recipes-core/busybox/busybox_git.bb           |   6 +-
 17 files changed, 42 insertions(+), 1156 deletions(-)
 delete mode 100644 meta/recipes-core/busybox/busybox/0001-flock-update-the-behaviour-of-c-parameter-to-match-u.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/0001-libiproute-handle-table-ids-larger-than-255.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/0001-sed-fix-sed-n-flushes-pattern-space-terminates-early.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/CVE-2016-2147.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/CVE-2016-2147_2.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/CVE-2016-2148.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/busybox-1.24.1-truncate-open-mode.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/busybox-1.24.1-unzip-regression.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/busybox-1.24.1-unzip.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/busybox-cross-menuconfig.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/busybox-kbuild-race-fix-commit-d8e61bb.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/commit-applet_tables-fix-commit-0dddbc1.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/ip_fix_problem_on_mips64_n64_big_endian_musl_systems.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/makefile-fix-backport.patch
 rename meta/recipes-core/busybox/{busybox_1.24.1.bb => busybox_1.26.1.bb} (62%)

-- 
1.9.1


