Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web11.9664.1603981704833427590
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2020 07:28:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TVp6rAUU;
 spf=pass (domain: gmail.com, ip: 209.85.128.65, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f65.google.com with SMTP id v5so63872wmh.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2020 07:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nF+z5XyRdR4T6MLOhqDo4SZY4a1gFG0GrSyVGyoi7k0=;
        b=TVp6rAUUyrmbwAA9awll5wfjv2hLaMrkEyPtUDyk1WYN7dHTP0iu6AwZhaSe+E8ZtR
         f36qDdfdF0tTuRoQRIHV6/8GqsJ6MnEHr49pL+Pa1dskTAwCmPQ1KXecfD7e/LFUQRIl
         mg8VBB5XGS6YbB59JRxtkoB171TosCJk+Iw36czR03sJRERJwBqEPR3+6dwENz4Ld9AF
         woQI23rDlBqqflPCQBWh9SApVlpYA9AAwku9BIHkldlc3TNuInR5UaCoGXWV3mkO5Yao
         k+Gkf/a/VTVotXsYOdb8EJSrAICaUNdkUdWSCKuGO1Xm9O/Bj6D3r7dQeH65x6A3l9oS
         fbug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nF+z5XyRdR4T6MLOhqDo4SZY4a1gFG0GrSyVGyoi7k0=;
        b=Yzr35h4FfhSX/H7MoCLFTDARyUN3KDtewH4l/qw3RWypoYuxorpVy6Ej+njCURtqcu
         Yh4OetkxEHfmoJzLCvuUMfNGGMf68SbN4iSCUNpiUURnCQ/XFy/CGrOmRSjkV5m5VVZE
         wKy97/A6jLlzT721FZ1VExcOWFoIrDnsl/K9sRYR4Gs0OCMZh1FAde6KK84NszkyDjF9
         sm8w0Pd7YStPGH1MJ1O06z/6KNSN1LRXuotE5C3mTAzZ4zB7LOqgCHV4qBrEU3QXvV0o
         lca+w4zIip3XR7FBxriZEyRd0tqekVRIQUDQJXwRtVht94bWfypK1xka9uic/2dUzbI7
         5BCQ==
X-Gm-Message-State: AOAM533HN9RivqOHmcoKaf6P1NjtI1ucZ6VbgWljKN5QOW+MXLGpJVPw
	ucCsYCbqioSkzAJ3NpdI2v3LIe1LnkZBQA==
X-Google-Smtp-Source: ABdhPJzGt0gtL6I7yALyXqIkB9omYSVCKpL/lYZiORYvqG/YynLTpfde1yMF9Kq256C3gijRWDURxA==
X-Received: by 2002:a1c:dd8b:: with SMTP id u133mr72451wmg.73.1603981703082;
        Thu, 29 Oct 2020 07:28:23 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id y4sm5404803wrp.74.2020.10.29.07.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 07:28:22 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v5 13/22] gstreamer1.0-python: install append is not need any more
Date: Thu, 29 Oct 2020 14:27:57 +0000
Message-Id: <20201029142806.1830504-14-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201029142806.1830504-1-quaresma.jose@gmail.com>
References: <20201029142806.1830504-1-quaresma.jose@gmail.com>
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
2.29.1

