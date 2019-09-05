Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id B4CB97F2EA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2019 15:51:56 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id q27so2439761lfo.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Sep 2019 08:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=cybfLNu7ywQAI4jFN40Qjnxn/PDXODNepCUY8B6qTnA=;
	b=imtSeQPB3UZYkQDzUOAAvQmjW8xijH2OdZ94SIc/wZ2nKt6cDqkZMg3yvqEVE2PGbO
	jF0hV2q37jY1dbRpskiKz09hs4+WhLscSZ5wsZAHnOLLjPCSGFsfTvXx9mQUeUT+t/LN
	vEkIN7imqctL+w9R7MFw6jTSzF41tEHy6iH6qmenUKUDQCazNQbkZRMZQWqG7gGYXoQj
	UWt987BcmcL1jXMSl0G6gCqjN5q38zeNlfKsRDLHOZ24DXO4x60sPaa2I/GEjhKYFjBN
	7zNS644vcBFVLhdN5Gp2cfdlhQM4Ca7ajhUfn1AAT4ZxETUHnf+UbbHGTP775bpNzq6l
	oc+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=cybfLNu7ywQAI4jFN40Qjnxn/PDXODNepCUY8B6qTnA=;
	b=jLvWa4YIp6/cnWimFRCBYO8yYMMzchwDjLLyRyz7Q5OmozdfU64ZWynFk9SrMGOAW+
	UK/brdapIU1pEeaH6Hdf5V6KRN+Y6CVIWZbHpOvQ0Tno5rgRvQZcA0DSptm9nC4274HQ
	jaIiTBfdwMN7T4zca/95SZoPAZmralyEMTNu3TyT5O8QARVUkqAwom/MlSTj7JVFE5AL
	OgG4aL6F2VMt+0fmwgv7EArgaouiXPXMPdQKH+3mUw0U9MS2IDGKpeEFdbvuykVKHe5/
	7Pe/jVjQgwaSK1jmScc5k2MiaTCnCeUqKfTFfoPTJmH/S9TyVupeX4HKJBrI2r0hhBMO
	b/FQ==
X-Gm-Message-State: APjAAAUfRvjT1n/6Z7nWxNuA/GL+cTcpwzOYokjBH4xdREcnqpPo7Py/
	V+BR8/3usPYBSrJlUAwhV6s/zmTggS8=
X-Google-Smtp-Source: APXvYqyRmOB/WNfI3EzNAkhYBxIGYBqZzxJhY+hc8/fFqZwZ2Dxwln7fU4hsVMuVdEGf9A9bUT6djg==
X-Received: by 2002:ac2:51ce:: with SMTP id u14mr2671039lfm.72.1567698716914; 
	Thu, 05 Sep 2019 08:51:56 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115])
	by smtp.gmail.com with ESMTPSA id h21sm439530ljg.34.2019.09.05.08.51.56
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Sep 2019 08:51:56 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Sep 2019 17:51:51 +0200
Message-Id: <20190905155153.30625-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH 1/3] python3-dbus: update to 1.2.10
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
X-List-Received-Date: Thu, 05 Sep 2019 15:51:57 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-dbus_1.2.8.bb => python3-dbus_1.2.10.bb}     | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/python/{python3-dbus_1.2.8.bb => python3-dbus_1.2.10.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-dbus_1.2.8.bb b/meta/recipes-devtools/python/python3-dbus_1.2.10.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-dbus_1.2.8.bb
rename to meta/recipes-devtools/python/python3-dbus_1.2.10.bb
index 2fb1eae96c..71d24ee1a0 100644
--- a/meta/recipes-devtools/python/python3-dbus_1.2.8.bb
+++ b/meta/recipes-devtools/python/python3-dbus_1.2.10.bb
@@ -5,11 +5,10 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b03240518994df6d8c974675675e5ca4"
 DEPENDS = "expat dbus glib-2.0 virtual/libintl"
 
-SRC_URI = "http://dbus.freedesktop.org/releases/dbus-python/dbus-python-${PV}.tar.gz \
-"
+SRC_URI = "http://dbus.freedesktop.org/releases/dbus-python/dbus-python-${PV}.tar.gz"
+SRC_URI[md5sum] = "5d21d5ae6423f0e41caa3400af44edac"
+SRC_URI[sha256sum] = "d4332bbd4a0054fa4010b259c293b84d461bbd9d7a8ef528157d151c0398d886"
 
-SRC_URI[md5sum] = "7379db774c10904f27e7e2743d90fb43"
-SRC_URI[sha256sum] = "abf12bbb765e300bf8e2a1b2f32f85949eab06998dbda127952c31cb63957b6f"
 S = "${WORKDIR}/dbus-python-${PV}"
 
 inherit distutils3-base autotools pkgconfig
@@ -18,7 +17,6 @@ inherit distutils3-base autotools pkgconfig
 # change to use PACKAGECONFIG when python3-sphinx is added to oe-core
 EXTRA_OECONF += "--disable-documentation"
 
-
 RDEPENDS_${PN} = "python3-io python3-logging python3-stringold python3-threading python3-xml"
 
 FILES_${PN}-dev += "${libdir}/pkgconfig"
-- 
2.17.1


