Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id 767A96FEF5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Apr 2017 22:44:18 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id e132so2113708ite.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Apr 2017 15:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=ZYlZh4kgScBT6MnEeZxJGfChKLwL55qwLaXBPPHWr/A=;
	b=M4ardu2uatULHV9Ig334vJn3BHpDNIgBMi0dHVZyfe8r8rurltOZxuWqClcSIAnPnf
	oAstHJSIcK1A/WXcAk+2qXWF2mRn1S8vP0J2y1fWp3AoySMIWQ0XOisnK90TZF7CuAAm
	dxZ+vuv7fvTTD3HXqhUo1rUzZcmgUCcBfmJ7T8NOnfTzDgEDtwy+v6lFr5pR3+E7smTF
	LHlaNrzT3YRFS7Dm2umZmb81VVj3LRr/7gzLycdKqorL35W8HzHEN/a0uqWTWQCe3517
	lRRq+Z80jTf6H7AguugKbV5vKyToGpTuf9QU2ONwBirOfmC2q9kClvLs7bUDHUj2QvKU
	H8gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ZYlZh4kgScBT6MnEeZxJGfChKLwL55qwLaXBPPHWr/A=;
	b=CIWdSI4Q1qgOCS60uIu2X8vLEVq+KrciVwlkoHE2SBdSvqbU/8BkJEXkU5W1ZYA4Ma
	8jh+NS7oMjF/Gtb3CujbTnvQY2SvozXNK6j2zJNXtG9oONBNYeeCjij8YCyHP2KfiyqT
	f4vyPocn8jr2lN+Vxt5iBS1Yz8KFCKJ2Ouhw+fopd29TOXgzQaEz3FzOhzx/5Xolwqy1
	dcqR0BR0qalMgcmfqgppK9O1X366REtK2ORKP4YhNmhnjEseMLZrMIj6Htrz+vt6ZIKU
	GALEXFAJX4PDLMHTK4FB4k0in2h2QTjWS3wc7Km1ICZ+yyMKQLrCqXB98LIzzNxg4JDJ
	m3cg==
X-Gm-Message-State: AN3rC/704+avf3WwHMv9D5HApAvAATnMYu5+qX0qA5qXeCQ0Xc05/VNr
	Ivwb+n7oXhX5g2B46Qg=
X-Received: by 10.36.103.215 with SMTP id u206mr3437930itc.6.1492296259308;
	Sat, 15 Apr 2017 15:44:19 -0700 (PDT)
Received: from linux-uys3.suse (69-165-142-50.dsl.teksavvy.com.
	[69.165.142.50])
	by smtp.gmail.com with ESMTPSA id r24sm777354ioe.1.2017.04.15.15.44.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 15 Apr 2017 15:44:18 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 15 Apr 2017 18:44:05 -0400
Message-Id: <20170415224405.14893-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.12.0.rc1.48.g076c053
Subject: [PATCH] mesa-demos: add glut dependency
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
X-List-Received-Date: Sat, 15 Apr 2017 22:44:18 -0000

If the user wants to enable the 'glut' PACKAGECONFIG for mesa-demos, freeglut
is required to provide the dependency before the demos can be compiled.

NOTE! this is a cross-layer dependency (freeglut is currently only available
in meta-oe). However 'glut' is not a default PACKAGECONFIG (so this is
allowed).

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/recipes-graphics/mesa/mesa-demos_8.3.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa-demos_8.3.0.bb b/meta/recipes-graphics/mesa/mesa-demos_8.3.0.bb
index e80d1e8acb..e43b9effba 100644
--- a/meta/recipes-graphics/mesa/mesa-demos_8.3.0.bb
+++ b/meta/recipes-graphics/mesa/mesa-demos_8.3.0.bb
@@ -40,7 +40,7 @@ PACKAGECONFIG[freetype2] = "--enable-freetype2,--disable-freetype2,freetype"
 PACKAGECONFIG[gbm] = "--enable-gbm,--disable-gbm,virtual/libgl"
 PACKAGECONFIG[gles1] = "--enable-gles1,--disable-gles1,virtual/libgles1"
 PACKAGECONFIG[gles2] = "--enable-gles2,--disable-gles2,virtual/libgles2"
-PACKAGECONFIG[glut] = "--with-glut=${STAGING_EXECPREFIXDIR},--without-glut,"
+PACKAGECONFIG[glut] = "--with-glut=${STAGING_EXECPREFIXDIR},--without-glut,freeglut"
 PACKAGECONFIG[osmesa] = "--enable-osmesa,--disable-osmesa,"
 PACKAGECONFIG[vg] = "--enable-vg,--disable-vg,virtual/libopenvg"
 PACKAGECONFIG[wayland] = "--enable-wayland,--disable-wayland,virtual/libgl wayland"
-- 
2.12.0.rc1.48.g076c053


