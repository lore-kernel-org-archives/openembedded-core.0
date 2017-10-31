Return-Path: <Dengke.Du@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 91F9A60746
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Oct 2017 06:45:27 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v9V6jSKT019402
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Oct 2017 23:45:28 -0700 (PDT)
Received: from pek-ddu-u1642.wrs.com (128.224.163.182) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Mon, 30 Oct 2017 23:45:28 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 31 Oct 2017 14:44:15 +0800
Message-ID: <cover.1509431793.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/1] avahi: upgrade to 0.7
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
X-List-Received-Date: Tue, 31 Oct 2017 06:45:27 -0000
Content-Type: text/plain

The following changes since commit 65d23bd7986615fdfb0f1717b615534a2a14ab80:

  README.qemu: qemuppc64 is not supported (2017-10-16 23:54:31 +0100)

are available in the git repository at:

  https://github.com/DengkeDu/openembedded-core.git dengke/avahi-0.7
  https://github.com//tree/dengke/avahi-0.7

Dengke Du (1):
  avahi: upgrade to 0.7

 .../avahi/{avahi-ui_0.6.32.bb => avahi-ui_0.7.bb}  |  6 ++---
 meta/recipes-connectivity/avahi/avahi.inc          | 11 +++-----
 .../avahi/{avahi_0.6.32.bb => avahi_0.7.bb}        |  6 ++---
 ...c-install-GtkBuilder-interface-files-for-.patch | 29 ---------------------
 .../files/avahi-fix-resource-unavaiable.patch      | 30 ----------------------
 5 files changed, 7 insertions(+), 75 deletions(-)
 rename meta/recipes-connectivity/avahi/{avahi-ui_0.6.32.bb => avahi-ui_0.7.bb} (89%)
 rename meta/recipes-connectivity/avahi/{avahi_0.6.32.bb => avahi_0.7.bb} (78%)
 delete mode 100644 meta/recipes-connectivity/avahi/files/0001-configure.ac-install-GtkBuilder-interface-files-for-.patch
 delete mode 100644 meta/recipes-connectivity/avahi/files/avahi-fix-resource-unavaiable.patch

-- 
2.7.4


