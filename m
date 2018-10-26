Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 67AD9745AB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Oct 2018 10:28:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9QARKtJ020833
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Oct 2018 03:28:21 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Fri, 26 Oct 2018 03:27:33 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 26 Oct 2018 17:45:35 +0800
Message-ID: <cover.1540547104.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Subject: [PATCH 0/2] Fixes for groff and toolchain-scripts.bbclass
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
X-List-Received-Date: Fri, 26 Oct 2018 10:28:30 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>


The following changes since commit 3be5331986289bf11040c241fd54239fb2011695:

  testimage.bbclass: define ptest suite variable (2018-10-25 14:53:44 +0100)

are available in the Git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/misc
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/misc

Kai Kang (2):
  groff: not search fonts on build host
  toolchain-scripts.bbclass: fix paths of siteconfig files

 meta/classes/toolchain-scripts.bbclass        |  9 +++++----
 ...groff-not-search-fonts-on-build-host.patch | 20 +++++++++++++++++++
 meta/recipes-extended/groff/groff_1.22.3.bb   |  1 +
 3 files changed, 26 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-extended/groff/groff-1.22.3/groff-not-search-fonts-on-build-host.patch

-- 
2.18.0


