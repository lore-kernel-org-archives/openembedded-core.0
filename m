Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F406260670
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jun 2015 07:34:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t5A7YLBT019550
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jun 2015 00:34:21 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 10 Jun 2015 00:34:21 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 10 Jun 2015 00:34:18 -0700
Message-ID: <cover.1433921605.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/2] fix depends issues for sysstat and mtools
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
X-List-Received-Date: Wed, 10 Jun 2015 07:34:20 -0000
Content-Type: text/plain

The following changes since commit de6a26b95a7f7bd8f9dc47ab35d8b07ba671f4eb:

  x264: use x86 over-ride instead of i586 (2015-06-08 17:32:46 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/deps
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/deps

Robert Yang (2):
  sysstat: DEPENDS on base-passwd
  mtools: add PACKAGECONFIG for libbsd

 meta/recipes-devtools/mtools/mtools_3.9.9.bb  |    3 +++
 meta/recipes-devtools/mtools/mtools_4.0.18.bb |    3 +++
 meta/recipes-extended/sysstat/sysstat.inc     |    2 ++
 3 files changed, 8 insertions(+)

-- 
1.7.9.5


