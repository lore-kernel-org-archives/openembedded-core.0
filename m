Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 31C7E73D91
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 05:29:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3T5T7l1009972
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 22:29:07 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 28 Apr 2015 22:29:07 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 28 Apr 2015 22:29:05 -0700
Message-ID: <cover.1430285314.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/2] 2 fixes for parallel build
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
X-List-Received-Date: Wed, 29 Apr 2015 05:29:10 -0000
Content-Type: text/plain

The following changes since commit 4dd4b96b6d60246338bb30ede9f3ab1b2e757be9:

  libxfont: Security Advisory - libxfont - CVE-2015-1804 (2015-04-28 07:56:01 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/parallel
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/parallel

Robert Yang (2):
  bison: fix parallel issue
  pcmciautils: fix for parallel build

 .../Makefile-fix-for-parallel-build.patch          |   12 +++----
 .../0001-src-local.mk-fix-parallel-issue.patch     |   33 ++++++++++++++++++++
 meta/recipes-devtools/bison/bison_3.0.4.bb         |    1 +
 3 files changed, 40 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-devtools/bison/bison/0001-src-local.mk-fix-parallel-issue.patch

-- 
1.7.9.5


