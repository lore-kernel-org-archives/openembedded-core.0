Return-Path: <pespin.shar@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id E5C7173195
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 19:15:22 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id l68so11566987wml.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 12:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=Xrt/7r8VEzkVbW+hikDaHxGxEZFV9mii4q2eP2efM5o=;
	b=ZbcNCsWXx2bgUh3JL+/Hr+A6T+xxFyG/p4lNs4kQM0H0pv1tqE4uo+nNbpnK4bAq2l
	3H2gEFzXYcXQCyyQKYyGbcMy8ZkJpWGtROeRGM6Uip0/+vHmrgsCqHPzsuaBFc/6++2X
	xhyStkJ0vUrakjFO2lbiGqtZwbOeKqDAAPwwr/8xe097E58MDFKBc7ZDwP7UMiFVCcVI
	ndUwkj2GiwqX8xcowoCge/fa962lf6SP+PrA1k4u6ig/XGv/PC+gYYEkZT7innva36qi
	6FZbWphwYEp3uOreHqXHZjXSqtfzCZBeewl76fMho4AXncjB/MCkPAgDsPXuC5qN5/2G
	HT+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=Xrt/7r8VEzkVbW+hikDaHxGxEZFV9mii4q2eP2efM5o=;
	b=J8z0b7rCAzEQq0oqf5Jsl/RgDhfnoR/Gobt+PHNvpwsjz+wgkXSSLXdLvHbd5IQ/5C
	iBkzY7Vnyl9K+3m2Nst9j0bp1IHFeAnD4Nd9ffuIahD4jd4+X2PqUk+nwESwXky3UZA1
	G/CKGz9aNqEajGW9UBQHDwZCufHAvumee/I4+P0Diahhw1dhMBOv5hq3aL+5ZmVyXSc8
	vTeF7BZdZcmmOwyzw+PMaw6aIlqLtu/5Ii1I4Pfxih5pW8KL79o5eDwxCW2W+L+k9p/x
	fBtpPJjSID5KTX4INUXZWkp65Dbhv3KJLKhOd/RPn8Wwfb0CPL2aTKOHuhb6Dx971p4u
	7Z7g==
X-Gm-Message-State: AD7BkJKYrXQIYJbQFms33z6QOuC2LYaH5m4mzLJAkPkocGzqmykth6/MGof7yzjEiGvRSg==
X-Received: by 10.194.5.194 with SMTP id u2mr20660277wju.139.1457896523558;
	Sun, 13 Mar 2016 12:15:23 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1811:c1f:3300:9248:9aff:fe94:7ff1])
	by smtp.gmail.com with ESMTPSA id
	n66sm12851410wmg.20.2016.03.13.12.15.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 13 Mar 2016 12:15:22 -0700 (PDT)
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 13 Mar 2016 20:13:36 +0100
Message-Id: <45da47270071e1db68f883e633461a12a3cefc97.1457896224.git.pespin.shar@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
Subject: [PATCH 38/42] opkg: Fix usage of systemd unitdir vars
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
X-List-Received-Date: Sun, 13 Mar 2016 19:15:23 -0000

* SYSTEMD_UNITDIR var is not present in the file, it can be safely removed

Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
---
 meta/recipes-devtools/opkg/opkg_0.3.1.bb | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/opkg/opkg_0.3.1.bb b/meta/recipes-devtools/opkg/opkg_0.3.1.bb
index 577f495..f1bc8ae 100644
--- a/meta/recipes-devtools/opkg/opkg_0.3.1.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.3.1.bb
@@ -48,13 +48,12 @@ do_install_append () {
 	install -d ${D}${OPKGLIBDIR}/opkg
 
 	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)};then
-		install -d ${D}${systemd_unitdir}/system
-		install -m 0644 ${WORKDIR}/opkg-configure.service ${D}${systemd_unitdir}/system/
+		install -d ${D}${systemd_system_unitdir}
+		install -m 0644 ${WORKDIR}/opkg-configure.service ${D}${systemd_system_unitdir}/
 		sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
 			-e 's,@SYSCONFDIR@,${sysconfdir},g' \
 			-e 's,@BINDIR@,${bindir},g' \
-			-e 's,@SYSTEMD_UNITDIR@,${systemd_unitdir},g' \
-			${D}${systemd_unitdir}/system/opkg-configure.service
+			${D}${systemd_system_unitdir}/opkg-configure.service
 	fi
 }
 
@@ -68,7 +67,7 @@ RPROVIDES_${PN} = "opkg-collateral"
 PACKAGES =+ "libopkg"
 
 FILES_libopkg = "${libdir}/*.so.* ${OPKGLIBDIR}/opkg/"
-FILES_${PN} += "${systemd_unitdir}/system/"
+FILES_${PN} += "${systemd_system_unitdir}/"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.7.1


