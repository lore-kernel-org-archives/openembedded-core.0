Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 73F2D60BB5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 12:54:57 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id e10so5162517wrr.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 04:54:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=QEuMF6/X7pMYAPROnHDFxf3XiLPsSXOeww30ctndwEs=;
	b=OGHUvqP36pgKioVdOVhCsFHQYa3nLMkxt7c2YtGY2aJqet9Rb+Fx7z6zLJt4ZrxdbK
	l00ON9fjnJqcmISFfogQVEdCTADIu9BJcsV3iDKtWYziItoccoUkGoIOy1IhxiwogOP+
	pNtGHEZF3H7gMBOxSOUTx8ZpnYfvNZnIYFhdU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=QEuMF6/X7pMYAPROnHDFxf3XiLPsSXOeww30ctndwEs=;
	b=pkJTBWQ8YSQwQxxwycyPSJ70cIw7fVynfzV8+fYTBrP/aEoH52EARKQccn2zMi/MkJ
	ZCNN4BsCL3qu1nSEX6BOttnbJWg+5x4PTbJ7tPPUo0b/1tuPPK6pX5G1RCYWUWGafd1Q
	v1pWvsS6lTEFgGGKqtAfXCUF5KSMO9B6LSqSplIkGdE7dSyNj4Mfi8MvcGiGWrEexQFQ
	PRWoBkjWS3f2WvEH7WYHZPnBPZqHBtjs+0yZRy1jwHKbtsyUP3p5T5n5fFseDJhe7Pf+
	ABizDb0QxAlQIEQ4NMv1wsvwYXgKJKI5yANh8+4SLNZ0bxjq+z+kmAevphuuP2bfP2i0
	L8Aw==
X-Gm-Message-State: APjAAAXBTi1ZVOCFm/nhc74Hj551IzfxW9hrxM5ZBhr3Hr0au2Vm2VLA
	eUI4UYH2P5+l47NzmIhewCUxJsdlkOg=
X-Google-Smtp-Source: APXvYqzhrZEVenZYeRkEXs3LCl/CefJDFhK9NCiPQ3vOLbwAqpWJHUx82p6m1Y2ARUZFxhjI8OIVEA==
X-Received: by 2002:a05:6000:10c5:: with SMTP id
	b5mr5853010wrx.203.1582980897580; 
	Sat, 29 Feb 2020 04:54:57 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	e1sm2057998wrx.90.2020.02.29.04.54.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 29 Feb 2020 04:54:56 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 29 Feb 2020 12:54:55 +0000
Message-Id: <20200229125455.487874-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH] psplash: Update to latest git revision
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
X-List-Received-Date: Sat, 29 Feb 2020 12:54:57 -0000
Content-Transfer-Encoding: 8bit

Image files are always generated now so make the gdk-pixbuf dependency
required.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/psplash/psplash_git.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index 6ff0393194a..779f0f6da83 100644
--- a/meta/recipes-core/psplash/psplash_git.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -4,8 +4,9 @@ HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/psplash"
 SECTION = "base"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://psplash.h;beginline=1;endline=8;md5=8f232c1e95929eacab37f00900580224"
+DEPENDS = "gdk-pixbuf-native"
 
-SRCREV = "773a3977d255e8f59a741ad6ce37c4d40f1feaa1"
+SRCREV = "aea172a24c5b0bdc0f4efa780c0faa00c9238362"
 PV = "0.1+git${SRCPV}"
 PR = "r15"
 
@@ -13,6 +14,7 @@ SRC_URI = "git://git.yoctoproject.org/${BPN} \
            file://psplash-init \
            file://psplash-start.service \
            file://psplash-systemd.service \
+           file://fix.patch \
            ${SPLASH_IMAGES}"
 UPSTREAM_CHECK_COMMITS = "1"
 
@@ -49,9 +51,6 @@ python __anonymous() {
     d.setVar("SPLASH_INSTALL", " ".join(pkgs))
     d.setVar("SPLASH_LOCALPATHS", " ".join(localpaths))
 
-    if haspng:
-        d.appendVar("DEPENDS", " gdk-pixbuf-native")
-
     d.prependVar("PACKAGES", "%s " % (" ".join(pkgs)))
     mlprefix = d.getVar('MLPREFIX') or ''
     pn = d.getVar('PN') or ''
-- 
2.25.0


