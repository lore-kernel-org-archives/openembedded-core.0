Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B74E860761
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2016 02:29:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u5F2Tq6H020438
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2016 19:29:52 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 14 Jun 2016 19:29:51 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Jun 2016 19:29:50 -0700
Message-ID: <cover.1465957427.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
MIME-Version: 1.0
Subject: [PATCH 0/1] make: 4.2 -> 4.2.1
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
X-List-Received-Date: Wed, 15 Jun 2016 02:29:53 -0000
Content-Type: text/plain

Hi RP and Ross,

This patch is based on master-next (make 4.2 is on master-next), the
4.2.1 is released on June 10 which contains a patch needed by us,
otherwise git may fail to build with make-native:
[SV 47995] Ensure forced double-colon rules work with -j.

// Robert

The following changes since commit 6979749fd31baf20f19d3307bba510907016aa3f:

  make: 4.1 -> 4.2 (2016-06-14 19:22:12 -0700)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/make
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/make

Robert Yang (1):
  make: 4.2 -> 4.2.1

 ...-SV-43434-Handle-NULL-returns-from-ttynam.patch | 63 ----------------------
 .../make/{make_4.2.bb => make_4.2.1.bb}            |  4 +-
 2 files changed, 2 insertions(+), 65 deletions(-)
 delete mode 100644 meta/recipes-devtools/make/make-4.2/0001-main.c-main-SV-43434-Handle-NULL-returns-from-ttynam.patch
 rename meta/recipes-devtools/make/{make_4.2.bb => make_4.2.1.bb} (71%)

-- 
2.8.0


