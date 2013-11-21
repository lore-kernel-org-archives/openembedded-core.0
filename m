Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0AEE46CF1E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 13:14:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rALDEmAE007380
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 21 Nov 2013 05:14:48 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Thu, 21 Nov 2013 05:14:47 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Nov 2013 21:14:34 +0800
Message-ID: <cover.1385039538.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 0/4] fix some packages (kconfig-frontends/lttng-tools/lttng-ust/qemu) loss RDEPENDS on python
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
X-List-Received-Date: Thu, 21 Nov 2013 13:14:49 -0000
Content-Type: text/plain

The following changes since commit 725fae65810c477882f7f9d02561362b3f603db0:

  bitbake: toasterui: fix typo (2013-11-20 14:06:49 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-add-python
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-add-python

Hongxu Jia (4):
  kconfig-frontends:  add python to kconfig-frontends's RDEPENDS
  lttng-ust:  add python to lttng-ust's RDEPENDS
  lttng-tools: add PACKAGECONFIG to support --enable-python-bindings and
    lttng-ust
  qemu: add bash and python to qemu's RDEPENDS

 .../kconfig-frontends/kconfig-frontends_3.12.0.0.bb  |  1 +
 meta/recipes-devtools/qemu/qemu.inc                  |  1 +
 meta/recipes-kernel/lttng/lttng-tools_2.3.1.bb       | 20 ++++++++++++++++----
 meta/recipes-kernel/lttng/lttng-ust_2.3.1.bb         |  1 +
 4 files changed, 19 insertions(+), 4 deletions(-)

-- 
1.8.1.2


