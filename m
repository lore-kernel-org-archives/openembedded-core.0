Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8389965D33
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jun 2014 02:23:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s5C2NfHI028154
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jun 2014 19:23:41 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 11 Jun 2014 19:23:41 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 12 Jun 2014 10:23:39 +0800
Message-ID: <cover.1402539725.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH 0/1] nfs-utils: Do not pass CFLAGS to gcc while building
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
X-List-Received-Date: Thu, 12 Jun 2014 02:23:49 -0000
Content-Type: text/plain

The following changes since commit b5a928af721026795be7b7f68b2dd577408afbe5:

  bitbake: toaster: add Project class models to orm (2014-06-11 10:35:47 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/nfs-utils
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/nfs-utils

Chong Lu (1):
  nfs-utils: Do not pass CFLAGS to gcc while building

 ...-Do-not-pass-CFLAGS-to-gcc-while-building.patch | 42 ++++++++++++++++++++++
 .../nfs-utils-unset-CFLAGS-for-testlk-build.patch  | 31 ----------------
 .../nfs-utils/nfs-utils_1.3.0.bb                   |  2 +-
 3 files changed, 43 insertions(+), 32 deletions(-)
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-Do-not-pass-CFLAGS-to-gcc-while-building.patch
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-unset-CFLAGS-for-testlk-build.patch

-- 
1.8.1.2


