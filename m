Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <liming.wang@windriver.com>) id 1RlJRM-0003u8-FM
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jan 2012 13:07:32 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q0C8gOtu021688
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2012 00:42:25 -0800 (PST)
Received: from pek-yocto-build2.corp.ad.wrs.com (128.224.163.150) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Thu, 12 Jan 2012 00:42:24 -0800
From: Liming Wang <liming.wang@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Thu, 12 Jan 2012 16:42:00 +0800
Message-ID: <1326357721-19562-1-git-send-email-liming.wang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] V2 qemuppc/kernel: replace emulation of qemuppc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Jan 2012 12:07:32 -0000
Content-Type: text/plain

v2 change log:
	- disable CONFIG_DEVTMPFS option to avoid /dev/console
	 pointing to serial. Otherwise, keyboard doesn't work well
	 on X-windows.

The following changes since commit a8ebc77767e034c589e8041406f4282136a2219b:

  meta/qemu-ppc32: remove references to non-existent patches (2012-01-05 10:42:40 -0500)

are available in the git repository at:
  git://128.224.163.150/linux-yocto-dev.git meta-qemuppc

Liming Wang (1):
      meta/qemuppc: replace kernel config file of qemu-ppc32 with mac99

 .../kernel-cache/bsp/qemu-ppc32/qemu-ppc32-gfx.cfg |   11 +++++
 .../cfg/kernel-cache/bsp/qemu-ppc32/qemu-ppc32.cfg |   44 +++++++++++++++----
 .../cfg/kernel-cache/bsp/qemu-ppc32/qemu-ppc32.scc |    1 +
 3 files changed, 46 insertions(+), 10 deletions(-)
 create mode 100644 meta/cfg/kernel-cache/bsp/qemu-ppc32/qemu-ppc32-gfx.cfg



