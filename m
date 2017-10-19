Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 81D0B6006E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Oct 2017 03:04:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v9J34O1m031449
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Oct 2017 20:04:24 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 18 Oct 2017 20:04:23 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 18 Oct 2017 23:04:21 -0400
Message-ID: <cover.1508381865.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH 0/1] ltp: upgrade to 20170929
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
X-List-Received-Date: Thu, 19 Oct 2017 03:04:23 -0000
Content-Type: text/plain

1. delete two patches, because the upstream already contain those.

2. add a patch to fix build error when set the DISTRO to 'poky-lsb', 
   suggested by Khem Raj.

The following changes since commit 65d23bd7986615fdfb0f1717b615534a2a14ab80:

  README.qemu: qemuppc64 is not supported (2017-10-16 23:54:31 +0100)

are available in the git repository at:

  https://github.com/DengkeDu/openembedded-core.git ltp-20170929
  https://github.com//tree/ltp-20170929

Dengke Du (1):
  ltp: upgrade to 20170929

 ...E_SIZE-redefinition-and-O_CREAT-undeclear.patch | 113 ---------------------
 .../ltp/0037-ltp-fix-format-security-error.patch   |  36 +++++++
 ...ommands-gdb01-replace-stdin-with-dev-null.patch |  34 -------
 .../ltp/{ltp_20170516.bb => ltp_20170929.bb}       |   5 +-
 4 files changed, 38 insertions(+), 150 deletions(-)
 delete mode 100644 meta/recipes-extended/ltp/ltp/0037-ltp-fix-PAGE_SIZE-redefinition-and-O_CREAT-undeclear.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0037-ltp-fix-format-security-error.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0038-commands-gdb01-replace-stdin-with-dev-null.patch
 rename meta/recipes-extended/ltp/{ltp_20170516.bb => ltp_20170929.bb} (96%)

-- 
2.8.1


