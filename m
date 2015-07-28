Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id ADB5076243
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 09:05:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6S95Bmd009284
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 02:05:11 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Tue, 28 Jul 2015 02:04:55 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 28 Jul 2015 02:05:07 -0700
Message-ID: <cover.1438074266.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/3] Fixes for qemu and mc
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
X-List-Received-Date: Tue, 28 Jul 2015 09:05:10 -0000
Content-Type: text/plain

The following changes since commit 27d068d05239c26a3848eb101571acab54635e37:

  harfbuzz: upgrade to 1.0.1 (2015-07-27 23:28:23 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/qemu
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/qemu

Robert Yang (3):
  mc: add PACKAGECONFIG for util-linux
  qemu: add PACKAGECONFIG for gnutls
  qemu_git.bb: remove it

 meta/recipes-devtools/qemu/qemu.inc                |    1 +
 ...-Arm-versatilepb-Add-memory-size-checking.patch |    0
 .../exclude-some-arm-EABI-obsolete-syscalls.patch  |    0
 .../qemu-enlarge-env-entry-size.patch              |    0
 meta/recipes-devtools/qemu/qemu_git.bb             |   15 ---------------
 meta/recipes-extended/mc/mc_4.8.14.bb              |    1 +
 6 files changed, 2 insertions(+), 15 deletions(-)
 rename meta/recipes-devtools/qemu/{files => qemu}/Qemu-Arm-versatilepb-Add-memory-size-checking.patch (100%)
 rename meta/recipes-devtools/qemu/{files => qemu}/exclude-some-arm-EABI-obsolete-syscalls.patch (100%)
 rename meta/recipes-devtools/qemu/{files => qemu}/qemu-enlarge-env-entry-size.patch (100%)
 delete mode 100644 meta/recipes-devtools/qemu/qemu_git.bb

-- 
1.7.9.5


