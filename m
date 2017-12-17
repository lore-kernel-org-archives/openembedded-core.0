Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8E141781CE
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Dec 2017 16:34:47 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id n13so3355256plp.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Dec 2017 08:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=4+rRMLcQGxOwI+laSHk+PDzMeZuTWgBeTh2j9p4fCu0=;
	b=A04PMXqWs/P3tT3qz9HK19xpXqdDPia56n/OTENGEF2VcFUD5hn/PhyNA9QswofXYE
	t/I156oBHL9n27OfqvMRQ1CjnVk5TxQ7D/xWmDF+a0BYBRvp9GswROyCwHpdQbT26BTE
	lDrdqfuQE6o6Gr9iVBzCt2rCfu0QGCWmbP5uR/+Dbc3ycsLlrzQDf7RQOIMyIqLXjWF1
	GN5FgKkB8BnXiflZNzDEPhlq5qjNVUbeql7xUEsl8KA0QR0ferX2txDTm7TcbhEwhjkG
	T9xuugJljaBWF2lNXlNMGB0abrBNZmEI6raUyN8z/lQELzqm/mSN2fONnhPMiisCqy3Y
	E8Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=4+rRMLcQGxOwI+laSHk+PDzMeZuTWgBeTh2j9p4fCu0=;
	b=P7s1OAzqwwN7UhGUloff0aJ3idRvOr5LS5QMjYEcWiAbnNfw6hwq4yq7Lu0tZF9f/W
	+xmVaoPYZD+SpWoc8E2VwI6xS9F+qGtbCdl0z+BVlMdPtbkl2jB9WI+DQGdszNhICO3/
	vbiG4iq8WOJHU/uJqbKIFe8rnbM/yoqJAxWjniOVt+nHQ6kfECzk5VbJNk4TdfngR0Bc
	DhB55tgd4gkWqZr1WlFtTyniKIehbL65eNXX2vG4MTyRiiCDioV2uqpdZQ2n6oToNCQp
	sxeDBDh3T64kotuwsAeHHB1aa5W+ADt7732wtXNMp5MJMOryKTqUdTby6shRzd1RFRsA
	uYjA==
X-Gm-Message-State: AKGB3mKEnxqZYnVq5qkhhFpM6ckYqFy5K733l7Q3HwoAZHRmThDKp9bM
	JUfe4OYp30A8Yo7vJXcpvLA=
X-Google-Smtp-Source: ACJfBot1YvIjvL+7okFneVnYLLAodUWNMCsAAvpwPdkwFCgZ5/8clBA3HJmLL7ugPH/pSDWj51NSzQ==
X-Received: by 10.84.168.198 with SMTP id f64mr19972641plb.324.1513528488843; 
	Sun, 17 Dec 2017 08:34:48 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:35e6:5321:54f2:87e6])
	by smtp.gmail.com with ESMTPSA id
	t202sm18393035pgb.75.2017.12.17.08.34.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Dec 2017 08:34:48 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Sun, 17 Dec 2017 08:34:37 -0800
Message-Id: <1f6d1fa417f9a7128168b0ad934f4ae75a8198e3.1513527416.git.akuster@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1513527416.git.akuster@mvista.com>
References: <cover.1513527416.git.akuster@mvista.com>
Subject: [PATCH 8/8] bind: Update to 9.11.2
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
X-List-Received-Date: Sun, 17 Dec 2017 16:34:47 -0000

From: Armin Kuster <akuster@mvista.com>

New License (mpl-2.0) and LICESE file.

New features in bind 9.11
see: https://www.isc.org/wp-content/uploads/2016/09/BIND9.11NewFeatures.pdf

add zlib PACKAGECONF

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-connectivity/bind/bind/dont-test-on-host.patch | 13 ++++++++-----
 .../bind/{bind_9.10.6.bb => bind_9.11.2.bb}                 | 10 +++++-----
 2 files changed, 13 insertions(+), 10 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.10.6.bb => bind_9.11.2.bb} (92%)

diff --git a/meta/recipes-connectivity/bind/bind/dont-test-on-host.patch b/meta/recipes-connectivity/bind/bind/dont-test-on-host.patch
index b02ecb1..7fbd1f5 100644
--- a/meta/recipes-connectivity/bind/bind/dont-test-on-host.patch
+++ b/meta/recipes-connectivity/bind/bind/dont-test-on-host.patch
@@ -2,16 +2,19 @@ Upstream-Status: Pending
 
 Signed-off-by: Saul Wold <sgw@linux.intel.com>
 
