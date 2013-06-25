Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3CC626204F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2013 02:56:27 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5P2uR6L001756
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2013 19:56:27 -0700 (PDT)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Mon, 24 Jun 2013 19:56:27 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Jun 2013 22:56:25 -0400
Message-ID: <cover.1372125622.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] ghostscript: upgrade to 9.07
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
X-List-Received-Date: Tue, 25 Jun 2013 02:56:27 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Upgrade ghostscript from 9.05 to 9.07.

Remove unuseful patch:
  * 0001-make-ghostscript-work-with-long-building-directory.patch
    
Port applicable patches:
  * ghostscript-9.02-genarch.patch
  * ghostscript-9.02-parallel-make.patch
  * ghostscript-9.02-prevent_recompiling.patch
  * ghostscript-9.05-NOT-check-endian.patch
  * ghostscript-native-fix-disable-system-libtiff.patch

The following changes since commit 87da29080429f1793845978901f5160701648c21:

  sanity.bbclass: Various improvements (2013-06-24 15:41:33 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/ghostscript-9.07
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/ghostscript-9.07

Wenzong Fan (1):
  ghostscript: upgrade to 9.07

 ...tscript-work-with-long-building-directory.patch |   22 -
 .../ghostscript/ghostscript-9.02-genarch.patch     |    3 +-
 .../ghostscript-9.02-parallel-make.patch           |  686 ++++++++++----------
 .../ghostscript-9.02-prevent_recompiling.patch     |   67 +-
 .../ghostscript-9.05-NOT-check-endian.patch        |   42 +-
 ...tscript-native-fix-disable-system-libtiff.patch |   13 +-
 .../{ghostscript_9.05.bb => ghostscript_9.07.bb}   |   17 +-
 7 files changed, 421 insertions(+), 429 deletions(-)
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/0001-make-ghostscript-work-with-long-building-directory.patch
 rename meta/recipes-extended/ghostscript/{ghostscript_9.05.bb => ghostscript_9.07.bb} (90%)

-- 
1.7.9.5


