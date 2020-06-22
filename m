Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web12.390.1592848790222709843
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 10:59:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=vEtoAdgv;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.43, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f43.google.com with SMTP id n5so13832450otj.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 10:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=z5Qw3leROYmV84qg8bOgjy/jQ3WPnnBjNjdG7VjgPrQ=;
        b=vEtoAdgvRX7MlyM3kMiEXPLOgd2bIFpJVo1Uwseb9fYGFiz5y6DYa4Pv1VsOKom1He
         HxexrE6vQd2c3MtA/KE7sjjfVfkdmLTc7k63zQZGTz4cjOOJYC1MhLladFMICi56Ogth
         MBbjvM9SLycgppzs3BNIZ71V9/xopiZr/FkMs04gUXz6z6YNWLWa9jwxSkZ0rjtBhnA5
         LjpaRC8rgH6enAh5BtbRQkibQBj144eWOu/5jujli+C3bz9rIwI3cHNVwjV+jtRvQHkP
         5FHJgz9F023agYIKOAF8NdVhmSHFKQwJB5VCArrXvtb2BPBWKF7Ch7iumob7Y4zzVcvr
         ghww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=z5Qw3leROYmV84qg8bOgjy/jQ3WPnnBjNjdG7VjgPrQ=;
        b=SDZhT7ye/0g7U+yhR+FfirhncogDtiKfIq3gn524zvZ+Aoc00R/pmRMz1IA2a4UHQ/
         5Fi6+luZtVNJm8Wb3vV3bVGosW5CJcdSyUOhHUfhZVvIkSMxhT1Cet4xghD5b3cPYzgJ
         yKFkhkiVfKKbXzltV0ns6On63TmaEgsprL7CL4ZzVV54JDJI+DZt7n3TO0Wvjm33Kocd
         pAcWPj8Qc6ypG5vav7nDmGzZVQUjq8RS3GRfcT43Wb/IRMJUwb1lotz5rG/Qqx4F+Xki
         w+eikz7xWo57TdpvhoVJj1pi1enntAN1xWFjJ216Or2VlBgtrU65HHvFVFKVIRStJ/x7
         c16A==
X-Gm-Message-State: AOAM531u/NMyX4+bgEkQYm3lup1z1/G1VZZ5afKH9a5djA7f4Sp8yH4Q
	JHjxf8S90jAJjuZDZU7uAPCBbmhHe/y0KQ==
X-Google-Smtp-Source: ABdhPJzrPIrJ+azaTfot3QY7cbyxezTrimqOXyOlv3a6Nf3dLMI68RcnrhO+4cvFe01vkGkAQQrHdw==
X-Received: by 2002:a9d:dc6:: with SMTP id 64mr12584369ots.319.1592848789109;
        Mon, 22 Jun 2020 10:59:49 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id n60sm3422659otn.75.2020.06.22.10.59.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 10:59:48 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/33] wpa-supplicant: remove service templates from SYSTEMD_SERVICE
Date: Mon, 22 Jun 2020 07:58:00 -1000
Message-Id: <7910a0d6f332253608767a9576a0d521dd87efd7.1592848337.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592848337.git.steve@sakoman.com>
References: <cover.1592848337.git.steve@sakoman.com>

From: Kai Kang <kai.kang@windriver.com>

Remove service templates wpa_supplicant-nl80211@.service and
wpa_supplicant-wired@.service from SYSTEMD_SERVICE that they should NOT
be started/stopped by calling 'systemctl' in postinst and prerm scripts.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fe9b8e50461ab00ab3ad8b065ebd32f0eea2a255)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../wpa-supplicant/wpa-supplicant_2.9.bb                    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
index 3e92427bb0..2936e89eed 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.9.bb
@@ -15,7 +15,7 @@ PACKAGECONFIG[openssl] = ",,openssl"
 
 inherit pkgconfig systemd
 
-SYSTEMD_SERVICE_${PN} = "wpa_supplicant.service wpa_supplicant-nl80211@.service wpa_supplicant-wired@.service"
+SYSTEMD_SERVICE_${PN} = "wpa_supplicant.service"
 SYSTEMD_AUTO_ENABLE = "disable"
 
 SRC_URI = "http://w1.fi/releases/wpa_supplicant-${PV}.tar.gz  \
@@ -37,13 +37,13 @@ S = "${WORKDIR}/wpa_supplicant-${PV}"
 PACKAGES_prepend = "wpa-supplicant-passphrase wpa-supplicant-cli "
 FILES_wpa-supplicant-passphrase = "${bindir}/wpa_passphrase"
 FILES_wpa-supplicant-cli = "${sbindir}/wpa_cli"
-FILES_${PN} += "${datadir}/dbus-1/system-services/*"
+FILES_${PN} += "${datadir}/dbus-1/system-services/* ${systemd_system_unitdir}/*"
 CONFFILES_${PN} += "${sysconfdir}/wpa_supplicant.conf"
 
 do_configure () {
 	${MAKE} -C wpa_supplicant clean
 	install -m 0755 ${WORKDIR}/defconfig wpa_supplicant/.config
-	
+
 	if echo "${PACKAGECONFIG}" | grep -qw "openssl"; then
         	ssl=openssl
 	elif echo "${PACKAGECONFIG}" | grep -qw "gnutls"; then
-- 
2.17.1

