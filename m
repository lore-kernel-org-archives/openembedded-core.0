Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 774C9776C2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Sep 2016 08:28:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u878Sb4n025780
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 7 Sep 2016 01:28:37 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 7 Sep 2016 01:28:36 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 7 Sep 2016 01:28:33 -0700
Message-ID: <cover.1473236857.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
MIME-Version: 1.0
Subject: [PATCH 0/3] fix lighttpd pciutils and apt
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
X-List-Received-Date: Wed, 07 Sep 2016 08:28:39 -0000
Content-Type: text/plain

The following changes since commit 55bb6816aca39bfa25d4f7e2158a57a5f0ac1cca:

  oeqa.buildperf: correct globalres time format (2016-09-06 10:24:00 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/3fixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/3fixes

Robert Yang (3):
  lighttpd: without-memcache -> without-memcached
  apt: add PACKAGECONFIG for lz4
  pciutils: fix PACKAGECONFIG

 meta/recipes-bsp/pciutils/pciutils_3.5.1.bb       | 6 +++---
 meta/recipes-devtools/apt/apt_1.2.12.bb           | 1 +
 meta/recipes-extended/lighttpd/lighttpd_1.4.41.bb | 2 +-
 3 files changed, 5 insertions(+), 4 deletions(-)

-- 
2.9.0


