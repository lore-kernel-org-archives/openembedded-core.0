Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 383C365DA3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2015 07:15:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t297FFkk003557
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Mar 2015 00:15:15 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 9 Mar 2015 00:15:14 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 9 Mar 2015 00:15:08 -0700
Message-ID: <cover.1425885208.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [V2 PATCH 0/6] meta: fix SRC_URI
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
X-List-Received-Date: Mon, 09 Mar 2015 07:15:14 -0000
Content-Type: text/plain

Changes of V2:
* Use snapshot.debian.org for the invalid SRC_URI when possible as Ross suggested.

// Robert

The following changes since commit 3c78468f12296abd02abce6eeac0f69bc7509958:

  build-appliance-image: Update to master head revision (2015-03-03 13:12:50 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/uri
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/uri

Robert Yang (6):
  xinetd: fixe HOMEPAGE and SRC_URI
  libevent: fix SRC_URI
  mailx: fix SRC_URI
  apt: fix SRC_URI
  net-tools: fix SRC_URI
  resolvconf: fix SRC_URI

 .../resolvconf/resolvconf_1.76.bb                  |    3 +--
 meta/recipes-devtools/apt/apt.inc                  |    2 +-
 meta/recipes-extended/mailx/mailx_12.5.bb          |    4 ++--
 .../net-tools/net-tools_1.60-25.bb                 |    4 ++--
 meta/recipes-extended/xinetd/xinetd_2.3.15.bb      |    4 ++--
 meta/recipes-support/libevent/libevent_2.0.21.bb   |    2 +-
 6 files changed, 9 insertions(+), 10 deletions(-)

-- 
1.7.9.5


