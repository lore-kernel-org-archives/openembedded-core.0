Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id A96AE6C119
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2018 12:10:23 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id c14so1675666wrr.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2018 04:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=uxnSagiG1M5Xcn5Sj7AvRx9dRsCDNpn1PiB9BiGvZtw=;
	b=CZic+DnmR8C4pa1DKyhp8uUQaI8XmaRF/JDqhz3GteAMJZkAprRnD+a0P1ggCo6k25
	a/D4XIhRyDHB6tGbmtHTtMQ69jGs00P17AYCz+EFUGYSPy8l+OGjPS8qG/llsKJIFV8R
	2/ZkyXBBqjzSN/wKRl35BzAv3LZNaO7AnFaGGscKWf1m/QyTCcxN7eJ2FwuWSSm7bGlf
	RTgmRW96UZy5BVIUAKvLbreulDNKk7RpaMNEWSo9Xiw7iI+/cA2QFcURR4Bp10m8o2ch
	NAwokiH5Dd9sl6QRS8C8TGmeST7ecnUFgK01+nxP4+uhNMhhmG6LjyPthw1pCiFnFFD9
	cMsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=uxnSagiG1M5Xcn5Sj7AvRx9dRsCDNpn1PiB9BiGvZtw=;
	b=IquKjcWZm8+0NEoSULB8TvOffq0Rwe+bUuOpEWGdp+KSEf45Fut9HiLvUeTOBxYD5L
	RTNhUNBZNajiIo6DYv3HlrWDVh5mhpaW3m7QV2nRwfTKNKKsTrhNnmCvwWvjwcLH8JVR
	lFDhNnAYrh1ovJSGkWgMAbO9JFM1KjCZp3j2qCQDGgilGzuxn6SLn+wCO9hb1U4lFuWb
	ZkdARdFWhBi9szG5QVcitFi+gCaOYttTJZaQc99vkN4uPdAxKnMnz4V6mQkHU4J6ULo9
	DmKzYbtm9DpeKogBmCa/g5o9zRQAa1opKrWtLcow1Y2f/h7xxU5TwNE5er0ytDP9nlgj
	RWaA==
X-Gm-Message-State: AA+aEWaG4y0VS8MFf121qZxXF9vqCRiCw9TyE0FP5RoyZBMxmVgsc1Tx
	14qrRAsfQ3S4hQM0xA++VHAnQIbJr5I=
X-Google-Smtp-Source: AFSGD/XEibvE8Pl0HBGNv6kIirjHukxtRkZtI/K4BQEko69cBzROCAcJiydBVu6HTLbxCdQ2qHN2tw==
X-Received: by 2002:adf:eec9:: with SMTP id a9mr1171232wrp.242.1543493424061; 
	Thu, 29 Nov 2018 04:10:24 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	129sm1751076wmd.18.2018.11.29.04.10.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 29 Nov 2018 04:10:22 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Nov 2018 12:10:20 +0000
Message-Id: <20181129121020.26396-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] libtasn1: no need to inherit binconfig
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
X-List-Received-Date: Thu, 29 Nov 2018 12:10:24 -0000

This recipe doesn't ship a *-config binary, so don't inherit binconfig.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/gnutls/libtasn1_4.13.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/gnutls/libtasn1_4.13.bb b/meta/recipes-support/gnutls/libtasn1_4.13.bb
index 2d223861c71..9ee19130916 100644
--- a/meta/recipes-support/gnutls/libtasn1_4.13.bb
+++ b/meta/recipes-support/gnutls/libtasn1_4.13.bb
@@ -18,6 +18,6 @@ DEPENDS = "bison-native"
 SRC_URI[md5sum] = "ce2ba4d3088119b48e7531a703669c52"
 SRC_URI[sha256sum] = "7e528e8c317ddd156230c4e31d082cd13e7ddeb7a54824be82632209550c8cca"
 
-inherit autotools texinfo binconfig lib_package gtk-doc
+inherit autotools texinfo lib_package gtk-doc
 
 BBCLASSEXTEND = "native"
-- 
2.11.0


