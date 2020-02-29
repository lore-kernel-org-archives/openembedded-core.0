Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id D034B61A0C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 12:56:55 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id v2so6536624wrp.12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 04:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ZZMrVc0TseupwS+Djz/RhB/gPnuYhuqa/8uCLDQ2tBM=;
	b=EwKpLR9NK2v6y/TH6qnhxIPEKKWqJWHpHN7R/0sEtpDiyN7qTFZaXlgkc5Z1QFhJ59
	L19bw+pO21L+2uCIqP3t7VErTRVbuALSiu4i6MvW/sYR1qJvHBMmNNchccCKYsNCBZmu
	Kd2XJolN95ubIrmFGP05xLg4437WSdj0yg+Kc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ZZMrVc0TseupwS+Djz/RhB/gPnuYhuqa/8uCLDQ2tBM=;
	b=nORRyOGNHXYU4N5sY+QY8KE/cLxZDxAw2BCd5EP/abzOnba4yvO5ZAz7oO2CFfqegL
	fJU+ItPIdsitBEMWm6U3xIMtPue8HD0wJZizKtoSNY1j0asqvhAnmOkCj6hHDUygkLT8
	yCK32cXO6lRAAgyMi0AV6WqoxPyus9ImNhXtHSA80j501fqCsX3/hmqYDsstBQAp3HBB
	SucRUd73aHyheHUqo2J+S85h0Cgl+HZK6r+KYIGAb0cLMKoCh8L/ack7oxqi+dl6LPKp
	LKYrgjNRjwVmimEYGksqAC07rMIfinYAIXmwlWgtk0yGVKsaVo4Ujub8OZ1bGrfwX6Sc
	b9zw==
X-Gm-Message-State: APjAAAXVRKCwQdk3QMOCFbKQb0lq9FdHjZwpvjnbczDTCBGT2wREapJz
	0tAAEUCIeX9bK/1Rv8spg30KhEbi+9o=
X-Google-Smtp-Source: APXvYqwBTvSOxek2W4/LZmxAsfMiZLlw/xMVOCqoH4fnot+RkLSL3tZJuoghWmVlScpBroXYtXE1vw==
X-Received: by 2002:adf:ee03:: with SMTP id y3mr10979689wrn.5.1582981016146;
	Sat, 29 Feb 2020 04:56:56 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	b18sm17124121wru.50.2020.02.29.04.56.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 29 Feb 2020 04:56:55 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 29 Feb 2020 12:56:54 +0000
Message-Id: <20200229125654.488036-1-richard.purdie@linuxfoundation.org>
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
X-List-Received-Date: Sat, 29 Feb 2020 12:56:56 -0000
Content-Transfer-Encoding: 8bit

Image files are always generated now so make the gdk-pixbuf dependency
required.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/psplash/psplash_git.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index 6ff0393194a..875adb13fc2 100644
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
 
@@ -49,9 +50,6 @@ python __anonymous() {
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


