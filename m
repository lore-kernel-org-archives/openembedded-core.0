Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5423E6AC1E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 01:40:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t5H1e4Dg024510
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 16 Jun 2015 18:40:04 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Tue, 16 Jun 2015 18:40:04 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <ross.burton@intel.com>
Date: Wed, 17 Jun 2015 09:32:46 +0800
Message-ID: <1434504767-17802-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] Restore arm64 related patches
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
X-List-Received-Date: Wed, 17 Jun 2015 01:40:07 -0000
Content-Type: text/plain

Hi Ross,

Three of four arm64 patches of qt4 are removed by mistake. Restore them then.

Sorry for trouble.

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
1.9.1


