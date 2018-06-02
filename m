Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 50CA27198F
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Jun 2018 23:00:09 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id o13-v6so8975790wmf.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Jun 2018 16:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=EDK/bFWRrU29wjwD/7f8x9S9FL66JkAHuwhbHvwuav4=;
	b=YnrThVShQepH8Jjjju2x8jLiyWgdQR3ghx9XaFHcNPaY1kjGhwNAunsS/F0PkqAHvF
	qSvyjy96NuhRqm5NCh6aMQQfi1LS1d8LVyJmxPDhoK5UpfaZ3g9q3rhHqqNrctO/5PRR
	h1uQ6NKruquCPsdk14BnPXatR32yAkolRNlRTEEYSnhdoOI2Aua76ABicADsIk2i94xD
	lhxfuqadtfE8FALqFREThAFvJOjOc0VSKyOawni7cnrn5zSonJNmuL7gU92xQVvjaDC9
	X/UEMaT4MF+DR1Nbfig5xYST6+DrBDOuBl0lpuxLP7O5CD5gbqqDTVpDtDkU9K9/06H1
	lyvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=EDK/bFWRrU29wjwD/7f8x9S9FL66JkAHuwhbHvwuav4=;
	b=Lfcgh6xlMknSwsvR57tGvaBriv1oOL7omQJFim6VN4LOthvR9Rdl9f9j4M5at3lgbU
	woaW90YABIvudcaOHCS9LS6E9TAvJG5lVQTwfWonG0paM6PTocsm/o1tPH7jNAIi36FM
	Ngnpo9xyAh5y+Rhg5Y3n7RZ8FQhyy+O5F2K25kQJyEMebGdBJ9gUToMMl7EduEiGI365
	qeaiViROvovQp3xm6NTTL7YepMA9dtgTBK+NiPkxfWoJv79eiTrnOj2pY1Ounz8UoOyi
	9ATjgcYxXCYD0M4yTl92MmqK714Z8TrA8I0eeSK8Lh4ALxbVPD1xlPT3ozqlxmjZ9xkH
	iXmQ==
X-Gm-Message-State: ALKqPweBSHtsqKC8fzDPR3zHr6xhptuhryHsWv2ghULSxR7mBYrNS10Z
	sxz3c08eJlJzgES3bgHZ6llsTBZp
X-Google-Smtp-Source: ADUXVKKJlJh9adGgrQ/yxdkyccRjhh1OTcPxyqAVg9DDuqeCC3axisJ15Kzg2wZy3YjDqukKWxiC/Q==
X-Received: by 2002:a50:a8a2:: with SMTP id
	k31-v6mr18098499edc.63.1527980409931; 
	Sat, 02 Jun 2018 16:00:09 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ae08:1403:ff00:489:7961:466d:7cf7])
	by smtp.gmail.com with ESMTPSA id
	g8-v6sm14081361edh.88.2018.06.02.16.00.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 02 Jun 2018 16:00:09 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
X-Google-Original-From: Oleksandr Kravchuk <dev@sashko.rv.ua>
To: openembedded-core@lists.openembedded.org
Date: Sun,  3 Jun 2018 00:59:58 +0200
Message-Id: <20180602225958.15177-2-dev@sashko.rv.ua>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180602225958.15177-1-dev@sashko.rv.ua>
References: <20180602225958.15177-1-dev@sashko.rv.ua>
Cc: Oleksandr Kravchuk <dev@sashko.rv.ua>
Subject: [meta-oe][PATCH v2 2/2] iso-codes: fix SRC_URI
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
X-List-Received-Date: Sat, 02 Jun 2018 23:00:09 -0000

The original FTP server, alioth.debian.org has been permanently taken
down by the Debian Project and replaced with salsa.debian.org.

Source: https://wiki.debian.org/Alioth

Package has been updated to revision 1, since the original one is not
available anymore.

Signed-off-by: Oleksandr Kravchuk <dev@sashko.rv.ua>
---
 .../iso-codes/{iso-codes_3.77.bb => iso-codes_3.77-1.bb}  | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta/recipes-support/iso-codes/{iso-codes_3.77.bb => iso-codes_3.77-1.bb} (56%)

diff --git a/meta/recipes-support/iso-codes/iso-codes_3.77.bb b/meta/recipes-support/iso-codes/iso-codes_3.77-1.bb
similarity index 56%
rename from meta/recipes-support/iso-codes/iso-codes_3.77.bb
rename to meta/recipes-support/iso-codes/iso-codes_3.77-1.bb
index bd613ac573..86a757ac62 100644
--- a/meta/recipes-support/iso-codes/iso-codes_3.77.bb
+++ b/meta/recipes-support/iso-codes/iso-codes_3.77-1.bb
@@ -2,14 +2,16 @@ SUMMARY = "ISO language, territory, currency, script codes and their translation
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "https://pkg-isocodes.alioth.debian.org/downloads/iso-codes-${PV}.tar.xz"
-SRC_URI[md5sum] = "9d0d06cfb4634428b300845edcd7140a"
-SRC_URI[sha256sum] = "21cd73a4c6f95d9474ebfcffd4e065223857720f24858e564f4409b19f7f0d90"
+SRC_URI = "https://salsa.debian.org/debian/iso-codes/-/archive/debian/${PV}/iso-codes-debian-${PV}.tar.bz2"
+SRC_URI[md5sum] = "a186e19abef46a561fd34394cda84b7f"
+SRC_URI[sha256sum] = "bf07ea8c2f59432c9c8e73b9dee9af7ba02e0e4894495aaeb8ff020656ec2973"
 
 # inherit gettext cannot be used, because it adds gettext-native to BASEDEPENDS which
 # are inhibited by allarch
 DEPENDS = "gettext-native"
 
+S = "${WORKDIR}/iso-codes-debian-${PV}"
+
 inherit allarch autotools
 
 FILES_${PN} += "${datadir}/xml/"
-- 
2.17.0


