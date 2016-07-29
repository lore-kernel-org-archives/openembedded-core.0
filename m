Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C3D7B60721
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2016 07:47:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u6T7likn029349
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 29 Jul 2016 00:47:44 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 29 Jul 2016 00:47:43 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Fri, 29 Jul 2016 03:47:40 -0400
Message-ID: <cover.1469778195.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH 0/1] fix groff_1.18.1.4 do_compile failure
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
X-List-Received-Date: Fri, 29 Jul 2016 07:47:44 -0000
Content-Type: text/plain

Steps to test:

1. Set groff version to 1.18.1.4
PREFERRED_VERSION_groff = "1.18.1.4"

2. bitbake groff

//Hongxu 

The following changes since commit 36feb38045b7a2af86ece147fec54b0db3bf491f:

  linux-yocto: Update genericx86* SRCREVs for linux-yocto 4.4 (2016-07-21 07:48:53 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib hongxu/fix-groff
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=hongxu/fix-groff

Hongxu Jia (1):
  groff_1.18.1.4: fix narrowing conversion error

 .../fix-narrowing-conversion-error.patch           | 61 ++++++++++++++++++++++
 meta/recipes-extended/groff/groff_1.18.1.4.bb      |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-extended/groff/groff-1.18.1.4/fix-narrowing-conversion-error.patch

-- 
2.8.1


