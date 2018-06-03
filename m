Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 83297750FE
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Jun 2018 02:03:32 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id m129-v6so8508730wmb.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Jun 2018 19:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=nKZ61E81Nk2aNTXbC0qK6+S/+dI88ARvOIw1pUep0uU=;
	b=0ocUCaNCqzsvjjz26gqVFXqAwLR7JhHZ+6YW4AH+C3xK5ZgFRZh5x8caliHFjrfcoL
	boNuuZg13EsXCgjrw5XSSxIQtaAiz2jz9w10gr4HxurKqYJvyXRaoistyI3JhQGPSmTO
	JlWjSW5FNC8ssclF0DNKFKExgcQKixU0S9RWAgP2R3Pq2db+NxJgmJRt9zUrSQ/mjY/d
	izN5bO6PblRM8U2vuzYIun/J8YIfEuKJp5jBwM82X8Jr4Fm2hCvAvC/NPmu376q6AQyB
	ENELBBHh5bA4kGky39sOHHKn2XGA75fldyKrgV5ywLzXuauZUhR/1adq3miMCWUQLRmW
	1mXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=nKZ61E81Nk2aNTXbC0qK6+S/+dI88ARvOIw1pUep0uU=;
	b=ghD6d1s8ZPf80FmVEYmEjQnj431dM4S4M3pUmH9ZeWq1TaDo/wTHltDZ5FnAgeWIvj
	a0O5k6dH5JSf/tmlqKOsZsPaYRTlMZ/5HKzWVtW7xi1d1pEwxVX2E8Aa2nCf4+oc1Tcy
	YMcfouQ5pD2KyfS3d4OEt23j44iicaAmiT0Fj0s5tc+XiICpNOl4GR8UmiGaEdzUBko/
	4IE3vahjuVi/GBJu2Mp2i6kU9Y8blSOap3N/IQVbkqyI7xWCpT2ZrAhgBgxjqEiHeWL0
	0hpLO2/Wb1jmBbZup0gM+jjxvbbpfVaXqZV2XbWT1DstFKGcLEN0LxLfQFRH12C1vZ6V
	85LA==
X-Gm-Message-State: ALKqPwfxgzKthS8lQvgcT17+OtJGV3zCiSJj/Qd7e2Z89qauSB0bpU5+
	hyeKMD8NRg4cp/V0eTz5wwmbzxPF
X-Google-Smtp-Source: ADUXVKLB5G//HZtobdFg4x3tFv1NS+EPZp4sFrRNmVGMTKGSZRbuGSlhGFinJGqIKQJmer0H8Qvkww==
X-Received: by 2002:a50:b52a:: with SMTP id
	y39-v6mr18407652edd.195.1527991412774; 
	Sat, 02 Jun 2018 19:03:32 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ae08:1403:ff00:489:7961:466d:7cf7])
	by smtp.gmail.com with ESMTPSA id
	b22-v6sm25468038edn.44.2018.06.02.19.03.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 02 Jun 2018 19:03:31 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
X-Google-Original-From: Oleksandr Kravchuk <dev@sashko.rv.ua>
To: openembedded-core@lists.openembedded.org
Date: Sun,  3 Jun 2018 04:03:26 +0200
Message-Id: <20180603020326.26196-1-dev@sashko.rv.ua>
X-Mailer: git-send-email 2.17.0
Cc: Oleksandr Kravchuk <dev@sashko.rv.ua>
Subject: [meta-oe][PATCH v3] iso-codes: fix SRC_URI
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
X-List-Received-Date: Sun, 03 Jun 2018 02:03:32 -0000

The original FTP server, alioth.debian.org has been permanently taken
down by the Debian Project and replaced with salsa.debian.org.

Source: https://wiki.debian.org/Alioth

Signed-off-by: Oleksandr Kravchuk <dev@sashko.rv.ua>
---
 meta/recipes-support/iso-codes/iso-codes_3.77.bb | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/iso-codes/iso-codes_3.77.bb b/meta/recipes-support/iso-codes/iso-codes_3.77.bb
index bd613ac573..b99fe65879 100644
--- a/meta/recipes-support/iso-codes/iso-codes_3.77.bb
+++ b/meta/recipes-support/iso-codes/iso-codes_3.77.bb
@@ -2,14 +2,16 @@ SUMMARY = "ISO language, territory, currency, script codes and their translation
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "https://pkg-isocodes.alioth.debian.org/downloads/iso-codes-${PV}.tar.xz"
-SRC_URI[md5sum] = "9d0d06cfb4634428b300845edcd7140a"
-SRC_URI[sha256sum] = "21cd73a4c6f95d9474ebfcffd4e065223857720f24858e564f4409b19f7f0d90"
+SRC_URI = "https://salsa.debian.org/debian/iso-codes/-/archive/upstream/${PV}/iso-codes-upstream-${PV}.tar.bz2"
+SRC_URI[md5sum] = "a19626c1abe1b96ade163692cf17b566"
+SRC_URI[sha256sum] = "2501501aa26e078a07056c55df5d0c56ce2c03cf1c03a5bccce4f3193c91aea1"
 
 # inherit gettext cannot be used, because it adds gettext-native to BASEDEPENDS which
 # are inhibited by allarch
 DEPENDS = "gettext-native"
 
+S = "${WORKDIR}/iso-codes-upstream-${PV}"
+
 inherit allarch autotools
 
 FILES_${PN} += "${datadir}/xml/"
-- 
2.17.0


