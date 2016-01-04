Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id F39E7731BE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jan 2016 02:09:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0429NKa008174
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Sun, 3 Jan 2016 18:09:23 -0800
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Sun, 3 Jan 2016 18:09:23 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Mon, 4 Jan 2016 10:08:41 +0800
Message-ID: <1451873322-30376-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] dbus: support large-file for stat64
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
X-List-Received-Date: Mon, 04 Jan 2016 02:09:24 -0000
Content-Type: text/plain

Test steps:
1. Build with qemux86 and start qemu with nfs as rootfs.

2. Build with qemux86-64 and start qemu with nfs as rootfs.

//Hongxu

The following changes since commit 2cd061a29a94fdcdfec86732e6bcbb71c12c4afc:

  bluez5: include the patch only for 5.36 (2015-12-28 13:02:11 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/dbus-lfs
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/dbus-lfs

Hongxu Jia (1):
  dbus: support large-file for stat64

 ...onfigure.ac-support-large-file-for-stat64.patch | 53 ++++++++++++++++++++++
 meta/recipes-core/dbus/dbus_1.8.20.bb              |  3 ++
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-core/dbus/dbus/0001-configure.ac-support-large-file-for-stat64.patch

-- 
1.9.1


