Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84964C4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Dec 2021 13:07:17 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web08.66651.1638882436780229881
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 05:07:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PIV6I/ha;
 spf=pass (domain: gmail.com, ip: 209.85.221.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id u17so22031255wrt.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 05:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JfhsxzESHryvRAN9clwn1IhVtR6w2RhlS2sDDTmYEzM=;
        b=PIV6I/haeTmZOBb+GmW4Sft10ZvcKGGD+tUy5e/Re4gIh3mzVN4/oKGeSJyialb/Qc
         XsAHX1DXNLXNtK1lEMYfduVhvVN9ts6yLOgD/fI159PkB+g9ZSBDWCDWpB/GgFN2VADZ
         qI0etwcYOOZ6TZv10cORBK0NgLC4y0lt0g8ku1Yy42iZLd65kT3uyHPJLh2Jq2VXCYpx
         HGFS6W5L6pkmMJ8y5KcAHPlWYx7/vIoZe5Vngn3RZsddB4jWAF5B7IX2BEHwVbSXSiDb
         tzqran/I2LRTZtqYcuEZ0S+oL8/n3nZGZkR13fk2Jj8dwgZN0wRKvB/qOV1QvwtQsNd+
         P9cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JfhsxzESHryvRAN9clwn1IhVtR6w2RhlS2sDDTmYEzM=;
        b=j80otuzDin7ZZLm2l5PsTSQSbGveZR6DCbhAFPUD/RWn+uq0X9K/f1Zi5OQLzhnzJH
         WroAfM+YNHEwOfTqVBUn4er+/T7Hn38e7PX98ODcszQUSPJKOREN+OKeaxqP7H1yJzC1
         mjCFmtBap5ZjX1enKAcxXwsoJUL6D+u1swJE39JwTWObQhsJDDFmVlmBOdyGPnIYIMiw
         IOIUrZ1xgGrpRPiSYwHO8e3Uyqvojfriktr6W/s1PwFwKW3QWQvHbiH8mH2xGkGODB8T
         m89eXJocRrg5a1eqBx7uSCHAh+euo9mYmt3k4PamVBwizzeeWfS8a14mAnrKUR0yMMMq
         3JAw==
X-Gm-Message-State: AOAM533Lc/gkS04ptAE4ek41QAkeWPwGhnjhfRcl4C29/9ZGkap6xIXw
	Cac5tmkK4gYVKai7DKlTjQTEhZLxLG3Wig==
X-Google-Smtp-Source: 
 ABdhPJwxHsfiBHEzSW4wueOtR6AVNDEzOZI7p9jfD8+oRvY+jR63FBqZ3FMfeV//vFHPOuTH/EtLjg==
X-Received: by 2002:adf:f88f:: with SMTP id u15mr51896592wrp.18.1638882435374;
        Tue, 07 Dec 2021 05:07:15 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 n4sm16592468wri.41.2021.12.07.05.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 05:07:15 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 10/16] cups: update 2.3.3op2 -> 2.4.0
Date: Tue,  7 Dec 2021 14:06:57 +0100
Message-Id: <20211207130703.3196805-10-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211207130703.3196805-1-alex@linutronix.de>
References: <20211207130703.3196805-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Dec 2021 13:07:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159296

Mark no-hardcode-lib patch as upstreamable.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-extended/cups/cups.inc           |  7 +--
 .../cups/cups/libexecdir.patch                | 50 +++++++++++--------
 .../cups/{cups_2.3.3op2.bb => cups_2.4.0.bb}  |  2 +-
 3 files changed, 34 insertions(+), 25 deletions(-)
 rename meta/recipes-extended/cups/{cups_2.3.3op2.bb => cups_2.4.0.bb} (51%)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index ba9bc6c6a6..3175a91ce4 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -40,11 +40,11 @@ SYSTEMD_SERVICE:${PN} = "cups.socket cups.path cups.service cups-lpd.socket"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)} \
                    ${@bb.utils.filter('DISTRO_FEATURES', 'pam systemd', d)}"
-PACKAGECONFIG[avahi] = "--enable-avahi,--disable-avahi,avahi"
+PACKAGECONFIG[avahi] = "--with-dnssd=avahi,--with-dnsssd=no,avahi"
 PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl"
-PACKAGECONFIG[gnutls] = "--enable-gnutls,--disable-gnutls,gnutls"
+PACKAGECONFIG[gnutls] = "--with-tls=gnutls,--with-tls=no,gnutls"
 PACKAGECONFIG[pam] = "--enable-pam --with-pam-module=unix, --disable-pam, libpam"
