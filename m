Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3A3CD7D19E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 22:05:14 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id x61so9776057edc.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Apr 2019 15:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=etARWtHO5CghOqzSPNo7k546/3GOY1KZK+5zBYAuy0s=;
	b=xbrKiPhcqekmGPol//B06bAWYcrz5NVF679I7gNJcLezSpDkWTAX35L/G3tpb0ep68
	ASQD0UF0J9wf3ouozVYipDyIxphBTfZpl5QuD3pb/MPu01Or+EYGFx4U0UynrgCzXGvP
	z3CG+1EWfYniQwUuNjRhv6IKLtVx+lJxhUvPm09FmDi3sTOQMmrsAWrltlpS8/vXSo9P
	eRnjmuifP/ppLTs+7Rz7E3NrgO1f6iuL1r4xV82mVTJfrexCgy7mJUQ9sKn8Io+0AOux
	7Etrqc7x2XCU3rfTOGO0Ec2R4DtsOrWsZX//Pw/47U14n9kVevPfluGS4Pjawr0846aR
	yz6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=etARWtHO5CghOqzSPNo7k546/3GOY1KZK+5zBYAuy0s=;
	b=ltOmwMnQ76k7gR233EILGevI39EjLpHTab5xiw6WESOO/jBr88JU2ineS1GFSkL5FE
	6nNvfnN8mdbopRY0+xep9xhY5ZaZ0+cLzm+X2CnS2NjP+uwggxQJvDjtxWyDHzyIR7/U
	QY0euuseCc3T/d+LXNCXw3ajzJAvKIi5eSsxftoVo9uVbqSDuo+bdnrR++phhrDix5yE
	yIzgsCA/LiwFpC/ClqKnyQIcMzpwB8qC/URwfcJfHPl4SPg3ZP5Fs/g5DvRhmaTHrWYX
	5sbZ+XEi6E4HZYklgwcv34W06ufZMdpHzaXx9XBxQld+63enT9I88hrqNaofr1lNN9mH
	jm+Q==
X-Gm-Message-State: APjAAAVR+JAje2HjmfEq30gVOmWSBW3TtJk7+ldAswIc+SFMTilFDtwK
	ZJUKp7+7NfNm50K7INo9EhS03znQZZs=
X-Google-Smtp-Source: APXvYqwQbW2d3OLYKjPLnBwMTgyAuhSiI3xZJmRQYszCsQvQiL0T051uRS1kjVXRxz9u3kpMS7QI7g==
X-Received: by 2002:a50:ac6c:: with SMTP id w41mr46732222edc.228.1554156315546;
	Mon, 01 Apr 2019 15:05:15 -0700 (PDT)
Received: from lund.luxoft.com (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id m47sm3558113edm.7.2019.04.01.15.05.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Apr 2019 15:05:14 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Apr 2019 00:05:03 +0200
Message-Id: <20190401220503.31034-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] libsecret: 0.18.8
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
X-List-Received-Date: Mon, 01 Apr 2019 22:05:15 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../libsecret/{libsecret_0.18.7.bb => libsecret_0.18.8.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/libsecret/{libsecret_0.18.7.bb => libsecret_0.18.8.bb} (81%)

diff --git a/meta/recipes-gnome/libsecret/libsecret_0.18.7.bb b/meta/recipes-gnome/libsecret/libsecret_0.18.8.bb
similarity index 81%
rename from meta/recipes-gnome/libsecret/libsecret_0.18.7.bb
rename to meta/recipes-gnome/libsecret/libsecret_0.18.8.bb
index 0061b88053..544f35346b 100644
--- a/meta/recipes-gnome/libsecret/libsecret_0.18.7.bb
+++ b/meta/recipes-gnome/libsecret/libsecret_0.18.8.bb
@@ -8,8 +8,8 @@ DEPENDS += "glib-2.0 libgcrypt gettext-native intltool-native"
 
 PACKAGECONFIG[manpages] = "--enable-manpages, --disable-manpages, libxslt-native xmlto-native"
 
-SRC_URI[archive.md5sum] = "376153ece17081eb5410870e0dc5c031"
-SRC_URI[archive.sha256sum] = "0d66fe1fc4561b3e046ee281d7c5a703a9baac88a8c4fb42ebc739d31dabd487"
+SRC_URI[archive.md5sum] = "fee403988442f497f3c1dfe7b128869c"
+SRC_URI[archive.sha256sum] = "3bfa889d260e0dbabcf5b9967f2aae12edcd2ddc9adc365de7a5cc840c311d15"
 
 # http://errors.yoctoproject.org/Errors/Details/20228/
 ARM_INSTRUCTION_SET_armv4 = "arm"
-- 
2.17.1


