Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8392D71716
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Oct 2014 07:07:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9277gCY019260
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Oct 2014 00:07:42 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 2 Oct 2014 00:07:41 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 2 Oct 2014 00:07:38 -0700
Message-ID: <cover.1412233591.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [dora] [PATCH 0/3] fixes for bash and apmd
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
X-List-Received-Date: Thu, 02 Oct 2014 07:07:46 -0000
Content-Type: text/plain

The following changes since commit 5c51dd2e9bab54013652475888554bc4660dcff3:

  qt4: Fix Qt 4.8.5 source to new location (2014-08-11 12:08:03 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib robert/dora-next
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=robert/dora-next

Khem Raj (1):
  bash: Fix CVE-2014-7169

Ross Burton (1):
  bash: fix CVE-2014-6271

Tobias Blom (1):
  apmd.service: Fix typo (not mandatory EnvironmentFile prefix)

 meta/recipes-bsp/apmd/apmd-3.2.2-14/apmd.service   |    2 +-
 .../bash/bash-3.2.48/cve-2014-6271.patch           |   77 ++++++++++++++++++++
 .../bash/bash-3.2.48/cve-2014-7169.patch           |   16 ++++
 meta/recipes-extended/bash/bash_3.2.48.bb          |    2 +
 4 files changed, 96 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/bash/bash-3.2.48/cve-2014-6271.patch
 create mode 100644 meta/recipes-extended/bash/bash-3.2.48/cve-2014-7169.patch

-- 
1.7.9.5


