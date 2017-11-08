Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D2F896AC00
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Nov 2017 02:32:27 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vA82WSSY029839
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 Nov 2017 18:32:28 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.189) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Tue, 7 Nov 2017 18:32:27 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 8 Nov 2017 10:33:50 +0800
Message-ID: <cover.1510108243.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/2] gcc: backport patch to fix miscompilation problem on mips64
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
X-List-Received-Date: Wed, 08 Nov 2017 02:32:28 -0000
Content-Type: text/plain

The following changes since commit 2e1eb9ab12802d52465e6ae636c3f6a40ffb098c:

  bitbake: tests/fetch: Add ftp test url (2017-11-07 15:02:19 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/bug12266
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/bug12266

Chen Qi (2):
  systemd: remove useless options for mips64
  gcc: backport patch to fix miscompilation on mips64

 meta/recipes-core/systemd/systemd_234.bb           |  3 --
 meta/recipes-devtools/gcc/gcc-7.2.inc              |  1 +
 .../gcc-7.2/0001-PR-rtl-optimization-81803.patch   | 52 ++++++++++++++++++++++
 3 files changed, 53 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.2/0001-PR-rtl-optimization-81803.patch

-- 
1.9.1


