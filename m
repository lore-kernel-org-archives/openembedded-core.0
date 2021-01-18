Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web12.3455.1611009487910876066
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jan 2021 14:38:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ZYxly3pg;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id kx7so1226237pjb.2
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Jan 2021 14:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=E4TNHUbDt3cvwncHscLE9mK0Q6x5NfnCjd8/9ejUYZc=;
        b=ZYxly3pgwYrwU2sX50yYbezDwQbBZ7thtipxeEEo/s/lxEog04gqDjmvDu3FEy145+
         5oy19Cuol7UGAWCmeioRGL7MR4wbzrWEhhth7R7LLvSOxIhR+o5nob1l9m1HDcWgQlwS
         JZkfBfjdeyYUIjkzqPJpyYINAl4hVLFmHasneh5XCm/e1OOUsSGEt2migrHwc9f9TsKh
         TPIUDAgK9wOM7ZRKrFI01y2rPtP1+wiDz8c1s/IliiE25bGJYnO7XyfCSO3/IIBc4ugh
         EP0ydvoCDDkCd8zPBX6/vRll/r95LDvpW/LaXHFT+fHacpHI8M37WRtAtUf/pdVuD+1l
         UYdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=E4TNHUbDt3cvwncHscLE9mK0Q6x5NfnCjd8/9ejUYZc=;
        b=RIcUOB7f0ENly77On8jQ69x3iY3OtWZWF9GgigFgKyS/TpujdIfjuEyDS9Xmq5/459
         eYeWL4AcSndZIsKfqlUQCFVUNx2um1YvBg8GDYD3cqmb/cdxds3eQVfaPrI7Y0SLsaNj
         xKVOiw2UPD/+KMviZ433GMVp6mQN7+XYh7nindcUQUZ6m0YTlroPxmbC1RROVuKaGLXh
         lRKsT0pDXgoKa6wPioEoLKP6Bn+oQVSyluPxDSIE2LRctMh/X+zvKOdVOIBB6j0QiJk6
         NPQsO6n/GZGxmSu8prN6avD7mcTGKrCK84J6mtdA4DB43Woa3Sjuj7fz4vGt1azPgDJo
         YAOA==
X-Gm-Message-State: AOAM5331GsVSxMe05Cr8a9deABMWT388wytWrIn038AKkfTmzaXh3X4d
	fUx81/rFY12i8b+xhcTXg7t6QDyVR+r+X0S6Z7k=
X-Google-Smtp-Source: ABdhPJwGPp1IDpj5aGS7e2YGkBbFEJElWCRJxURae9Y8lJSMcHXqlsad1xHLV9VNkBKNsL5HZ4arHQ==
X-Received: by 2002:a17:902:f543:b029:de:1c6a:b780 with SMTP id h3-20020a170902f543b02900de1c6ab780mr1560683plf.81.1611009486886;
        Mon, 18 Jan 2021 14:38:06 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.150])
        by smtp.gmail.com with ESMTPSA id a12sm16835556pgq.5.2021.01.18.14.38.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jan 2021 14:38:06 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/19] classes/waf: Add build and install arguments
Date: Mon, 18 Jan 2021 12:36:20 -1000
Message-Id: <0fe8ab5f1b47388199f0a5480b176ad181c81e47.1611009050.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1611009050.git.steve@sakoman.com>
References: <cover.1611009050.git.steve@sakoman.com>

From: Joshua Watt <JPEWhacker@gmail.com>

Adds variables that can be used to allow a recipe to pass extra
arguments to `waf build` and `waf install`. In most cases, you want to
pass the same arguments to `build` and `install` (since install is a
superset of `build`), so by default setting EXTRA_OEWAF_BUILD also
affects `waf install`, but this can be overridded.

(From OE-Core rev: 493e17a2f5cbbbe3b1e435dadb281b007bca2cbf)

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 633652284b13dc78206f4cc8e81f29de44777b75)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/waf.bbclass | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
index 900244004e..309f625a40 100644
--- a/meta/classes/waf.bbclass
+++ b/meta/classes/waf.bbclass
@@ -5,6 +5,11 @@ B = "${WORKDIR}/build"
 
 EXTRA_OECONF_append = " ${PACKAGECONFIG_CONFARGS}"
 
+EXTRA_OEWAF_BUILD ??= ""
+# In most cases, you want to pass the same arguments to `waf build` and `waf
+# install`, but you can override it if necessary
+EXTRA_OEWAF_INSTALL ??= "${EXTRA_OEWAF_BUILD}"
+
 def waflock_hash(d):
     # Calculates the hash used for the waf lock file. This should include
     # all of the user controllable inputs passed to waf configure. Note
@@ -55,11 +60,11 @@ waf_do_configure() {
 
 do_compile[progress] = "outof:^\[\s*(\d+)/\s*(\d+)\]\s+"
 waf_do_compile()  {
-	(cd ${S} && ./waf build ${@oe.utils.parallel_make_argument(d, '-j%d', limit=64)})
+	(cd ${S} && ./waf build ${@oe.utils.parallel_make_argument(d, '-j%d', limit=64)} ${EXTRA_OEWAF_BUILD})
 }
 
 waf_do_install() {
-	(cd ${S} && ./waf install --destdir=${D})
+	(cd ${S} && ./waf install --destdir=${D} ${EXTRA_OEWAF_INSTALL})
 }
 
 EXPORT_FUNCTIONS do_configure do_compile do_install
-- 
2.17.1

