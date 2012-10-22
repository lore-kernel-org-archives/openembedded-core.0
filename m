Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TQEZN-0003iH-LC
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Oct 2012 11:45:13 +0200
Received: from mail-wi0-f197.google.com ([209.85.212.197])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 22 Oct 2012 02:31:49 -0700
Received: by mail-wi0-f197.google.com with SMTP id hr7so1778872wib.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2012 02:31:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=JvXxfLRlkSV3O7E6ipRK2M1/22ZUH5vUocbJl6p+IVw=;
	b=HgQSthvfP8P22cR7jhtPQapj6Kn/2VuEghWa4Ubr9gtVNi308lHBQomrxHy4mnZqLm
	AziyHxAancjzqTGyLVn++oXGroBgJ+jA6VxEUSC2hmJ7zB55bApbcSGsFqjr3+hMRu4e
	TFLed228hxDQSsV8IaWFXUwxrwJPsA98fC4rJA1hjzh2ozYk6G7xGNF6KorgfnXblyEU
	wl3sJrNERN6uulXxnH87Alf2BEX59esFKUSP5uuvrn2C7g6Hf+DiyMpCkiB32gh3bjSL
	Mj/Bb4kOHD0ejNSVLORPgkaOZZpHPHBr0IKjxO1xy9toA4NnwskK8K62qgyIU5sUxlln
	IzCA==
Received: by 10.216.207.73 with SMTP id m51mr5103004weo.116.1350898307215;
	Mon, 22 Oct 2012 02:31:47 -0700 (PDT)
Received: by 10.216.207.73 with SMTP id m51mr5102999weo.116.1350898307060;
	Mon, 22 Oct 2012 02:31:47 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id w8sm50203841wif.4.2012.10.22.02.31.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 22 Oct 2012 02:31:46 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Oct 2012 10:30:29 +0100
Message-Id: <af1365a98c78c547e373195e27c538f71c963dd3.1350898066.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1350898066.git.ross.burton@intel.com>
References: <cover.1350898066.git.ross.burton@intel.com>
In-Reply-To: <cover.1350898066.git.ross.burton@intel.com>
References: <cover.1350898066.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQm9+MOe348W6XZSU1ng+Ptuc7C2+2O6GGg8uCAZ2fzT6cvFrTnXLYyLiFHDhCah8jLDVdIDu+Rz39VydQstLf4avn3Q9tlyFaU1uQXZmL929Wmee5RqGLY45n0RVh6tXZGf44Gc1KyW/kVBGtZtYvW9YkudOJL3xNaykB3edDCnMQBux/DzJegGENEmMTf8/JYPkJOf
Subject: [PATCH 3/3] atk: Update to 2.6.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Oct 2012 09:45:13 -0000

From: Daniel Stone <daniel@fooishbar.org>

Newer Clutter releases want 2.5.3+, so upgrade to the stable 2.6.0.

Signed-off-by: Daniel Stone <daniel@fooishbar.org>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/atk/{atk_2.4.0.bb => atk_2.6.0.bb} |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-support/atk/{atk_2.4.0.bb => atk_2.6.0.bb} (74%)

diff --git a/meta/recipes-support/atk/atk_2.4.0.bb b/meta/recipes-support/atk/atk_2.6.0.bb
similarity index 74%
rename from meta/recipes-support/atk/atk_2.4.0.bb
rename to meta/recipes-support/atk/atk_2.6.0.bb
index 4a2d853..be797c7 100644
--- a/meta/recipes-support/atk/atk_2.4.0.bb
+++ b/meta/recipes-support/atk/atk_2.6.0.bb
@@ -7,15 +7,15 @@ LICENSE = "GPLv2+ & LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
                     file://atk/atkutil.c;endline=20;md5=db21b0bdbef9da4dc6eb122debc9f9bc \
                     file://atk/atk.h;endline=20;md5=c58238d688c24387376d6c69d06248a7"
-PR = "r1"
+PR = "r0"
 
 DEPENDS = "glib-2.0"
 
 inherit autotools gtk-doc pkgconfig
 
-SRC_URI = "http://download.gnome.org/sources/atk/2.4/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "2184a140f71d50276669d6eda5cce5db"
-SRC_URI[sha256sum] = "091e9ce975a9fbbc7cd8fa64c9c389ffb7fa6cdde58b6d5c01b2c267093d888d"
+SRC_URI = "http://download.gnome.org/sources/atk/2.6/${BPN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "6b34e2a63dda4429b5692be7ca3aa5bf"
+SRC_URI[sha256sum] = "eff663f90847620bb68c9c2cbaaf7f45e2ff44163b9ab3f10d15be763680491f"
 
 BBCLASSEXTEND = "native"
 
-- 
1.7.10



