Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 536246F157
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 09:44:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2S9i7YR024672
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 28 Mar 2014 02:44:07 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Fri, 28 Mar 2014 02:44:06 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Mar 2014 17:43:49 +0800
Message-ID: <cover.1395996410.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 0/5][Part IV] wr-misc patches
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
X-List-Received-Date: Fri, 28 Mar 2014 09:44:06 -0000
Content-Type: text/plain

WindRiver patches was sent for YP compliance.

There are total 22 patches, and separate them into 4 parts,
each part is individual which means there is no dependence
between them.

//Hongxu

The following changes since commit 8c3eb5ee4582b6f6d489549290937657f37fc19e:

  packagegroup-toolset-native: Update after ocf-linux -> cryptodev-linux change (2014-03-27 19:53:30 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/wr-misc-patches-4
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/wr-misc-patches-4

Konrad Scherer (1):
  syslinux.bbclass: Enable additional kernel parameters for syslinux

Mark Hatle (2):
  packagegroups: Remove toolchain *-symlinks packages
  packagegroup-self-hosted: Use packagegroup-core-buildessential

Ming Liu (1):
  kernel.bbclass: handles symbolic KERNEL_OUTPUT in bundle_initramfs
    task

Peter Seebach (1):
  libc-common.bbclass: rename ALL the packages

 meta/classes/kernel.bbclass                         | 21 ++++++++++++++++++---
 meta/classes/libc-common.bbclass                    | 19 +++++++++++++------
 meta/classes/syslinux.bbclass                       |  5 +++++
 .../packagegroup-core-buildessential.bb             |  4 ----
 .../packagegroups/packagegroup-self-hosted.bb       | 16 +---------------
 5 files changed, 37 insertions(+), 28 deletions(-)

-- 
1.8.1.2


