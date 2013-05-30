Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5A66B60991
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 06:32:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r4U6Wbrx014430
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 23:32:37 -0700 (PDT)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Wed, 29 May 2013 23:32:37 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 30 May 2013 02:32:34 -0400
Message-ID: <cover.1369882542.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] qt-mobility: fix metaobjectbuilder build errors
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
X-List-Received-Date: Thu, 30 May 2013 06:32:37 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Backport upstream patches to fix the build errors:
    
ipc/qmetaobjectbuilder.cpp:803:65: error: invalid conversion from \
'QMetaObjectExtraData::StaticMetacallFunction {aka void (*)(QObject*, \
QMetaObject::Call, int, void**)}' to 'QtMobility::QMetaObjectBuilder:: \
StaticMetacallFunction {aka int (*)(QMetaObject::Call, int, void**)} \

Upstream-commit:
http://qt.gitorious.org/qt-mobility/qt-mobility/commit/f102053b28009b3094b0e5777177208afa6097c5

Task-number: QTMOBILITY-1990

[YOCTO #4575]

The following changes since commit 5cb59cc6910d8f3165528c4a71e29e4de897d242:

  yocto-bsp: re-enable AutoAddDevices in xorg.conf for generated BSPs (2013-05-29 22:25:41 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/qt-mobility
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/qt-mobility

Wenzong Fan (1):
  qt-mobility: fix metaobjectbuilder build errors

 .../fix_metaobjectbuilder_build_err.patch          | 4707 ++++++++++++++++++++
 meta/recipes-qt/qt4/qt-mobility_1.2.0.inc          |    3 +-
 2 files changed, 4709 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-qt/qt4/qt-mobility-1.2.0/fix_metaobjectbuilder_build_err.patch

-- 
1.7.9.5


