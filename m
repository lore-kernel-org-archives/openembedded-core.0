Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 36D2A60155
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 02:39:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s0M2dcA8002618
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 18:39:38 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.164) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Tue, 21 Jan 2014 18:39:38 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Jan 2014 10:39:45 +0800
Message-ID: <cover.1390358320.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/4] Upgrade busybox to 1.22.1 stable release
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
X-List-Received-Date: Wed, 22 Jan 2014 02:39:40 -0000
Content-Type: text/plain

The following changes since commit 4659d29b1040349116549644e45035a5b37d9311:

  sstate.bbclass: remove previous version's stamp (2014-01-21 10:36:23 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/busybox-1.22.1
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/busybox-1.22.1

Chen Qi (4):
  busybox: upgrade to stable 1.22.1
  meta-skeleton: rename busybox's bbappend file
  coreutils: move 'stat' to base_bindir_progs
  procps: make the 'watch' command register to /bin/watch

 ...{busybox_1.21.1.bbappend => busybox_%.bbappend} |    0
 .../busybox-lineedit-initialize-delptr.patch       |   23 --
 ...usybox-list-suid-and-non-suid-app-configs.patch |  179 -------------
 ...sybox-sed-fix-sed-clusternewline-testcase.patch |  262 --------------------
 .../busybox-sulogin-empty-root-password.patch      |   58 -----
 .../busybox/find-get-rid-of-nested-functions.patch |  117 ---------
 .../busybox/busybox/run-parts.in.usr-bin.patch     |   29 ---
 .../busybox/busybox/stat-usr-bin.patch             |   21 --
 ...estsuite-du-du-k-works-fix-false-positive.patch |   35 ---
 .../busybox/busybox/watch.in.usr-bin.patch         |   29 ---
 .../{busybox_1.21.1.bb => busybox_1.22.1.bb}       |   13 +-
 meta/recipes-core/busybox/busybox_git.bb           |   11 +-
 meta/recipes-core/coreutils/coreutils_6.9.bb       |    4 +-
 meta/recipes-core/coreutils/coreutils_8.22.bb      |    4 +-
 meta/recipes-extended/procps/procps.inc            |    6 +
 15 files changed, 14 insertions(+), 777 deletions(-)
 rename meta-skeleton/recipes-core/busybox/{busybox_1.21.1.bbappend => busybox_%.bbappend} (100%)
 delete mode 100644 meta/recipes-core/busybox/busybox/busybox-lineedit-initialize-delptr.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/busybox-list-suid-and-non-suid-app-configs.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/busybox-sed-fix-sed-clusternewline-testcase.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/busybox-sulogin-empty-root-password.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/find-get-rid-of-nested-functions.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/run-parts.in.usr-bin.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/stat-usr-bin.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/testsuite-du-du-k-works-fix-false-positive.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/watch.in.usr-bin.patch
 rename meta/recipes-core/busybox/{busybox_1.21.1.bb => busybox_1.22.1.bb} (66%)

-- 
1.7.9.5


