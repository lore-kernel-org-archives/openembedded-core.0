Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web10.18815.1603023033990700999
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Oct 2020 05:10:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AB0eq1Dt;
 spf=pass (domain: gmail.com, ip: 209.85.221.68, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f68.google.com with SMTP id t9so8293297wrq.11
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Oct 2020 05:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3p+vn1q40gLa0zhtXUw3GnYSxAqzBL38L8MWH2TkG/4=;
        b=AB0eq1Dt+L7cBlse3t5k93WbzW4a2dzmjQCClG77kaSKVdPNmbPCpxB9qanVQUKUhL
         TS9gQKMHINcuF31V+I8WUxOqy9Gh7NGGM6xAFknEWdcbDsIxrHKhsJpTLc0173pzDATs
         KtFQVRnMC5CBexh5rhfVdsT8xwWx7WaGIZGhOlXyWfwDcCjfakvgRHmFgqndd4Baoyzp
         9hzKLppCMdWEmm8r2RgLhqvvyNtsll92CGAYNKMOtFMLDlsprbqQDI6GR+MtyX+3ga7V
         WJbV+0aCy2sAsbPGM2FLLX8zA4J1Y918uMgFJeHJANZRSMqTMLke6yjU984QnKrUvEk6
         3xnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3p+vn1q40gLa0zhtXUw3GnYSxAqzBL38L8MWH2TkG/4=;
        b=fsoyjgiN6ssiWp1XHrSsGx1aNiArTQsJtsnPfraANgcyAUUvDXfudBDubQAUlmKP7U
         BvDaJgCb2t8cpSO9b+kvNuAVq+0pt491De+mYrzqkarpmo+1otlevjtEVdSHcax3p2pE
         h7O7tCtWem9b22l5Ff1J80o8hlDsqMCeaZsccRwktFdevVI3w843fAldO6HtHhOjdBH1
         p3GFYN2exx7oPN45ZfGLwg+cFpWmZHgy2aN3YuFNZnTEN6APYL113n5IeJWG3iGR9ghs
         9k6dqC16apc/JwjmGIMSFBf6uN1S7Is2i1tN8SbpC5wJ6XxTGf24Qapc1hn7z/2jyL2Y
         +QGA==
X-Gm-Message-State: AOAM531+y2YXNwkmgtDdI1yslFsVED6FuZFFMUW4zvl6NHFFJtIJlOdu
	CzAZFqmjzu+NA3R8CjGo46VyT6uzgNbO6w==
X-Google-Smtp-Source: ABdhPJwJF0FB8O56TCFBUocaTKiu/P8hRpEky9c6e7H7FuTA1GdjLUQbX5TsIzcL+Mv36SALw4yZ5Q==
X-Received: by 2002:adf:f3cb:: with SMTP id g11mr15453916wrp.210.1603023032358;
        Sun, 18 Oct 2020 05:10:32 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id z18sm9511084wrs.82.2020.10.18.05.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2020 05:10:31 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v3 13/20] gstreamer1.0-python: install append is not need any more
Date: Sun, 18 Oct 2020 13:09:55 +0100
Message-Id: <20201018121002.1417335-14-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201018121002.1417335-1-quaresma.jose@gmail.com>
References: <20201018121002.1417335-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../gstreamer/gstreamer1.0-python_1.18.0.bb          | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.0.bb
index f13f9c5a44..8ad6e15306 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.0.bb
@@ -21,15 +21,3 @@ REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
 UNKNOWN_CONFIGURE_WHITELIST_append = " introspection"
 
 inherit meson pkgconfig distutils3-base upstream-version-is-even gobject-introspection features_check
-
-do_install_append() {
-
-    # Note that this particular find line is taken from the Debian packaging for
-    # gst-python1.0.
-    find "${D}" \
-        -name '*.pyc' -o \
-        -name '*.pyo' -o \
-        -name '*.la' -o \
-        -name 'libgstpythonplugin*' \
-        -delete
-}
-- 
2.28.0

