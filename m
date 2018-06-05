Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1F60A78255
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jun 2018 15:48:18 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id n5-v6so6030940wmc.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jun 2018 08:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=CHXUKLZ/CzBeSnpP54C1KAiUL6GR5xvxtdbrfVyMuqQ=;
	b=StP7GHMdIe+7gWnmhe79Hfxi2+Jmu0m+G0rYsw4RWn/6yjbZ+8zvP2GFBkTkFEGfDr
	c85wvu8oqR2oCb8TO+dkmeSZ7D06TmiI73dZIZ+OZdfVb5eUf+bZs8my45Ve/f/YB2tT
	m+wKbtDzkHDAaKPp/qEzaO1nAaUdg/nDzdenuPu+UMqT1LbowTaZzGwyv+tvouU3iOTJ
	P/oEUZJzjRfsKKi5dLh2s1D3rAGRCPjmzTkWkqSnCjTvPDPFeO0wul2uLZYfbvg102nJ
	jnndRIQjytltC7ewXtZEp4iHp7B8KH+8T7qw/5KshOcrgH+rQk2qZybAKDzTcgnRYvLj
	FNBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=CHXUKLZ/CzBeSnpP54C1KAiUL6GR5xvxtdbrfVyMuqQ=;
	b=LEJ+WENhIdWBvZ55Ma3NUwk0XCL/w27aZOCZTToagjydQr4JDW3K0bidFLYpnS+Gt8
	WAqGaK2IlWFy25HRaF2yVK3rbeEiqx/z5zUmed0Sf2+QAOcHrjHVRdmL9PDcX3wRMUv4
	PtdPrgHS4vjIAXMVdjt0FgZotzfR7wt4d+pdPCydE6Y+hsNUhU8Im4YfUItrkaL1McJC
	ZdN/o5CnFkTk4dYAM19EdiWmM6IvnYQge6rXcG+TDgtqctcsU+ntDYGUqnT5T9N/nQ8l
	ZaybT/NeLlWjjLaODolANlr5F8y1nG5cXL/bF1nXRjifipDqAgS41eRzX1PqiGvOj61h
	HTMQ==
X-Gm-Message-State: ALKqPwdN/bnqDwsy8IuzuXt677EKzT9ITjm/sW5zVCir4Ylw8VSdUVu8
	nxz0AVELij4DnNmqiLq7gFIDFUgl
X-Google-Smtp-Source: ADUXVKKxtXZwgR4m0qRXRAraP8npKC3IQqjuy9azkwbtT68ooWiGl9oyUaOyvRdgcWa8+FJziqk3Cg==
X-Received: by 2002:a50:8987:: with SMTP id
	g7-v6mr28924575edg.25.1528213698609; 
	Tue, 05 Jun 2018 08:48:18 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ae08:1403:ff00:489:7961:466d:7cf7])
	by smtp.gmail.com with ESMTPSA id
	q6-v6sm26047326edh.9.2018.06.05.08.48.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Jun 2018 08:48:17 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
X-Google-Original-From: Oleksandr Kravchuk <dev@sashko.rv.ua>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Jun 2018 17:48:15 +0200
Message-Id: <20180605154815.18009-1-dev@sashko.rv.ua>
X-Mailer: git-send-email 2.17.0
Cc: Oleksandr Kravchuk <dev@sashko.rv.ua>
Subject: [meta-oe][PATCH v2] iso-codes: update to 3.79 and fix SRC_URI
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
X-List-Received-Date: Tue, 05 Jun 2018 15:48:18 -0000

Updated package to version 3.79.

The original FTP server, alioth.debian.org has been permanently taken
down by the Debian Project and replaced with salsa.debian.org.

Source: https://wiki.debian.org/Alioth

Also added UPSTREAM_CHECK_URI, HOMEPAGE, and BUGTRACKER.

Signed-off-by: Oleksandr Kravchuk <dev@sashko.rv.ua>
---
 .../{iso-codes_3.77.bb => iso-codes_3.79.bb}         | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)
 rename meta/recipes-support/iso-codes/{iso-codes_3.77.bb => iso-codes_3.79.bb} (50%)

diff --git a/meta/recipes-support/iso-codes/iso-codes_3.77.bb b/meta/recipes-support/iso-codes/iso-codes_3.79.bb
similarity index 50%
rename from meta/recipes-support/iso-codes/iso-codes_3.77.bb
rename to meta/recipes-support/iso-codes/iso-codes_3.79.bb
index bd613ac573..3fadd459c8 100644
--- a/meta/recipes-support/iso-codes/iso-codes_3.77.bb
+++ b/meta/recipes-support/iso-codes/iso-codes_3.79.bb
@@ -1,15 +1,21 @@
 SUMMARY = "ISO language, territory, currency, script codes and their translations"
+HOMEPAGE = "https://salsa.debian.org/iso-codes-team/iso-codes"
+BUGTRACKER = "https://salsa.debian.org/iso-codes-team/iso-codes/issues"
+
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "https://pkg-isocodes.alioth.debian.org/downloads/iso-codes-${PV}.tar.xz"
-SRC_URI[md5sum] = "9d0d06cfb4634428b300845edcd7140a"
-SRC_URI[sha256sum] = "21cd73a4c6f95d9474ebfcffd4e065223857720f24858e564f4409b19f7f0d90"
+SRC_URI = "git://git@salsa.debian.org/iso-codes-team/iso-codes.git;protocol=git"
+SRCREV = "c1d5dd96b33cb815ebc21d2708bc045b1545249d"
 
 # inherit gettext cannot be used, because it adds gettext-native to BASEDEPENDS which
 # are inhibited by allarch
 DEPENDS = "gettext-native"
 
+UPSTREAM_CHECK_URI = "https://salsa.debian.org/iso-codes-team/iso-codes/tags"
+
+S = "${WORKDIR}/git"
+
 inherit allarch autotools
 
 FILES_${PN} += "${datadir}/xml/"
-- 
2.17.0


