Received: from mail-da0-f48.google.com ([209.85.210.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@bigsur.com>) id 1Tl8Tf-0002N7-Pk
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Dec 2012 02:29:44 +0100
Received: by mail-da0-f48.google.com with SMTP id k18so630614dae.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2012 17:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bigsur.com; s=bigsur.com;
	h=x-received:sender:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=8dZZ2y9q2RTEwDz/SKDf2Lv41a8PeSB8nv+JWhCuOVk=;
	b=TSNbKmrVfKORerFl5THEnz5EGFgl8J7mOi3e84qYyp6zHk7K8iEYQkzevCS4jJ8B7A
	tYAxkxy5Hu0s2crmqmRz4uztRqz2FmlnSiYPF7b3DS+S67FDUA42z8Q4uJ6WezXipNK8
	P7/vEsQXlZXBe8mzxj203Ucwi6xvwVzNltz3s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:sender:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references:x-gm-message-state;
	bh=8dZZ2y9q2RTEwDz/SKDf2Lv41a8PeSB8nv+JWhCuOVk=;
	b=a9tpSfwmIQ4Tn9VG+wberrxcXweY73a/jtCsZWZxWi4QJfPhB6uQLlNkimY0i7kyUd
	ItAYA5Yv76kmjSWZNQyqQ+PpAMcBDf+WGGkwCuO+gwHEboZB4MNUmfioNfei4SUYO/Mm
	pISM6hoAd24ESwxf+VcKeU7x9eDhA27FYp3Szt2iwf75+ubvRCW1IPobudzOD/iSQNzM
	OLfo2F/rwwcHRKw2IsvH6qyWyfzxbGuKUMssvIf6bsuvzI320rii/5rtmZTvxm2qx6zz
	e7WVL7gKKyf2xH8uXSHP5XWYPm5Ti85hnyFD9aUgmukOvmt3xod3JeL21UrYPgKzX34E
	fApA==
X-Received: by 10.68.238.8 with SMTP id vg8mr12821969pbc.26.1355879700696;
	Tue, 18 Dec 2012 17:15:00 -0800 (PST)
Received: from localhost (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id i5sm2356157pax.13.2012.12.18.17.14.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Dec 2012 17:14:59 -0800 (PST)
Sender: Saul Wold <sgw@bigsur.com>
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Dec 2012 17:14:28 -0800
Message-Id: <1355879668-22733-2-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1355879668-22733-1-git-send-email-sgw@linux.intel.com>
References: <1355879668-22733-1-git-send-email-sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQk9NRcD3ObEs6qosoKkzel5FVizvetxvAcPhiUNJOq/RAkmITwwwrJYCXZ7CMHfaUf7NQ0D
Subject: [PATCH 2/2] icu: reduce what's needed for cross tools
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Dec 2012 01:29:44 -0000

The ICU Update copied to complete source tree over, it only
needed a couple of binaries and libraries, so only copy those.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/icu/icu.inc |   16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-support/icu/icu.inc b/meta/recipes-support/icu/icu.inc
index f7257d1..1329635 100644
--- a/meta/recipes-support/icu/icu.inc
+++ b/meta/recipes-support/icu/icu.inc
@@ -7,7 +7,7 @@ DEPENDS = "icu-native"
 DEPENDS_class-native = ""
 
 S = "${WORKDIR}/icu/source"
-STAGING_ICU_SOURCE_DIR_NATIVE = "${STAGING_DATADIR_NATIVE}/icu"
+STAGING_ICU_DIR_NATIVE = "${STAGING_DATADIR_NATIVE}/${BPN}/${PV}"
 
 PARALLEL_MAKE = ""
 FULL_OPTIMIZATION_arm = "-Os"
@@ -17,7 +17,7 @@ inherit autotools pkgconfig binconfig
 # ICU needs the native build directory as an argument to its --with-cross-build option when
 # cross-compiling. Taken the situation that different builds may share a common sstate-cache
 # into consideration, the native build directory needs to be staged.
-EXTRA_OECONF = "--with-cross-build=${STAGING_DATADIR_NATIVE}/icu/source"
+EXTRA_OECONF = "--with-cross-build=${STAGING_ICU_DIR_NATIVE}"
 EXTRA_OECONF_class-native = ""
 
 # ICU puts custom m4 autoconf functions in aclocal.m4.
@@ -29,11 +29,13 @@ do_configure_prepend() {
     [ -f acinclude.m4 ] || cp aclocal.m4 acinclude.m4
 }
 
-do_install_append() {
-    if [ ${PN} == 'icu-native' ]; then
-	mkdir -p ${D}/${STAGING_ICU_SOURCE_DIR_NATIVE}
-	cp -r ${S} ${D}/${STAGING_ICU_SOURCE_DIR_NATIVE}
-    fi
+do_install_append_class-native() {
+	mkdir -p ${D}/${STAGING_ICU_DIR_NATIVE}/config
+	cp -r ${S}/config/icucross.mk ${D}/${STAGING_ICU_DIR_NATIVE}/config
+	cp -r ${S}/lib ${D}/${STAGING_ICU_DIR_NATIVE}
+	cp -r ${S}/bin ${D}/${STAGING_ICU_DIR_NATIVE}
+	cp -r ${S}/tools ${D}/${STAGING_ICU_DIR_NATIVE}
+
 }
 
 PACKAGES =+ "libicudata libicuuc libicui18n libicule libiculx libicutu libicuio"
-- 
1.7.9.5



