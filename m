Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C73A379987
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2018 06:24:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8T6O8g4015409
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 28 Sep 2018 23:24:18 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Fri, 28 Sep 2018 23:23:57 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 29 Sep 2018 13:43:46 +0800
Message-ID: <cover.1538199671.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Subject: [PATCH v2 00/10] Fix multilib install conflicts
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
X-List-Received-Date: Sat, 29 Sep 2018 06:24:43 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

V2:
* add Upstream-Status for
  meta/recipes-devtools/opkg-utils/opkg-utils/update-alternatives-not-warn-same-priorities-for-multilib.patch

The following changes since commit 3bbbe25ae74e120f7d3452685f0cae2245d7b14d:

  glibc-package.inc: correct intention for deleting /usr/lib as needed (2018-09-27 23:41:41 +0100)

are available in the Git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/ML-sep29
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/ML-sep29

Kai Kang (10):
  cups: fix multilib install file conflicts
  bind: fix multilib install file conflicts
  man-db: fix multilib install file conflict
  groff: fix multilib install file conflicts
  nss: move create blank certificates to pkg_postinst
  libcheck: avoid multilib install file conflict
  opkg-utils/update-alternatives: not warn same priorities for multilib
  os-release: fix install file conflict for multilib
  gobject-introspection: fix multilib install file conflicts
  vala: update vapigen-wrapper

 meta/recipes-connectivity/bind/bind_9.11.4.bb |  4 +-
 meta/recipes-core/os-release/os-release.bb    |  6 +-
 ...ot-warn-same-priorities-for-multilib.patch | 36 ++++++++++
 .../opkg-utils/opkg-utils_0.3.6.bb            |  1 +
 meta/recipes-devtools/vala/vala.inc           |  4 +-
 meta/recipes-extended/cups/cups.inc           |  3 +
 meta/recipes-extended/groff/groff_1.22.3.bb   |  4 +-
 meta/recipes-extended/man-db/man-db_2.8.3.bb  |  3 +
 ...nfigure.ac-make-GIR_DIR-configurable.patch | 65 +++++++++++++++++++
 .../gobject-introspection_1.58.0.bb           | 10 ++-
 .../libcheck/libcheck_0.12.0.bb               |  5 ++
 meta/recipes-support/nss/nss_3.38.bb          | 32 +++++----
 12 files changed, 153 insertions(+), 20 deletions(-)
 create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/update-alternatives-not-warn-same-priorities-for-multilib.patch
 create mode 100644 meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-configure.ac-make-GIR_DIR-configurable.patch

-- 
2.18.0


