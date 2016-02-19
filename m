Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BC7F773179
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Feb 2016 08:48:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u1J8mXLE028136
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Feb 2016 00:48:53 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 19 Feb 2016 00:48:37 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Feb 2016 00:48:33 -0800
Message-ID: <cover.1455871674.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/4] meta: 4 fixes
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
X-List-Received-Date: Fri, 19 Feb 2016 08:48:54 -0000
Content-Type: text/plain

The following changes since commit 58b45240739da210ef2fecea931c8b8daa9a4c07:

  epiphany: Add libxml2-native to DEPENDS (2016-02-18 22:55:12 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/4fixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/4fixes

Robert Yang (4):
  image.bbclass: fix circular dependency when IMAGE_FSTYPES append
    hddimg
  recipe_sanity.bbclass: skip DataSmart in recipe_sanity_eh()
  terminal.bbclass: import oe.terminal for oe.terminal.prioritized()
  staging.bbclass: remove trail slash from SYSROOT_DESTDIR

 meta/classes/image-live.bbclass    |   11 ++++++++++-
 meta/classes/recipe_sanity.bbclass |    5 ++---
 meta/classes/staging.bbclass       |    2 +-
 meta/classes/terminal.bbclass      |    6 ++++--
 4 files changed, 17 insertions(+), 7 deletions(-)

-- 
1.7.9.5


