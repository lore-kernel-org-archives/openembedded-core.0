Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 58CF86E374
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2014 09:40:44 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s1P9eiFI029898
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2014 01:40:46 -0800 (PST)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Tue, 25 Feb 2014 01:40:44 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 25 Feb 2014 17:44:02 +0800
Message-ID: <cover.1393321369.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH 0/3] 3 fixes for CentOS 5.8
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
X-List-Received-Date: Tue, 25 Feb 2014 09:40:47 -0000
Content-Type: text/plain

The following changes since commit 72576e2d04dc8b43ae0d7f31cddd74318f52103e:

  bitbake: hob: replace the use of hob-toolchain with populate_sdk task (2014-02-25 08:06:11 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib rbt/cent5
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=rbt/cent5

Donn Seeley (1):
  dpkg: fix a link problem for dpkg-native on CentOS 5.8

Robert Yang (2):
  grub: exclude .pc from POTFILES.in (fix build on CentOS 5.8)
  dpkg-compiler.m4: remove -Wvla (fix build on CentOS 5.8)

 .../grub/grub/autogen.sh-exclude-pc.patch          | 34 +++++++++
 meta/recipes-bsp/grub/grub_git.bb                  |  1 +
 .../dpkg/dpkg/glibc2.5-sync_file_range.patch       | 86 ++++++++++++++++++++++
 .../dpkg/dpkg/no-vla-warning.patch                 | 32 ++++++++
 meta/recipes-devtools/dpkg/dpkg_1.17.4.bb          |  2 +
 5 files changed, 155 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/grub/autogen.sh-exclude-pc.patch
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/glibc2.5-sync_file_range.patch
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/no-vla-warning.patch

-- 
1.8.3.1


