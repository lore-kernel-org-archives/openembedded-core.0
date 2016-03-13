Return-Path: <pespin.shar@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1394973192
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 19:14:54 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id p65so11585404wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 12:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=CpbLgHmtNoJSbmBncULb32cPZ9xvAtWOaF0Ibn2V8Fo=;
	b=R3kGEb7498eVtxen0w9lJ9seTqW9Id/tevfLS7+/He15vA2CrKPHPkx9sZXfudh/ZC
	v1Sqjh3HlKeeAr9B/yh6xK3+GJ9NwA1E4OcZ/DK/aCFgmw81VEN4sEYNVXf9t1JMgmnc
	NMgI0duC0hwCH7Ys/UTo0odVtW3V/M1F7bhq34v2SckzvnwmpK7Tl2F9uqeW2CgUgrcF
	21zlL7IZGCg/cmEGe4OzXDvwmEoGKSk/+Rn3mxEBXhgdFwK8VnFqt5zWBOA082gf1sqk
	GgGVPgrABKy2bIhxhRdyWb4UjCwls4nXq8mmN6tH97sDYUVpWxUNE5bbukkJ4UGU0ZG+
	Q76Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=CpbLgHmtNoJSbmBncULb32cPZ9xvAtWOaF0Ibn2V8Fo=;
	b=V+//B82J5Ezmoezsa88oijNMfqfBLC8Se2vcPUwzE2JhDr8tYZ3tLPjIa40Sn1Rcdf
	5CuxX19Wu67o2kwCrhM4rZxC9lVoxNB4bYDuVIJkoHHBCbo9FgAEPHr1D/C5dwwNTbOD
	YElH87rAK03Dhrx1AoheG8Ya/YHrlLvG5BLMM0Moq6SsuKS3Ho/5Rjdny7aDYVT29PfC
	jE9/wWjZLyw6QlhCRHwUTkmjykRTzbAEYHCPs/c8I4WLCVsuuuoHXQgBxaB2+pWzfrrs
	r3+voxfWR6YT75WRDrZyqvZq38U+a6VGKw/h8OXeXRP2gdvXcRuTpo44SRHu3cA5mHLZ
	wapg==
X-Gm-Message-State: AD7BkJI2jYHxpoPG/d7NhB/S96mw6oYh06i3CS8raCo2i7gZHFKIUzaOD6QGuQG+qVGREg==
X-Received: by 10.28.138.149 with SMTP id m143mr14776821wmd.94.1457896494609; 
	Sun, 13 Mar 2016 12:14:54 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1811:c1f:3300:9248:9aff:fe94:7ff1])
	by smtp.gmail.com with ESMTPSA id
	n66sm12851410wmg.20.2016.03.13.12.14.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 13 Mar 2016 12:14:53 -0700 (PDT)
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 13 Mar 2016 20:13:14 +0100
Message-Id: <8097b27ab27965fe25ea779b2d588f7d3ac5be1a.1457896224.git.pespin.shar@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
Subject: [PATCH 16/42] glibc-package: Fix usage of systemd unitdir vars
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
X-List-Received-Date: Sun, 13 Mar 2016 19:14:54 -0000

Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
---
 meta/recipes-core/glibc/glibc-package.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index bad6424..e2644a9 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -49,7 +49,7 @@ FILES_libsotruss = "${libdir}/audit/sotruss-lib.so"
 FILES_SOLIBSDEV = "${libdir}/lib*${SOLIBSDEV}"
 FILES_${PN}-dev += "${bindir}/rpcgen ${libdir}/*_nonshared.a ${base_libdir}/*_nonshared.a ${base_libdir}/*.o ${datadir}/aclocal"
 FILES_${PN}-staticdev += "${libdir}/*.a ${base_libdir}/*.a"
-FILES_nscd = "${sbindir}/nscd* ${sysconfdir}/init.d/nscd ${systemd_unitdir}/system/nscd* ${sysconfdir}/tmpfiles.d/nscd.conf \
+FILES_nscd = "${sbindir}/nscd* ${sysconfdir}/init.d/nscd ${systemd_system_unitdir}/nscd* ${sysconfdir}/tmpfiles.d/nscd.conf \
               ${sysconfdir}/nscd.conf ${sysconfdir}/default/volatiles/98_nscd ${localstatedir}/db/nscd"
 FILES_${PN}-mtrace = "${bindir}/mtrace"
 FILES_tzcode = "${bindir}/tzselect ${sbindir}/zic ${sbindir}/zdump"
@@ -117,8 +117,8 @@ do_install_append () {
 	install -m 0755 ${S}/nscd/nscd.conf ${D}${sysconfdir}/nscd.conf
 	sed -i "s%daemon%start-stop-daemon --start --exec%g" ${D}${sysconfdir}/init.d/nscd
 
-	install -d ${D}${systemd_unitdir}/system
-	install -m 0644 ${S}/nscd/nscd.service ${D}${systemd_unitdir}/system/
+	install -d ${D}${systemd_system_unitdir}
+	install -m 0644 ${S}/nscd/nscd.service ${D}${systemd_system_unitdir}/
 
 	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
 		install -d ${D}${sysconfdir}/tmpfiles.d
-- 
2.7.1


