Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 711386AC3A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2015 09:15:49 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t2I9Fo0m029076
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2015 02:15:50 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.236) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Wed, 18 Mar 2015 02:15:50 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 18 Mar 2015 17:16:09 +0800
Message-ID: <cover.1426670089.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/5] Changes regarding log checking and license checksums
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
X-List-Received-Date: Wed, 18 Mar 2015 09:15:53 -0000
Content-Type: text/plain

The following changes since commit 0752c79282b1cc9699743e719518e6c341d50a3a:

  systemd: fix /var/log/journal ownership (2015-03-16 17:38:51 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/log-check-license-warn
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/log-check-license-warn

Chen Qi (5):
  rootfs.py: two changes regarding log checking
  rootfs.py: add log checking ability for deb and ipk
  packagegroup: add LIC_FILES_CHKSUM
  os-release: add LIC_FILES_CHKSUM
  glibc-collateral.inc: add LIC_FILES_CHKSUM

 meta/lib/oe/rootfs.py                              | 64 +++++++++++++++-------
 meta/recipes-core/glibc/glibc-collateral.inc       |  2 +
 meta/recipes-core/os-release/os-release.bb         |  1 +
 .../packagegroups/packagegroup-base.bb             |  1 +
 .../packagegroups/packagegroup-core-boot.bb        |  1 +
 .../packagegroup-core-buildessential.bb            |  1 +
 .../packagegroup-core-eclipse-debug.bb             |  1 +
 .../packagegroups/packagegroup-core-nfs.bb         |  1 +
 .../packagegroups/packagegroup-core-sdk.bb         |  1 +
 .../packagegroup-core-ssh-dropbear.bb              |  1 +
 .../packagegroups/packagegroup-core-ssh-openssh.bb |  1 +
 .../packagegroup-core-standalone-sdk-target.bb     |  1 +
 .../packagegroups/packagegroup-core-tools-debug.bb |  1 +
 .../packagegroup-core-tools-profile.bb             |  1 +
 .../packagegroup-core-tools-testapps.bb            |  1 +
 .../packagegroups/packagegroup-cross-canadian.bb   |  1 +
 .../packagegroups/packagegroup-self-hosted.bb      |  1 +
 .../packagegroup-core-device-devel.bb              |  1 +
 .../packagegroup-core-full-cmdline.bb              |  1 +
 .../packagegroups/packagegroup-core-lsb.bb         |  1 +
 .../packagegroups/packagegroup-core-clutter.bb     |  1 +
 .../packagegroups/packagegroup-core-directfb.bb    |  1 +
 .../packagegroups/packagegroup-core-x11-base.bb    |  1 +
 .../packagegroups/packagegroup-core-x11-xserver.bb |  1 +
 .../packagegroups/packagegroup-core-x11.bb         |  1 +
 .../packagegroups/packagegroup-core-qt.bb          |  1 +
 .../packagegroups/packagegroup-core-qt4e.bb        |  1 +
 .../packagegroup-qt-toolchain-target.inc           |  1 +
 .../packagegroups/packagegroup-core-x11-sato.bb    |  1 +
 29 files changed, 74 insertions(+), 19 deletions(-)

-- 
1.9.1


