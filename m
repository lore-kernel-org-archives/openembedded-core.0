Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6CEE278842
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jan 2018 12:27:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Jan 2018 04:27:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,340,1511856000"; d="scan'208";a="18133595"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 10 Jan 2018 04:27:40 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Jan 2018 14:27:41 +0200
Message-Id: <20180110122742.1226-3-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180110122742.1226-1-alexander.kanavin@linux.intel.com>
References: <20180110122742.1226-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 3/4] gnupg: enable native version
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
X-List-Received-Date: Wed, 10 Jan 2018 12:27:39 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-support/gnupg/gnupg_2.2.4.bb       | 2 ++
 meta/recipes-support/libksba/libksba_1.3.5.bb   | 2 ++
 meta/recipes-support/npth/npth_1.5.bb           | 2 ++
 meta/recipes-support/pinentry/pinentry_1.1.0.bb | 2 ++
 4 files changed, 8 insertions(+)

diff --git a/meta/recipes-support/gnupg/gnupg_2.2.4.bb b/meta/recipes-support/gnupg/gnupg_2.2.4.bb
index e9f19ca8140..e15bcf298ac 100644
--- a/meta/recipes-support/gnupg/gnupg_2.2.4.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.2.4.bb
@@ -44,3 +44,5 @@ do_install_append() {
 PACKAGECONFIG ??= "gnutls"
 PACKAGECONFIG[gnutls] = "--enable-gnutls, --disable-gnutls, gnutls"
 PACKAGECONFIG[sqlite3] = "--enable-sqlite, --disable-sqlite, sqlite3"
+
+BBCLASSEXTEND = "native"
diff --git a/meta/recipes-support/libksba/libksba_1.3.5.bb b/meta/recipes-support/libksba/libksba_1.3.5.bb
index 36b66705634..a7ea53fed02 100644
--- a/meta/recipes-support/libksba/libksba_1.3.5.bb
+++ b/meta/recipes-support/libksba/libksba_1.3.5.bb
@@ -24,3 +24,5 @@ do_configure_prepend () {
 	# Else these could be used in preference to those in aclocal-copy
 	rm -f ${S}/m4/gpg-error.m4
 }
+
+BBCLASSEXTEND = "native"
diff --git a/meta/recipes-support/npth/npth_1.5.bb b/meta/recipes-support/npth/npth_1.5.bb
index 54de70c5c08..e7db6ae1b4b 100644
--- a/meta/recipes-support/npth/npth_1.5.bb
+++ b/meta/recipes-support/npth/npth_1.5.bb
@@ -19,3 +19,5 @@ inherit autotools binconfig-disabled
 
 FILES_${PN} = "${libdir}/libnpth.so.*"
 FILES_${PN}-dev += "${bindir}/npth-config"
+
+BBCLASSEXTEND = "native"
diff --git a/meta/recipes-support/pinentry/pinentry_1.1.0.bb b/meta/recipes-support/pinentry/pinentry_1.1.0.bb
index 3b77709ffb5..1eaa261f75a 100644
--- a/meta/recipes-support/pinentry/pinentry_1.1.0.bb
+++ b/meta/recipes-support/pinentry/pinentry_1.1.0.bb
@@ -34,3 +34,5 @@ PACKAGECONFIG[gtk2] = "--enable-pinentry-gtk2, --disable-pinentry-gtk2, gtk+ gli
 
 #To use libsecret, add meta-gnome
 PACKAGECONFIG[secret] = "--enable-libsecret, --disable-libsecret, libsecret"
+
+BBCLASSEXTEND = "native"
-- 
2.15.1


