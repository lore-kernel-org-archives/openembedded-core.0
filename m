Received: from mail-la0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TcSdx-0008Ie-PB
	for openembedded-core@lists.openembedded.org;
	Sun, 25 Nov 2012 04:12:29 +0100
Received: by mail-la0-f47.google.com with SMTP id u2so7328867lag.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Nov 2012 18:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=b3ttv/AdNBfP6R9YsWH2BNoX5V7+jgdHgt6Hj4dbdIk=;
	b=g7c7j3Cb3Spl0v15zFdlPHeDVwOcZe25wUyxbBZiikcOCvzgJ8z+k04UAnRkqZX1cA
	RyTTnfVq6aqBVDL650znBo0AspLNIMwWf2Aq07SLNaRl9a+H1rd3Gvk3vxSgTUf6nT6e
	DMV/UfInqLTwgOuqu8BXiyoCJ8xbrSZ73OPHeSwbDYQYewJj+bJCEleU4eNMQz0SAipV
	m0qu1QlZBhGwZHnSn++4ylQNVPkTtnIrfuY5uGbw+RYa5zdCuyryU4eDVluVetHCpr8t
	iKAy7G0DedIutRGJ8kDZs9O5DhcDnphzmrBDphbgJObbyhmclMIxmyyozwNdmpCqkut0
	X/Bw==
Received: by 10.152.110.74 with SMTP id hy10mr7288586lab.54.1353812299806;
	Sat, 24 Nov 2012 18:58:19 -0800 (PST)
Received: from prime (a91-153-8-136.elisa-laajakaista.fi. [91.153.8.136])
	by mx.google.com with ESMTPS id t5sm4083714lbf.6.2012.11.24.18.58.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 24 Nov 2012 18:58:18 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TcSQC-00073G-Q9; Sun, 25 Nov 2012 04:58:16 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 25 Nov 2012 04:57:22 +0200
Message-Id: <1353812242-27313-2-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1353812242-27313-1-git-send-email-cazfi74@gmail.com>
References: <1353812242-27313-1-git-send-email-cazfi74@gmail.com>
Subject: [PATCH] automake: update to upstream version 1.12.5
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
X-List-Received-Date: Sun, 25 Nov 2012 03:12:29 -0000

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../automake/{automake_1.12.3.bb => automake_1.12.5.bb}          |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/automake/{automake_1.12.3.bb => automake_1.12.5.bb} (90%)

diff --git a/meta/recipes-devtools/automake/automake_1.12.3.bb b/meta/recipes-devtools/automake/automake_1.12.5.bb
similarity index 90%
rename from meta/recipes-devtools/automake/automake_1.12.3.bb
rename to meta/recipes-devtools/automake/automake_1.12.5.bb
index aaa5ee5..76e2b87 100644
--- a/meta/recipes-devtools/automake/automake_1.12.3.bb
+++ b/meta/recipes-devtools/automake/automake_1.12.5.bb
@@ -25,10 +25,10 @@ SRC_URI += "${PATHFIXPATCH} \
 	    file://python-libdir.patch \
             file://py-compile-compile-only-optimized-byte-code.patch"
 
-SRC_URI[md5sum] = "d2af8484de94cdee16d89c50aaa1c729"
-SRC_URI[sha256sum] = "095ffaa3ac887d1eb3511bf13d7f1fc9ec0503c6a06aeae05c93730cdda9a5a0"
+SRC_URI[md5sum] = "674f6d28f8723e0f478cb03de30f36f1"
+SRC_URI[sha256sum] = "82089e23b384d3e64efa4f09f133a02dadb91c0593d4f1d4e12c29d806be9925"
 
-PR = "r2"
+PR = "r0"
 
 do_install () {
     oe_runmake 'DESTDIR=${D}' install
-- 
1.7.10.4



