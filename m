Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DEFE16AD31
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2013 06:28:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5O6S0t9023850
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Jun 2013 23:28:01 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Sun, 23 Jun 2013 23:28:00 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Jun 2013 14:27:57 +0800
Message-ID: <cover.1371807568.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Subject: [PATCH 0/1] kbd: Limit the kbdrate application to x86, mips and sparc
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
X-List-Received-Date: Mon, 24 Jun 2013 06:28:01 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Tested with:
1)
MACHINE = "qemux86-64"
IMAGE_INSTALL_append = " kbd"

2)
MACHINE = "qemuppc"
IMAGE_INSTALL_append = " kbd"

3)
MACHINE = "qemuarm"
IMAGE_INSTALL_append = " kbd"

4)
MACHINE = "qemumips"
IMAGE_INSTALL_append = " kbd"

build:
$ bitbake core-image-minimal
$ runqemu qemux86-64 core-image-minimal ext3 nographic

run on qemu targets:
# kbdrate

--
The following changes since commit 47bbd0a32e6a70e191539e221c8cbfafb28e747b:

  Add Upstream-Status for libxml2-CVE-2012-2871.patch (2013-06-21 10:19:36 +0800)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib jhuang0/r_bbappend_kbd_0621_2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/r_bbappend_kbd_0621_2

Jackie Huang (1):
  Limit the kbdrate application to x86, mips and sparc.

 .../0001-Limit-kbdrate-to-x86-mips-and-sparc.patch |   48 ++++++++++++++++++++
 meta/recipes-core/kbd/kbd_1.15.2.bb                |    6 ++-
 2 files changed, 52 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/kbd/files/0001-Limit-kbdrate-to-x86-mips-and-sparc.patch

-- 
1.7.4.1


