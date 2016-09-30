Return-Path: <Dengke.Du@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3A8CB65CBF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 05:05:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u8U55YuB015985
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2016 22:05:35 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 29 Sep 2016 22:05:33 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 30 Sep 2016 01:05:31 -0400
Message-ID: <cover.1475211809.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH 0/1] rng-tools: add systemd service file
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
X-List-Received-Date: Fri, 30 Sep 2016 05:05:36 -0000
Content-Type: text/plain

The following changes since commit 5d8a968ecdf40babe452b0ac63d94a7a163710ae:

  dev-manual: Applied review changes to GNU debugging section. (2016-09-28 15:02:33 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib dengke/add-systemd-service-for-rng_tools
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=dengke/add-systemd-service-for-rng_tools

Dengke Du (1):
  rng-tools: add systemd service file

 meta/recipes-support/rng-tools/rng-tools/rngd.service |  9 +++++++++
 meta/recipes-support/rng-tools/rng-tools_5.bb         | 14 ++++++++++++--
 2 files changed, 21 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/rng-tools/rng-tools/rngd.service

-- 
2.8.1


