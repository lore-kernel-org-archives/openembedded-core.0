Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1UFEfz-0000fS-HX
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 03:11:05 +0100
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r2C1s8MO027234
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2013 18:54:08 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.206) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Mon, 11 Mar 2013 18:54:08 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 12 Mar 2013 09:54:05 +0800
Message-ID: <cover.1363052725.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH V2 0/1]qemu-native:fix do_compile failed on SLED 11.2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Mar 2013 02:11:08 -0000
Content-Type: text/plain

Change from V1: Use C style comments instead of C++ style comments.

The following changes since commit 365eb9b5d22208c967dcd91d8ab52faed20f04b5:

  bitbake: bitbake-layers: fix duplicated help info (2013-03-10 04:36:52 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-qemu-native
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-qemu-native

Hongxu Jia (1):
  qemu-native:fix do_compile failed on SLED 11.2

 .../fix-libcap-header-issue-on-some-distro.patch   |   84 ++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu.inc                |    4 +
 2 files changed, 88 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/files/fix-libcap-header-issue-on-some-distro.patch

-- 
1.7.10.4