-PACKAGECONFIG[systemd] = "--with-systemd=${systemd_system_unitdir},--disable-systemd,systemd"
+PACKAGECONFIG[systemd] = "--with-systemd=${systemd_system_unitdir},--without-systemd,systemd"
 PACKAGECONFIG[xinetd] = "--with-xinetd=${sysconfdir}/xinetd.d,--without-xinetd,xinetd"
 
 EXTRA_OECONF = " \
@@ -57,6 +57,7 @@ EXTRA_OECONF = " \
                --with-system-groups=lpadmin \
                --with-cups-group=lp \
                --with-domainsocket=/run/cups/cups.sock \
+               --with-pkgconfpath=${libdir}/pkgconfig \
                DSOFLAGS='${LDFLAGS}' \
                "
 
diff --git a/meta/recipes-extended/cups/cups/libexecdir.patch b/meta/recipes-extended/cups/cups/libexecdir.patch
index 2e15841b0d..7ccad94f0f 100644
--- a/meta/recipes-extended/cups/cups/libexecdir.patch
+++ b/meta/recipes-extended/cups/cups/libexecdir.patch
@@ -1,27 +1,35 @@
-Use $libexecdir instead of hardcoding $prefix/lib as this breaks multilib builds.
+From 1724f7bcdbcfdb445778f8a2e530c5c094c18c10 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Tue, 13 Jul 2021 12:56:30 +0100
+Subject: [PATCH] Use $libexecdir instead of hardcoding $prefix/lib as this
+ breaks multilib builds.
 
-Upstream-Status: Inappropriate
+Upstream-Status: Pending
 Signed-off-by: Ross Burton <ross.burton@arm.com>
 
+---
+ config-scripts/cups-directories.m4 | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
 diff --git a/config-scripts/cups-directories.m4 b/config-scripts/cups-directories.m4
-index 1430af3a6..6efedc604 100644
+index 2033d47..230166e 100644
 --- a/config-scripts/cups-directories.m4
 +++ b/config-scripts/cups-directories.m4
-@@ -265,7 +265,7 @@ case "$host_os_name" in
- 	*-gnu)
- 		# GNUs
- 		INSTALL_SYSV="install-sysv"
--		CUPS_SERVERBIN="$exec_prefix/lib/cups"
-+		CUPS_SERVERBIN="$libexecdir/cups"
- 		;;
- 	*bsd* | darwin*)
- 		# *BSD and Darwin (macOS)
-@@ -275,7 +275,7 @@ case "$host_os_name" in
- 	*)
- 		# All others
- 		INSTALL_SYSV="install-sysv"
--		CUPS_SERVERBIN="$exec_prefix/lib/cups"
-+		CUPS_SERVERBIN="$libexecdir/cups"
- 		;;
- esac
- 
\ No newline at end of file
+@@ -239,7 +239,7 @@ AC_SUBST([CUPS_REQUESTS])
+ AS_CASE(["$host_os_name"], [*-gnu], [
+     # GNUs
+     INSTALL_SYSV="install-sysv"
+-    CUPS_SERVERBIN="$exec_prefix/lib/cups"
++    CUPS_SERVERBIN="$libexecdir/cups"
+ ], [*bsd* | darwin*], [
+     # *BSD and Darwin (macOS)
+     INSTALL_SYSV=""
+@@ -247,7 +247,7 @@ AS_CASE(["$host_os_name"], [*-gnu], [
+ ], [*], [
+     # All others
+     INSTALL_SYSV="install-sysv"
+-    CUPS_SERVERBIN="$exec_prefix/lib/cups"
++    CUPS_SERVERBIN="$libexecdir/cups"
+ ])
+ 
+ AC_DEFINE_UNQUOTED([CUPS_SERVERBIN], ["$CUPS_SERVERBIN"], [Location of server programs.])
diff --git a/meta/recipes-extended/cups/cups_2.3.3op2.bb b/meta/recipes-extended/cups/cups_2.4.0.bb
similarity index 51%
rename from meta/recipes-extended/cups/cups_2.3.3op2.bb
rename to meta/recipes-extended/cups/cups_2.4.0.bb
index fc2aa702f5..42be34c4f3 100644
--- a/meta/recipes-extended/cups/cups_2.3.3op2.bb
+++ b/meta/recipes-extended/cups/cups_2.4.0.bb
@@ -2,4 +2,4 @@ require cups.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "deb3575bbe79c0ae963402787f265bfcf8d804a71fc2c94318a74efec86f96df"
+SRC_URI[sha256sum] = "9abecec128ca6847c5bb2d3e3d30c87b782c0697b9acf284d16fa38f80a3a6de"
-- 
2.20.1


