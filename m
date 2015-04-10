Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B1B256ABF7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Apr 2015 08:31:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3A8VWKU002497
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Apr 2015 01:31:32 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 10 Apr 2015 01:31:31 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Apr 2015 01:31:26 -0700
Message-ID: <cover.1428654657.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/3] Package Upgrades
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
X-List-Received-Date: Fri, 10 Apr 2015 08:31:31 -0000
Content-Type: text/plain

The following changes since commit 75ae0b7cf3863eb2857a2b6a7073beea626f751d:

  wic: Implement --build-rootfs command line option (2015-04-08 23:11:08 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/PU
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/PU

Robert Yang (3):
  groff: 1.22.2 -> 1.22.3
  wget: 1.16.2 -> 1.16.3
  git: 2.3.1 -> 2.3.5

 .../git/{git_2.3.1.bb => git_2.3.5.bb}             |    8 ++---
 ...off-1.22.2-correct-man.local-install-path.patch |   36 +++++++++++---------
 .../groff/{groff_1.22.2.bb => groff_1.22.3.bb}     |    9 ++---
 .../wget/{wget_1.16.2.bb => wget_1.16.3.bb}        |    4 +--
 4 files changed, 30 insertions(+), 27 deletions(-)
 rename meta/recipes-devtools/git/{git_2.3.1.bb => git_2.3.5.bb} (41%)
 rename meta/recipes-extended/groff/{groff-1.22.2 => groff-1.22.3}/groff-1.22.2-correct-man.local-install-path.patch (40%)
 rename meta/recipes-extended/groff/{groff_1.22.2.bb => groff_1.22.3.bb} (89%)
 rename meta/recipes-extended/wget/{wget_1.16.2.bb => wget_1.16.3.bb} (45%)

-- 
1.7.9.5


