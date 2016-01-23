Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8D1057708E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Jan 2016 23:10:25 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id q184so3930502qkb.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Jan 2016 15:10:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=njHvwblbOvK52uND8S1cihkqdhRaBE492pWuQHfgAII=;
	b=hEk3hLd+iXNLh+2CwELVsuHevs3wT5T6SVDOEm18gb1DMCC+HB8B+Hh2N4rQ4OUj0L
	hlGiW75LBbmKCKEp9tNDKwLmEdiqxLad7cXvdmiVckPsbmsRfXrFWNOJTklzXwbbm7aU
	J+nxmcdUCjZYPjJ8LAkPdtmzlW0b/l9s4P6J12fPNqS98MnK3gDtkLbt3B78t6GFU7zW
	aJoiv97Vhyl6Szz9dx0V958w30t9N4nLVxxMUxZS7K9TdE8Yd6/dysM494hb7CoJ19/W
	YrrXWfdQTdWBHoAyGVpKy0BcApkFi1/Me+trlXK2KvyFB0DGB/NTMxUGBchY/UFbaAU5
	WguA==
X-Gm-Message-State: AG10YOTASYJ9yccsnWoBpRdPdoQnwxBICWwrs77KjCbiYo0ietaSLUFfUrzxSIWooYT4wg==
X-Received: by 10.55.79.69 with SMTP id d66mr12628977qkb.76.1453590625958;
	Sat, 23 Jan 2016 15:10:25 -0800 (PST)
Received: from build-slave.star.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id 67sm5769501qht.14.2016.01.23.15.10.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 23 Jan 2016 15:10:25 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Date: Sat, 23 Jan 2016 18:10:10 -0500
Message-Id: <347b26573030e61fd3ba63e0fe971be4c1ef08b6.1453589999.git.derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1453589999.git.derek@asterius.io>
References: <cover.1453589999.git.derek@asterius.io>
In-Reply-To: <cover.1453589999.git.derek@asterius.io>
References: <cover.1453589999.git.derek@asterius.io>
Subject: [meta-python][PATCH 13/13] python-flufl-enum: update to 4.1
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
X-List-Received-Date: Sat, 23 Jan 2016 23:10:29 -0000

---
 .../python/{python-flufl-enum_4.0.1.bb => python-flufl-enum_4.1.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-flufl-enum_4.0.1.bb => python-flufl-enum_4.1.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python-flufl-enum_4.0.1.bb b/meta-python/recipes-devtools/python/python-flufl-enum_4.1.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python-flufl-enum_4.0.1.bb
rename to meta-python/recipes-devtools/python/python-flufl-enum_4.1.bb
index 458d244..bafa1f7 100644
--- a/meta-python/recipes-devtools/python/python-flufl-enum_4.0.1.bb
+++ b/meta-python/recipes-devtools/python/python-flufl-enum_4.1.bb
@@ -4,12 +4,12 @@ specific, concise semantics in an easy to read and write syntax. flufl.enum has
 features needed to make enumerations useful, but without a lot of extra baggage to weigh them down. "
 
 LICENSE = "LGPLv3"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=1fa25baed15d3be23c902636379438e8"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=04363ba21b0f5ce3af8daa2e5aae431f"
 
 PYPI_PACKAGE = "flufl.enum"
 
-SRC_URI[md5sum] = "b3ad23761a78232bc78499ced7cb85d9"
-SRC_URI[sha256sum] = "4af7e7cf2dcc7517251570c7ef9ad194e30ee4b6f860eba500c03954ae95f9d8"
+SRC_URI[md5sum] = "461779384c07ed2b5f554a5d51a000c4"
+SRC_URI[sha256sum] = "94da1413ba085473652f81565847913ea1543d1739972ecbd6afe57d7b1b68b4"
 
 inherit pypi setuptools
 
-- 
1.9.1


