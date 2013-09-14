Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 11D3360EDA
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Sep 2013 08:49:13 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r8E8nGB2024873
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Sep 2013 01:49:16 -0700 (PDT)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Sat, 14 Sep 2013 01:49:14 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 14 Sep 2013 04:49:10 -0400
Message-ID: <cover.1379148332.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/1] telepathy-mission-control: do_compile failed (race issue)
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
X-List-Received-Date: Sat, 14 Sep 2013 08:49:13 -0000
Content-Type: text/plain

The following changes since commit 7c85b0d6dad9410b43842a18a372ed3331c96e27:

  linux-libc-headers: do_install: fix "Argument list too long" error (2013-09-13 22:28:46 -0400)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib robert/tmc
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/tmc

Robert Yang (1):
  telepathy-mission-control: do_compile failed (race issue)

 .../tmc-Makefile-fix-race.patch                    |   47 ++++++++++++++++++++
 .../telepathy/telepathy-mission-control_5.15.0.bb  |    5 ++-
 2 files changed, 51 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/telepathy/telepathy-mission-control/tmc-Makefile-fix-race.patch

-- 
1.7.10.4


