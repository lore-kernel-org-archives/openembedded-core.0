Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BD44D6011F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Nov 2015 03:35:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tAR3ZKf5012551
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 19:35:20 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 26 Nov 2015 19:35:19 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 26 Nov 2015 19:35:18 -0800
Message-ID: <cover.1448594831.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] qt4-4.8.7: fix build for mips n32
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
X-List-Received-Date: Fri, 27 Nov 2015 03:35:21 -0000
Content-Type: text/plain

The following changes since commit 80b3974081c4a8c604e23982a6db8fb32c616058:

  sstate: Ensure siginfo and sig files are also touched (2015-11-25 08:08:51 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/qt
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/qt

Robert Yang (1):
  qt4-4.8.7: fix build for mips n32

 meta/recipes-qt/qt4/qt4-4.8.7.inc                  |    1 +
 .../qt4/qt4-4.8.7/fix-for-mips-n32.patch           |   38 ++++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/fix-for-mips-n32.patch

-- 
1.7.9.5


