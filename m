Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 320F574F35
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jun 2018 16:06:45 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id m129-v6so6164453wmb.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jun 2018 09:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=R5OkK7OOuugAfPsN4AK6cVdFK1mgA2ESvIZo3FX1wVY=;
	b=DhOaAdZeSR5hmGUjho/ZzpvuSbyn8Nw3QxQ/YPkMrbxZGrehiuhONwXQpxu6xQUApe
	D8gRWY3yndVLbhXsGwEA8pVfjWxatxNF/Ypopx2phFTcVWs5IxFcqT2tlvQO2CANyhfK
	KKNYR+3BRQoV4vzGbL30JACuQZAgvS8Q5Iz6RPQswg7fwASzcFbwPnsZVd5SJ5VJeNUV
	XrSpvsJ87m163OFgL0xkbunUtfI0RQpOO5fZVdXPRX/dhrpzGVNvjOfL/ZNI1gBCDowh
	DGVKfdMbcszv/mmyMyCBZI1ipfijhPdqcvSIJUpx9GXcHzvbCkESCSVzDj/E35OXvJwn
	GTNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=R5OkK7OOuugAfPsN4AK6cVdFK1mgA2ESvIZo3FX1wVY=;
	b=gpuaN3W5TK1O9FqVm0fXotGf6M6rWC9hyaBG3ciyBFSF9i5wVIl0+J5Qr5D9SRlOY6
	7vHkMSV9myO7iGw59KWeRvRizN7XmD+e/rWoj02XhYV3kVExtOOLlOkdQ0MDSFbhlU4F
	KLZr2SctnmFo9DJQpQvgeGlyFSjI2TGL0hhDdOmQga0pRsDXCXqcVXQJclg+9hM5yDlK
	4prMs9m8m8pUu6jrRd5aydRZBVWq1OCs9Cxv9MTqNG2ZybAuz6vgEv8T4M2DNPZt1qoZ
	Y6gV3BdQkXsCX/9rDyNCX0DWXEpLswznwE45O95Qv9EnhrML1CvY+SC03+c5j8hQdTZS
	mm6w==
X-Gm-Message-State: APt69E1jbvF+sYwdimGBkNmg2wOwrM5hEdJfew9H9ldCzlZ1VsMLPwi3
	oJ2fYWUZAqyQmwApGA5yT7ggxj/a
X-Google-Smtp-Source: ADUXVKJmotNVZUM5Gkjp+xsoHu7aPFv5O86OyCojJtpY4hMqg27Q8LvsO5//QRIgLlbz3H9UIuzjEA==
X-Received: by 2002:a50:cb0d:: with SMTP id
	g13-v6mr8229048edi.81.1528214806443; 
	Tue, 05 Jun 2018 09:06:46 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ae08:1403:ff00:489:7961:466d:7cf7])
	by smtp.gmail.com with ESMTPSA id
	a12-v6sm4118926edr.89.2018.06.05.09.06.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Jun 2018 09:06:45 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
X-Google-Original-From: Oleksandr Kravchuk <dev@sashko.rv.ua>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Jun 2018 18:06:43 +0200
Message-Id: <20180605160643.23035-1-dev@sashko.rv.ua>
X-Mailer: git-send-email 2.17.0
Cc: Oleksandr Kravchuk <dev@sashko.rv.ua>
Subject: [meta-oe][PATCH v3] iso-codes: update to 3.79 and fix SRC_URI
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
X-List-Received-Date: Tue, 05 Jun 2018 16:06:46 -0000

Updated package to version 3.79.

The original FTP server, alioth.debian.org has been permanently taken
down by the Debian Project and replaced with salsa.debian.org.

Source: https://wiki.debian.org/Alioth

Also added HOMEPAGE, and BUGTRACKER.

Signed-off-by: Oleksandr Kravchuk <dev@sashko.rv.ua>
---
 .../iso-codes/{iso-codes_3.77.bb => iso-codes_3.79.bb} | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)
 rename meta/recipes-support/iso-codes/{iso-codes_3.77.bb => iso-codes_3.79.bb} (56%)

diff --git a/meta/recipes-support/iso-codes/iso-codes_3.77.bb b/meta/recipes-support/iso-codes/iso-codes_3.79.bb
similarity index 56%
rename from meta/recipes-support/iso-codes/iso-codes_3.77.bb
rename to meta/recipes-support/iso-codes/iso-codes_3.79.bb
index bd613ac573..72cb542f18 100644
--- a/meta/recipes-support/iso-codes/iso-codes_3.77.bb
+++ b/meta/recipes-support/iso-codes/iso-codes_3.79.bb
@@ -1,15 +1,19 @@
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
 
+S = "${WORKDIR}/git"
+
 inherit allarch autotools
 
 FILES_${PN} += "${datadir}/xml/"
-- 
2.17.0


