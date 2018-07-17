Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 67850789A5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 16:39:31 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id 69-v6so29633wmf.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 09:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=d4A101zkKdgxLw0I9YhgxdbWft+sxmajktb8PjDmsF4=;
	b=VdPhnZsyOxQLMMo9w3tXVemyVCdcECj21rj3n1RgT//I5dOdML7S2JLZY2xI6YGn61
	+l1HLJWupjuIKbzoxZsx7TRBizkMUgjSh2uZzn/eUJNhnPqz5K27sRiMgK0/6fV/uc6u
	ieCXm723zT3Xu3As9NcE0FX83G6PtgiwttDNZZrOVQ13woACmbXFdrWA9mqfsXBRi4hU
	CD1rHD6B/E4IP4Kq66fW8N8Ecu83/my2ncyEuwJ1K96tNAe6jitLERcMnVcWFGhrikxZ
	zVyiC1zg8uBK38p5yxX1Ve1sb3+X2NdWs3Sk20d+2gcpl+AZ2ZJTO/aeod7FPQ3CZNMz
	6VKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=d4A101zkKdgxLw0I9YhgxdbWft+sxmajktb8PjDmsF4=;
	b=QczLwEUBIBYl+deunyAzFXE1+wqIOVV7ByKvD0ZGKNtBnooR2+ZlXF/loO2aQST4La
	71IrFMeqvVSxt5q76WpfbmYIF3zbNJPpBb77X2J+5gMAla751YqI/oirziXSzxG/Qwy+
	bLjb79V/WsAVKCppr6QVtEeJQtsnaRP1pMgpWFpxV1aDLkj1qo3oM32y1k6ObMZG56Lw
	1mJTh76MV6gdgkkDatoszHhBvqJSaHYQGafmHWl9Ccy7fzf/fuyqZ6Tb7VPLehTPgLE7
	PxN1TkJ3HcuoK9JUWptuezsEK1qMcqDR66+UiW+2y0a9/aDzSGq+TR0zvWFeByVC+1rP
	4Xsg==
X-Gm-Message-State: AOUpUlES2UlQrav95ucfMzvGadYERBl5oJ02D4p93lBsC2VPMhTqmpbC
	1+ygWaPpStPPKkBMn8AMurxculZ+
X-Google-Smtp-Source: AAOMgpc6w9F3CkkZ0xDj1CGSlpo89X6tgWBZJIyrTPTyJwJrCO5Vt/0aZvqTRdzJw+89xXMUwUS3Sg==
X-Received: by 2002:a1c:90e:: with SMTP id 14-v6mr1873880wmj.130.1531845571896;
	Tue, 17 Jul 2018 09:39:31 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	i125-v6sm15958wmd.11.2018.07.17.09.39.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Jul 2018 09:39:31 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jul 2018 17:39:10 +0100
Message-Id: <20180717163910.3196-15-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180717163910.3196-1-ross.burton@intel.com>
References: <20180717163910.3196-1-ross.burton@intel.com>
Subject: [PATCH 15/15] ca-certificates: upgrade 20170717 -> 20180409
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
X-List-Received-Date: Tue, 17 Jul 2018 16:39:31 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../{ca-certificates_20170717.bb => ca-certificates_20180409.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/ca-certificates/{ca-certificates_20170717.bb => ca-certificates_20180409.bb} (95%)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20170717.bb b/meta/recipes-support/ca-certificates/ca-certificates_20180409.bb
similarity index 95%
rename from meta/recipes-support/ca-certificates/ca-certificates_20170717.bb
rename to meta/recipes-support/ca-certificates/ca-certificates_20180409.bb
index 24d3a6e4d3e..0d57083c522 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20170717.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20180409.bb
@@ -5,7 +5,7 @@ This derived from Debian's CA Certificates."
 HOMEPAGE = "http://packages.debian.org/sid/ca-certificates"
 SECTION = "misc"
 LICENSE = "GPL-2.0+ & MPL-2.0"
-LIC_FILES_CHKSUM = "file://debian/copyright;md5=e7358b9541ccf3029e9705ed8de57968"
+LIC_FILES_CHKSUM = "file://debian/copyright;md5=aeb420429b1659507e0a5a1b123e8308"
 
 # This is needed to ensure we can run the postinst at image creation time
 DEPENDS = ""
@@ -14,7 +14,7 @@ DEPENDS_class-nativesdk = "openssl-native"
 # Need c_rehash from openssl and run-parts from debianutils
 PACKAGE_WRITE_DEPS += "openssl-native debianutils-native"
 
-SRCREV = "34b8e19e541b8af4076616b2e170c7a70cdaded0"
+SRCREV = "dbbd11e56af93bb79f21d0ee6059a901f83f70a5"
 
 SRC_URI = "git://salsa.debian.org/debian/ca-certificates.git;protocol=https \
            file://0002-update-ca-certificates-use-SYSROOT.patch \
-- 
2.11.0


