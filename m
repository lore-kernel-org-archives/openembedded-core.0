Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 49C1378237
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 21:14:45 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7MLElUO028838
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 14:14:47 -0700
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 22 Aug 2017 14:14:46 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Aug 2017 14:14:45 -0700
Message-ID: <20170822211446.65099-1-jslater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [PATCH 0/1] ghostscript: CVE-2017-9727, -9835, -11714
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
X-List-Received-Date: Tue, 22 Aug 2017 21:14:46 -0000
Content-Type: text/plain

Apply after 0001-ghostscript-fix-several-CVEs-by-adding-bounds-checki.patch

Joe Slater (1):
  ghostscript: CVE-2017-9727, -9835, -11714

 .../ghostscript/ghostscript/CVE-2017-11714.patch   |  61 ++++++++++
 .../ghostscript/ghostscript/CVE-2017-9727.patch    |  35 ++++++
 .../ghostscript/ghostscript/CVE-2017-9835.patch    | 125 +++++++++++++++++++++
 .../ghostscript/ghostscript_9.21.bb                |   3 +
 4 files changed, 224 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2017-11714.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9727.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9835.patch

-- 
2.7.4


