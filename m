Return-Path: <andrej.valek@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 361D17C668
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2019 19:20:49 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x1HJKonb004270
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2019 20:20:50 +0100
Received: from dev.vm6.ccp.siemens.com ([139.22.40.5])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id x1HJKoRo028768;
	Sun, 17 Feb 2019 20:20:50 +0100
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id B5B8098F566;
	Sun, 17 Feb 2019 20:20:49 +0100 (CET)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Feb 2019 20:19:52 +0100
Message-Id: <20190217191953.12856-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190215082252.2726-1-andrej.valek@siemens.com>
References: <20190215082252.2726-1-andrej.valek@siemens.com>
Subject: [PATCH v3 0/1] busybox: 1.29.3 -> 1.30.1
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
X-List-Received-Date: Sun, 17 Feb 2019 19:20:50 -0000

v0:
 - proposal update

v1:
 - fix failing bc applet
  - add update-alternatives into bc recipe

v2:
 - disabled previously enabled bc applet
 - re-generate defconfig with new busybox
  - no new applet has been enabled

 ...inittab_1.29.3.bb => busybox-inittab_1.30.1.bb} |   0
 ...te-check-CONFIG_DESKTOP-before-using-od-t.patch |  83 ---------
 ...-testsuite-check-uudecode-before-using-it.patch |   6 +-
 meta/recipes-core/busybox/busybox/defconfig        | 191 +++++++++++----------
 .../{busybox_1.29.3.bb => busybox_1.30.1.bb}       |   5 +-
 5 files changed, 104 insertions(+), 181 deletions(-)
 rename meta/recipes-core/busybox/{busybox-inittab_1.29.3.bb => busybox-inittab_1.30.1.bb} (100%)
 delete mode 100644 meta/recipes-core/busybox/busybox/0001-testsuite-check-CONFIG_DESKTOP-before-using-od-t.patch
 rename meta/recipes-core/busybox/{busybox_1.29.3.bb => busybox_1.30.1.bb} (89%)

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>

-- 
2.11.0


