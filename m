Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EE51371975
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2016 06:31:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u9C6VUkZ003495
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 23:31:30 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 11 Oct 2016 23:31:29 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 11 Oct 2016 23:31:25 -0700
Message-ID: <cover.1476253865.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
MIME-Version: 1.0
Subject: [PATCH 0/4] fix xcb-proto libxcb and source-highlight
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
X-List-Received-Date: Wed, 12 Oct 2016 06:31:30 -0000
Content-Type: text/plain

he following changes since commit 1a2311c8fa9a3703568cd390c44639fe3335023e:

  build-appliance-image: Update to master head revision (2016-10-11 23:43:20 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/4fixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/4fixes

Robert Yang (4):
  xcb-proto: create .pyc files for python2
  xcb-proto: fix for python3
  libxcb: use python3 to build it
  source-highlight: use with-boost-libdir

 .../Fix-inconsistent-use-of-tabs-vs.-space.patch   |  62 ++++++
 meta/recipes-graphics/xorg-lib/libxcb_1.12.bb      |   3 +
 .../0001-Make-whitespace-use-consistent.patch      | 215 +++++++++++++++++++++
 ...print-is-a-function-and-needs-parentheses.patch |  75 +++++++
 meta/recipes-graphics/xorg-proto/xcb-proto_1.12.bb |  13 +-
 .../source-highlight/source-highlight_3.1.8.bb     |   2 +-
 6 files changed, 368 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxcb/Fix-inconsistent-use-of-tabs-vs.-space.patch
 create mode 100644 meta/recipes-graphics/xorg-proto/xcb-proto/0001-Make-whitespace-use-consistent.patch
 create mode 100644 meta/recipes-graphics/xorg-proto/xcb-proto/0002-print-is-a-function-and-needs-parentheses.patch

-- 
2.9.0


