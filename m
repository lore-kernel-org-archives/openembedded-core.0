Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 815597BE58
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 05:54:51 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id t13so5555280pgr.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Dec 2018 21:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=iai6paF5HF9xgQz0m1+rKae2GKfmXTMR6jdXC/iRT18=;
	b=Kz3T/OOgd/g2tIgIy8dFm5I5Bj3mboolzyKzTG3x7dLIBRPnBPeJnqW32C7WB01Yx3
	fXJ0i1mJulyq9OZBFx9Hn75wofBWN2S6Xe/MnydMYjXiC6A88rF85Hu32/3Exm5BXIxt
	J4F7+0dIKqPu2F+zpeg0NWJoaMFOrhAfr052gBh6qCj6Clt6A9eOT6ZSOvgExeXO30oh
	aZ382Dtb4llBVyfuvA12x6HL+74NzHwn6qx5PV4f6ksQRtuYCogQOLTNd3zZCWL5Hp/M
	CjKwfGiN3vlS4LqmqJgUmvKMBA30qL9aGTT4oC48vxq9ELhWhr9UCZaxuliLQs3i0RU9
	l5Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=iai6paF5HF9xgQz0m1+rKae2GKfmXTMR6jdXC/iRT18=;
	b=UwCUM1n5owbIBOvoXFoK9mvffwYrKCoiaAKyXmiqBNDbFD9XB7cThlP6GqTHl/clWf
	irAyUmWEybpvLV0T2jIqRXZaVHIxJNJzttXYq0SwgOECVU+ksGypx2W3Xu12hyDtaSTb
	WlHhOSo47kkOe5mXytQdSg7gNhkmD3iQJSc3Acv8HKTWF9yyOoRi7HKy/sgVpK+GB6yI
	4fDwWKzAmMa0vqN0AUA4zfF8a+NQ6jq3SgVIs0tkewdjIc6cJ6H6Zl88gvU4GMe1JvGm
	73eJv7DEOi/patT97Rd/r1ijg28aIqyBbGFvyS2pKkhzZYG4NKgd0Ixoqwj8aSwdp8q5
	5P2Q==
X-Gm-Message-State: AA+aEWbPysEGQhARqpz9OE9Hwe5qCIzVXqgt3+nB8gG5u+/+eONi9MkG
	oqnKOmbqSdRC4Y+8rBhFGphhaCA2uNM=
X-Google-Smtp-Source: AFSGD/Wpn1ooTH2Su31ECS5qlUpltfEq6KNsYHxESEVIdmh5355MSfnjtCvZqGq0sO2xcE2LFq47Lw==
X-Received: by 2002:a63:a452:: with SMTP id c18mr11267757pgp.204.1545026092275;
	Sun, 16 Dec 2018 21:54:52 -0800 (PST)
Received: from localhost.localdomain ([2601:646:877f:9499::6872])
	by smtp.gmail.com with ESMTPSA id
	u126sm21263551pgb.2.2018.12.16.21.54.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 16 Dec 2018 21:54:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 16 Dec 2018 21:54:41 -0800
Message-Id: <20181217055442.13735-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20181217055442.13735-1-raj.khem@gmail.com>
References: <20181217055442.13735-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] libxcrypt: Upgrade to 4.4.1 release
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
X-List-Received-Date: Mon, 17 Dec 2018 05:54:52 -0000
Content-Transfer-Encoding: 8bit

License-Update: New files added to existing list

Add -Wno-error=missing-attributes to compiler flags, this helps in
compiling with gcc 9.0, eventually, the code should be fixed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libxcrypt/{libxcrypt_4.1.1.bb => libxcrypt_4.4.1.bb}   | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-core/libxcrypt/{libxcrypt_4.1.1.bb => libxcrypt_4.4.1.bb} (75%)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt_4.1.1.bb b/meta/recipes-core/libxcrypt/libxcrypt_4.4.1.bb
similarity index 75%
rename from meta/recipes-core/libxcrypt/libxcrypt_4.1.1.bb
rename to meta/recipes-core/libxcrypt/libxcrypt_4.4.1.bb
index 465aa96523..8dcda25e6d 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt_4.1.1.bb
+++ b/meta/recipes-core/libxcrypt/libxcrypt_4.4.1.bb
@@ -3,13 +3,14 @@ DESCRIPTION = "Forked code from glibc libary to extract only crypto part."
 HOMEPAGE = "https://github.com/besser82/libxcrypt"
 SECTION = "libs"
 LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM ?= "file://LICENSING;md5=cb3ca4cabd2447a37bf186fad6f79852 \
+LIC_FILES_CHKSUM ?= "file://LICENSING;md5=e28ba6195a4e39904919b78a92bcf27e \
       file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
 "
 
 inherit autotools pkgconfig
 
-SRCREV ?= "21b455b68baad279e6a3936faced16c5e5634376"
+# v4.4.1
+SRCREV ?= "b8714d4e9e37cf0d511917bd5eea0e51e4a397d5"
 SRCBRANCH ?= "develop"
 
 SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH} \
@@ -22,6 +23,6 @@ FILES_${PN} = "${libdir}/libcrypt*.so.* ${libdir}/libcrypt-*.so ${libdir}/libowc
 S = "${WORKDIR}/git"
 
 BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE} -std=gnu99"
-TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${includedir}"
+TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${includedir} -Wno-error=missing-attributes"
 
 BBCLASSEXTEND = "nativesdk"
-- 
2.20.1


