Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web11.26115.1594155810084215840
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2020 14:03:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XWQKogyb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id q5so46704418wru.6
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2020 14:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=63nGcSCYQL83NHSgHnrL38IIWtNkoULqfrxTySNS26k=;
        b=XWQKogybfVHwXfWLuZ4XwZzS7IXEfoeWTCi29AmEnkzRujGlrL/VCuLWYXeV5bwk4l
         pKHrV0BnwLuOXch9H5NJwTt+XabPz52+HprnvLRnvC8JXU21KFzZFESE7V+NjF6WUILs
         ck6KBn8Am1nf56vdFQkOopjOdNr+ItoSsBP14=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=63nGcSCYQL83NHSgHnrL38IIWtNkoULqfrxTySNS26k=;
        b=GDIjdhrk8/CePz+5f8+UAo36tWooL2hHQRJT4Nb9vixYiiFgCc3eFx+YrG/tfHP1Ag
         5CXJ/t9vEv83ht70gp/7JUb0UoSucySlRy8WN57kknEIPu11A/BnDuXhHSAGmCigie7C
         CGkWAXqK0LKxa+Av/5rDlNs/sOmWH5IWhvk059+XbDA9elRVB8A4yn0bc+7XPA4K4EjM
         Or4liG8VkkyWnaApAG5gQgi8lRSL7eitqrslTpqosNqLPSm+46wUlFJQih+m+B7V6nqv
         D0PVgO1zQgOba1+wN94HpfVEvdyx5kbjCdQrVFHmTUHniUezq1TpGmGWQ8NZ0x4FQlIr
         isOQ==
X-Gm-Message-State: AOAM533Hp4VjH+UXAKoUZx/q/Wyj5k9oPNaLtjsUE3p5Rhms6/6QQMqk
	o7xbwXaAqNbg9WgHRrWSSOvlNRtGNDy7OA==
X-Google-Smtp-Source: ABdhPJwMq+k9zYtaj+MKrg7wFYRaQUIq9hhyfRJzguz6BAypGXSg6dLuE2e92CL0YxG5+nkeWUBfJA==
X-Received: by 2002:adf:b312:: with SMTP id j18mr52283751wrd.195.1594155808397;
        Tue, 07 Jul 2020 14:03:28 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id s10sm2597187wme.31.2020.07.07.14.03.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 14:03:27 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] adwaita-icon-theme: Add missing license files to LIC_FILES_CHKSUM
Date: Tue,  7 Jul 2020 22:03:25 +0100
Message-Id: <20200707210325.350986-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707210325.350986-1-richard.purdie@linuxfoundation.org>
References: <20200707210325.350986-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sources have a couple of COPYING files which should be listed
in the license checksum entry so the full license terms are included
in license handling code.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-gnome/gnome/adwaita-icon-theme_3.36.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.36.1.bb b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.36.1.bb
index 473e1fc0be5..2d78bea2c85 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.36.1.bb
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.36.1.bb
@@ -4,7 +4,9 @@ BUGTRACKER = "https://gitlab.gnome.org/GNOME/adwaita-icon-theme/issues"
 SECTION = "x11/gnome"
 
 LICENSE = "LGPL-3.0 | CC-BY-SA-3.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=c84cac88e46fc07647ea07e6c24eeb7c"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c84cac88e46fc07647ea07e6c24eeb7c \
+                    file://COPYING_CCBYSA3;md5=96143d33de3a79321b1006c4e8ed07e7 \
+                    file://COPYING_LGPL;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
 inherit allarch autotools pkgconfig gettext gtk-icon-cache upstream-version-is-even
 
-- 
2.25.1

