Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F030A612D1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2013 12:30:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r69CUhST029802
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Jul 2013 05:30:43 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Tue, 9 Jul 2013 05:30:42 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Jul 2013 20:30:35 +0800
Message-ID: <cover.1373372649.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH 0/5]add nss for LSB library check
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
X-List-Received-Date: Tue, 09 Jul 2013 12:30:42 -0000
Content-Type: text/plain

http://refspecs.linuxfoundation.org/LSB_4.1.0/LSB-Core-generic/LSB-Core-generic/libnss3.html
https://developer.mozilla.org/en-US/docs/NSS
//Hongxu

The following changes since commit dc86293f0444384e8ae5131fdd10b6cb077164b0:

  bitbake: HOB:Proper handle of SIGINT (2013-07-05 15:52:48 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-nss
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-nss

Hongxu Jia (5):
  nspr-native: add version 4.10
  packagegroup-core-lsb: add nss for LSB library check
  nss: add version 3.15.1
  nss: Create checksum files for the NSS libraries
  nss: fix incorrect shebang of perl

 .../packagegroups/packagegroup-core-lsb.bb         |   1 +
 meta/recipes-support/nspr/nspr_4.10.bb             |   2 +
 .../files/nss-fix-incorrect-shebang-of-perl.patch  | 110 ++++++++++++
 .../files/nss-fix-support-cross-compiling.patch    |  71 ++++++++
 .../files/nss-no-rpath-for-cross-compiling.patch   |  26 +++
 meta/recipes-support/nss/files/nss.pc.in           |  11 ++
 meta/recipes-support/nss/files/signlibs.sh         |  20 +++
 meta/recipes-support/nss/nss.inc                   | 187 +++++++++++++++++++++
 meta/recipes-support/nss/nss_3.15.1.bb             |   9 +
 9 files changed, 437 insertions(+)
 create mode 100644 meta/recipes-support/nss/files/nss-fix-incorrect-shebang-of-perl.patch
 create mode 100644 meta/recipes-support/nss/files/nss-fix-support-cross-compiling.patch
 create mode 100644 meta/recipes-support/nss/files/nss-no-rpath-for-cross-compiling.patch
 create mode 100644 meta/recipes-support/nss/files/nss.pc.in
 create mode 100644 meta/recipes-support/nss/files/signlibs.sh
 create mode 100644 meta/recipes-support/nss/nss.inc
 create mode 100644 meta/recipes-support/nss/nss_3.15.1.bb

-- 
1.8.1.2


