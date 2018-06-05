Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4D87E782E8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jun 2018 15:22:20 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id x6-v6so5687069wmc.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jun 2018 08:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=HxLi5rNN27xC8V6LCz2ycecS/tzljEebrifxfjsunUw=;
	b=bWjGEnwLSdflTK7wKrnDq0aT8aHOLn0GSR2FLxMoY24jvn9IN9WwS1/Bpleb8PHh9W
	fiVtT8mrWiHcJ9Sypm+m9THkB5HQIGSZ6jQ0H153Qb5J6kXD8py4k+8hXJB2WJanzJAz
	jYqjnqUXFTVTuAonb0muCf7H8PBXyJbmz6OQYQeoPn8Se8anj4PsHxYLeJuYGVL4SSUH
	BConN+/p6kBYRby9/DAmbjPpTBd7df2Q/Lb/AhjuJTmODscf3wIcESrRQ2riHi+pqv+1
	31w4BVgFEke36x2H6Prbv2mg+uOGZYKWZ/e+K77I2/SzmRgmKVCGuyqMxs4UzEoRk9x5
	rU4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=HxLi5rNN27xC8V6LCz2ycecS/tzljEebrifxfjsunUw=;
	b=eA02w+r/6fwqkl3g9FC0D2Vr9hp7R+rqTaD5+eGfa04KjAZl1WolK7e7NyOMVyq1vK
	GZunuMMzS7ISkVPQAZxI4bjTkYfYgUM1y2vPfHNVJBZXlBXf0rITrR55CW14NbtMJyyt
	8zCg8y32Dy9mqVxpY6frV6PjmouXrls/kep2WL/HfsS/u/54k5eoblPeiiRTmgDzNKvt
	7qBrApuX9KajH+swCnzE977+OGZsXVH6gplNJy7qWWYMO+ykoICjHCtbuwYbydiA1kCr
	tWTjzKxzC1k+nsNsAtjSV5NqD7f6Hk6jlmkfXVz5DQ8w+9cf3YSyJjFxWrAq9esrt4uR
	W2Lg==
X-Gm-Message-State: ALKqPwdyzjUpjzSMElsfrRjYRBzBCWFFy2cpyMfiawBIJ8EUTZzHEEmQ
	dIHx+63KmMAr1zNzoYfVFSeLDzlE
X-Google-Smtp-Source: ADUXVKKY47XcIjuNslagdYHeQuwrD+GNymPeN5oqHfLFZbAkQYFOjkuFJQKDqZlQoKs+eJu9zudsDQ==
X-Received: by 2002:a50:db8c:: with SMTP id
	p12-v6mr29408113edk.298.1528212139996; 
	Tue, 05 Jun 2018 08:22:19 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ae08:1403:ff00:489:7961:466d:7cf7])
	by smtp.gmail.com with ESMTPSA id
	r15-v6sm550171edp.92.2018.06.05.08.22.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Jun 2018 08:22:18 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
X-Google-Original-From: Oleksandr Kravchuk <dev@sashko.rv.ua>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Jun 2018 17:22:13 +0200
Message-Id: <20180605152213.28474-1-dev@sashko.rv.ua>
X-Mailer: git-send-email 2.17.0
Cc: Oleksandr Kravchuk <dev@sashko.rv.ua>
Subject: [meta-oe][PATCH] iso-codes: update to 3.79 and fix SRC_URI
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
X-List-Received-Date: Tue, 05 Jun 2018 15:22:20 -0000

Updated package to version 3.79.

The original FTP server, alioth.debian.org has been permanently taken
down by the Debian Project and replaced with salsa.debian.org.

Source: https://wiki.debian.org/Alioth

Signed-off-by: Oleksandr Kravchuk <dev@sashko.rv.ua>
---
 .../iso-codes/{iso-codes_3.77.bb => iso-codes_3.79.bb}    | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta/recipes-support/iso-codes/{iso-codes_3.77.bb => iso-codes_3.79.bb} (58%)

diff --git a/meta/recipes-support/iso-codes/iso-codes_3.77.bb b/meta/recipes-support/iso-codes/iso-codes_3.79.bb
similarity index 58%
rename from meta/recipes-support/iso-codes/iso-codes_3.77.bb
rename to meta/recipes-support/iso-codes/iso-codes_3.79.bb
index bd613ac573..9f982a2668 100644
--- a/meta/recipes-support/iso-codes/iso-codes_3.77.bb
+++ b/meta/recipes-support/iso-codes/iso-codes_3.79.bb
@@ -2,14 +2,16 @@ SUMMARY = "ISO language, territory, currency, script codes and their translation
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "https://pkg-isocodes.alioth.debian.org/downloads/iso-codes-${PV}.tar.xz"
-SRC_URI[md5sum] = "9d0d06cfb4634428b300845edcd7140a"
-SRC_URI[sha256sum] = "21cd73a4c6f95d9474ebfcffd4e065223857720f24858e564f4409b19f7f0d90"
+SRC_URI = "${DEBIAN_MIRROR}/main/i/iso-codes/iso-codes_${PV}.orig.tar.xz"
+SRC_URI[md5sum] = "5875d7aa41b1acd7b218631ff7b85464"
+SRC_URI[sha256sum] = "cbafd36cd4c588a254c0a5c42e682190c3784ceaf2a098da4c9c4a0cbc842822"
 
 # inherit gettext cannot be used, because it adds gettext-native to BASEDEPENDS which
 # are inhibited by allarch
 DEPENDS = "gettext-native"
 
+UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/i/iso-codes/"
+
 inherit allarch autotools
 
 FILES_${PN} += "${datadir}/xml/"
-- 
2.17.0


