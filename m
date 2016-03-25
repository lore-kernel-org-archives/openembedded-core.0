Return-Path: <net147@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id DD0996072C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Mar 2016 11:33:50 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id fe3so44939556pab.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Mar 2016 04:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=l+ZaIRQTTM4x+SnTyXKW6jyEdoYE4gC8LHvj818hQ94=;
	b=YhmAt/29Hckg0jZsmpMQk5P3u54gtcyw/3piUAcl0J7M8BUrdtR/Rgb02ZMuaIaac8
	RmFf73TmOM32GQfHk9Tydy+CTTxErIeTjUwXeCR12yskSP+19uefsWg0zVOsrt+xQqDJ
	D2aYiilPz9O1uHddNTnJ+Qaai1DUxOeO+QomPsNY+Uk9N1Tv98NgE2dFx1tD+VCOhBr4
	M3dhuvckO/SjrjMV1n7wObvtRk0nWHpJS51llNyyYYJxo9pReBY9NrfMdAFgg4GzMU/L
	mCouqEuHh2R5LtNObeQYwqOROc1XQcawqPGxJXzsJXqje2UOkT69FwIeudrvSSQFhBSy
	zkXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=l+ZaIRQTTM4x+SnTyXKW6jyEdoYE4gC8LHvj818hQ94=;
	b=FcJ8Dv8LWxAWqA7w6NTY5LXhFor20/iJTt+oNINl9/GiWI8OX5WnkRAp2fEn1toCHh
	ITPOoZCJwy7AHDYu5rPUKFX0dPSKDD67rLlsZj/nRr9lw3myS1Dt8PUR/G4XG8KSYiTE
	aTsUjyRXgVgagPr8mf5nBJUaLxp657tArrbed/9SfOrqR4MndET/Dx500nZwXqfzV/QB
	iSMAh5CgVIlhZQGxua6M1kETrxuh9IXA0zoOzeUSAvMwwCRBtk/8Q8adQSCPT31I+VdM
	UqdcnM8QJKvUCkTwp8J1abJNs6vykixpdBeryXv0bowUPnmrEcQbsuYWjLR/nbJLCVyT
	NrbA==
X-Gm-Message-State: AD7BkJLku2a86qXGlAp921yE+IDxsZhFy8u/snYtsUysn+G8a1lTwissDdQGxqGclxfNmw==
X-Received: by 10.66.100.196 with SMTP id fa4mr20349222pab.37.1458905631385;
	Fri, 25 Mar 2016 04:33:51 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	o71sm15970441pfj.68.2016.03.25.04.33.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Mar 2016 04:33:50 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Mar 2016 22:33:20 +1100
Message-Id: <1458905600-21185-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] gdb-cross-canadian: use PACKAGECONFIG for python and readline
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
X-List-Received-Date: Fri, 25 Mar 2016 11:33:52 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-devtools/gdb/gdb-cross-canadian.inc | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
index ae97759..6e42af1 100644
--- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
+++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
@@ -5,15 +5,17 @@ SUMMARY = "GNU debugger (cross-canadian gdb for ${TARGET_ARCH} target)"
 PN = "gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 BPN = "gdb"
 
-DEPENDS = "nativesdk-ncurses nativesdk-expat nativesdk-gettext nativesdk-readline nativesdk-python \
+DEPENDS = "nativesdk-ncurses nativesdk-expat nativesdk-gettext \
            virtual/${HOST_PREFIX}gcc-crosssdk virtual/${HOST_PREFIX}binutils-crosssdk virtual/nativesdk-${HOST_PREFIX}libc-for-gcc"
 
-RDEPENDS_${PN} += "nativesdk-python-core nativesdk-python-lang nativesdk-python-re \
-                   nativesdk-python-codecs nativesdk-python-netclient"
-
 GDBPROPREFIX = "--program-prefix='${TARGET_PREFIX}'"
 
-EXTRA_OECONF_append = " --with-python=${WORKDIR}/python"
+# Overrides PACKAGECONFIG variables in gdb-common.inc
+PACKAGECONFIG ??= "python readline"
+PACKAGECONFIG[python] = "--with-python=${WORKDIR}/python,--without-python,nativesdk-python, \
+                         nativesdk-python-core nativesdk-python-lang nativesdk-python-re \
+                         nativesdk-python-codecs nativesdk-python-netclient"
+PACKAGECONFIG[readline] = "--with-system-readline,--without-system-readline,nativesdk-readline"
 
 SSTATE_DUPWHITELIST += "${STAGING_DATADIR}/gdb"
 
-- 
2.7.4


