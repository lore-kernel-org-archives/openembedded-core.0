Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A382371957
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2018 06:59:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w3B6xcEc004341
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2018 23:59:38 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Tue, 10 Apr 2018 23:59:25 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 11 Apr 2018 14:56:08 +0800
Message-ID: <cover.1523429249.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH 0/2] patch: fix CVE-2018-6951 and CVE-2018-1000156
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
X-List-Received-Date: Wed, 11 Apr 2018 06:59:37 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

These are also needed for previous releases, so I think they should be 
backported to the branch for 2.5 and 2.4 as well.
--
The following changes since commit 29f65bda6d2c9fea4adb125c4857ee64f9312b9f:

  nativesdk-glibc: Split glibc and libcrypt to use libxcrypt instead (2018-04-07 22:34:45 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib.git jhuang0/d_patch_CVEs_180411_0
  http://git.pokylinux.org/cgit.cgi//log/?h=jhuang0/d_patch_CVEs_180411_0

Jackie Huang (2):
  patch: fix CVE-2018-6951
  patch: fix CVE-2018-1000156

 ...02-Fix-segfault-with-mangled-rename-patch.patch |  35 ++++
 ...-files-to-be-missing-for-ed-style-patches.patch |  38 ++++
 ...ry-command-execution-in-ed-style-patches-.patch | 215 +++++++++++++++++++++
 meta/recipes-devtools/patch/patch_2.7.6.bb         |   6 +-
 4 files changed, 293 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/patch/patch/0002-Fix-segfault-with-mangled-rename-patch.patch
 create mode 100644 meta/recipes-devtools/patch/patch/0003-Allow-input-files-to-be-missing-for-ed-style-patches.patch
 create mode 100644 meta/recipes-devtools/patch/patch/0004-Fix-arbitrary-command-execution-in-ed-style-patches-.patch

-- 
2.11.0


