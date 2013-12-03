Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BF8426DEEC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Dec 2013 10:27:16 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rB3ARFXs005260
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 3 Dec 2013 02:27:15 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Tue, 3 Dec 2013 02:27:15 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 3 Dec 2013 18:27:03 +0800
Message-ID: <cover.1386066249.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 0/3] mtools, syslinux: add ability to compile with nativesdk
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
X-List-Received-Date: Tue, 03 Dec 2013 10:27:17 -0000
Content-Type: text/plain

The following changes since commit a17ffbdbb7d142a94ef842a32b749b18e2e7f0a1:

  bitbake: hob: fix rotating progress icon animation (2013-12-02 17:51:35 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-mtools
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-mtools

Hongxu Jia (3):
  mtools: add ability to compile with nativesdk
  syslinux: add ability to compile with nativesdk
  eglibc-locale.inc: use nativesdk override with the PACKAGES_DYNAMIC
    statement

 meta/recipes-core/eglibc/eglibc-locale.inc      | 6 ++++++
 meta/recipes-devtools/mtools/mtools_3.9.9.bb    | 2 +-
 meta/recipes-devtools/mtools/mtools_4.0.18.bb   | 2 +-
 meta/recipes-devtools/syslinux/syslinux_6.01.bb | 2 +-
 4 files changed, 9 insertions(+), 3 deletions(-)

-- 
1.8.1.2


