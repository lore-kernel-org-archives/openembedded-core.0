Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id 9176376FC4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Jan 2016 16:28:05 +0000 (UTC)
Received: by mail-qg0-f46.google.com with SMTP id o11so79942441qge.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Jan 2016 08:28:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=C4kY6PtxldnyYCkMYGiKUFwsOz6lg/fyM41ZXuRVfKY=;
	b=UJTUMG245LglBsNMaohuz7NSDTedcKDtR/QdTlOnHyx6cGs69YTZ7hk/fvF7O8Ejki
	hF0BBFt62OIdgty6uhXqVwHkQDuegylX1jPxwQ7Wt3xNKYqafp9IIaNmkmv2506pKqP+
	3vLc41kQkvYm86GJHNnsxWB8LNtCMRZ+A2LdEKeE5oBfLfUFtCZEzcyBSZu4ugIjp+Q7
	9Jtev5tCm8aRG6OQ/czdTebcwehD2zNSqBelzSfXKwXQvdptKczPIikQ40YHoKhWYbCR
	Nkwa3I/1QXrjk2vFbPAWXzV5jPI4z2XIG51+rmzcIvjjh8CExgb1HKlC617HurTpGaCp
	+Fgg==
X-Gm-Message-State: AG10YOQrXfDBJenpLZg8Ct90SwS2StXDSwLF8nwQh6cbNEnCp9NNAvPxlasL7RLF3/wlzQ==
X-Received: by 10.140.101.130 with SMTP id u2mr11515267qge.71.1453566486366;
	Sat, 23 Jan 2016 08:28:06 -0800 (PST)
Received: from build-slave.star.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	s64sm5169844qgd.28.2016.01.23.08.28.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 23 Jan 2016 08:28:05 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Date: Sat, 23 Jan 2016 11:27:57 -0500
Message-Id: <1453566477-30040-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python-ujson: update to 1.35
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
X-List-Received-Date: Sat, 23 Jan 2016 16:28:08 -0000

  - source file extension change
  - license updated for whitespace modifications and author entity name change
---
 .../python/{python-ujson_1.33.bb => python-ujson_1.35.bb}         | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python-ujson_1.33.bb => python-ujson_1.35.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python-ujson_1.33.bb b/meta-python/recipes-devtools/python/python-ujson_1.35.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python-ujson_1.33.bb
rename to meta-python/recipes-devtools/python/python-ujson_1.35.bb
index 8fdd2b8..8cd7858 100644
--- a/meta-python/recipes-devtools/python/python-ujson_1.33.bb
+++ b/meta-python/recipes-devtools/python/python-ujson_1.35.bb
@@ -3,16 +3,16 @@ DESCRIPTION = "UltraJSON is an ultra fast JSON encoder and decoder written in pu
 HOMEPAGE = "https://pypi.python.org/pypi/ujson"
 
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=5b206f6ba5e41c60df8cdcddf79a3d82"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=008b4463162884ce4a43480de2e750f4"
 
 SRCNAME = "ujson"
 
 SRC_URI = " \
-    http://pypi.python.org/packages/source/u/ujson/${SRCNAME}-${PV}.zip \
+    http://pypi.python.org/packages/source/u/ujson/${SRCNAME}-${PV}.tar.gz \
 "
 
-SRC_URI[md5sum] = "8148a2493fff78940feab1e11dc0a893"
-SRC_URI[sha256sum] = "68cf825f227c82e1ac61e423cfcad923ff734c27b5bdd7174495d162c42c602b"
+SRC_URI[md5sum] = "42f77b0cce686dfa4da2e68480b1dd24"
+SRC_URI[sha256sum] = "f66073e5506e91d204ab0c614a148d5aa938bdbf104751be66f8ad7a222f5f86"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.9.1


