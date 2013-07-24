Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9756660629
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 08:02:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6O82iHq012965
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 01:02:44 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Wed, 24 Jul 2013 01:02:42 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 24 Jul 2013 16:02:45 +0800
Message-ID: <cover.1374652867.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/1] qemu: block to build it on mips64 arch
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
X-List-Received-Date: Wed, 24 Jul 2013 08:02:43 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

The following changes since commit 947336a1ef2b936328ba6fcf519d55a4eda7085d:

  systemd: ignore qemu output, and check its return code (2013-07-24 13:09:10 +0800)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib roy/qemu
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=roy/qemu

Roy.Li (1):
  qemu: block to build it on mips64 arch

 meta/recipes-devtools/qemu/qemu_1.5.0.bb |    2 ++
 meta/recipes-devtools/qemu/qemu_git.bb   |    2 ++
 2 files changed, 4 insertions(+)

-- 
1.7.10.4


