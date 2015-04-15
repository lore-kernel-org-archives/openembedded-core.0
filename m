Return-Path: <bruno.bottazzini@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id EEA39605D2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Apr 2015 17:54:59 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 Apr 2015 10:55:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,582,1422950400"; d="scan'208";a="709617022"
Received: from orsmsx106.amr.corp.intel.com ([10.22.225.133])
	by fmsmga002.fm.intel.com with ESMTP; 15 Apr 2015 10:54:58 -0700
Received: from orsmsx157.amr.corp.intel.com (10.22.240.23) by
	ORSMSX106.amr.corp.intel.com (10.22.225.133) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Wed, 15 Apr 2015 10:54:52 -0700
Received: from fmsmsx104.amr.corp.intel.com (10.18.124.202) by
	ORSMSX157.amr.corp.intel.com (10.22.240.23) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Wed, 15 Apr 2015 10:54:52 -0700
Received: from localhost.localdomain (10.218.98.35) by
	fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Wed, 15 Apr 2015 10:54:51 -0700
From: Bruno Bottazzini <bruno.bottazzini@intel.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 15 Apr 2015 14:54:38 -0300
Message-ID: <1429120478-31804-1-git-send-email-bruno.bottazzini@intel.com>
X-Mailer: git-send-email 2.3.5
MIME-Version: 1.0
X-Originating-IP: [10.218.98.35]
Subject: [PATCH] systemd 219 -> system 219-stable The upstream systemd git repo only contains the main systemd branch that progresses at a quick pace, continuously bringing both bugfixes and new features.
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
X-List-Received-Date: Wed, 15 Apr 2015 17:55:02 -0000
Content-Type: text/plain

Distributions usually prefer basing their releases on stabilized versions
that receive the bugfixes but not the features.
---
 meta/recipes-core/systemd/systemd_219.bb | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_219.bb b/meta/recipes-core/systemd/systemd_219.bb
index 43c4f95..d1303f7 100644
--- a/meta/recipes-core/systemd/systemd_219.bb
+++ b/meta/recipes-core/systemd/systemd_219.bb
@@ -25,11 +25,11 @@ SECTION = "base/shell"
 
 inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d update-alternatives qemu systemd ptest gettext
 
-SRCREV = "a88abde72169ddc2df77df3fa5bed30725022253"
+SRCREV = "85a6fabdd3e43cfab0fc6359e9f2a9e368d4a3ed"
 
-PV = "219+git${SRCPV}"
+PV = "219-stable+git${SRCPV}"
 
-SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;branch=master \
+SRC_URI = "git://anongit.freedesktop.org/systemd/systemd-stable;branch=v219-stable;protocol=git \
            file://0002-shared-missing.h-fall-back-to-insecure-getenv.patch \
            file://0003-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
            file://0004-configure-Check-for-additional-features-that-uclibc-.patch \
@@ -38,12 +38,8 @@ SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;branch=master \
            file://0007-util-Use-mkostemp-only-if-libc-supports-it.patch \
            file://0008-util-bypass-unimplemented-_SC_PHYS_PAGES-system-conf.patch \
            file://0009-sysv-generator-add-support-for-executing-scripts-und.patch \
-           file://0010-Make-root-s-home-directory-configurable.patch \
            file://0011-systemd-user-avoid-using-system-auth.patch \
-           file://0001-tmpfiles-avoid-creating-duplicate-acl-entries.patch \
-           file://0002-tmpfiles-quietly-ignore-ACLs-on-unsupported-filesyst.patch \
            file://0012-systemd-tmpfiles.c-Honor-ordering-within-files-as-th.patch \
-           file://0013-journal-fix-Inappropriate-ioctl-for-device-on-ext4.patch \
            file://0014-Revert-rules-remove-firmware-loading-rules.patch \
            file://0015-Revert-udev-remove-userspace-firmware-loading-suppor.patch \
            file://tmpfiles-pam.patch \
-- 
2.3.5


