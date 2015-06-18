Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7752F6AC37
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jun 2015 03:21:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t5I3LZZ7017137
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 20:21:35 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Wed, 17 Jun 2015 20:21:35 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 18 Jun 2015 11:14:15 +0800
Message-ID: <cover.1434596999.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Subject: [PATCH 0/1] Upgrade openssl from 1.0.2a to 1.0.2c
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
X-List-Received-Date: Thu, 18 Jun 2015 03:21:34 -0000
Content-Type: text/plain

Build for qemux86 and qemumips. And it is fine to run openssl basic sub-commands.

The following changes since commit 1675ff6fff53dda89fa8d4f3a2c292c23fd346d7:

  bitbake: tests/data: Add new data tests (2015-06-12 00:02:28 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/openssl
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/openssl

Kai Kang (1):
  openssl: upgrade from 1.0.2a to 1.0.2c

 ...lcl.h-fix-MIPS-specific-gcc-version-check.patch | 30 ----------------------
 .../openssl/openssl/debian/c_rehash-compat.patch   |  8 +++---
 .../{openssl_1.0.2a.bb => openssl_1.0.2c.bb}       |  5 ++--
 3 files changed, 6 insertions(+), 37 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/0001-bn-bn_lcl.h-fix-MIPS-specific-gcc-version-check.patch
 rename meta/recipes-connectivity/openssl/{openssl_1.0.2a.bb => openssl_1.0.2c.bb} (89%)

-- 
1.9.1


