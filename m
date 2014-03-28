Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 269AF6EBA2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 09:43:50 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2S9hpkq004545
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 28 Mar 2014 02:43:51 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Fri, 28 Mar 2014 02:43:50 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Mar 2014 17:43:34 +0800
Message-ID: <cover.1395997035.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 0/4][Part III] wr-misc patches
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
X-List-Received-Date: Fri, 28 Mar 2014 09:43:50 -0000
Content-Type: text/plain

WindRiver patches was sent for YP compliance.

There are total 22 patches, and separate them into 4 parts,
each part is individual which means there is no dependence
between them.

//Hongxu

The following changes since commit 8c3eb5ee4582b6f6d489549290937657f37fc19e:

  packagegroup-toolset-native: Update after ocf-linux -> cryptodev-linux change (2014-03-27 19:53:30 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/wr-misc-patches-3
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/wr-misc-patches-3

Baogen Shang (2):
  libarchive: fix CVE-2013-0211
  libtiff: fix CVE-2013-4244

yanjun.zhu (2):
  nss-3.15.1: fix CVE-2013-1741
  nss-3.15.1: fix CVE-2013-5605

 .../libarchive/libarchive-CVE-2013-0211.patch      | 38 +++++++++
 .../libarchive/libarchive_3.1.2.bb                 |  1 +
 .../libtiff/files/libtiff-CVE-2013-4244.patch      | 19 +++++
 meta/recipes-multimedia/libtiff/tiff_4.0.3.bb      |  3 +-
 .../nss/files/nss-3.15.1-fix-CVE-2013-1741.patch   | 92 ++++++++++++++++++++++
 .../nss/files/nss-3.15.1-fix-CVE-2013-5605.patch   | 18 +++++
 meta/recipes-support/nss/nss.inc                   |  2 +
 7 files changed, 172 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/libarchive-CVE-2013-0211.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/libtiff-CVE-2013-4244.patch
 create mode 100644 meta/recipes-support/nss/files/nss-3.15.1-fix-CVE-2013-1741.patch
 create mode 100644 meta/recipes-support/nss/files/nss-3.15.1-fix-CVE-2013-5605.patch

-- 
1.8.1.2


