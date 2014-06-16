Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F21C96FAEC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jun 2014 05:20:40 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s5G5KcV6007906
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Jun 2014 22:20:38 -0700 (PDT)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Sun, 15 Jun 2014 22:20:38 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Jun 2014 01:20:34 -0400
Message-ID: <cover.1402895653.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/2] Dpkg: fixing CVE-2014-0471
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
X-List-Received-Date: Mon, 16 Jun 2014 05:20:46 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Directory traversal vulnerability in the unpacking functionality in dpkg before 1.15.9, 1.16.x before 1.16.13, and 1.17.x before 1.17.8 allows remote attackers to write arbitrary files via a crafted source package, related to "C-style filename quoting."

The following changes since commit 8e0c54cd0e82ffe120f84f495101cd29e6fd06bf:

  bitbake: bb/utils: fix contains_any() (2014-06-12 17:47:59 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/dpkg
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/dpkg

Guillem Jover (2):
  Dpkg::Source::Patch: Correctly parse C-style diff filenames
  Dpkg::Source::Patch: Outright reject C-style filenames in patches

 .../dpkg-1.17.4-CVE-2014-0471-CVE-2014-3127.patch  |   49 ++++++++++++
 .../dpkg/dpkg/dpkg-1.17.4-CVE-2014-0471.patch      |   83 ++++++++++++++++++++
 meta/recipes-devtools/dpkg/dpkg_1.17.4.bb          |    2 +
 3 files changed, 134 insertions(+)
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/dpkg-1.17.4-CVE-2014-0471-CVE-2014-3127.patch
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/dpkg-1.17.4-CVE-2014-0471.patch

-- 
1.7.9.5


