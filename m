Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A4E2A6DD78
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 17:33:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAQHXkbK017018
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 26 Nov 2013 09:33:46 -0800 (PST)
Received: from yow-bashfiel-d3.wrs.com (128.224.147.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Tue, 26 Nov 2013 09:33:47 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 26 Nov 2013 12:33:42 -0500
Message-ID: <cover.1385487115.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/3] linux-yocto: consolidated pull request
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
X-List-Received-Date: Tue, 26 Nov 2013 17:33:49 -0000
Content-Type: text/plain

Richard/Saul,

Small updates to import the latest -stable updates for the 3.10 and 3.4
kernels, as well as some fixes for preempt-rt on qemumarm and minor 
configuration tweaks.

Built and booted locally.

Bruce

The following changes since commit 1e084f9d755e3458d2f9863382fa3bb7877a146d:

  qemu: add PACKAGECONFIG for vnc, libcurl, nss, uuid, curses, gtk+, libcap-ng (2013-11-26 12:10:35 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (3):
  linux/yocto-3.10: merge v3.10.19
  linux-yocto/3.4: update to v3.4.69
  linux-yocto/3.10: -rt, ebtables and e1000 fixes

 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb    |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb  |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 18 +++++++++---------
 meta/recipes-kernel/linux/linux-yocto_3.4.bb       | 14 +++++++-------
 6 files changed, 28 insertions(+), 28 deletions(-)

-- 
1.8.1.2


