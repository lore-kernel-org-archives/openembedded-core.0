Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A1D2173D15
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Apr 2015 11:24:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t37BOVGK025052
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 Apr 2015 04:24:31 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 7 Apr 2015 04:24:31 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 7 Apr 2015 04:24:21 -0700
Message-ID: <cover.1428405830.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 00/10] Package Upgrades
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
X-List-Received-Date: Tue, 07 Apr 2015 11:24:32 -0000
Content-Type: text/plain

The following changes since commit fbaddd724855a829698d853a70eee86118d6a5e7:

  package_manager: call createrepo with --dbpath pointing inside WORKDIR (2015-04-02 12:00:55 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/PU
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/PU

Robert Yang (10):
  strace: 4.9 -> 4.10
  libuser: 0.60 -> 0.61
  patch: 2.7.1 -> 2.7.5
  libgcrypt: 1.6.2 -> 1.6.3
  gnupg: 2.1.1 -> 2.1.2
  socat: 1.7.2.4 -> 1.7.3.0
  dhcp: 4.3.1 -> 4.3.2
  groff: 1.22.2 -> 1.22.3
  man-pages: 3.76 -> 3.82
  glib-2.0: 2.42.1 -> 2.44.0

 .../dhcp/dhcp/dhcp-xen-checksum.patch              |  307 --------------------
 .../dhcp/{dhcp_4.3.1.bb => dhcp_4.3.2.bb}          |    5 +-
 .../socat/socat/fix-cross-compiling-failed.patch   |   36 ---
 .../socat/socat/socat-1.7.2.4-linux-3.17.patch     |   29 --
 .../socat/{socat_1.7.2.4.bb => socat_1.7.3.0.bb}   |    8 +-
 .../{glib-2.0_2.42.1.bb => glib-2.0_2.44.0.bb}     |    4 +-
 meta/recipes-devtools/patch/patch.inc              |    1 +
 .../patch/patch/patch-CVE-2015-1196.patch          |  200 -------------
 .../patch/{patch_2.7.1.bb => patch_2.7.5.bb}       |    6 +-
 .../{strace-4.9 => strace}/Makefile-ptest.patch    |    8 +-
 .../strace/{strace-4.9 => strace}/git-version-gen  |    0
 .../strace/{strace-4.9 => strace}/run-ptest        |    0
 .../strace-add-configure-options.patch             |   24 +-
 .../strace/{strace_4.9.bb => strace_4.10.bb}       |    8 +-
 ...off-1.22.2-correct-man.local-install-path.patch |   36 +--
 .../groff/{groff_1.22.2.bb => groff_1.22.3.bb}     |    7 +-
 .../libuser/libuser/fixsepbuild.patch              |   35 ---
 .../libuser/{libuser_0.60.bb => libuser_0.61.bb}   |    6 +-
 .../{man-pages_3.76.bb => man-pages_3.82.bb}       |    4 +-
 .../gnupg/{gnupg_2.1.1.bb => gnupg_2.1.2.bb}       |    4 +-
 meta/recipes-support/libgcrypt/libgcrypt_1.6.2.bb  |    4 -
 meta/recipes-support/libgcrypt/libgcrypt_1.6.3.bb  |    4 +
 22 files changed, 59 insertions(+), 677 deletions(-)
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp/dhcp-xen-checksum.patch
 rename meta/recipes-connectivity/dhcp/{dhcp_4.3.1.bb => dhcp_4.3.2.bb} (64%)
 delete mode 100644 meta/recipes-connectivity/socat/socat/fix-cross-compiling-failed.patch
 delete mode 100644 meta/recipes-connectivity/socat/socat/socat-1.7.2.4-linux-3.17.patch
 rename meta/recipes-connectivity/socat/{socat_1.7.2.4.bb => socat_1.7.3.0.bb} (78%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.42.1.bb => glib-2.0_2.44.0.bb} (83%)
 delete mode 100644 meta/recipes-devtools/patch/patch/patch-CVE-2015-1196.patch
 rename meta/recipes-devtools/patch/{patch_2.7.1.bb => patch_2.7.5.bb} (60%)
 rename meta/recipes-devtools/strace/{strace-4.9 => strace}/Makefile-ptest.patch (90%)
 rename meta/recipes-devtools/strace/{strace-4.9 => strace}/git-version-gen (100%)
 rename meta/recipes-devtools/strace/{strace-4.9 => strace}/run-ptest (100%)
 rename meta/recipes-devtools/strace/{strace-4.9 => strace}/strace-add-configure-options.patch (70%)
 rename meta/recipes-devtools/strace/{strace_4.9.bb => strace_4.10.bb} (84%)
 rename meta/recipes-extended/groff/{groff-1.22.2 => groff-1.22.3}/groff-1.22.2-correct-man.local-install-path.patch (40%)
 rename meta/recipes-extended/groff/{groff_1.22.2.bb => groff_1.22.3.bb} (92%)
 delete mode 100644 meta/recipes-extended/libuser/libuser/fixsepbuild.patch
 rename meta/recipes-extended/libuser/{libuser_0.60.bb => libuser_0.61.bb} (85%)
 rename meta/recipes-extended/man-pages/{man-pages_3.76.bb => man-pages_3.82.bb} (86%)
 rename meta/recipes-support/gnupg/{gnupg_2.1.1.bb => gnupg_2.1.2.bb} (89%)
 delete mode 100644 meta/recipes-support/libgcrypt/libgcrypt_1.6.2.bb
 create mode 100644 meta/recipes-support/libgcrypt/libgcrypt_1.6.3.bb

-- 
1.7.9.5


