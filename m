Return-Path: <george.mccollister@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id B4C3E71A84
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 18:08:42 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id u15so42270517oie.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Dec 2016 10:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7Afxs3w1VcuUyaXp2HS8XzZJVy1lFOQ4rCq7FO2JkZ0=;
	b=b5YYEi3pVvEsWLxC5EkLCWZtV4YrOG/jHDk1pnv+R+4jK1CAbqXBQd1E61T9PGR4wV
	WzsVFPIrLRIiHOoy8DEnTDLG71folrkAPeNGaHmIvkCGYhcBodxAGkXBGd0q1APc09sy
	PaNiK29x1D8tvG1h4zqtK//2mMLoJBSwQn7WQFXYLBKsAKD/1ZRP2zjMlC0fHiNOQ2RO
	S/K9ddEAYE8TyzBVoQCLqivUpp/GZGL23pdQD0/pb6DjXVli1eZOn6J2f92C2Nsh0kdi
	iurUiAzGtF9srygo6esbmohKzy7HiB/Xy9GSg2dPFLiQyB/2SiEyk41ddF0H/Ju8u27l
	N3Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7Afxs3w1VcuUyaXp2HS8XzZJVy1lFOQ4rCq7FO2JkZ0=;
	b=UIwOgzs1vDJGPT9nqYvsLrMykQEPVjBafY/4mlRyBYa1YgH9XvImzgMVTjzt/LMWE5
	fTSNIbCtebfvBVuRf1Kt06Ssp/tBpmmEGv6t86KqwauRSIfNUdlbV0gEJPWOjqk1ennw
	H/pISGaaXtkR6EW0Q4bfs3/CR0VjwqtR48CBznqIIPo4gFqBbxMBNMI2TQH7CrX4VUlk
	Drop1H1Og8L3K9rO2hggA6LtqJey3l11VGY0r9pt5DrJjw/9Injmw6MW9Q/Y1P0gHpTh
	P1VRjvQB3W6Hu9+reyAhbCRz5bHpWH4e7VrGuFzXHLrr/F+jBKgPe8iz2Kcmtc80UmxN
	Cg4Q==
X-Gm-Message-State: AKaTC00DETU5rWzJmOEuzGoDEkVNoh59ZfBVNZIrZ60I9yv+8zjPQjrGu32+QR+IVp6aHQ==
X-Received: by 10.36.155.194 with SMTP id o185mr3472870itd.71.1481047723487;
	Tue, 06 Dec 2016 10:08:43 -0800 (PST)
Received: from localhost.localdomain (216-21-169-52.slc.googlefiber.net.
	[216.21.169.52])
	by smtp.gmail.com with ESMTPSA id 17sm9417317ioh.12.2016.12.06.10.08.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Dec 2016 10:08:43 -0800 (PST)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Dec 2016 12:08:30 -0600
Message-Id: <8b52033562719fb4654f2d0c1fa49357722ff27f.1481047167.git.george.mccollister@gmail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1481047167.git.george.mccollister@gmail.com>
References: <cover.1481047167.git.george.mccollister@gmail.com>
Subject: [master][PATCH 1/2] python-3.5-manifest: Add imp to importlib
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
X-List-Received-Date: Tue, 06 Dec 2016 18:08:44 -0000

The imp python module is the forerunner of importlib. Include imp in
the importlib subpackage instead of the misc subpackage so that it can
be depended on without bringing in a bunch of unrelated, unused modules.

Signed-off-by: George McCollister <george.mccollister@gmail.com>
---
 meta/recipes-devtools/python/python-3.5-manifest.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python-3.5-manifest.inc b/meta/recipes-devtools/python/python-3.5-manifest.inc
index 851f12e..7fcd871 100644
--- a/meta/recipes-devtools/python/python-3.5-manifest.inc
+++ b/meta/recipes-devtools/python/python-3.5-manifest.inc
@@ -115,7 +115,7 @@ FILES_${PN}-image="${libdir}/python3.5/colorsys.* ${libdir}/python3.5/__pycache_
 
 SUMMARY_${PN}-importlib="Python import implementation library"
 RDEPENDS_${PN}-importlib="${PN}-core ${PN}-lang"
-FILES_${PN}-importlib="${libdir}/python3.5/importlib ${libdir}/python3.5/importlib/__pycache__ "
+FILES_${PN}-importlib="${libdir}/python3.5/importlib ${libdir}/python3.5/importlib/__pycache__ ${libdir}/python3.5/imp.* ${libdir}/python3.5/__pycache__/imp.* "
 
 SUMMARY_${PN}-io="Python low-level I/O"
 RDEPENDS_${PN}-io="${PN}-core ${PN}-math"
-- 
2.9.3


