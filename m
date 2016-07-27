Return-Path: <Dengke.Du@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AE95460721
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 05:02:05 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u6R5250f019323
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2016 22:02:05 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 26 Jul 2016 22:02:04 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Jul 2016 01:02:01 -0400
Message-ID: <cover.1469595557.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH 0/2] perf: enable man pages for 'help' functionality
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
X-List-Received-Date: Wed, 27 Jul 2016 05:02:06 -0000
Content-Type: text/plain

The following changes since commit 36feb38045b7a2af86ece147fec54b0db3bf491f:

  linux-yocto: Update genericx86* SRCREVs for linux-yocto 4.4 (2016-07-21 07:48:53 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib dengke/enable-help-man-pages-for-perf
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=dengke/enable-help-man-pages-for-perf

Dengke Du (2):
  Asciidoc: add it
  perf: enable man pages for 'help' functionality

 meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb | 20 ++++++++++++++++++++
 meta/recipes-kernel/perf/perf.bb                 | 11 ++++++++++-
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb

-- 
2.8.1


