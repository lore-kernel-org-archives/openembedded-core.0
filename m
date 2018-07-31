Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7A807749F3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2018 07:09:44 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w6V79jpu031118
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2018 00:09:45 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Tue, 31 Jul 2018 00:09:44 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 31 Jul 2018 15:13:39 +0800
Message-ID: <cover.1533021154.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/4] A few fixes related to oeqa runtime
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
X-List-Received-Date: Tue, 31 Jul 2018 07:09:44 -0000
Content-Type: text/plain

The following changes since commit 9c419271b5cf927924682c3200451979f02409bb:

  bitbake: codeparser: Track oe.utils.conditional usage (2018-07-30 12:45:15 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/oeqa_fixes
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/oeqa_fixes

Chen Qi (4):
  oe_syslog.py: fix settings in OEHasPackage decorator
  parselogs.py: ignore network interface name changing failure
  systemd: backport patch to allow setting dbus calls timeout
  systemd.py: increase default bus timeout

 meta/lib/oeqa/runtime/cases/oe_syslog.py           |   4 +-
 meta/lib/oeqa/runtime/cases/parselogs.py           |   3 +-
 meta/lib/oeqa/runtime/cases/systemd.py             |   6 +-
 ...bus-make-BUS_DEFAULT_TIMEOUT-configurable.patch | 175 +++++++++++++++++++++
 meta/recipes-core/systemd/systemd_239.bb           |   1 +
 5 files changed, 183 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-sd-bus-make-BUS_DEFAULT_TIMEOUT-configurable.patch

-- 
1.9.1


