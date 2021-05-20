Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web09.496.1621543759113507559
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 May 2021 13:49:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=B17ASByD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id z137-20020a1c7e8f0000b02901774f2a7dc4so5760804wmc.0
        for <openembedded-core@lists.openembedded.org>; Thu, 20 May 2021 13:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=pcY0XNc6LqeCK3jKSwCoxz0KxaJv4HelQD33DE6yHnE=;
        b=B17ASByDqYIySrS7SE0NlIwMRjQyMg8fiq4xSR3c6qmUZGgXa65wqrDfq7k499ceBC
         6YVMZjnabY/lbSMDtO6UkKmegGlpMByR0VJiOYDHEZp95jCA/l2cFUsAHEhlrXi6rtIm
         9GzNJzh4tM0YjrBjjyrSxV1LaU9owXWp4kXiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pcY0XNc6LqeCK3jKSwCoxz0KxaJv4HelQD33DE6yHnE=;
        b=dujas40V9L4Vp5bBPKEpX9UyZUJ3WRubf0Bjk1///1WV0cOtjZyQwQq9wPL12yjNKJ
         FhzoKryn3m+G/t2Hiip4C/Je1GSUGiCatjHt0hFy6jNWWIk4LmVOQzzM09INIHNLLeL0
         +7/Cz6exzZBx6Z55Tb7E+sE0m7lOHImnmZ80UMEUhFj3syC9MXnrd4GMAy+sVrTbzgVJ
         pmjNSfxKxJK4Td6gxg0bBpjEqgStbmmb8rcRonBX4jJ00fTHsYRdM79SltyMKXtp/Xh2
         1I4l2XQB5Jdbg5CBKBgnQHQw2O/Nae+FZwO+UPljNO/pApyQM1f/ddclhr4j5yaKIRVH
         pang==
X-Gm-Message-State: AOAM530V11NOnGysvIzEEvW2OKlSY/TRVL/1wUMeBY8ME1gFa0+29fKv
	nOR2IXuPBdckG6OtVth8GH9O8/DCqD/3Ow==
X-Google-Smtp-Source: ABdhPJzNRkq/bNHM3KONGVT2jmInYjGjccBaNJfZq4PO8tw+YVOEJZi+dZnN35goV/4ozVqLgn8DCA==
X-Received: by 2002:a05:600c:290b:: with SMTP id i11mr5869514wmd.34.1621543757656;
        Thu, 20 May 2021 13:49:17 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:c394:d896:3913:6568])
        by smtp.gmail.com with ESMTPSA id n189sm3768061wme.9.2021.05.20.13.49.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 13:49:17 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott] [PATCH 25/28] librsvg: Exclude CVE-2018-1000041 from cve-check
Date: Thu, 20 May 2021 21:48:59 +0100
Message-Id: <20210520204902.2527687-25-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210520204902.2527687-1-richard.purdie@linuxfoundation.org>
References: <20210520204902.2527687-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Issue only affects windows.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-gnome/librsvg/librsvg_2.40.21.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb b/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb
index acdbc1f1b3d..59de80a691d 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb
@@ -25,6 +25,9 @@ SRC_URI += "file://gtk-option.patch \
 
 SRC_URI[archive.sha256sum] = "f7628905f1cada84e87e2b14883ed57d8094dca3281d5bcb24ece4279e9a92ba"
 
+# Issue only on windows
+CVE_CHECK_WHITELIST += "CVE-2018-1000041"
+
 CACHED_CONFIGUREVARS = "ac_cv_path_GDK_PIXBUF_QUERYLOADERS=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders"
 
 PACKAGECONFIG ??= "gdkpixbuf"
-- 
2.30.2

