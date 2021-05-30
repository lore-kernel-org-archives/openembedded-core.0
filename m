Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web08.36991.1622412543576481188
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 May 2021 15:09:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TD+A8LW8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id g17so8847871wrs.13
        for <openembedded-core@lists.openembedded.org>; Sun, 30 May 2021 15:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=S1ntifciGWum7Tdk9iEaD/6gUcKQ6d+UFjFSJNJB8k4=;
        b=TD+A8LW8nYLNPTlsWbpm4OLFKyW1hRJOZvZmjmIwWGFSKx4PtNFHmkTOHYAiQIMci2
         ss8ipljiHQXTqxF8YLxY2HkbKLAdKQcP6bMtp8Z1Es3rqtZIlcJcn04aDD3PI+/ZKjsr
         CRGkEaCG8EBMm5dbTitvd0qHB7JA08UpYkblQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S1ntifciGWum7Tdk9iEaD/6gUcKQ6d+UFjFSJNJB8k4=;
        b=EGLdB0W5vnVH3cyKgPt2xn+wU8Ehla+yQs9Jzj+8xF16NXXyK9tgpiMG8xROg2UcEX
         rhOvlJddoKoxmfGcrDT4z5LcNOZgL/rV08bmkAn7ouMIXi9TxkJ78OGkdT0f7JNGSgHM
         /kctj37p9zVHW0sud6oSlLopyXPwHg3+MkTSS0nWW/4pWWKI0ediknLf2tFML1gEe5oV
         8Uauew3z0VO+8DLIPp8Fsz4ycKXN9W1t6xzSZvj3CMdBsoGYD4lJ1i2lWGan9t6Y++qJ
         VKjmEJWdHYkHSlfuoWxAxbTMmohu+OpVB1r94WcdrUt0/G9FDE3bMWbpgz6dPtrBjDT4
         a6bw==
X-Gm-Message-State: AOAM531OgC4htBhclNj0269WQJ60vdym3gAImtlhcn5pH/avspnyrnI8
	w7E3M8HZsoMHmsz5qgXCKahBtgcaAWQ12A==
X-Google-Smtp-Source: ABdhPJxHeuasKb4eUOcIou95OvxyDNSQdySk9ZkTghj94eH50ejhBBcgkySP3WXLBwf9pTK5Q4U1iA==
X-Received: by 2002:a5d:50c7:: with SMTP id f7mr19592927wrt.189.1622412542105;
        Sun, 30 May 2021 15:09:02 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:fcab:51bf:ac39:992c])
        by smtp.gmail.com with ESMTPSA id j10sm14721102wrt.32.2021.05.30.15.09.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 May 2021 15:09:01 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 14/16] libpcre2: upgrade 10.36 -> 10.37
Date: Sun, 30 May 2021 23:08:54 +0100
Message-Id: <20210530220856.2830501-14-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210530220856.2830501-1-richard.purdie@linuxfoundation.org>
References: <20210530220856.2830501-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Only the copyright year changed in license text.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libpcre/{libpcre2_10.36.bb => libpcre2_10.37.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libpcre/{libpcre2_10.36.bb => libpcre2_10.37.bb} (91%)

diff --git a/meta/recipes-support/libpcre/libpcre2_10.36.bb b/meta/recipes-support/libpcre/libpcre2_10.37.bb
similarity index 91%
rename from meta/recipes-support/libpcre/libpcre2_10.36.bb
rename to meta/recipes-support/libpcre/libpcre2_10.37.bb
index d8077a1224b..b596fbe87d7 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.36.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.37.bb
@@ -8,11 +8,11 @@ SUMMARY = "Perl Compatible Regular Expressions version 2"
 HOMEPAGE = "http://www.pcre.org"
 SECTION = "devel"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=60c08fab1357bfe9084b333bc33362d6"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=6b3022283c9a79238d521848ea9dcb4d"
 
 SRC_URI = "https://ftp.pcre.org/pub/pcre/pcre2-${PV}.tar.bz2"
 
-SRC_URI[sha256sum] = "a9ef39278113542968c7c73a31cfcb81aca1faa64690f400b907e8ab6b4a665c"
+SRC_URI[sha256sum] = "4d95a96e8b80529893b4562be12648d798b957b1ba1aae39606bbc2ab956d270"
 
 CVE_PRODUCT = "pcre2"
 
-- 
2.30.2

