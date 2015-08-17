Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0303C606E8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Aug 2015 08:17:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t7H8HAGf029701
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Aug 2015 01:17:11 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Mon, 17 Aug 2015 01:17:10 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 17 Aug 2015 01:17:09 -0700
Message-ID: <cover.1439799402.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] ncurses: 5.9 -> 6.0
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
X-List-Received-Date: Mon, 17 Aug 2015 08:17:12 -0000
Content-Type: text/plain

The following changes since commit 059db140885bad379534e6ec713f3ceb4e18faea:

  adt-installer: use DEPLOY_DIR in ANT_DEPLOY expansion (2015-08-16 17:28:14 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/ncurses
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/ncurses

Robert Yang (1):
  ncurses: 5.9 -> 6.0

 meta/recipes-core/ncurses/ncurses.inc              |   11 ++++++++---
 .../ncurses/{ncurses-5.9 => ncurses}/config.cache  |    0
 .../{ncurses-5.9 => ncurses}/tic-hang.patch        |    0
 .../ncurses/{ncurses_5.9.bb => ncurses_6.0.bb}     |    8 +++-----
 4 files changed, 11 insertions(+), 8 deletions(-)
 rename meta/recipes-core/ncurses/{ncurses-5.9 => ncurses}/config.cache (100%)
 rename meta/recipes-core/ncurses/{ncurses-5.9 => ncurses}/tic-hang.patch (100%)
 rename meta/recipes-core/ncurses/{ncurses_5.9.bb => ncurses_6.0.bb} (41%)

-- 
1.7.9.5


