Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 116C0746E1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2018 06:28:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w9C6SWA1018608
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 11 Oct 2018 23:28:32 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Thu, 11 Oct 2018 23:28:31 -0700
From: <kai.kang@windriver.com>
To: <ross.burton@intel.com>
Date: Fri, 12 Oct 2018 13:47:30 +0800
Message-ID: <cover.1539322988.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 0/3] Fix multilib install file conflict of gobject-introspection
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
X-List-Received-Date: Fri, 12 Oct 2018 06:28:32 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

V3:
* according to Ross's comment, remove override 'class-target' for RDEPENDS

The following changes since commit 793a82c2da639088884c93595e6a3f28e5e3d747:

  oeqa/manual/oe-core: Drop image build during taskexp test (2018-10-11 23:06:35 +0100)

are available in the Git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/gir-ml
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/gir-ml

Kai Kang (3):
  gobject-introspection: add required python modules to rdepends
  gobject-introspection: fix multilib install file conflicts
  vala: update vapigen-wrapper

 meta/recipes-devtools/vala/vala.inc           |  7 +-
 ...nfigure.ac-make-GIR_DIR-configurable.patch | 68 +++++++++++++++++
 ...02-g-ir-tools-respect-gir_dir_prefix.patch | 76 +++++++++++++++++++
 .../gobject-introspection_1.58.0.bb           | 13 +++-
 4 files changed, 160 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-configure.ac-make-GIR_DIR-configurable.patch
 create mode 100644 meta/recipes-gnome/gobject-introspection/gobject-introspection/0002-g-ir-tools-respect-gir_dir_prefix.patch

-- 
2.18.0


