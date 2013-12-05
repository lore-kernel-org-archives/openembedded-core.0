Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AFA806DF9C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2013 22:58:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rB5MwI62018117
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Dec 2013 14:58:18 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Thu, 5 Dec 2013 14:58:18 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 5 Dec 2013 16:57:39 -0600
Message-ID: <cover.1386283669.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [RFC PATCH 0/7][dora] misc WR patches
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
X-List-Received-Date: Thu, 05 Dec 2013 22:58:20 -0000
Content-Type: text/plain

The following patches are various items that we have in our tree, but I
don't believe are generally applicable and should likely -not- be merged
into oe-core.

These are being sent for Yocto Project compliance.

Note a few of these have previous been sent.  The items were resent because
later patches relied on them.

The following changes since commit c303f5ecf7cda1c3b8bb776a6800946c0487cd93:

  Revert "utils.bbclass: Fix override ordering for FILESPATH" (2013-12-03 12:55:47 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib mhatle/dora-misc
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mhatle/dora-misc

Amy Fong (1):
  native-python: bad interpreter error message

Chen Qi (1):
  bind: add support for read-only rootfs

Junxian.Xiao (1):
  Fix conflict between procps and base-files

Ming Liu (2):
  bind: run in the chrooted jail
  bind: use volatiles for managing /var/ subdirs

Wenzong Fan (1):
  nss: workaround multilib build on 32bit host

Yue Tao (1):
  bind: add init.d/bind status command

 meta/classes/distutils.bbclass                     |  14 ++-
 .../bind-add-init-bind-status-command.patch        |  45 ++++++++
 meta/recipes-connectivity/bind/bind-9.8.1/bind9    |  33 ++++++
 .../init.d-add-support-for-read-only-rootfs.patch  |  70 ++++++++++++
 .../bind/bind-9.8.1/init.d-fix-indentation.patch   |  90 ++++++++++++++++
 .../init.d-normalize-for-volatiles.patch           |  37 +++++++
 .../bind/bind-9.8.1/setup-chroot-hooks.patch       | 119 +++++++++++++++++++++
 .../bind/bind-9.8.1/volatiles.98_bind              |   5 +
 .../bind/bind-9.8.1/volatiles.99_bind-chroot       |  10 ++
 meta/recipes-connectivity/bind/bind_9.8.1.bb       |  31 +++++-
 meta/recipes-extended/procps/procps_3.2.8.bb       |   4 +
 .../nss/files/nss-fix-nsinstall-build.patch        |  35 ++++++
 meta/recipes-support/nss/nss.inc                   |   1 +
 13 files changed, 489 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-connectivity/bind/bind-9.8.1/bind-add-init-bind-status-command.patch
 create mode 100644 meta/recipes-connectivity/bind/bind-9.8.1/bind9
 create mode 100644 meta/recipes-connectivity/bind/bind-9.8.1/init.d-add-support-for-read-only-rootfs.patch
 create mode 100644 meta/recipes-connectivity/bind/bind-9.8.1/init.d-fix-indentation.patch
 create mode 100644 meta/recipes-connectivity/bind/bind-9.8.1/init.d-normalize-for-volatiles.patch
 create mode 100644 meta/recipes-connectivity/bind/bind-9.8.1/setup-chroot-hooks.patch
 create mode 100644 meta/recipes-connectivity/bind/bind-9.8.1/volatiles.98_bind
 create mode 100644 meta/recipes-connectivity/bind/bind-9.8.1/volatiles.99_bind-chroot
 create mode 100644 meta/recipes-support/nss/files/nss-fix-nsinstall-build.patch

-- 
1.8.1.2.545.g2f19ada


