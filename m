Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2615D6FDF7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jun 2014 08:17:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s5G8H3Yi009315
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 16 Jun 2014 01:17:03 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 16 Jun 2014 01:17:02 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Jun 2014 16:16:48 +0800
Message-ID: <cover.1402901435.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: saul.wold@intel.com, kang.kai@windriver.com
Subject: [PATCH 0/1] ghostscript: upgrade to 9.14
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
X-List-Received-Date: Mon, 16 Jun 2014 08:17:30 -0000
Content-Type: text/plain

The following changes since commit 3a88df915831f2fd5e46ed71b21190398d1de0f1:

  alsa-tools: Add missing pkgconfg dependency (2014-06-14 08:46:02 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/upgrade-ghostscript
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/upgrade-ghostscript

Hongxu Jia (1):
  ghostscript: upgrade to 9.14

 ...c-add-a-preprocessor-define-to-allow-fope.patch |  36 ++++++
 .../ghostscript-9.02-parallel-make.patch           | 144 ++++++++++-----------
 .../ghostscript-9.05-NOT-check-endian.patch        |  44 -------
 ...tscript-native-fix-disable-system-libtiff.patch |  45 +++----
 .../{ghostscript_9.07.bb => ghostscript_9.14.bb}   |  42 ++----
 5 files changed, 132 insertions(+), 179 deletions(-)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/base-genht.c-add-a-preprocessor-define-to-allow-fope.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.05-NOT-check-endian.patch
 rename meta/recipes-extended/ghostscript/{ghostscript_9.07.bb => ghostscript_9.14.bb} (70%)

-- 
1.8.1.2


