Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5AF7C6C48C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Dec 2018 08:33:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wB58XYnq020092
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Dec 2018 00:33:35 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Wed, 5 Dec 2018 00:33:28 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 5 Dec 2018 16:40:42 +0800
Message-ID: <cover.1543996242.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/4] Upgrade sudo, cups, sysstat, at
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
X-List-Received-Date: Wed, 05 Dec 2018 08:33:34 -0000
Content-Type: text/plain

The following changes since commit 016e3dda2d6acc9b457079d11b5346a5352a431d:

  btrfs-tools: update to 4.19 (2018-12-03 12:20:01 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/PU
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/PU

Chen Qi (4):
  sudo: upgrade to 1.8.26
  cups: upgrade to 2.2.9
  sysstat: upgrade to 12.1.1
  at: upgrade to 3.1.23

 .../at/at/fix_parallel_build_error.patch           | 15 +++++---
 meta/recipes-extended/at/at/pam.conf.patch         | 40 +++++++++++++---------
 .../at/{at_3.1.20.bb => at_3.1.23.bb}              |  6 ++--
 .../0001-don-t-try-to-run-generated-binaries.patch | 29 ++++++++--------
 .../cups/{cups_2.2.8.bb => cups_2.2.9.bb}          |  4 +--
 meta/recipes-extended/sudo/sudo.inc                |  7 ++--
 .../sudo/{sudo_1.8.23.bb => sudo_1.8.26.bb}        |  4 +--
 .../{sysstat_11.7.4.bb => sysstat_12.1.1.bb}       |  4 +--
 8 files changed, 63 insertions(+), 46 deletions(-)
 rename meta/recipes-extended/at/{at_3.1.20.bb => at_3.1.23.bb} (90%)
 rename meta/recipes-extended/cups/{cups_2.2.8.bb => cups_2.2.9.bb} (40%)
 rename meta/recipes-extended/sudo/{sudo_1.8.23.bb => sudo_1.8.26.bb} (91%)
 rename meta/recipes-extended/sysstat/{sysstat_11.7.4.bb => sysstat_12.1.1.bb} (53%)

-- 
1.9.1


