Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id D7EBE78D4C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 15:33:03 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id a3-v6so5460898wrt.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 08:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=5dzLlMTprbuEmLkNwgZEKM7baLJylBp1bYtW7+DQ274=;
	b=WEIg3i6ZDc3QYGkadAMWXLRylUE8BLl7gPZRWdovhwaZ9NTfjIVlVVMqed6jlIIdYF
	MwrmvWmKzfe6pARX65r0Mug3IrYTMyrBJE8Fez/gMNdrg1VStXXGjv4rFmsNAI1pl1To
	mfdXdDUiZp0opIJ4KcMAMQELTA2NpDXwDppKk3TyqhCkY5sxjvKGgDVmniMsoWNPHdzP
	iw9uDjcMx9sMCCIZRvfnTPuDAmOjnEQWKH3T74M8I8GpUSkTYJS/HxdrXvQ6w6WpEoYs
	h+zA1+XSeU3aEYifdks3NbyopObiQZzvxUGcK8qEWsp4wf93auH8ICZH+qfeoNDsquQ5
	XyoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=5dzLlMTprbuEmLkNwgZEKM7baLJylBp1bYtW7+DQ274=;
	b=qhGYXxE8vucZ1a98y2Hd/F6o70/vrcL0qTDkXj0vza2vVgT747Ez2rAmvzd+nOUVc7
	jdoGOoEB+aknl/8T7KYfqtd9ztRhtmcLitRWh/yczKX5d+HMz8+/22/46yvlmhSL/KuW
	8FfesCI17352F8zmfpN7qy3SpDoLyj3v4zhKwonNCIlPL1ewj7dBNHDQwCQlgSFeWxt5
	ZndjUxgAhGC/NxSZoxipBZZMa8m0mEX4YIN5nakky8hl3RGjxPM3aLIfSlrBctfutthL
	Ha0S0054Pq1lEs//xkSO1e+1yM1aF8L6CEOCnvHAA8vluhSmlf52LGyLoCKzaRDe+fD4
	g00A==
X-Gm-Message-State: AOUpUlGOe3SNHl0m7AFh8N93/HwQQXmMCo1OYn30d7Ydwk8kFT3TAYHo
	RXcO2/V5UVn/+Zos5Gq+AA0Ppu342LU=
X-Google-Smtp-Source: AAOMgpcxDV0JA0A54oRorywbupD8te7D9/zmqvaxoCZfv/OHl/Sp+DfrYN4hrkd/GI4hUHz2m6/Srg==
X-Received: by 2002:a5d:540d:: with SMTP id g13-v6mr5435198wrv.4.1532705584341;
	Fri, 27 Jul 2018 08:33:04 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	z62-v6sm3804916wmc.10.2018.07.27.08.33.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Jul 2018 08:33:03 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jul 2018 16:32:43 +0100
Message-Id: <20180727153248.22838-11-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180727153248.22838-1-ross.burton@intel.com>
References: <20180727153248.22838-1-ross.burton@intel.com>
Subject: [PATCH 11/16] cups: depend on libusb1
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
X-List-Received-Date: Fri, 27 Jul 2018 15:33:04 -0000

There is no need to depend on the compatibility library libusb-compat, as CUPS
links directly to libusb1.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/cups/cups.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index ac4d225c1a7..717eef03a75 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -2,7 +2,7 @@ SUMMARY = "An Internet printing system for Unix"
 HOMEPAGE = "https://www.cups.org/"
 SECTION = "console/utils"
 LICENSE = "GPLv2 & LGPLv2"
-DEPENDS = "gnutls libpng jpeg dbus dbus-glib zlib libusb"
+DEPENDS = "gnutls libpng jpeg dbus dbus-glib zlib libusb1"
 
 SRC_URI = "https://github.com/apple/cups/releases/download/v${PV}/${BP}-source.tar.gz \
            file://use_echo_only_in_init.patch \
-- 
2.11.0


