Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 776F460601
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jan 2015 02:26:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t062Q1Z2010214
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 5 Jan 2015 18:26:01 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 5 Jan 2015 18:26:00 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 5 Jan 2015 18:25:59 -0800
Message-ID: <cover.1420511130.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] grub 2.0: several fixes
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
X-List-Received-Date: Tue, 06 Jan 2015 02:26:10 -0000
Content-Type: text/plain

The following changes since commit 24f19fedb40d0af84beb8e9a6595ea06f09d4615:

  gstreamer1.0-omx: use mulitple SCMs to fetch submodules (2014-12-31 08:22:53 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/grub2
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/grub2

Robert Yang (1):
  grub 2.0: several fixes

 .../fix-endianness-problem.patch                   |    0
 .../grub-2.00-ignore-gnulib-gets-stupidity.patch   |   28 ------------
 .../{grub-2.00 => files}/grub-install.in.patch     |    0
 ...rub2-remove-sparc64-setup-from-x86-builds.patch |    0
 .../grub/{grub-2.00 => files}/remove-gets.patch    |    0
 meta/recipes-bsp/grub/grub-efi_2.00.bb             |   48 +++++---------------
 meta/recipes-bsp/grub/grub2.inc                    |   44 ++++++++++++++++++
 meta/recipes-bsp/grub/grub_2.00.bb                 |   32 +------------
 meta/recipes-bsp/grub/grub_git.bb                  |   16 +------
 9 files changed, 58 insertions(+), 110 deletions(-)
 rename meta/recipes-bsp/grub/{grub-2.00 => files}/fix-endianness-problem.patch (100%)
 delete mode 100644 meta/recipes-bsp/grub/files/grub-2.00-ignore-gnulib-gets-stupidity.patch
 rename meta/recipes-bsp/grub/{grub-2.00 => files}/grub-install.in.patch (100%)
 rename meta/recipes-bsp/grub/{grub-2.00 => files}/grub2-remove-sparc64-setup-from-x86-builds.patch (100%)
 rename meta/recipes-bsp/grub/{grub-2.00 => files}/remove-gets.patch (100%)
 create mode 100644 meta/recipes-bsp/grub/grub2.inc

-- 
1.7.9.5