-Index: bind-9.9.5/bin/Makefile.in
+refactored for 9.11
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+Index: bind-9.11.2/bin/Makefile.in
 ===================================================================
---- bind-9.9.5.orig/bin/Makefile.in
-+++ bind-9.9.5/bin/Makefile.in
-@@ -19,7 +19,7 @@ srcdir =	@srcdir@
+--- bind-9.11.2.orig/bin/Makefile.in
++++ bind-9.11.2/bin/Makefile.in
+@@ -10,7 +10,7 @@ srcdir =	@srcdir@
  VPATH =		@srcdir@
  top_srcdir =	@top_srcdir@
  
 -SUBDIRS =	named rndc dig delv dnssec tools tests nsupdate \
 +SUBDIRS =	named rndc dig delv dnssec tools nsupdate \
- 		check confgen @PYTHON_TOOLS@ @PKCS11_TOOLS@
+ 		check confgen @NZD_TOOLS@ @PYTHON_TOOLS@ @PKCS11_TOOLS@
  TARGETS =
  
diff --git a/meta/recipes-connectivity/bind/bind_9.10.6.bb b/meta/recipes-connectivity/bind/bind_9.11.2.bb
similarity index 92%
rename from meta/recipes-connectivity/bind/bind_9.10.6.bb
rename to meta/recipes-connectivity/bind/bind_9.11.2.bb
index 8b8835b..0bbc4df 100644
--- a/meta/recipes-connectivity/bind/bind_9.10.6.bb
+++ b/meta/recipes-connectivity/bind/bind_9.11.2.bb
@@ -2,8 +2,8 @@ SUMMARY = "ISC Internet Domain Name Server"
 HOMEPAGE = "http://www.isc.org/sw/bind/"
 SECTION = "console/network"
 
-LICENSE = "ISC & BSD"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=dba46507446198119bcde32a4feaab43"
+LICENSE = "ISC & MPL-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f27a50d2e878867827842f2c60e30bfc"
 
 DEPENDS = "openssl libcap"
 
@@ -23,8 +23,8 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://use-python3-and-fix-install-lib-path.patch \
            "
 
-SRC_URI[md5sum] = "84e663284b17aee0df1ce6f248b137d7"
-SRC_URI[sha256sum] = "17bbcd2bd7b1d32f5ba4b30d5dbe8a39bce200079048073d1e0d050fdf47e69d"
+SRC_URI[md5sum] = "efca7e5a63a07efba264da9be2fbb57f"
+SRC_URI[sha256sum] = "7f46ad8620f7c3b0ac375d7a5211b15677708fda84ce25d7aeb7222fe2e3c77a"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>9(\.\d+)+(-P\d+)*)/"
@@ -48,6 +48,7 @@ PACKAGECONFIG[httpstats] = "--with-libxml2,--without-libxml2,libxml2"
 PACKAGECONFIG[readline] = "--with-readline=-lreadline,,readline"
 PACKAGECONFIG[libedit] = "--with-readline=-ledit,,libedit"
 PACKAGECONFIG[urandom] = "--with-randomdev=/dev/urandom,--with-randomdev=/dev/random,,"
+PACKAGECONFIG[zlib] = "--with-zlib=${STAGING_LIBDIR}/.., --without-zlib, zlib, zlib"
 
 USERADD_PACKAGES = "${PN}"
 USERADD_PARAM_${PN} = "--system --home ${localstatedir}/cache/bind --no-create-home \
@@ -88,7 +89,6 @@ do_install_append() {
 	install -d "${D}${sysconfdir}/init.d"
 	install -m 644 ${S}/conf/* "${D}${sysconfdir}/bind/"
 	install -m 755 "${S}/init.d" "${D}${sysconfdir}/init.d/bind"
-	sed -i -e '1s,#!.*python3,#! /usr/bin/python3,' ${D}${sbindir}/dnssec-coverage ${D}${sbindir}/dnssec-checkds
 
 	# Install systemd related files
 	install -d ${D}${sbindir}
-- 
2.7.4


