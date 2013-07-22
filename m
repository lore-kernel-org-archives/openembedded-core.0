Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E058E60686
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2013 05:45:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6M5jZ8x012874
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jul 2013 22:45:35 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Sun, 21 Jul 2013 22:45:34 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 22 Jul 2013 13:45:32 +0800
Message-ID: <cover.1374470729.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH 0/1] nss:fix postinst failed at rootfs time
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
X-List-Received-Date: Mon, 22 Jul 2013 05:45:35 -0000
Content-Type: text/plain

Test Case:

*On host:
1) In local.conf
    IMAGE_INSTALL_append = " nss"
2) Build core-image-sato

*On target:
1) Search checksum file
root@qemuarm:~# find /usr/lib/ -name "*.chk"
/usr/lib/libfreebl3.chk
/usr/lib/libnssdbm3.chk
/usr/lib/libsoftokn3.chk

2) Test for valid checksum files.
root@qemuarm:~# chktest /usr/lib/libfreebl3.so
SUCCESS
root@qemuarm:~# chktest /usr/lib/libnssdbm3.so 
SUCCESS
root@qemuarm:~# chktest /usr/lib/libsoftokn3.so
SUCCESS

//Hongxu

The following changes since commit 3dee534f1e25109e0bdb681de0746c336f4b8840:

  lib/oeqa: fix dependecy check (2013-07-16 10:04:17 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-nss-postinst
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-python-readlne

Hongxu Jia (1):
  nss:fix postinst failed at rootfs time

 meta/recipes-support/nss/nss.inc | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

-- 
1.8.1.2


