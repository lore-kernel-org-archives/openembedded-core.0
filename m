Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 333C56065B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 13:25:33 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id hr14so5287182wib.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 06:25:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=9DoTejoE1j3JIJdleQcXG3q5cegfCcRfYSw5f/ZdyHw=;
	b=Lt3agoBxavk/CDLllmCfsKBzABxJ/fN/Ah0L7YkJnBBUT5lWyLsKRSMLFROmxmWFBW
	YeGQoMCmsV0c9b5TFT8ZzVSnaP0fe5jW7UMnFa8pVNW4c750aNH1jzphuewY78fg26xB
	FPFiKj9IWH3t84aWptvvo3frYthdb3JT9vDz77RVKhWk3FDUMhx2OJMVP1H0goxN2M3d
	M+kXOSo4bwjJp4KID6XUQXQCeAvMYRPK8nB7C6k7lOZUNx+V6u2HIIfGWMs9u/FH/MtU
	ouEdTVix4T2hTQXCHErdIoimaO9zD9VyyTAMGm2T2EON4OfKUBNzi57DDI3tk2hHOYyu
	n6FQ==
X-Received: by 10.180.109.195 with SMTP id hu3mr4754980wib.13.1369920332864;
	Thu, 30 May 2013 06:25:32 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	ca19sm38020385wib.3.2013.05.30.06.25.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 30 May 2013 06:25:31 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 May 2013 14:22:15 +0100
Message-Id: <1369920136-2815-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQmwXHBPjvVG+8Qq7FmjC2pep1jfQO5IYCYrNq5k+YG8XiPvMtaRkvGv2UVhHsXRlKaZSJNo
Subject: [PATCH 1/2] cogl: remove documentation hacks
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
X-List-Received-Date: Thu, 30 May 2013 13:25:33 -0000

These sed lines disable the documentation and appear to be historical, building
works fine without them.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/cogl/cogl-1.0.inc |    6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/recipes-graphics/cogl/cogl-1.0.inc b/meta/recipes-graphics/cogl/cogl-1.0.inc
index 9dc47f8..a44e6c4 100644
--- a/meta/recipes-graphics/cogl/cogl-1.0.inc
+++ b/meta/recipes-graphics/cogl/cogl-1.0.inc
@@ -41,10 +41,4 @@ PACKAGECONFIG[glx] = "--enable-glx,--disable-glx,${EDEPENDS_GL} ${EDEPENDS_X11}"
 # Default to GLX
 PACKAGECONFIG ??= "gl glx"
 
-#Fix up some weirdness in the docs
-do_configure_prepend() {
-        sed -i s:doc/reference/Makefile::g ${S}/configure.ac
-        sed -i s:doc::g ${S}/Makefile.am
-}
-
 FILES_${PN}-examples = "${bindir}/* ${datadir}/cogl/examples-data/*"
-- 
1.7.10.4


