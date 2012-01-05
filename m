Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <liming.wang@windriver.com>) id 1RimAN-0003kd-JJ
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 13:11:31 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q058c6WM019027
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 5 Jan 2012 00:38:06 -0800 (PST)
Received: from pek-yocto-build2.corp.ad.wrs.com (128.224.163.150) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Thu, 5 Jan 2012 00:38:06 -0800
From: Liming Wang <liming.wang@windriver.com>
To: <richard.purdie@linuxfoundation.org>, <sgw@linux.intel.com>
Date: Thu, 5 Jan 2012 16:37:42 +0800
Message-ID: <1325752666-28560-1-git-send-email-liming.wang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/4] qemuppc: replace emulation of qemuppc
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
X-List-Received-Date: Thu, 05 Jan 2012 12:11:32 -0000
Content-Type: text/plain

Hi Richard,

These patches are aimed to replace emulation of qemuppc from prep to mac99.
With this new emulation, qemuppc now supports framebuffer and the network
works well.

The kernel config also needs modification and I will let Bruce to review the
patches.

The following changes since commit 0ff1d667dc23b0cc903c18f1b5e032c2b6630aae:

  distro: Add poky-tiny distro definition

are available in the git repository at:

  git://128.224.162.211/poky.git qemuppc-new

Liming Wang (4):
      qemuppc: replace emulation of qemuppc from prep to mac99
      qemuppc: add pointercal file
      qemuppc: add machconfig
      tslib: enable big endian support for qemuppc

 meta/conf/machine/qemuppc.conf                     |    2 +-
 .../formfactor/files/qemuppc/machconfig            |   10 ++++++++++
 .../pointercal/files/qemuppc/pointercal            |  Bin 0 -> 36 bytes
 meta/recipes-graphics/tslib/tslib_1.0.bb           |    1 +
 scripts/runqemu                                    |    7 +------
 scripts/runqemu-internal                           |   16 ++++++++--------
 6 files changed, 21 insertions(+), 15 deletions(-)
 create mode 100755 meta/recipes-bsp/formfactor/files/qemuppc/machconfig
 create mode 100644 meta/recipes-bsp/pointercal/files/qemuppc/pointercal


