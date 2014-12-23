Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 02DD67272A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Dec 2014 05:10:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sBN5A364021577
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Dec 2014 21:10:03 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 22 Dec 2014 21:10:02 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 23 Dec 2014 13:09:53 +0800
Message-ID: <cover.1419309149.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/6] Packages upgrade
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
X-List-Received-Date: Tue, 23 Dec 2014 05:10:06 -0000
Content-Type: text/plain

The following changes since commit 15de188692d2572d897799424e2a22eab24c78e2:

  kernel-devsrc: Ensure we have a dependency on the actual source (2014-12-21 13:52:17 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/upgrade-packages
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/upgrade-packages

Hongxu Jia (6):
  libxml2: upgrade to 2.9.2
  directfb: upgrade to 1.7.6
  apr-util: upgrade to 1.5.4
  pax-utils: upgrade to 0.9.2
  ppp: upgrade 2.4.7
  groff: upgrade 1.22.3

 .../ppp/{ppp_2.4.6.bb => ppp_2.4.7.bb}             |   4 +-
 meta/recipes-core/libxml/libxml2.inc               |   6 +-
 .../configure.ac-fix-cross-compiling-warning.patch |  45 +++
 .../libxml/libxml2/python-sitepackages-dir.patch   |  17 +-
 .../libxml/{libxml2_2.9.1.bb => libxml2_2.9.2.bb}  |   4 +-
 .../{pax-utils_0.8.1.bb => pax-utils_0.9.2.bb}     |   4 +-
 ...off-1.22.2-correct-man.local-install-path.patch |  32 --
 ...off-1.22.3-correct-man.local-install-path.patch |  45 +++
 .../groff/{groff_1.22.2.bb => groff_1.22.3.bb}     |   6 +-
 .../directfb/directfb/fixsepbuild.patch            |  19 --
 .../rename-no-instrument-function-macro.patch      | 345 ---------------------
 .../{directfb_1.7.4.bb => directfb_1.7.6.bb}       |   8 +-
 .../apr/{apr-util_1.5.3.bb => apr-util_1.5.4.bb}   |   4 +-
 13 files changed, 120 insertions(+), 419 deletions(-)
 rename meta/recipes-connectivity/ppp/{ppp_2.4.6.bb => ppp_2.4.7.bb} (96%)
 create mode 100644 meta/recipes-core/libxml/libxml2/configure.ac-fix-cross-compiling-warning.patch
 rename meta/recipes-core/libxml/{libxml2_2.9.1.bb => libxml2_2.9.2.bb} (62%)
 rename meta/recipes-devtools/pax-utils/{pax-utils_0.8.1.bb => pax-utils_0.9.2.bb} (83%)
 delete mode 100644 meta/recipes-extended/groff/groff-1.22.2/groff-1.22.2-correct-man.local-install-path.patch
 create mode 100644 meta/recipes-extended/groff/groff-1.22.3/groff-1.22.3-correct-man.local-install-path.patch
 rename meta/recipes-extended/groff/{groff_1.22.2.bb => groff_1.22.3.bb} (90%)
 delete mode 100644 meta/recipes-graphics/directfb/directfb/fixsepbuild.patch
 delete mode 100644 meta/recipes-graphics/directfb/directfb/rename-no-instrument-function-macro.patch
 rename meta/recipes-graphics/directfb/{directfb_1.7.4.bb => directfb_1.7.6.bb} (58%)
 rename meta/recipes-support/apr/{apr-util_1.5.3.bb => apr-util_1.5.4.bb} (93%)

-- 
1.9.1


