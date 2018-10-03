Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id 8434478FA0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Oct 2018 12:34:18 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id q5-v6so5913741wrw.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Oct 2018 05:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=F5Jhi5rcwZ8cKxLK3X2VUR0tWO1rd8IoB0qEoKIHWhM=;
	b=v/CRHSgPeDn69bOovNGXUQeY79Q9KS7aDeNPHsoAOA/VMBmOwxvG+eAI2SAZoFgb0l
	3kForhulpXPKgop6TvpdGfij7xXfGSA65zjZ51I3ox/IIKTkrcfogpHFlcSAQ8SL9mVz
	9mxqRJXlyG0XcAjNXPJZQ/1JYFgDpnCrFhLDepnEvvMv9innWrIE6GjsazayG1TSRojj
	kC6Ff+cL3sgaPX9gl/7LS/xfwhisJkM/weq4Hy5CqEMTbNLW0difSxc8bsMQOuKqt5pu
	ebhI9aoDwKjQPLBQ3M+lk7L80FVdiua3g4c34COj8Rbv65H7pTmIUbMEg3D0xcWZJMDX
	omkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=F5Jhi5rcwZ8cKxLK3X2VUR0tWO1rd8IoB0qEoKIHWhM=;
	b=B2XHs2itn1oDC5NlIZ5G0ZSx9LwYLUFsZ5atS6rRDy/2QyOZGTph6zQ1S7LRGGkzHc
	j9o7OKWWwKEcgN70WK5PPHsOzQqfJJ8sTIWqpqVilyk8c7QR1VUDsPRNDhI9WuPrvCKE
	mPfodj2dmxnnh3zeGpPoxOkokr3wDKgSic2RhKd+BU00vCLm7Nih1IagaspBmZBsTw6b
	B3hBz6Tz5BF389pZho4UdfZmzH/N3Md+GngkEb4zxgK86F1moJZwKHbI3jkqAyX0LTBn
	oIO1YPYZT/YBXNg7+kgPY58XEwbQOtbfMthPoiBW8Xk9o/rVO7j5NOCNHsuWMbDZWjiu
	/K3g==
X-Gm-Message-State: ABuFfojKcaw3/GzIqRpUME2Fw42cNkfpTXYkKrhjW0vM97nLAx/1usYp
	J6X4EwKrUvF3GvbrPIoyDf1Os/9ng3s=
X-Google-Smtp-Source: ACcGV639yn8h3L2oChUcGb+kTXs47fLdrec2Op+vTJfJua0bdYAJ40uELPcBjAa/MZbY1TDs8IF1Jg==
X-Received: by 2002:a5d:698b:: with SMTP id
	g11-v6mr594153wru.159.1538570058916; 
	Wed, 03 Oct 2018 05:34:18 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	z69-v6sm1527081wmz.18.2018.10.03.05.34.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Oct 2018 05:34:18 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Oct 2018 13:34:16 +0100
Message-Id: <20181003123416.16501-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] pango: respect PTEST_ENABLED
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
X-List-Received-Date: Wed, 03 Oct 2018 12:34:18 -0000

Don't use the 'ptest' DISTRO_FEATURE because whilst that can be on,
PTEST_ENABLED could have been overwritten.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/pango/pango_1.42.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/pango/pango_1.42.4.bb b/meta/recipes-graphics/pango/pango_1.42.4.bb
index fc610a9a5f9..22fe3af15d7 100644
--- a/meta/recipes-graphics/pango/pango_1.42.4.bb
+++ b/meta/recipes-graphics/pango/pango_1.42.4.bb
@@ -29,7 +29,7 @@ LIBV = "1.8.0"
 
 # This binary needs to be compiled for the host architecture.  This isn't pretty!
 do_compile_prepend_class-target () {
-	if ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'true', 'false', d)}; then
+	if ${@bb.utils.contains('PTEST_ENABLED', '1', 'true', 'false', d)}; then
 		make CC="${BUILD_CC}" CFLAGS="" LDFLAGS="${BUILD_LDFLAGS}" AM_CPPFLAGS="$(pkg-config-native --cflags glib-2.0)" gen_all_unicode_LDADD="$(pkg-config-native --libs glib-2.0)" -C ${B}/tests gen-all-unicode
 	fi
 }
-- 
2.11.0


