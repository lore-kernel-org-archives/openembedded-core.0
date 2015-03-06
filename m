Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D034B738F5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Mar 2015 09:32:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t269Wcod000471
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Mar 2015 01:32:38 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 6 Mar 2015 01:32:38 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 6 Mar 2015 01:32:32 -0800
Message-ID: <cover.1425634271.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/6] fix SRC_URI and update package to fix SRC_URI
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
X-List-Received-Date: Fri, 06 Mar 2015 09:32:38 -0000
Content-Type: text/plain

The following changes since commit 3c78468f12296abd02abce6eeac0f69bc7509958:

  build-appliance-image: Update to master head revision (2015-03-03 13:12:50 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/uri
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/uri

Robert Yang (6):
  xinetd: fixe HOMEPAGE and SRC_URI
  libevent: fix SRC_URI
  mailx: fix SRC_URI
  net-tools: 1.60-25 -> 1.60-26
  resolvconf: 1.76 -> 1.76.1
  apt: fix SRC_URI

 .../{resolvconf_1.76.bb => resolvconf_1.76.1.bb}   |    5 ++---
 meta/recipes-devtools/apt/apt.inc                  |    2 +-
 meta/recipes-extended/mailx/mailx_12.5.bb          |    4 ++--
 .../{net-tools_1.60-25.bb => net-tools_1.60-26.bb} |    4 ++--
 meta/recipes-extended/xinetd/xinetd_2.3.15.bb      |   10 ++++++----
 meta/recipes-support/libevent/libevent_2.0.21.bb   |    8 ++++----
 6 files changed, 17 insertions(+), 16 deletions(-)
 rename meta/recipes-connectivity/resolvconf/{resolvconf_1.76.bb => resolvconf_1.76.1.bb} (94%)
 rename meta/recipes-extended/net-tools/{net-tools_1.60-25.bb => net-tools_1.60-26.bb} (95%)

-- 
1.7.9.5


