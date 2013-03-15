Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>) id 1UGSrQ-0007Vn-Cs
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Mar 2013 12:31:44 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r2F845QV029300
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Mar 2013 01:04:05 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Fri, 15 Mar 2013 01:04:06 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Mar 2013 16:03:59 +0800
Message-ID: <cover.1363333753.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com, Jackie.Huang@windriver.com
Subject: [PATCH 0/4] Multilib: fix PN -> BPN in do_install for some recipes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Mar 2013 11:31:46 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

tested with:
MULTILIBS ?= "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 ?= "x86"

$ bitbake python-imaging lib32-python-imaging \
liberation-fonts lib32-liberation-fonts \
ttf-bitstream-vera lib32-ttf-bitstream-vera \
gnupg lib32-gnupg libatomics-ops lib32-libatomics-ops


The following changes since commit f46cf86d0ec3b80ce526b4dad1b1eac5995969ec:

  icecc: improve interaction with sstate (2013-03-15 01:52:54 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib jhuang0/d_bpn_0315_1
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/d_bpn_0315_1

Jackie Huang (4):
  python-imaging: fix PN -> BPN in do_install for multilibs
  gnupg: fix PN -> BPN in do_install for multilibs
  ttf-fonts: fix PN -> BPN in do_install for multilibs
  libatomics-ops: fix PN -> BPN in do_install for multilibs

 .../python/python-imaging_1.1.7.bb                 |    8 ++++----
 .../ttf-fonts/liberation-fonts_1.04.bb             |    6 +++---
 .../ttf-fonts/liberation-fonts_1.06.bb             |    6 +++---
 .../ttf-fonts/ttf-bitstream-vera_1.10.bb           |    6 +++---
 .../pulseaudio/libatomics-ops_7.2.bb               |    4 ++--
 meta/recipes-support/gnupg/gnupg_1.4.7.bb          |   12 ++++++------
 6 files changed, 21 insertions(+), 21 deletions(-)

-- 
1.7.4.1



