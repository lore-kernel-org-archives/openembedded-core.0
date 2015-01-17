Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E770D72D17
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Jan 2015 00:31:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0H0VIUg008785
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jan 2015 16:31:19 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 16 Jan 2015 16:31:18 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Jan 2015 16:31:14 -0800
Message-ID: <cover.1421454635.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/4] fix for guile and neard
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
X-List-Received-Date: Sat, 17 Jan 2015 00:31:26 -0000
Content-Type: text/plain

The following changes since commit 6541799c2e9a5a1586676c207d62f885c70e24dc:

  lib/oe/rootfs.py: Fix reference to abiversion file location (2015-01-16 23:14:26 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/neard_guile
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/neard_guile

Robert Yang (4):
  Revert "guile: fixed installed-vs-shipped error"
  guile: fix installed-vs-shipped error
  neard: fix B != S
  neard: fix parallel issue

 meta/recipes-connectivity/neard/neard.inc          |    4 +--
 .../neard/Makefile.am-fix-parallel-issue.patch     |   33 ++++++++++++++++++++
 meta/recipes-connectivity/neard/neard_0.14.bb      |    2 ++
 ...pends.patch => libguile-Makefile.am-hook.patch} |   23 ++++++++------
 meta/recipes-devtools/guile/guile_2.0.11.bb        |    2 +-
 5 files changed, 51 insertions(+), 13 deletions(-)
 create mode 100644 meta/recipes-connectivity/neard/neard/Makefile.am-fix-parallel-issue.patch
 rename meta/recipes-devtools/guile/files/{libguile-Makefile.am-depends.patch => libguile-Makefile.am-hook.patch} (56%)

-- 
1.7.9.5


