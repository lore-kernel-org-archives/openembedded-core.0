Return-Path: <maxime.roussinbelanger@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9F4917BD97
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2019 04:14:26 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id c21so11984894qtj.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2019 21:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=mQkFuGiDWfAgutHWL63FKK9nd3H3mczSE3OiFCqtqL0=;
	b=VN/ayOeLACJ6qv0RA1GZNAYobKZGU8zmy3BBe7dn8azOruvBE3i5PTL9ZUyD70k9mM
	+6GayHE7ceWzqa6jF1nNaZGNKLQZSP2w6f2cukSPqrJZ9BYmwUeq3JeHhqfDHb7CIEgQ
	YPIIn4jFmGSgzxFAYt3q8fFvfeo51FT3TsJU8jQVPD7tPrSp4Qfp6v+7Hel4gstT/szb
	s7iryM1MUQonOGmTWRwNGTBVKeChGAd2Rrqm/ZdI7euky4cl/z9NYVBoCwKJuG/iIXbo
	G4oNbC16Rq18ae0k2nhS/ZMzql4VeIEBd+jAeTXTErfOPC3m1KNf+rxIfgQzCclJl6Sy
	Rkww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=mQkFuGiDWfAgutHWL63FKK9nd3H3mczSE3OiFCqtqL0=;
	b=pKg3O2fsojhiwXhsH/hd+6U+yQ3now4PZFrr5l0skbisD+yYYjfQ+DLsccOXMf1zCt
	26YPNhPXPspHRNSavConJtQLGMog5Te7Ax207LTBztmU35w9CD6Ms2FhxDftvO4qNYXl
	T8oOHiCFvkM1f8fqdNRa8SH/PXf6Gtnwpg3LyB0/UnBjD2Jd46NwMolBwHd7dMp7jBg0
	eAsDavS3FJahs92LXll5FC8TW8ZqC9KAu12HhEhcMZm5+xAmcZWOsRialu0MKc6B8zSB
	aychcCNOVZMnk57z4BCNBbsgHH5kif85FBrd4IWcVkt9vvBc8VUTN2AJ9HW7GDDSn8iQ
	5GfQ==
X-Gm-Message-State: APjAAAWLqHbmVpgDVoMXIyxT1lRNjaRl+UQdK6DOUGWTd4Qa1aPkzVW1
	z2siIWGDcJ6MFomLw2VV4CJ8gRqwpsU=
X-Google-Smtp-Source: APXvYqzID+tYrl/hDwU01lTb33H2G5OGKPeRaRfSW8TvdPc7MZdnXzIfHJwA1piJQgTgKGjyn0RAyQ==
X-Received: by 2002:ac8:7289:: with SMTP id v9mr14432850qto.155.1570767267126; 
	Thu, 10 Oct 2019 21:14:27 -0700 (PDT)
Received: from mbedesk.Sonatest.net
	(ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca.
	[174.94.156.236]) by smtp.gmail.com with ESMTPSA id
	q64sm4045287qkb.32.2019.10.10.21.14.26
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 10 Oct 2019 21:14:26 -0700 (PDT)
From: =?UTF-8?q?Maxime=20Roussin-B=C3=A9langer?=
	<maxime.roussinbelanger@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Oct 2019 00:13:58 -0400
Message-Id: <20191011041359.5933-1-maxime.roussinbelanger@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/2] shadow: update homepage and bugtracker
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
X-List-Received-Date: Fri, 11 Oct 2019 04:14:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The previous homepage and issue tracker is no longer available.

Remove some trailing whitespace

Signed-off-by: Maxime Roussin-Bélanger <maxime.roussinbelanger@gmail.com>
---
 meta/recipes-extended/shadow/shadow-sysroot_4.6.bb | 6 +++---
 meta/recipes-extended/shadow/shadow.inc            | 8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb b/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb
index ef014628f6..79fc8b80b5 100644
--- a/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb
+++ b/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Shadow utils requirements for useradd.bbclass"
-HOMEPAGE = "http://pkg-shadow.alioth.debian.org"
-BUGTRACKER = "https://alioth.debian.org/tracker/?group_id=30580"
+HOMEPAGE = "http://github.com/shadow-maint/shadow"
+BUGTRACKER = "http://github.com/shadow-maint/shadow/issues"
 SECTION = "base utils"
 LICENSE = "BSD | Artistic-1.0"
 LIC_FILES_CHKSUM = "file://login.defs_shadow-sysroot;md5=25e2f2de4dfc8f966ac5cdfce45cd7d5"
@@ -27,6 +27,6 @@ do_install() {
 SYSROOT_DIRS += "${sysconfdir}"
 
 # don't create any packages
-# otherwise: dbus-dev depends on shadow-sysroot-dev which depends on shadow-sysroot 
+# otherwise: dbus-dev depends on shadow-sysroot-dev which depends on shadow-sysroot
 # and this has another copy of /etc/login.defs already provided by shadow
 PACKAGES = ""
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index af38b911df..770c239e96 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -1,6 +1,6 @@
 SUMMARY = "Tools to change and administer password and group data"
-HOMEPAGE = "http://pkg-shadow.alioth.debian.org"
-BUGTRACKER = "https://alioth.debian.org/tracker/?group_id=30580"
+HOMEPAGE = "http://github.com/shadow-maint/shadow"
+BUGTRACKER = "http://github.com/shadow-maint/shadow/issues"
 SECTION = "base/utils"
 LICENSE = "BSD | Artistic-1.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ed80ff1c2b40843cf5768e5229cf16e5 \
@@ -59,7 +59,7 @@ NSCDOPT = ""
 NSCDOPT_class-native = "--without-nscd"
 NSCDOPT_class-nativesdk = "--without-nscd"
 NSCDOPT_libc-glibc = "--with-nscd"
-          
+
 PAM_PLUGINS = "libpam-runtime \
                pam-plugin-faildelay \
                pam-plugin-securetty \
@@ -136,7 +136,7 @@ do_install_append() {
 		sed -i -f ${WORKDIR}/login_defs_pam.sed ${D}${sysconfdir}/login.defs
 	fi
 
-	install -d ${D}${sbindir} ${D}${base_sbindir} ${D}${base_bindir} 
+	install -d ${D}${sbindir} ${D}${base_sbindir} ${D}${base_bindir}
 
 	# Move binaries to the locations we want
 	rm ${D}${sbindir}/vigr
-- 
2.20.1


