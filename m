Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <liming.wang@windriver.com>) id 1Rj5Ln-00069A-DK
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 09:40:35 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q068XBWQ023113
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Jan 2012 00:33:11 -0800 (PST)
Received: from pek-yocto-build2.corp.ad.wrs.com (128.224.163.150) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Fri, 6 Jan 2012 00:33:11 -0800
From: Liming Wang <liming.wang@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Fri, 6 Jan 2012 16:32:55 +0800
Message-ID: <1325838776-13150-1-git-send-email-liming.wang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] qemuppc/kernel: replace emulation of qemuppc
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
X-List-Received-Date: Fri, 06 Jan 2012 08:40:35 -0000
Content-Type: text/plain

Hi bruce,

This patch is for kernel to replace emulation of qemuppc from
prep to mac99.

The following changes since commit a8ebc77767e034c589e8041406f4282136a2219b:

  meta/qemu-ppc32: remove references to non-existent patches (2012-01-05 10:42:40 -0500)

are available in the git repository at:
  git://128.224.163.150/linux-yocto-dev.git meta-qemuppc

Liming Wang (1):
      meta/qemuppc: replace kernel config file of qemu-ppc32 with mac99

 .../kernel-cache/bsp/qemu-ppc32/qemu-ppc32-gfx.cfg |   11 +++++
 .../cfg/kernel-cache/bsp/qemu-ppc32/qemu-ppc32.cfg |   42 +++++++++++++++----
 .../cfg/kernel-cache/bsp/qemu-ppc32/qemu-ppc32.scc |    1 +
 3 files changed, 45 insertions(+), 9 deletions(-)
 create mode 100644 meta/cfg/kernel-cache/bsp/qemu-ppc32/qemu-ppc32-gfx.cfg


