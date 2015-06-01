Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6648F755F5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jun 2015 08:02:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t5182gea009830
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Jun 2015 01:02:42 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 1 Jun 2015 01:02:42 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 1 Jun 2015 01:02:41 -0700
Message-ID: <cover.1433145739.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] boost: fix build for mips
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
X-List-Received-Date: Mon, 01 Jun 2015 08:02:42 -0000
Content-Type: text/plain

The following changes since commit 968973d55d4b33e1a929ed4cdf9387fcaba2d93f:

  qt4: unconditionally disable gstreamer 0.10 support in qt webkit (2015-05-30 22:25:12 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/boost
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/boost

Robert Yang (1):
  boost: fix build for mips

 meta/recipes-support/boost/boost-1.58.0.inc        |    5 ++-
 ...dded-gcc.jam-was-passing-the-options-m32-.patch |   33 ++++++++++++++++
 ...n-t-pass-m32-m64-where-it-s-not-supported.patch |   40 ++++++++++++++++++++
 3 files changed, 77 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/boost/files/0001-mips1-fix-added-gcc.jam-was-passing-the-options-m32-.patch
 create mode 100644 meta/recipes-support/boost/files/0002-Don-t-pass-m32-m64-where-it-s-not-supported.patch

-- 
1.7.9.5


