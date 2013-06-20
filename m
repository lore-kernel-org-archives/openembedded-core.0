Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 316C261A47
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 13:25:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5KDP1uY023941
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 06:25:01 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Thu, 20 Jun 2013 06:25:01 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 20 Jun 2013 21:24:32 +0800
Message-ID: <cover.1371734594.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Subject: [PATCH 0/1] Remove tcl hardcoded library install path
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
X-List-Received-Date: Thu, 20 Jun 2013 13:25:01 -0000
Content-Type: text/plain

The following changes since commit e04e6dab0afa8f72bf001b0cc106cd13b7694a91:

  bdwgc-native: Add missing pkgconfig DEPENDS (2013-06-19 18:03:35 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib kangkai/tcl
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/tcl

Kai Kang (1):
  tcl: remove hardcoded library install path

 .../tcltk/tcl/let-DST-include-year-2099.patch      |   35 ++++++++++++++++++
 .../tcl/tcl-remove-hardcoded-install-path.patch    |   37 ++++++++++++++++++++
 meta/recipes-devtools/tcltk/tcl_8.6.0.bb           |    6 ++-
 3 files changed, 76 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/tcltk/tcl/let-DST-include-year-2099.patch
 create mode 100644 meta/recipes-devtools/tcltk/tcl/tcl-remove-hardcoded-install-path.patch

-- 
1.7.5.4


