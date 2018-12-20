Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1285F7BF85
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 01:33:57 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wBK1XrGV014046
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 19 Dec 2018 17:33:54 -0800 (PST)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 19 Dec 2018 17:33:52 -0800
From: <kai.kang@windriver.com>
To: <ross.burton@intel.com>
Date: Wed, 19 Dec 2018 20:33:49 -0500
Message-ID: <cover.1545269541.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.19.0.rc2
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 0/1] grub-efi-native: workaround for fedora 29
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
X-List-Received-Date: Thu, 20 Dec 2018 01:33:58 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

v2:
* update comment in workaround-for-as-from-binutils-2.31.patch

The following changes since commit fef47bd915f6a3960e512b5aba8b461b77a9ea78:

  linux-yocto-4.14: Drop bbappend (2018-12-18 16:20:10 +0000)

are available in the Git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/grub-efi-native-fedora29
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/grub-efi-native-fedora29

Kai Kang (1):
  grub-efi-native: workaround for fedora 29

 ...workaround-for-as-from-binutils-2.31.patch | 43 +++++++++++++++++++
 meta/recipes-bsp/grub/grub-efi_2.02.bb        |  2 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/workaround-for-as-from-binutils-2.31.patch

-- 
2.19.0.rc2


