Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 90819606E8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Aug 2015 18:20:57 +0000 (UTC)
Received: by pdbfa8 with SMTP id fa8so47557474pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Aug 2015 11:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=eRC6VoMF2r4+V6DY+AUh5sdBFtDHxrj7Fmx10vpXE+c=;
	b=zoDCbNEiSG8KXxKRcXJC8Z3Mn3bmfnGC7yChsv4LdlLby7f1BBqi0n8lEIedgBd9LP
	gonCb0KPWak1Znp+Ul7n/bneqi9nMbAqz5IGWkm8W7QiIaKcBW/vgqW8PfBi4uI7VTTN
	1XopQRq41q2xWCIrZoSu2cOfPcQBd7HB7Zc1Z/m7ui4zvphy2QBpn6LMZ001d/ISRj7B
	RiXISqbzRFDnOqcoeqTvCxseChLO/H6ESClcDv48e/FjqQcOocD7B3fGWXQbp6xBrp+n
	rE2ecXgqZYWebcOhpwMDBn/cdO7TmvyPS9aywsRmjCUyxn6+GyyaEW0w55g4R7H642f6
	FgAw==
X-Received: by 10.70.108.198 with SMTP id hm6mr111044315pdb.12.1439749257633; 
	Sun, 16 Aug 2015 11:20:57 -0700 (PDT)
Received: from haswell.localdomain ([2601:646:8601:4580:baca:3aff:fe80:aa8f])
	by smtp.gmail.com with ESMTPSA id
	s13sm12053365pdi.70.2015.08.16.11.20.57
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 16 Aug 2015 11:20:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 16 Aug 2015 11:30:02 -0700
Message-Id: <1439749803-26868-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1439749803-26868-1-git-send-email-raj.khem@gmail.com>
References: <1439749803-26868-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 2/3] libunistring: Upgrade recipe 0.9.4 -> 0.9.5
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
X-List-Received-Date: Sun, 16 Aug 2015 18:21:00 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{libunistring_0.9.4.bb => libunistring_0.9.5.bb}             | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)
 rename meta/recipes-support/libunistring/{libunistring_0.9.4.bb => libunistring_0.9.5.bb} (87%)

diff --git a/meta/recipes-support/libunistring/libunistring_0.9.4.bb b/meta/recipes-support/libunistring/libunistring_0.9.5.bb
similarity index 87%
rename from meta/recipes-support/libunistring/libunistring_0.9.4.bb
rename to meta/recipes-support/libunistring/libunistring_0.9.5.bb
index 289c813..45cf633 100644
--- a/meta/recipes-support/libunistring/libunistring_0.9.4.bb
+++ b/meta/recipes-support/libunistring/libunistring_0.9.5.bb
@@ -13,17 +13,16 @@ DESCRIPTION = "Text files are nowadays usually encoded in Unicode, and may\
 
 HOMEPAGE = "http://www.gnu.org/software/libunistring/"
 SECTION = "devel"
-LICENSE = "GPLv3&LGPLv3"
+LICENSE = "GPLv3 & LGPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://COPYING.LIB;md5=6a6a8e020838b23406c81b19c1d46df6" 
+                    file://COPYING.LIB;md5=6a6a8e020838b23406c81b19c1d46df6"
 
 SRC_URI = "${GNU_MIRROR}/libunistring/libunistring-${PV}.tar.gz \
            file://iconv-m4-remove-the-test-to-convert-euc-jp.patch \
            file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
 "
-
-SRC_URI[md5sum] = "c24a6a3838d9ad4a41a62549312c4226"
-SRC_URI[sha256sum] = "f5246d63286a42902dc096d6d44541fbe4204b6c02d6d5d28b457c9882ddd8a6"
+SRC_URI[md5sum] = "1a705bcdcb83799d544137617b377cfd"
+SRC_URI[sha256sum] = "1a8c0772467850bef7197318a95f44abbb678ea83cbf119a3500cc7848276a17"
 
 inherit autotools texinfo
 BBCLASSEXTEND = "native nativesdk"
-- 
2.5.0


