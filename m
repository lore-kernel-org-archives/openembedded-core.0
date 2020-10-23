Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web09.1069.1603478636559330190
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2020 11:43:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ObDsCuqu;
 spf=pass (domain: gmail.com, ip: 209.85.221.67, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f67.google.com with SMTP id j7so3208562wrt.9
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2020 11:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YVv1JjI+Q5iglI/N8SzkqYl9Dy81KonZ0KbTxsKHXZo=;
        b=ObDsCuqusZsEcX4MAHgmqAwqw/Dch0tKsjAX8RQvV/XtyfQCG/FbANTo+IRMS1mJOr
         TmVCoXRfWBHVbtP4ByfM9Rco1dXZL0PbZBq7078uzexavvQfzPbgZHjXHm+HG5Y68rOm
         GLHeZKfjb8tEgpZufmoIHfujuWZHfPx/Z7zEEprq2WI3K97fLcM88JYOh4L60vA1PeJP
         4FChbamrNElP/k51bv19RDHoVzYzjRHlu77xr/h+0Rr26H9NECHUvxlF0DO2bRN+pjZ/
         OPyZmokzP/Vj0dpbt3bouJ2sypuCSVk+SMpDjZfu0wtgEZALnIFsNOkC6SkR20zS9Izo
         f6EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YVv1JjI+Q5iglI/N8SzkqYl9Dy81KonZ0KbTxsKHXZo=;
        b=U4Vkypu9FkHMLbtS6QUUfX9YMaQ6XiB+X5a2ZqCESeKOQfFnVmzi0Id6kEPQwW/bCF
         2cZQiFAt3z/hPWDuLnLHCzg6qQOVYyb9/M6HO3GW/xFVQUZRUYtnCZmqNSoeXjmNnsPY
         wexv1zPs7OtFfKJyFXLnVNaOLU1S68PQLwPzb6Q31gOn7lGV/EH4aNHBOZzKwxSniAjR
         1L39Jq/UFdVhH/XUBRvIbdUqKle0YYCHvnVoeGusuGDlm6HEBvRqEblTQqHz8xkPG7D+
         2cAJZRtwzHJsd+O0+pCkKDIfHoM3S9SepCt5v8ZpKNylBhu/VkvdijmFAAfYxVbeqo2g
         jK4g==
X-Gm-Message-State: AOAM530XsG5xhBjIAYlMExN1REva6g0PoyOWC+k3V1xppqMcu/xY1Fmf
	teIXMNuEI5w9btvzLYl9RqwVPP76wFuUeg==
X-Google-Smtp-Source: ABdhPJxkedGWIMtAZb6O+fzfgBAAaNfguZ5bW0cnyAsDOrTvr74bEdm/yCGVni4K85oVaONsbCVTVw==
X-Received: by 2002:adf:cd87:: with SMTP id q7mr3974097wrj.169.1603478634975;
        Fri, 23 Oct 2020 11:43:54 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id b7sm4999302wrp.16.2020.10.23.11.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 11:43:54 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v4 13/21] gstreamer1.0-python: install append is not need any more
Date: Fri, 23 Oct 2020 19:41:24 +0100
Message-Id: <20201023184132.3208737-14-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201023184132.3208737-1-quaresma.jose@gmail.com>
References: <20201023184132.3208737-1-quaresma.jose@gmail.com>
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
2.29.0

