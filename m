Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5FA3B7399D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2015 01:39:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t2C1d1bF003884
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 18:39:01 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 11 Mar 2015 18:39:01 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 11 Mar 2015 18:38:56 -0700
Message-ID: <cover.1426124214.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [V3 PATCH 0/5] meta: fix SRC_URI
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
X-List-Received-Date: Thu, 12 Mar 2015 01:39:00 -0000
Content-Type: text/plain

* V3
Use git repo for xinetd.

* V2:
Use snapshot.debian.org for the invalid SRC_URI when possible as Ross suggested.

* V1:
Initial version

// Robert

The following changes since commit 99f209a49a4390192b95184ff86bd6f973010111:

  layer.conf: bump version as error-report interface changed (2015-03-10 17:44:56 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/uri
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/uri

Robert Yang (5):
  xinetd: fixe HOMEPAGE and SRC_URI
  libevent: fix SRC_URI
  apt: fix SRC_URI
  net-tools: fix SRC_URI
  resolvconf: fix SRC_URI

 .../resolvconf/resolvconf_1.76.bb                  |    3 +--
 meta/recipes-devtools/apt/apt.inc                  |    2 +-
 .../net-tools/net-tools_1.60-25.bb                 |    4 ++--
 meta/recipes-extended/xinetd/xinetd_2.3.15.bb      |    9 +++++----
 meta/recipes-support/libevent/libevent_2.0.21.bb   |    2 +-
 5 files changed, 10 insertions(+), 10 deletions(-)

-- 
1.7.9.5


