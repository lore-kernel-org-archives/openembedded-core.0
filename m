Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web12.25220.1591602515328523229
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2020 00:48:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=alwwWDch;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id w7so12595235edt.1
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2020 00:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r5jarZT/pZWbGlnVeLloWaOjUSNKPGnDkTieYarr6t0=;
        b=alwwWDchP1prJoj2wX0rYVuyvi4nTQ8S9DvQFHjelC7OQBavxK/KPAGqcz7IHw2dL/
         06jjNCpZGrdKeXB+X1FKi4k/nhEqG1GodD5Q5wy1XrL+xSszDGfsyC8HXmhRJ4Y+Rptf
         Ep+XDGDnFEM2oAWXQbbjZZCauboutwuj5pJ4U6Op8oqm5jAdBz4tS66tHLufNZ+FGXo4
         9xN330lNp2hufZvbM1ha8kKP0QaH8P6xz4f2Sk1SmDae6JuMl/C01lV5zNYY7ZlhEllB
         0ZU5Kce3WPeIE4B3bTEskDDDwTi+S+UkjmPHK6VPXbYCKaTWVmqw2J/DfAbmTx1AplXm
         Kjfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r5jarZT/pZWbGlnVeLloWaOjUSNKPGnDkTieYarr6t0=;
        b=oqoXQRXX4VFS+Vi1/9LuGyhFHy6BDZL2oljBk6IaGhogdf0QsX8mk/NgQB8WsVpX4B
         LtJP5WxfhJvAMHqnVgwaqWfyCFR9ElObW4RaVJC28U7Y2Az5T4qKQ3aY8Kasdxs6iJMc
         Apc1AhjQo3YoTeBIqNiag3NeZlFFa+NG4c+3O2ohCEskEptRKzWy1XtQvl8SRTgOMEzs
         ejhMipYYfrPPjMl/NtXk/O6+0NDy6lCI3kBN67nhpBxH6NITJsEhAd7Awi/HZApDhIva
         W5xmU/aZ5s2j3QGnRP4ZMm0OXRTWumZ9UStT2t25v0httS1CdI9ah3jyNGlWVFX5XOqJ
         G0oQ==
X-Gm-Message-State: AOAM533GyWnH8ycc6JjhaUxwP7NcCizc6fQEYliTD5gEz7Z2z5/VaLyr
	TMsJ0R+Dy9xBQdKl3AnvJVmkDLGC88I=
X-Google-Smtp-Source: ABdhPJy8aLWvtNOoQkdzYwasceI2gSZhzbgJVu/8d9CWRgeO1huNcRPOZ6EtHSBe8V8kcvCo6JoTAQ==
X-Received: by 2002:a05:6402:306f:: with SMTP id bs15mr21584985edb.331.1591602513674;
        Mon, 08 Jun 2020 00:48:33 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.66.228])
        by smtp.gmail.com with ESMTPSA id g22sm12473466edj.63.2020.06.08.00.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 00:48:32 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 23/42] wpebackend-fdo: upgrade 1.6.0 -> 1.6.1
Date: Mon,  8 Jun 2020 09:46:40 +0200
Message-Id: <20200608074659.7051-23-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200608074659.7051-1-alex.kanavin@gmail.com>
References: <20200608074659.7051-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{wpebackend-fdo_1.6.0.bb => wpebackend-fdo_1.6.1.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-sato/webkit/{wpebackend-fdo_1.6.0.bb => wpebackend-fdo_1.6.1.bb} (78%)

diff --git a/meta/recipes-sato/webkit/wpebackend-fdo_1.6.0.bb b/meta/recipes-sato/webkit/wpebackend-fdo_1.6.1.bb
similarity index 78%
rename from meta/recipes-sato/webkit/wpebackend-fdo_1.6.0.bb
rename to meta/recipes-sato/webkit/wpebackend-fdo_1.6.1.bb
index 3b1dbf1e09..2fdab42c38 100644
--- a/meta/recipes-sato/webkit/wpebackend-fdo_1.6.0.bb
+++ b/meta/recipes-sato/webkit/wpebackend-fdo_1.6.1.bb
@@ -12,7 +12,6 @@ inherit cmake features_check
 
 REQUIRED_DISTRO_FEATURES = "opengl"
 
-SRC_URI[md5sum] = "456afeed22f6749f7b2a97c11660835d"
 SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "7f5bd7b9d8f97b1655f4dcd39fad92719d0fb3985b251da5802df13aaa09f567"
+SRC_URI[sha256sum] = "740eee3327acfb462b8460519a219e30dc0a870326e88e2ddc4fe2c8de20b1c9"
 
-- 
2.26.2

