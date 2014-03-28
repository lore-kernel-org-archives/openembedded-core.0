Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0510D6DF25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 09:43:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2S9hLFD024489
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 28 Mar 2014 02:43:21 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Fri, 28 Mar 2014 02:43:21 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Mar 2014 17:43:02 +0800
Message-ID: <cover.1395996194.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 0/7][Part II] wr-misc patches
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
X-List-Received-Date: Fri, 28 Mar 2014 09:43:21 -0000
Content-Type: text/plain

WindRiver patches was sent for YP compliance.

There are total 22 patches, and separate them into 4 parts,
each part is individual which means there is no dependence
between them.

//Hongxu

The following changes since commit 8c3eb5ee4582b6f6d489549290937657f37fc19e:

  packagegroup-toolset-native: Update after ocf-linux -> cryptodev-linux change (2014-03-27 19:53:30 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/wr-misc-patches-2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/wr-misc-patches-2

Amy Fong (1):
  native-python: bad interpreter error message

Hongxu Jia (1):
  lttng-ust: add python to lttng-ust's RDEPENDS

Hu Yadi (1):
  libpcap: add PACKAGECONFIG for libnl1

Ming Liu (1):
  libpam: fix multilib packaging issue for pam-plugins

Yue Tao (3):
  tzcode-native: Replace fixed version with PV
  guile: add texinfo-native to DEPENDS
  e2fsprogs: Add e2fsprogs-mke2fs and e2fsprogs-e2fsck as recommend
    packages

 meta/classes/distutils.bbclass                     | 14 ++++++++++-
 meta/recipes-connectivity/libpcap/libpcap.inc      |  1 +
 .../recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb |  1 +
 meta/recipes-devtools/guile/guile_2.0.9.bb         |  2 +-
 meta/recipes-extended/pam/libpam_1.1.6.bb          | 29 +++++++++++++++++++---
 .../recipes-extended/tzcode/tzcode-native_2013i.bb |  3 ++-
 meta/recipes-kernel/lttng/lttng-ust_2.3.1.bb       |  1 +
 7 files changed, 44 insertions(+), 7 deletions(-)

-- 
1.8.1.2


