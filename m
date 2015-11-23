Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 345C4606D1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 13:41:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tANDfWvl003290
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 05:41:32 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 23 Nov 2015 05:41:31 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 23 Nov 2015 05:41:30 -0800
Message-ID: <cover.1448285591.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] package_manager.py: fix RPM_PREFER_ELF_ARCH for mips
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
X-List-Received-Date: Mon, 23 Nov 2015 13:41:32 -0000
Content-Type: text/plain

The following changes since commit 6f98c39418c60b7c0b25b30983d2e5257158a6a4:

  gcc: Drop 4.8 (2015-11-16 14:59:07 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/elf
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/elf

Robert Yang (1):
  package_manager.py: fix RPM_PREFER_ELF_ARCH for mips

 meta/lib/oe/package_manager.py |    9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

-- 
1.7.9.5


