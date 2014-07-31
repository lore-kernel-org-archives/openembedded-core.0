Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B44977093C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jul 2014 08:07:40 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s6V87f7e005578
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jul 2014 01:07:41 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 31 Jul 2014 01:07:40 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 31 Jul 2014 16:08:04 +0800
Message-ID: <cover.1406793899.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH V5 0/1] systemd: upgrade to 215
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
X-List-Received-Date: Thu, 31 Jul 2014 08:07:45 -0000
Content-Type: text/plain

The following changes since commit 7986adeac16550b33f65fded39a55f668e0e543f:

  populate_sdk_base: Fix grep command usage on old hosts (2014-07-29 09:57:54 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/systemd_215
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/systemd_215

Chen Qi (1):
  systemd: upgrade to 215

 ...k-for-__BYTE_ORDER-__BIG_ENDIAN-when-chec.patch |  116 ++++++++++++++++++++
 ...icitly-include-endian.h-wherever-we-want-.patch |   52 +++++++++
 .../systemd/systemd/systemd-older-kernel.patch     |   56 ----------
 .../systemd/{systemd_213.bb => systemd_215.bb}     |   10 +-
 4 files changed, 174 insertions(+), 60 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-always-check-for-__BYTE_ORDER-__BIG_ENDIAN-when-chec.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0002-endian-explicitly-include-endian.h-wherever-we-want-.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/systemd-older-kernel.patch
 rename meta/recipes-core/systemd/{systemd_213.bb => systemd_215.bb} (97%)

-- 
1.7.9.5


