Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6FE227894C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 07:56:20 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w5D7tu8k027573
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 00:56:11 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Wed, 13 Jun 2018 00:55:39 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Jun 2018 15:58:18 +0800
Message-ID: <cover.1528870775.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/7] Fix failures discoved by parselogs and systemd test cases
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
X-List-Received-Date: Wed, 13 Jun 2018 07:56:20 -0000
Content-Type: text/plain

The following changes since commit ddbd7b0cd6580ee26e11aa87e426fb294b372d64:

  meta-yocto-bsp: bump to the latest linux stable kernel for edgerouter/beaglebone (2018-06-12 23:34:40 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/parselogs_failures
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/parselogs_failures

Chen Qi (7):
  oeqa/runtime/cases/parselogs.py: extend common_errors list
  watchdog: remove the useless watchdog-conf.patch
  watchdog: disable systemd services by default
  watchdog: make init script start after syslog
  watchdog: fix init script for sysvinit
  oeqa/runtime/cases/parselogs.py: ignore a message from watchdog
  dnf: default to disable systemd units

 meta/lib/oeqa/runtime/cases/parselogs.py           |   2 +
 meta/recipes-devtools/dnf/dnf_2.7.5.bb             |   1 +
 .../watchdog/watchdog/watchdog-conf.patch          |  16 ---
 .../watchdog/watchdog/watchdog-init.patch          |  56 -----------
 .../watchdog/watchdog/watchdog.init                | 110 +++++++++++++++++++++
 meta/recipes-extended/watchdog/watchdog_5.15.bb    |  14 +--
 6 files changed, 121 insertions(+), 78 deletions(-)
 delete mode 100644 meta/recipes-extended/watchdog/watchdog/watchdog-conf.patch
 delete mode 100644 meta/recipes-extended/watchdog/watchdog/watchdog-init.patch
 create mode 100644 meta/recipes-extended/watchdog/watchdog/watchdog.init

-- 
1.9.1


