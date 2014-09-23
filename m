Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 204B46AFB5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 14:20:06 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8NEK69K024950
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 07:20:07 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 23 Sep 2014 07:20:06 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 23 Sep 2014 22:19:56 +0800
Message-ID: <cover.1411473883.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/3] man/info: fix not support xz/bz2 compression
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
X-List-Received-Date: Tue, 23 Sep 2014 14:20:07 -0000
Content-Type: text/plain

Test Case:

vim local.conf
..
IMAGE_INSTALL_append = " man man-doc texinfo texinfo-doc info info-doc"
INHERIT += "compress_doc"
DOC_COMPRESS = "xz" or DOC_COMPRESS = "bz2"
..

bitbake core-image-minimal

runqemu qemux86

On target,
...
root@qemux86:~# man man

root@qemux86:~# info info
...

//Hongxu

The following changes since commit afdbe3112b940987f3f3cddcb32c91a5e17a297d:

  bitbake: bitbake-worker: Fix bitbake -n (2014-09-22 15:54:40 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-doc
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-doc

Hongxu Jia (3):
  busybox: enable CONFIG_BZIP2/CONFIG_XZ/CONFIG_UNXZ by default
  man: fix not support xz/bz2 compression
  texinfo: fix info not work

 meta/recipes-core/busybox/busybox/defconfig  | 6 +++---
 meta/recipes-extended/man/man/man.conf       | 3 ++-
 meta/recipes-extended/texinfo/texinfo_5.2.bb | 8 +++++++-
 3 files changed, 12 insertions(+), 5 deletions(-)

-- 
1.9.1


