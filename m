Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2E6F5719CA
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Oct 2016 01:14:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u991EToC027027
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 8 Oct 2016 18:14:30 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Sat, 8 Oct 2016 18:14:29 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 9 Oct 2016 08:56:05 +0800
Message-ID: <cover.1475973333.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
MIME-Version: 1.0
Subject: [PATCH 0/2] net-tools: fix building with linux-4.8
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
X-List-Received-Date: Sun, 09 Oct 2016 01:14:30 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

This is a follow-up from the thread:
https://patchwork.openembedded.org/patch/132637/

I reverted Bruce's change and picked Randy's fix for net-tools,
build tests are fine for qemux86-64/ppc/arm/arm64/mips and I
booted core-image-full-cmdline for qemuarm64 and checked that
iptunnel works fine.

--
The following changes since commit ac647ea6964e166c395334fe107015030adc1b76:

  update-rc.d.bbclass: check that init script is executable before running it (2016-10-07 16:53:18 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib.git jhuang0/d_net-tools-linux-4.8_161008-1
  http://git.pokylinux.org/cgit.cgi//log/?h=jhuang0/d_net-tools-linux-4.8_161008-1

Jackie Huang (2):
  Revert "linux-libc-headers: if_tunnel: remove include of if/ip/in6.h"
  net-tools: fix building with linux-4.8

 .../net-tools-fix-building-with-linux-4.8.patch    | 52 ++++++++++++++++++++++
 .../net-tools/net-tools_1.60-26.bb                 |  1 +
 ...1-if_tunnel-remove-include-of-if-ip-in6.h.patch | 33 --------------
 .../linux-libc-headers/linux-libc-headers_4.8.bb   |  1 -
 4 files changed, 53 insertions(+), 34 deletions(-)
 create mode 100644 meta/recipes-extended/net-tools/net-tools/net-tools-fix-building-with-linux-4.8.patch
 delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-if_tunnel-remove-include-of-if-ip-in6.h.patch

-- 
2.8.3


