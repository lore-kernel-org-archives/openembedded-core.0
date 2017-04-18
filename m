Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E0EF760720
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 08:33:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v3I8XLMu022126
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 01:33:22 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 18 Apr 2017 01:33:20 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Apr 2017 01:33:19 -0700
Message-ID: <cover.1492504368.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Subject: [PATCH 0/1] acl: fix race issue when do_compile
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
X-List-Received-Date: Tue, 18 Apr 2017 08:33:22 -0000
Content-Type: text/plain

The following changes since commit ba2884f6ad3a4e746fc80cbd707f83fa8abd4210:

  oe-run-native: print more error messages (2017-04-14 10:26:10 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/acl
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/acl

Robert Yang (1):
  acl: fix race issue when do_compile

 .../Makefile-libacl-should-depend-on-include.patch | 51 ++++++++++++++++++++++
 meta/recipes-support/attr/acl_2.2.52.bb            |  4 +-
 2 files changed, 54 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/attr/acl/Makefile-libacl-should-depend-on-include.patch

-- 
2.10.2


