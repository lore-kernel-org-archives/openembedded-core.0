Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 386566AC1E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 02:27:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t5H2RJXY024834
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 16 Jun 2015 19:27:19 -0700 (PDT)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Tue, 16 Jun 2015 19:27:18 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <ross.burton@intel.com>
Date: Wed, 17 Jun 2015 10:27:09 +0800
Message-ID: <cover.1434507721.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.4.1
In-Reply-To: <1434504767-17802-2-git-send-email-kai.kang@windriver.com>
References: <1434504767-17802-2-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] Pull to restore qt4 arm64 patches
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
X-List-Received-Date: Wed, 17 Jun 2015 02:27:19 -0000
Content-Type: text/plain

Push to poky-contrib for merge easily.

The following changes since commit 1675ff6fff53dda89fa8d4f3a2c292c23fd346d7:

  bitbake: tests/data: Add new data tests (2015-06-12 00:02:28 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib kangkai/qt4
  https://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=kangkai%2Fqt4

Kai Kang (1):
  qt4-4.8.7: restore arm64 patches which are dropped by mistake

 meta/recipes-qt/qt4/qt4-4.8.7.inc                  |   3 +
 .../0030-aarch64_arm64_qatomic_support.patch       | 491 +++++++++++++++++++++
 .../qt4/qt4-4.8.7/0031-aarch64_arm64_mkspecs.patch | 124 ++++++
 .../qt4/qt4-4.8.7/0032-aarch64_add_header.patch    |  18 +
 4 files changed, 636 insertions(+)
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0030-aarch64_arm64_qatomic_support.patch
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0031-aarch64_arm64_mkspecs.patch
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0032-aarch64_add_header.patch

-- 
2.4.1


