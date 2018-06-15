Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f50.google.com (mail-pg0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 7D72574C04
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2018 18:47:15 +0000 (UTC)
Received: by mail-pg0-f50.google.com with SMTP id a14-v6so4795185pgw.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2018 11:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=QYRa9A6iTt4i9lR/fD8guVQelXN6fsL6oD/s1MeT3/4=;
	b=Z+kyzyWEldHur5kTgXfC/JSDpDM8vF6ZiCteUMPXJisNy7PciBJDnYXw87WYeqU/i+
	Y29FdeVzFA2Ma/GUuNDCZOq5mVbClxekPKlc5OWBSUIjcEvUgp1QPZheVzeGGDcMHTjg
	P121AtOwMcylmUXS+S1mxA3OKQ1kdqpH9s8zyO/Qn5t4nKu3AC3te00TUMz6cLGI/uD7
	8jlyYtYELYHepyxTaheG+PWmzYCNSJK7sbvUUM4k6dTGo800aJIfQDOjC8z50Vc/Sw1i
	k1dEdgOESF4FbVuqnwIyG8GIANnTLaFtkWlYHbJjQc6Nyi4/t7PrjMTEwzYMSUNK/fkr
	kc5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=QYRa9A6iTt4i9lR/fD8guVQelXN6fsL6oD/s1MeT3/4=;
	b=b6pr3qQzPoR8XakCAr4I4S8XQMeQh/3S6UTPGnoZYM4eqMk5ZFOgjS20mp3iEgSRsl
	owAG/daUz4z7mCl1/U+Ac+wGBDSk1ue8SCmU1pHCKQwMjQ79xizp7zSAiZO42cs1nizo
	EJjA5cTQP9dBCuhJnX8QsZ1kX7/givjvD86mbpmBMwGeO/cIITDKomvjWLoHatG+KFGp
	rwTuj1mpfIIKD1+AHIpWmbkYN+jv1ecUs0WY5VKuDs9o/LWi0t2lZPfwqAG93TDfBwds
	n/quO8ZGLGN+5EjvHquKvwAZsk/C6Eg+4AOYCgMxSADxRPYHoN+nyc1MqSXfSAW5FYhS
	DbUg==
X-Gm-Message-State: APt69E2PBGv02thd3Se/wnvtHxXrGOjqpGFDalE/DdTJ2ZjhlOcknLUm
	wOsHzpKmEfqAQOs8a5Af0OY4SA==
X-Google-Smtp-Source: ADUXVKJoRTEQQR8BTliE5LqFJbm6z4Hbo+qNs7wZcctAiURSyqb5EB5W06rI/UkyheBkuqjfte38vw==
X-Received: by 2002:a62:1c43:: with SMTP id
	c64-v6mr3171404pfc.176.1529088436392; 
	Fri, 15 Jun 2018 11:47:16 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	s19-v6sm14993590pfe.97.2018.06.15.11.47.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 15 Jun 2018 11:47:15 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jun 2018 11:47:09 -0700
Message-Id: <1529088429-1667-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] rsync: merge rsync.inc into the rsync recipe
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
X-List-Received-Date: Fri, 15 Jun 2018 18:47:15 -0000

There's only one user of rsync.inc (meta-gplv2 has its own copy), so
merge the .inc file into the rsync recipe.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-devtools/rsync/rsync.inc      | 20 --------------------
 meta/recipes-devtools/rsync/rsync_3.1.3.bb | 28 +++++++++++++++++++++++-----
 2 files changed, 23 insertions(+), 25 deletions(-)
 delete mode 100644 meta/recipes-devtools/rsync/rsync.inc

diff --git a/meta/recipes-devtools/rsync/rsync.inc b/meta/recipes-devtools/rsync/rsync.inc
deleted file mode 100644
index 26c023a..0000000
--- a/meta/recipes-devtools/rsync/rsync.inc
+++ /dev/null
@@ -1,20 +0,0 @@
-SUMMARY = "File synchronization tool"
-HOMEPAGE = "http://rsync.samba.org/"
-BUGTRACKER = "http://rsync.samba.org/bugzilla.html"
-SECTION = "console/network"
-
-DEPENDS = "popt"
-
-SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
-           file://rsyncd.conf"
-
-inherit autotools
-
-do_install_append() {
-	install -d ${D}${sysconfdir}
-	install -m 0644 ${WORKDIR}/rsyncd.conf ${D}${sysconfdir}
-}
-
-EXTRA_OEMAKE='STRIP=""'
-
-PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
diff --git a/meta/recipes-devtools/rsync/rsync_3.1.3.bb b/meta/recipes-devtools/rsync/rsync_3.1.3.bb
index 84a0258..29cb231 100644
--- a/meta/recipes-devtools/rsync/rsync_3.1.3.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.1.3.bb
@@ -1,24 +1,37 @@
-require rsync.inc
+SUMMARY = "File synchronization tool"
+HOMEPAGE = "http://rsync.samba.org/"
+BUGTRACKER = "http://rsync.samba.org/bugzilla.html"
+SECTION = "console/network"
+# GPLv2+ (<< 3.0.0), GPLv3+ (>= 3.0.0)
+LICENSE = "GPLv3+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI += "file://makefile-no-rebuild.patch"
+DEPENDS = "popt"
+
+SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
+           file://rsyncd.conf \
+           file://makefile-no-rebuild.patch \
+"
 
 SRC_URI[md5sum] = "1581a588fde9d89f6bc6201e8129afaf"
 SRC_URI[sha256sum] = "55cc554efec5fdaad70de921cd5a5eeb6c29a95524c715f3bbf849235b0800c0"
 
-# GPLv2+ (<< 3.0.0), GPLv3+ (>= 3.0.0)
-LICENSE = "GPLv3+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+inherit autotools
 
 PACKAGECONFIG ??= "acl attr \
     ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
 "
+
 PACKAGECONFIG[acl] = "--enable-acl-support,--disable-acl-support,acl,"
 PACKAGECONFIG[attr] = "--enable-xattr-support,--disable-xattr-support,attr,"
+PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 
 # By default, if crosscompiling, rsync disables a number of
 # capabilities, hardlinking symlinks and special files (i.e. devices)
 CACHED_CONFIGUREVARS += "rsync_cv_can_hardlink_special=yes rsync_cv_can_hardlink_symlink=yes"
 
+EXTRA_OEMAKE = 'STRIP=""'
+
 # rsync 3.0 uses configure.sh instead of configure, and
 # makefile checks the existence of configure.sh
 do_configure_prepend () {
@@ -29,4 +42,9 @@ do_configure_append () {
 	cp -f ${S}/configure ${S}/configure.sh
 }
 
+do_install_append() {
+	install -d ${D}${sysconfdir}
+	install -m 0644 ${WORKDIR}/rsyncd.conf ${D}${sysconfdir}
+}
+
 BBCLASSEXTEND = "native"
-- 
1.9.1


