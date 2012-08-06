Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>) id 1SyHZP-0006R1-Uy
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Aug 2012 09:17:44 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q7675wsN007277
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Aug 2012 00:05:58 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Mon, 6 Aug 2012 00:05:58 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 6 Aug 2012 15:05:43 +0800
Message-ID: <cover.1344236526.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4
MIME-Version: 1.0
Subject: [PATCH 0/1] tcl: Add ${bindir_crossscripts}/tclConfig.sh to sysroot stage
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
X-List-Received-Date: Mon, 06 Aug 2012 07:17:44 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

tclConfig.sh is changed in do_install for cross compile and
is installed to STAGING_BINDIR_CROSS, but if SSTATE_DIR is set
and tcl is from sstage, tclConfig.sh can't be found in
STAGING_BINDIR_CROSS, add ${bindir_crossscripts}/tclConfig.sh
to sysroot stage can fix it.

[YOCTO #2891]

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
The following changes since commit a9d0cbe1d84bb26fc1a1f48764fe514cf9f9c548:

  gcc: Bump PR since there have been several gcc changes and various problems reported and this should flush anything stale out (2012-08-03 10:32:24 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib jhuang0/bug2891_tcl_0806
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/bug2891_tcl_0806

Jackie Huang (1):
  tcl: Add ${bindir_crossscripts}/tclConfig.sh to sysroot stage

 meta/recipes-devtools/tcltk/tcl_8.5.11.bb |    9 +++++++--
 1 files changed, 7 insertions(+), 2 deletions(-)

-- 
1.7.4



