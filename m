Return-Path: <geissonator@gmail.com>
Received: from mail-yb1-f194.google.com (mail-yb1-f194.google.com
	[209.85.219.194])
	by mail.openembedded.org (Postfix) with ESMTP id BF2F079671
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 20:40:31 +0000 (UTC)
Received: by mail-yb1-f194.google.com with SMTP id e18-v6so2343603ybq.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 13:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=zACWNa0I7Qnh+U86tmOGMs7gbCs5yB7puBR0vZYP3t0=;
	b=bNGCj9gKHp0MN8a4Dtf+Y8n5HY2vBKCWK0ZD1KSjh/7NuyPnLQcgqCKQwJWf/ywLaK
	IpvLjWd16BXn7IbRf6F2zYxV18x19XI5uymUASdEqm1gSGPvhmH2kScgmsZn208z7KR/
	NuI+Y18B4VdXESY/uKTX2GvuoJ68z8Ba2ghFl/22qFT4OQ9rREpKGTIia7I++7sBf9W5
	Gfu0TYUu6OYf1D83fHf2mff894wSW3Tc2mSvfrCS+HUe/hT2atCn7mFJ4fOSdrPfxlX9
	CmsIjFtc9wRyGFCYZY77h1ypknPDeb96UG6KmKI4JSoDG/iI2d+MwWshxE2T2IJm8lml
	GKuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zACWNa0I7Qnh+U86tmOGMs7gbCs5yB7puBR0vZYP3t0=;
	b=fXSoPV8n07nrf56JxagGj1+iQxeQ6VkViq5fqS/XPFWQ7NFuFCu9daei6ltw5f5HSd
	MoJqLTAtdUbnrzhpACHYQFeKEi6IEZchMko7tVJw4M0WtJ1KsK3t9YCu0GXOxC1ZOdss
	BygFubL+bv5LsVgC2aGlqPYCe5fbgyAeuMXEN+KWaoeRza/UyI4toKuCgp6xT7x+Zust
	k2kyGxlyuoAq92hKgGhUicxKBjP95vKwy+XwXp2r/9xbUzDNY4q6eTxahAw4s0ANO/dy
	QCJq++5LVeTo9n3DZQqMS9RM/gaVXY4Z+xgCFay5CYphxkqrKFiso8GYUTXp0hwV2pwk
	Ba7Q==
X-Gm-Message-State: APzg51DBEe8r5XWadxvMsYGstfvkCDAvxUCNC2ntJSXoIw1idZArv0X3
	qUw3k5MPpdAeG4mQDKiOEshVJcDK
X-Google-Smtp-Source: ANB0VdYAwcdu4tyHYgbTLg6X7KGXRiWkiA1FndEihhJGawtNVxK9UEB6i5nRhOHwctQAdGlTGXkWSQ==
X-Received: by 2002:a25:ad93:: with SMTP id
	z19-v6mr1855185ybi.479.1536784832354; 
	Wed, 12 Sep 2018 13:40:32 -0700 (PDT)
Received: from andrewg-VirtualBox.ibm.com
	(45-18-127-186.lightspeed.austtx.sbcglobal.net. [45.18.127.186])
	by smtp.gmail.com with ESMTPSA id
	r84-v6sm1297031ywe.10.2018.09.12.13.40.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 12 Sep 2018 13:40:31 -0700 (PDT)
From: Andrew Geissler <geissonator@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Sep 2018 13:40:24 -0700
Message-Id: <1536784825-4476-1-git-send-email-geissonator@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Andrew Geissler <geissonator@gmail.com>,
	alejandro.enedino.hernandez-samaniego@xilinx.com
Subject: [PATCH 1/2] python/python3: Remove trailing white spaces
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
X-List-Received-Date: Wed, 12 Sep 2018 20:40:32 -0000

Noticed these in my diff when adding some new changes
to these files.

Signed-off-by: Andrew Geissler <geissonator@gmail.com>
---
 meta/recipes-devtools/python/python3_3.5.5.bb | 2 +-
 meta/recipes-devtools/python/python_2.7.15.bb | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.5.5.bb b/meta/recipes-devtools/python/python3_3.5.5.bb
index 40896db..c919a97 100644
--- a/meta/recipes-devtools/python/python3_3.5.5.bb
+++ b/meta/recipes-devtools/python/python3_3.5.5.bb
@@ -137,7 +137,7 @@ do_compile() {
 		-e 's,^INCLUDEDIR=.*,INCLUDE=${STAGING_INCDIR},g' \
 		-e 's,^CONFINCLUDEDIR=.*,CONFINCLUDE=${STAGING_INCDIR},g' \
 		Makefile
-	# save copy of it now, because if we do it in do_install and 
+	# save copy of it now, because if we do it in do_install and
 	# then call do_install twice we get Makefile.orig == Makefile.sysroot
 	install -m 0644 Makefile Makefile.sysroot
 
diff --git a/meta/recipes-devtools/python/python_2.7.15.bb b/meta/recipes-devtools/python/python_2.7.15.bb
index 43d9ff5..82b65d2 100644
--- a/meta/recipes-devtools/python/python_2.7.15.bb
+++ b/meta/recipes-devtools/python/python_2.7.15.bb
@@ -75,7 +75,7 @@ do_compile() {
 		-e 's,^INCLUDEDIR=.*,INCLUDE=${STAGING_INCDIR},g' \
 		-e 's,^CONFINCLUDEDIR=.*,CONFINCLUDE=${STAGING_INCDIR},g' \
 		Makefile
-	# save copy of it now, because if we do it in do_install and 
+	# save copy of it now, because if we do it in do_install and
 	# then call do_install twice we get Makefile.orig == Makefile.sysroot
 	install -m 0644 Makefile Makefile.sysroot
 
@@ -107,7 +107,7 @@ do_install() {
 		STAGING_INCDIR=${STAGING_INCDIR} \
 		STAGING_BASELIBDIR=${STAGING_BASELIBDIR} \
 		DESTDIR=${D} LIBDIR=${libdir}
-	
+
 	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/python-native/pgen \
 		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python-native/python \
 		CROSSPYTHONPATH=${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/ \
-- 
2.7.4


