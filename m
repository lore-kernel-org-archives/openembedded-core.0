Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C1AD874775
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 16:30:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w86GUwlq014971
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 6 Sep 2018 09:30:59 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Thu, 6 Sep 2018 09:30:54 -0700
From: <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 6 Sep 2018 23:52:23 +0800
Message-ID: <cover.1536248856.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH v5 0/7] disable allarch when multilib is used
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
X-List-Received-Date: Thu, 06 Sep 2018 16:30:59 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

V5:
* set PACKAGE_ARCH in event handler bb.event.RecipePreFinalise
* add execption of target-sdk-provides-dummy for package_qa_multilib check



The following changes since commit c710430aa1a5a30d3087c3102485d4621e8d179e:

  Revert "prelink: Fix SRC_URI and branch" (2018-09-06 14:49:28 +0100)

are available in the Git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/noarchV5
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/noarchV5

Kai Kang (7):
  allarch: only enable allarch when multilib is not used
  sstate.bbclass: update SSTATE_DUPWHITELIST
  update_font_cache: update script for multilib
  update_gtk_immodules_cache: update for multilib
  statetests.py: drop test_sstate_allarch_samesigs_multilib
  multilib: fix install file conflicts
  target-sdk-provides-dummy: skip package_qa_multilib check

 meta/classes/allarch.bbclass                         | 12 +++++++++++-
 meta/classes/icecc.bbclass                           |  2 +-
 meta/classes/multilib.bbclass                        |  7 ++++++-
 meta/classes/multilib_global.bbclass                 |  4 +---
 meta/classes/package.bbclass                         |  9 ++++++---
 meta/classes/populate_sdk_base.bbclass               |  3 +--
 meta/classes/sstate.bbclass                          |  4 +++-
 meta/lib/oeqa/selftest/cases/sstatetests.py          | 11 ++---------
 meta/recipes-core/udev/eudev_3.2.5.bb                |  6 ++++--
 .../gobject-introspection_1.56.1.bb                  |  6 ++++--
 meta/recipes-gnome/gtk+/gtk+.inc                     |  4 ++++
 meta/recipes-gnome/gtk+/gtk+3.inc                    |  4 ++++
 meta/recipes-graphics/cairo/cairo_1.14.12.bb         |  6 ++++--
 .../recipes-graphics/fontconfig/fontconfig_2.12.6.bb |  8 +++++++-
 meta/recipes-support/icu/icu.inc                     |  4 +++-
 .../libgpg-error/libgpg-error_1.32.bb                |  5 ++++-
 scripts/postinst-intercepts/update_font_cache        |  2 +-
 .../postinst-intercepts/update_gtk_immodules_cache   |  8 ++++----
 18 files changed, 70 insertions(+), 35 deletions(-)

-- 
2.18.0


