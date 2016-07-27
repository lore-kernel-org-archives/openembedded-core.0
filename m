Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6334160721
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 07:27:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u6R7RFOe006603
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 00:27:15 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 27 Jul 2016 00:27:14 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Jul 2016 15:24:11 +0800
Message-ID: <cover.1469604202.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.9.2.368.g08bb350
MIME-Version: 1.0
Subject: [PATCH 0/1] Make attr ptest pass when selinux enabled
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
X-List-Received-Date: Wed, 27 Jul 2016 07:27:17 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The following changes since commit 36feb38045b7a2af86ece147fec54b0db3bf491f:

  linux-yocto: Update genericx86* SRCREVs for linux-yocto 4.4 (2016-07-21 07:48:53 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/attr
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/attr

Kai Kang (1):
  attr: make ptest pass when selinux enabled

 meta/recipes-support/attr/attr.inc                 |  2 +-
 .../files/filter-selinux-attr-from-output.patch    | 41 ++++++++++++++++++++++
 2 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/attr/files/filter-selinux-attr-from-output.patch

-- 
2.9.2.368.g08bb350


