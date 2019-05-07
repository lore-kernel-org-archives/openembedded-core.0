Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id 78B427D42D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 May 2019 21:01:36 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id j20so12902193lfh.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 May 2019 14:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=w2N5pO8q2qMElitsKxM96YKB/X/378u0wmsSVTabnWI=;
	b=sK6Ds6EDXjp5rDqyZxKUgHve9Yq1aTtCa5A2oX5c1zJieShHqBUbyU35enbbmGpJ1V
	fkjr5pYxV/cHvUPZeScSrsmqYxRdDgV/7DwRqXjXT8Ks+UbO5ZloRkigx+70pvK3J9sB
	Nd6K8Zt+Gycgt+BpOxPaAArwZ5EDqlWJPIt++K0LrliXnJ1vjI2gHpw8ps9k8+AJfYVM
	9p1qIyibjUFkwtT1S72EojiaCwbGpGo9MdGWtUSPpt2nBi8rblmpLPy3ZLOCiBBzKhBa
	/mOjM1khQ6mA7DsvoDaPM/pAy3p/phs9Oe9vyiBXanLS5f0Uc76XlUD1rBEN9AniE/Kw
	azuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=w2N5pO8q2qMElitsKxM96YKB/X/378u0wmsSVTabnWI=;
	b=Av0Sr2i2H9TK3DQB8cF8tzrXIOh/Qd4kgYxmbGRR95DZfWk1IDcWq2dlpk3DDTpTTg
	B+URMoFvficQMauaBzrXYmVCEIXAD7wWPFBVJOt+OAHPSPEepRxjk0P8qAN84kI+kWCI
	eSC/uogRPwTeLHKmi/mIL3sz25/9bdk86+stpALOkqm+mg0Ri1fR9W4s8mq3k/Th1uTn
	wPWSGqSPFoasqwWoyYY5DVZ3wwveqsR2fw2LkeFHwJT9Cj0bobwoa05UMci07kYXubN5
	w2DHbFeCzfd6Prv+DBw5IDFdH9a9TBrOiLlElAzl2cuHKDZjChUPzNOTdLA4Ge9Ucx9f
	1WLg==
X-Gm-Message-State: APjAAAV6s60V8AXBZ3Tbm0boqxDnaxvY+tMMQbymqk0AhbM0qCWVZK45
	1wvXd+u/5WsiQAfMus8FZEiVwUsm7kQ=
X-Google-Smtp-Source: APXvYqy40G8RVCzvuFQ6EE0n1SnQc3i+EXa2zmUVUmP0/j4MqTPsmMtxsTEPdVT3gEp0nG9sBfitGQ==
X-Received: by 2002:a19:fc19:: with SMTP id a25mr17624284lfi.128.1557262896358;
	Tue, 07 May 2019 14:01:36 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id p5sm147415lfc.80.2019.05.07.14.01.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 May 2019 14:01:35 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 May 2019 23:01:33 +0200
Message-Id: <20190507210133.11454-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] wpa-supplicant: update to 2.8
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
X-List-Received-Date: Tue, 07 May 2019 21:01:36 -0000

License checksums were changed due to modified copyright years.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{wpa-supplicant_2.7.bb => wpa-supplicant_2.8.bb}   | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-connectivity/wpa-supplicant/{wpa-supplicant_2.7.bb => wpa-supplicant_2.8.bb} (90%)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.7.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.8.bb
similarity index 90%
rename from meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.7.bb
rename to meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.8.bb
index fe5fa2b82e..bd4167c314 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.7.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.8.bb
@@ -3,9 +3,9 @@ HOMEPAGE = "http://w1.fi/wpa_supplicant/"
 BUGTRACKER = "http://w1.fi/security/"
 SECTION = "network"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=a3791c270ad6bb026707d17bf750e5ef \
-                    file://README;beginline=1;endline=56;md5=495cbce6008253de4b4d8f4cdfae9f4f \
-                    file://wpa_supplicant/wpa_supplicant.c;beginline=1;endline=12;md5=a5687903a31b8679e6a06b3afa5c819e"
+LIC_FILES_CHKSUM = "file://COPYING;md5=279b4f5abb9c153c285221855ddb78cc \
+                    file://README;beginline=1;endline=56;md5=e7d3dbb01f75f0b9799e192731d1e1ff \
+                    file://wpa_supplicant/wpa_supplicant.c;beginline=1;endline=12;md5=0a8b56d3543498b742b9c0e94cc2d18b"
 DEPENDS = "dbus libnl"
 RRECOMMENDS_${PN} = "wpa-supplicant-passphrase wpa-supplicant-cli"
 
@@ -26,8 +26,8 @@ SRC_URI = "http://w1.fi/releases/wpa_supplicant-${PV}.tar.gz  \
            file://99_wpa_supplicant \
            file://0001-replace-systemd-install-Alias-with-WantedBy.patch \
           "
-SRC_URI[md5sum] = "a68538fb62766f40f890125026c42c10"
-SRC_URI[sha256sum] = "76ea6b06b7a2ea8e6d9eb1a9166166f1656e6d48c7508914f592100c95c73074"
+SRC_URI[md5sum] = "0af5998c5d924e985cab16b9a1c77904"
+SRC_URI[sha256sum] = "a689336a12a99151b9de5e25bfccadb88438f4f4438eb8db331cd94346fd3d96"
 
 CVE_PRODUCT = "wpa_supplicant"
 
-- 
2.17.1


