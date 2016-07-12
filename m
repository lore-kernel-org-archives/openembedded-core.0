Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CFE8E6AC4B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 12:04:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u6CC4420019205
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 05:04:06 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 12 Jul 2016 05:04:02 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 12 Jul 2016 05:04:00 -0700
Message-ID: <cover.1468324994.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
MIME-Version: 1.0
Subject: [PATCH 0/2] fix oe-selftest and testimage.bbclass
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
X-List-Received-Date: Tue, 12 Jul 2016 12:04:09 -0000
Content-Type: text/plain

The following changes since commit b17f91ed06a604e3d356fe17756bfe2ca61594b7:

  tune-ppce500mc.inc: pass -mcpu=e500mc for ppce500mc kernel compile (2016-07-10 14:12:07 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/test
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/test

Robert Yang (2):
  oe-selftest: print errors when failed to find test
  testimage.bbclass: INHERIT -> IMAGE_CLASSES

 meta/classes/testimage.bbclass |  2 +-
 scripts/oe-selftest            | 12 ++++++++++--
 2 files changed, 11 insertions(+), 3 deletions(-)

-- 
2.9.0


