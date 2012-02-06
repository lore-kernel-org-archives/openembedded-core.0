Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RuW6m-0004yr-CO
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Feb 2012 22:28:20 +0100
Received: by yhfq46 with SMTP id q46so2607902yhf.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Feb 2012 13:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Mw48IosyjnRrVHvAia03sDiJx8JmlT5yzT+Vbq0LLCM=;
	b=X27SbDDMUuG5d3DHPs03VqmKC/Exkyf2o9sp1hNHoxykQlnrazQTvBH1nEXRbvo2ZF
	aJyqvUjqimj1bACsdXVgKIeNS5K+G7KT2tcjzSqw+6im2wNeI1SNOtEr25YpcYS2uc95
	WkHjCPJZLmpquChxcdehWl+IklDqPB/tGmAFw=
Received: by 10.236.181.97 with SMTP id k61mr27132516yhm.108.1328563218714;
	Mon, 06 Feb 2012 13:20:18 -0800 (PST)
Received: from localhost.localdomain (hsvwanfw1-nat.mentorg.com.
	[139.181.24.34])
	by mx.google.com with ESMTPS id u11sm37999299anc.12.2012.02.06.13.20.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 06 Feb 2012 13:20:18 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Feb 2012 15:20:10 -0600
Message-Id: <cb6cbd8e788316335b3460458553f37c92425312.1328563142.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <cover.1328563142.git.chris_larson@mentor.com>
References: <cover.1328563142.git.chris_larson@mentor.com>
In-Reply-To: <cover.1328563142.git.chris_larson@mentor.com>
References: <cover.1328563142.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 1/4] external-csl-toolchain: set PKG/PKGV for staticdev
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Feb 2012 21:28:20 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-core/meta/external-csl-toolchain.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/meta/external-csl-toolchain.bb b/meta/recipes-core/meta/external-csl-toolchain.bb
index c9f35c4..7dd8da2 100644
--- a/meta/recipes-core/meta/external-csl-toolchain.bb
+++ b/meta/recipes-core/meta/external-csl-toolchain.bb
@@ -89,6 +89,7 @@ INSANE_SKIP_gdbserver = "1"
 
 PKG_${PN} = "eglibc"
 PKG_${PN}-dev = "eglibc-dev"
+PKG_${PN}-staticdev = "eglibc-staticdev"
 PKG_${PN}-doc = "eglibc-doc"
 PKG_${PN}-dbg = "eglibc-dbg"
 PKG_${PN}-pic = "eglibc-pic"
@@ -100,6 +101,7 @@ PKG_${PN}-pcprofile = "eglibc-pcprofile"
 
 PKGV_${PN} = "${CSL_VER_LIBC}"
 PKGV_${PN}-dev = "${CSL_VER_LIBC}"
+PKGV_${PN}-staticdev = "${CSL_VER_LIBC}"
 PKGV_${PN}-doc = "${CSL_VER_LIBC}"
 PKGV_${PN}-dbg = "${CSL_VER_LIBC}"
 PKGV_${PN}-pic = "${CSL_VER_LIBC}"
-- 
1.7.7



