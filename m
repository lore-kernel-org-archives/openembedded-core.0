Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1DA847016E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 00:39:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7N0dNfM009389
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 17:39:23 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 22 Aug 2016 17:39:22 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 22 Aug 2016 17:39:19 -0700
Message-ID: <cover.1471912673.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
MIME-Version: 1.0
Subject: [PATCH 0/3] Packages upgrade
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
X-List-Received-Date: Tue, 23 Aug 2016 00:39:25 -0000
Content-Type: text/plain

The following changes since commit 0865a5b8b8fbf478fb4b2310f808bcffff84a091:

  packagefeed-stability.bbclass: cleansstate should remove pkgs from deploy dir (2016-08-20 16:05:29 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/pu
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/pu

Robert Yang (3):
  git: 2.9.2 -> 2.9.3
  subversion: 1.9.3 -> 1.9.4
  nasm: 2.11.08 -> 2.12.02

 meta/recipes-devtools/git/git_2.9.2.bb                        | 11 -----------
 meta/recipes-devtools/git/git_2.9.3.bb                        | 11 +++++++++++
 .../nasm/{nasm_2.11.08.bb => nasm_2.12.02.bb}                 |  5 ++---
 .../subversion/{subversion_1.9.3.bb => subversion_1.9.4.bb}   |  5 +++--
 4 files changed, 16 insertions(+), 16 deletions(-)
 delete mode 100644 meta/recipes-devtools/git/git_2.9.2.bb
 create mode 100644 meta/recipes-devtools/git/git_2.9.3.bb
 rename meta/recipes-devtools/nasm/{nasm_2.11.08.bb => nasm_2.12.02.bb} (81%)
 rename meta/recipes-devtools/subversion/{subversion_1.9.3.bb => subversion_1.9.4.bb} (96%)

-- 
2.9.0


