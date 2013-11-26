Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6603A6DD12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 02:28:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAQ2SeLd023723
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2013 18:28:40 -0800 (PST)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Mon, 25 Nov 2013 18:28:40 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Nov 2013 18:32:33 +0800
Message-ID: <cover.1385399840.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH 0/1] coreutils 6.9: fix coreutils.texi
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
X-List-Received-Date: Tue, 26 Nov 2013 02:28:42 -0000
Content-Type: text/plain

The following changes since commit 6ddb9bf0976169fde7eee16d70a83210aa354416:

  bitbake: perforce: Fix path subdirectory issues (2013-11-24 12:25:37 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib robert/coreutils
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/coreutils

Robert Yang (1):
  coreutils 6.9: fix coreutils.texi

 .../coreutils-6.9/coreutils-fix-texinfo.patch      | 375 +++++++++++++++++++++
 meta/recipes-core/coreutils/coreutils_6.9.bb       |   1 +
 2 files changed, 376 insertions(+)
 create mode 100644 meta/recipes-core/coreutils/coreutils-6.9/coreutils-fix-texinfo.patch

-- 
1.8.3.1


