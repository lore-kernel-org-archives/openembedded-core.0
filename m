Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 5F03472A0E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jan 2015 12:53:46 +0000 (UTC)
Received: by mail-wi0-f172.google.com with SMTP id n3so7406237wiv.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Jan 2015 04:53:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=XpLlO5gOkOjDKgUrClRo0SzigcB0yHHBILefluuNP+A=;
	b=I75E173MtEc2h7d+re72eP4CnSMPSm98CcXZwWJW0OpgeGNS1s13VUo6fvZZMbJvWy
	bqAnfpRIJE8y9/nbuLjYe+WAs2htNufplROgsmIC39jGQaKM/1OdTRGXoRLY41v3NOYE
	5d1w1rpxjEdAkjAYnQVVuFIjBfy7T0suYGglTnkiQ8iBAsYHIEiynFDZIsrzWxTcucdB
	/wN5qTFEAAQepg5zej++N0BXa5sLmPe4Z0BlKRNB573EKxZ3mX2874KtKweKsDz6hf//
	k8cCDfXOpflz7TOenoEiVK/Ba5bJ7oE+PuMW4rGxmd8jzNDBaXYFfE57SAUI4Wa6owYg
	/SCQ==
X-Gm-Message-State: ALoCoQlrhFfYgVbzCtbNaZ7fVnQu9dM701hVOuPW0I87hzuLAzhD9/XHQTSm4A+tK+fcTh4Cb4zl
X-Received: by 10.180.81.7 with SMTP id v7mr7096845wix.74.1420635227117;
	Wed, 07 Jan 2015 04:53:47 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id n5sm2486990wic.6.2015.01.07.04.53.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Jan 2015 04:53:46 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Jan 2015 12:52:34 +0000
Message-Id: <1420635154-21522-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] cogl: fix .pc file packaging
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
X-List-Received-Date: Wed, 07 Jan 2015 12:53:47 -0000

Some .pc files were not being correctly moved into the right sub-package, so fix
this.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/cogl/cogl-1.0.inc |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/cogl/cogl-1.0.inc b/meta/recipes-graphics/cogl/cogl-1.0.inc
index cc51bb4..af06484 100644
--- a/meta/recipes-graphics/cogl/cogl-1.0.inc
+++ b/meta/recipes-graphics/cogl/cogl-1.0.inc
@@ -71,18 +71,18 @@ FILES_libcogl-gles2 = "${libdir}/libcogl-gles2${SOLIBS}"
 FILES_libcogl-gles2-dev = "${includedir}/cogl/cogl-gles2 \
                            ${libdir}/libcogl-gles2${SOLIBSDEV} \
                            ${libdir}/libcogl-gles2.la \
-                           ${libdir}/pkgconfig/cogl-gles2-experimental.pc"
+                           ${libdir}/pkgconfig/cogl-gles2-*.pc"
 FILES_libcogl-pango = "${libdir}/libcogl-pango${SOLIBS}"
 FILES_libcogl-pango-dev = "${includedir}/cogl/cogl-pango \
                            ${libdir}/libcogl-pango${SOLIBSDEV} \
                            ${libdir}/libcogl-pango.la \
-                           ${libdir}/pkgconfig/cogl-pango-1.0.pc"
+                           ${libdir}/pkgconfig/cogl-pango-*.pc"
 
 FILES_libcogl-path = "${libdir}/libcogl-path${SOLIBS}"
 FILES_libcogl-path-dev = "${includedir}/cogl/cogl-path \
                           ${libdir}/libcogl-path${SOLIBSDEV} \
                           ${libdir}/libcogl-path.la \
-                          ${libdir}/pkgconfig/cogl-path-1.0.pc"
+                          ${libdir}/pkgconfig/cogl-path-*.pc"
 
 # For backwards compatibility after Debian-renaming
 RPROVIDES_libcogl = "cogl-1.0"
-- 
1.7.10.4


