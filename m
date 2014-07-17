Return-Path: <ticotimo@gmail.com>
Received: from mail-vc0-f179.google.com (mail-vc0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 52F4670621
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 23:08:00 +0000 (UTC)
Received: by mail-vc0-f179.google.com with SMTP id hq11so4385329vcb.38
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 16:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=wysSekCW3le48IWU+Fz5o0X4p5Nsx2FjIGhT/MYEC0A=;
	b=oEJloOE5lUoN3Vd+F088ZinafrRAmXfqP+MHIvE2NG7faAepyC1mYvDFmvgvugprc5
	2A2aM23cj3GCdc2ZC02CBrTZQLYkHFYA/RsP+5bHgID9BcOqcqLGhQ7IKjXHo/6x9Nr7
	OZepzIw+5BCnUEdbMHP3oeE+lsLXt78e41UrQ12nOJoOgqlPkgEk6OOqHYWHE+OcMDRj
	fl2JFaGsQVA6+WHHQqvosnMercDysQmEV7Y6aUWXzUG9dxje1+RlwdCeODaWp6YE4UAK
	HZ6nohofVULliZrC3U+urIItZ0DjXtIC10jWwPclX9CGnBvY6NAgrhEaP3Tt+fHcJdoX
	JYpg==
X-Received: by 10.52.27.208 with SMTP id v16mr361577vdg.21.1405638481802;
	Thu, 17 Jul 2014 16:08:01 -0700 (PDT)
Received: from localhost.localdomain.com ([196.40.10.133])
	by mx.google.com with ESMTPSA id
	sx10sm7305975vdb.16.2014.07.17.16.07.59 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Jul 2014 16:08:00 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Jul 2014 16:07:45 -0700
Message-Id: <1405638465-23793-1-git-send-email-TicoTimo@gmail.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH] libgpg-error: fix pkgconfig.patch
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
X-List-Received-Date: Thu, 17 Jul 2014 23:08:08 -0000

Typo in pkgconfig.patch:
   -Libs: -L{libdir} -lgpg-error
vs.
   +Libs: -L${libdir} -lgpg-error

This patch fixes failure in libgcrypt-native do_configure.
| ../x86_64-linux-libtool: line 6001: cd: {libdir}: No such file or directory
| x86_64-linux-libtool: link: cannot determine absolute directory name of `{libdir}'

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 meta/recipes-support/libgpg-error/libgpg-error-1.12/pkgconfig.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error-1.12/pkgconfig.patch b/meta/recipes-support/libgpg-error/libgpg-error-1.12/pkgconfig.patch
index 2a2c1e9..89c9d22 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error-1.12/pkgconfig.patch
+++ b/meta/recipes-support/libgpg-error/libgpg-error-1.12/pkgconfig.patch
@@ -52,7 +52,7 @@ Index: libgpg-error-1.12/src/gpg-error.pc.in
 +Name: gpg-error
 +Description: a library that defines common error values for all GnuPG components
 +Version: @VERSION@
-+Libs: -L{libdir} -lgpg-error
++Libs: -L${libdir} -lgpg-error
 +Cflags: -I${includedir}
 Index: libgpg-error-1.12/src/gpg-error.m4
 ===================================================================
-- 
1.9.3


