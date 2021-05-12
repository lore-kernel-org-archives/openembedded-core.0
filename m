Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.5466.1620859766454193564
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 15:49:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YdrNUf0m;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id e7so6657276wrc.11
        for <openembedded-core@lists.openembedded.org>; Wed, 12 May 2021 15:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=pcY0XNc6LqeCK3jKSwCoxz0KxaJv4HelQD33DE6yHnE=;
        b=YdrNUf0mlStR1tPlkX4g/1MUmD5a+7DxrwdVxs76dXXHnKFVaSmapyGoIyzl278LMZ
         pBLbwpnDSSwcJyehBcMeb8PydZ6wMUYzDaNoh7RkyS6odmSs7yLvZrp48f4VQGB2H8q0
         0/UdH/xFnfQLOOKKqJRQPGamhvqSj2fPMkU9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pcY0XNc6LqeCK3jKSwCoxz0KxaJv4HelQD33DE6yHnE=;
        b=IajszQL1xnccZiPwyLUK4yd2foH1v955Je50ojz74l1/nO6oFMJ/Ra1QvYUwIyeE0I
         fFPSXfRdhXlogJqAAngs89CeqB0foCy41chK8IGhvcDJbKcBbR6VQgAgEZicGg3krIeE
         HgFkLpO0gBnm8YoENOC2BLiTWaQVXhFcWlb5gVkp54Il8spZdDtFFRkzmedaqAo+aPVd
         +LZUgZaxgHNGik4oQgJS1i8YKdl2MhnkGBgZKu4IdK0vaLehmBoMZsWy/Mp10hUv0CXq
         BiQbEK1gBgzBwN7nBdzDRnt6cklDoY+uvpflOaLWfnF9zBzg/bB2LZeBDgsuHIhdNSot
         tdow==
X-Gm-Message-State: AOAM530DlEy2KlmnHwi0gmZzSBO/nf62TWET/w0OSrfmsDatuCD3Dys2
	PNs0NUay0R5qvueuDSCPVTxLvP9BgXoIEw==
X-Google-Smtp-Source: ABdhPJw2QnFUxDf185pMO+kPqHs1CIwSp4N+TdHqAULvMJ/1/r0Q8S9NI5O4xsNA/D9FD3IZYxAwDw==
X-Received: by 2002:a5d:6352:: with SMTP id b18mr47774859wrw.76.1620859764766;
        Wed, 12 May 2021 15:49:24 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:f649:3481:d239:bb03])
        by smtp.gmail.com with ESMTPSA id o13sm791887wmh.34.2021.05.12.15.49.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 15:49:24 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] librsvg: Exclude CVE-2018-1000041 from cve-check
Date: Wed, 12 May 2021 23:49:22 +0100
Message-Id: <20210512224922.2286380-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210512224922.2286380-1-richard.purdie@linuxfoundation.org>
References: <20210512224922.2286380-1-richard.purdie@linuxfoundation.org>
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

