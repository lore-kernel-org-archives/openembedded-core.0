Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3746F610FB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2013 05:54:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r8N5sqMx013497
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Sep 2013 22:54:53 -0700 (PDT)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Sun, 22 Sep 2013 22:54:51 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 23 Sep 2013 01:54:46 -0400
Message-ID: <cover.1379906677.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/1 V2] telepathy-mission-control: do_compile failed (race issue)
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
X-List-Received-Date: Mon, 23 Sep 2013 05:54:52 -0000
Content-Type: text/plain

* Changes of V2:
  - Use the similar fix from telepathy-glib to fix the problem as Ross suggested.

// Robert

The following changes since commit bf6b0d95db3863a2cfbccb154c0c7ad5b3bbf0b0:

  glib-2.0: fix broken python script header on machines using buildtools (2013-09-22 12:23:35 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib robert/tmc
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/tmc

Robert Yang (1):
  telepathy-mission-control: do_compile failed (race issue)

 .../tmc-Makefile-fix-race.patch                    |   76 ++++++++++++++++++++
 .../telepathy/telepathy-mission-control_5.15.0.bb  |    4 +-
 2 files changed, 79 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/telepathy/telepathy-mission-control/tmc-Makefile-fix-race.patch

-- 
1.7.10.4


