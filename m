Return-Path: <Dengke.Du@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4CEAC60684
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 07:15:21 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u8N7FMLq028593
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 00:15:22 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 23 Sep 2016 00:15:21 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 23 Sep 2016 03:15:19 -0400
Message-ID: <cover.1474614730.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH 0/1] cracklib: Apply patch to fix CVE-2016-6318
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
X-List-Received-Date: Fri, 23 Sep 2016 07:15:22 -0000
Content-Type: text/plain

The following changes since commit 4359f8cce66ba0a51fcd62fa2fadb52d69f60736:

  poky: add Fedora-24 to SANITY_TESTED_DISTROS (2016-09-13 15:16:15 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib dengke/cracklib-fix-CVE-2016-6318
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=dengke/cracklib-fix-CVE-2016-6318

Dengke Du (1):
  cracklib: Apply patch to fix CVE-2016-6318

 .../0001-Apply-patch-to-fix-CVE-2016-6318.patch    | 105 +++++++++++++++++++++
 meta/recipes-extended/cracklib/cracklib_2.9.5.bb   |   1 +
 2 files changed, 106 insertions(+)
 create mode 100644 meta/recipes-extended/cracklib/cracklib/0001-Apply-patch-to-fix-CVE-2016-6318.patch

-- 
2.8.1


