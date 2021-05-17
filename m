Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web09.19572.1621260884186989342
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 07:14:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=YnaB4kRk;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id ot16so1818351pjb.3
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 07:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=WkAq0EunsdESYsnTiWbvZfbyYA35v75dnIdluQE0Bw8=;
        b=YnaB4kRkVhtDfYvu+1EI07NMtgTAuaz/4aB53gLGRvIpfXXLyA3H3JEeDjdpSkBxWZ
         ZpAHVlsgfpmpRV24Z4sUrIQZPCyLzM6xA2gBhViQ0wv8joegYs+mm62IJ1tCFlL2ZiJS
         9cnyoA8TSycSThr7nKiNBc1l7WfT7XHIdiLkZol2xEaBxyBLghMP3x7z09hubdpkfOM6
         sN1uZxXQTBXZrDBf+OlkPzLNXRB8T+Q64i6q7XLwU5DwGEaYPJ17gP1vpw19ouvUqpxi
         ryU/1427gK2vT0i7oUbxNr79l2NXgfZAmM9PmNbaId2cuU4bcTe3hLWvB54mWIQ83gXe
         WRHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WkAq0EunsdESYsnTiWbvZfbyYA35v75dnIdluQE0Bw8=;
        b=fIZVE/ve/jlMi9qtxQZpKFznwV18BmTFv5E3QPKLkfb5EbqRTQLT5dhL0ePg1Nkn4T
         SSfPJubU4b8xaSgQlavWLWLx1MfXlV5k4hld3mQ57xzvrvaZzNo+h2G+TjFqQ10Ij4My
         N7Z2pV4neANF5UqHFZR9FBygYhaVUe071QHne1EmB3YRvyeWWGriGNhS2nJiut3oMrmx
         amFSA/KnuKjUTwzG/aoVu/5JYYvCmGQoq1X77aXpVtnH2xoZpAIe+notiQSB5wOMs3Lt
         dwkx087sez6Xc8XzVQLycezrD0YBVAFZf22HoTsRtnl+2d2UzHOApfPYGECXbCHC4xZD
         1Z4w==
X-Gm-Message-State: AOAM530xG/jg1byqCgcOyC9NNEz/PtfNg71o9cm7UwrsNcBHLs4H7TRJ
	3xTfLZbBrWBOZe8alrQecOG8phHdOFYnUshIgDQ=
X-Google-Smtp-Source: ABdhPJyMgDR9+S9bvlyvlCu3w3BWfCYsku1Kt8APiF6GJDetbPz1ZFZLTBp3DugTxKMCPqYYMXmsIA==
X-Received: by 2002:a17:90b:3706:: with SMTP id mg6mr171816pjb.90.1621260883273;
        Mon, 17 May 2021 07:14:43 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 66sm11292660pgj.9.2021.05.17.07.14.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 07:14:42 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 20/35] tiff: Exclude CVE-2015-7313 from cve-check
Date: Mon, 17 May 2021 04:13:26 -1000
Message-Id: <256f6be93eed82c7db8a76b1038e105331c0009f.1621260695.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1621260695.git.steve@sakoman.com>
References: <cover.1621260695.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Some fix upstream addresses the issue, it isn't clear which change this was. Our
current version doesn't have issues with the test image though so we can exclude.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3874da694ae1d9de06dd003bd80705205e2b033b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-multimedia/libtiff/tiff_4.1.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
index 97ad575f64..cfea18ed29 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
@@ -19,6 +19,10 @@ SRC_URI[sha256sum] = "5d29f32517dadb6dbcd1255ea5bbc93a2b54b94fbf83653b4d65c7d677
 # exclude betas
 UPSTREAM_CHECK_REGEX = "tiff-(?P<pver>\d+(\.\d+)+).tar"
 
+# Tested with check from https://security-tracker.debian.org/tracker/CVE-2015-7313
+# and 4.1.0 doesn't have the issue
+CVE_CHECK_WHITELIST += "CVE-2015-7313"
+
 inherit autotools multilib_header
 
 CACHED_CONFIGUREVARS = "ax_cv_check_gl_libgl=no"
-- 
2.25.1

