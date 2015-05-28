Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2E9F275669
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 May 2015 09:22:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t4S9MR48003338
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 May 2015 02:22:27 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 28 May 2015 02:22:26 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 28 May 2015 02:22:23 -0700
Message-ID: <cover.1432782683.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] python3: fix build for shared object
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
X-List-Received-Date: Thu, 28 May 2015 09:22:27 -0000
Content-Type: text/plain

The following changes since commit e6952593d810636f26af541b12126848483e619a:

  kernel: Build uImage only when really needed (2015-05-26 10:57:41 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/py
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/py

Robert Yang (1):
  python3: fix build for shared object

 meta/recipes-devtools/python/python3_3.4.3.bb |    1 +
 1 file changed, 1 insertion(+)

-- 
1.7.9.5


