Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 82C3877FF5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jun 2017 11:00:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v568XLWb019362
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Jun 2017 01:34:07 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.167) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Tue, 6 Jun 2017 01:33:21 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 6 Jun 2017 16:36:15 +0800
Message-ID: <cover.1496738086.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/3] Package Upgrade -- sysstat, kmod, util-linux
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
X-List-Received-Date: Tue, 06 Jun 2017 11:00:04 -0000
Content-Type: text/plain

The following changes since commit 02417b149623c3042c257d1c1074f915dc02b7c7:

  oeqa/selftest: lock down Meson git revision for reliability (2017-06-05 17:59:38 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/PU-20170606
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/PU-20170606

Chen Qi (3):
  sysstat: upgrade to 11.5.5
  kmod: upgrade to 24
  util-linux: upgrade to 2.29.2

 .../{util-linux_2.29.1.bb => util-linux_2.29.2.bb} |  4 +-
 .../{sysstat_11.5.4.bb => sysstat_11.5.5.bb}       |  4 +-
 meta/recipes-kernel/kmod/kmod.inc                  |  5 +--
 .../recipes-kernel/kmod/kmod/kcmdline_quotes.patch | 44 ----------------------
 4 files changed, 6 insertions(+), 51 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux_2.29.1.bb => util-linux_2.29.2.bb} (86%)
 rename meta/recipes-extended/sysstat/{sysstat_11.5.4.bb => sysstat_11.5.5.bb} (53%)
 delete mode 100644 meta/recipes-kernel/kmod/kmod/kcmdline_quotes.patch

-- 
1.9.1


