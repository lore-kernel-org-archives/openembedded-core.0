Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 664E2745B4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Oct 2018 17:08:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w92H7Xff029624
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 2 Oct 2018 10:07:49 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Tue, 2 Oct 2018 10:07:30 -0700
From: <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 3 Oct 2018 00:27:10 +0800
Message-ID: <cover.1538492159.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 0/4] Fix multilib install conflicts
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
X-List-Received-Date: Tue, 02 Oct 2018 17:08:14 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

V3:
* replace sed commands with patches
* avoid multilib expand for os-release. It needs a commit on branch
  master-next, so rebase on master-next

The following changes since commit 92bf8679fd1b61a90ad3694ed7be5704ad0d6353:

  meta-ide-support: add cmake-native (2018-10-01 13:08:00 +0100)

are available in the Git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/ML-sep30
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/ML-sep30

Kai Kang (4):
  cups: fix multilib install file conflicts
  man-db: fix multilib install file conflict
  libcheck: avoid multilib install file conflict
  os-release: avoid multilib expand

 meta/conf/multilib.conf                       |  2 +-
 meta/recipes-extended/cups/cups.inc           |  3 ++-
 .../cups-avoid-install-file-conflicts.patch   | 21 +++++++++++++++++++
 ...avoid-multilib-install-file-conflict.patch | 16 ++++++++++++++
 meta/recipes-extended/man-db/man-db_2.8.3.bb  |  3 ++-
 ...echo-compiler-info-to-check_stdint.h.patch | 19 +++++++++++++++++
 .../libcheck/libcheck_0.12.0.bb               |  3 ++-
 7 files changed, 63 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-extended/cups/cups/cups-avoid-install-file-conflicts.patch
 create mode 100644 meta/recipes-extended/man-db/files/man_db.conf-avoid-multilib-install-file-conflict.patch
 create mode 100644 meta/recipes-support/libcheck/libcheck/not-echo-compiler-info-to-check_stdint.h.patch

-- 
2.18.0


