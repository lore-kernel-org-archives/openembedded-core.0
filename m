Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 74F4660780
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 08:03:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6A83jLx011489
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 01:03:45 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Wed, 10 Jul 2013 01:03:45 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 10 Jul 2013 16:03:37 +0800
Message-ID: <cover.1373443071.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH V2 0/5] add nss for LSB library check
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
X-List-Received-Date: Wed, 10 Jul 2013 08:03:45 -0000
Content-Type: text/plain

Change from V1:
1) Rename the title of patch 1/5
2) Use ${libdir} rather than ${base_libdir} as the lib location
   which references the nss in meta-browser.

//Hongxu

The following changes since commit dc86293f0444384e8ae5131fdd10b6cb077164b0:

  bitbake: HOB:Proper handle of SIGINT (2013-07-05 15:52:48 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-nss
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-nss

Hongxu Jia (5):
  nspr: add native version
  packagegroup-core-lsb: add nss for LSB library check
  nss: add version 3.15.1
  nss: create checksum files for the nss libraries
  nss: fix incorrect shebang line of perl script

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


