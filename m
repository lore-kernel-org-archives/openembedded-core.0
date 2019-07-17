Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 76BD47ED48
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 11:03:27 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id u25so11323526wmc.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 04:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=UqYITL1CCYc1KXW8ZPQ25hdKz8ZCdBmCXFaf+hFpIiE=;
	b=nIOWqiw2nOlEI7HW4Gh9cnAUSxJtzw22OAciFH4ksXEzW0a3hXKT6cXYrMc7ZpvfiW
	/21TtRLOyYLrEfiAfgT2zkRmHsRoefJ1Nd13w7KEOMcrrDJJgNJg7yqPxnNmWV0xfcuF
	rkRykiSsLyUK/ndRqyqbpalfRBb/6zhnht5Dknd0m1G88B9UOdJMWEeKWzR4Y8icDbBQ
	EHVIyKYS4oa8vO6m1Telko1pI237WJfV5kEsr6daJl6TJlUWjGLcc8jiYBDIs55st8OK
	DXTzUmqUobBsWFDgjPnU91nBENwAooTunZm7+cCX+F+2woTOlIB0XNdSOVu6pszKBZX2
	9Bag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=UqYITL1CCYc1KXW8ZPQ25hdKz8ZCdBmCXFaf+hFpIiE=;
	b=NfkRC+ej+qW5+IywLrwZpHUY+2l0+yh7/24f0/Kxf7ND0XaWyqGgE0V42TeMEQwJh/
	XrmRpzBPl5S0ltDVtN5UVKYjMh1IjaEYta5V2AXBeUrWosVptec+iFrh6iAnLUe5I20n
	1hWHHigGAhtIl32CW5uNClQtjYUlOCKOXeNOTyFWvFgJr3FwuBkt80jzPIHd/kNRKOEx
	OQHrHjamulAtfb4FoYCn1IahMx7cOiWvarUWisV7cEp5s/6E5ZDUqY1TqmQu0H7gdnVM
	wvM3n5sAaBqQr9GwGyfa8byLytyOcZlo4ZL97QNufQzkgCHftWPW91K0XrDJ5oD0GXtq
	8dVA==
X-Gm-Message-State: APjAAAVA7kq60HlLWMCCzpOP5uycFdkLQYsTvHxcLy6HL5T794LbHLHR
	70Gy0KIlScMZV2UFR7/kVmBtU0DN/Ms=
X-Google-Smtp-Source: APXvYqx+oCkDOm9xHeV1Lamos6wnxEzEqENJG2cDeCP5vY7eZGfg2mnTM1lWGGw+YKiwZ1PrS497+g==
X-Received: by 2002:a05:600c:2245:: with SMTP id
	a5mr35926123wmm.121.1563361408184; 
	Wed, 17 Jul 2019 04:03:28 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	g8sm24584326wme.20.2019.07.17.04.03.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 17 Jul 2019 04:03:27 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jul 2019 12:03:22 +0100
Message-Id: <20190717110324.24433-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190717110324.24433-1-ross.burton@intel.com>
References: <20190717110324.24433-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] boost: set CVE vendor to Boost
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
X-List-Received-Date: Wed, 17 Jul 2019 11:03:28 -0000
Content-Transfer-Encoding: 8bit

There's a Boost module for Drupal.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/boost/boost.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index 9be3717fd65..0330202586f 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -2,6 +2,8 @@ SUMMARY = "Free peer-reviewed portable C++ source libraries"
 SECTION = "libs"
 DEPENDS = "bjam-native zlib bzip2"
 
+CVE_PRODUCT = "boost:boost"
+
 ARM_INSTRUCTION_SET_armv4 = "arm"
 ARM_INSTRUCTION_SET_armv5 = "arm"
 
-- 
2.20.1


