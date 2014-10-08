Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C490460167
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Oct 2014 12:16:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s98CGdnt018984
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 8 Oct 2014 05:16:40 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 8 Oct 2014 05:16:38 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <mark.hatle@windriver.com>,
	<paul@paulbarker.me.uk>
Date: Wed, 8 Oct 2014 20:16:35 +0800
Message-ID: <cover.1412770325.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] opkg: fix remove pkg with --force-removal-of-dependent-packages failed
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
X-List-Received-Date: Wed, 08 Oct 2014 12:16:47 -0000
Content-Type: text/plain

1. vim local.conf
...
PACKAGE_CLASSES ?= "package_ipk"
IMAGE_INSTALL_append = " perl-modules"
IMAGE_FEATURES += "package-management ssh-server-dropbear"
...

2. bitbake core-image-minimal

3. runqemu qemux86

4. ssh target
opkg remove perl --force-removal-of-dependent-packages

Expected result:
perl removed successfully

//Hongxu

The following changes since commit 505a6b696ae990442de720e5e1135a3e44d5f75c:

  bitbake: fetcher: fix BB_STRICT_CHECKSUM datatype check (2014-10-06 16:09:53 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-opkg
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-opkg

Hongxu Jia (1):
  opkg: fix remove pkg with --force-removal-of-dependent-packages failed

 ...g_remove.c-avoid-remove-pkg-repeatly-with.patch | 39 ++++++++++++++++++++++
 meta/recipes-devtools/opkg/opkg_0.2.2.bb           |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-devtools/opkg/opkg/libopkg-opkg_remove.c-avoid-remove-pkg-repeatly-with.patch

-- 
1.9.1


