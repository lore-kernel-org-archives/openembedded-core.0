Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7FC0D6AC24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Apr 2015 09:15:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3N9FKPw026121
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Apr 2015 02:15:21 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 23 Apr 2015 02:15:20 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Apr 2015 02:15:18 -0700
Message-ID: <cover.1429780485.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/2] 2 fixes
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
X-List-Received-Date: Thu, 23 Apr 2015 09:15:20 -0000
Content-Type: text/plain

The following changes since commit 166f2587468ae71988c610858aad3f7ef67eccba:

  bison: don't depend on help2man (2015-04-21 11:29:30 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/2fixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/2fixes

Robert Yang (2):
  gnu-efi: fix parallel issue
  kernel-devsrc: depends on virtual/kernel:do_install

 .../gnu-efi/lib-Makefile-fix-parallel-issue.patch  |   38 ++++++++++++++++++++
 meta/recipes-bsp/gnu-efi/gnu-efi_3.0.2.bb          |    1 +
 meta/recipes-kernel/linux/kernel-devsrc.bb         |    2 +-
 3 files changed, 40 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-bsp/gnu-efi/gnu-efi/lib-Makefile-fix-parallel-issue.patch

-- 
1.7.9.5


