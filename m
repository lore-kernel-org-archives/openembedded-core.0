Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
 by mx.groups.io with SMTP id smtpd.web11.1488.1588648792253461925
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2020 20:19:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=iBjDmMRg;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.196, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f196.google.com with SMTP id f7so209032pfa.9
        for <openembedded-core@lists.openembedded.org>; Mon, 04 May 2020 20:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Jke2eAVl4bVo8Bo1iaACvD80slVBmNiRfN/mmSZzfCY=;
        b=iBjDmMRgI71dYyjoJp7GEae4sNCdvGDnm1A+wnC6oNaYxtSXo5nZMqs8iWjGnjOtFB
         ZNxJFeIaStPZNPOyhMK7bRy45g5sypbltRcFSoUiGysuhqFuW2rttOGuJUifI7On/szJ
         nDlnKDAbTCVX2seN2ITWtJpigIsTpzaqp99reVIY7G6Nt4a8P9Ke0tqFgTHMnizMDXJd
         JkRa2Fbd6nUQfPtFud7b8VdBL5z9pAH733yv1UNBwqIFYY3MBXNCaOtnPultaxG8YQdl
         5JiCmpIxrWrglj13eFWz/KpMMRzrl5BIouEuIsaKhdzFGE3xyeiCl+gnMkrfVKzTvjor
         8ykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Jke2eAVl4bVo8Bo1iaACvD80slVBmNiRfN/mmSZzfCY=;
        b=kPVGSje+wDRuwqpKQIJSrAHGf54P+YzJMLbRDZ7U9BmDCBFRRBIY5Na1KRJIQ+/Fhn
         vqKBxdKTRHQjVHYTvALS8P2etvgoQ9Td5pPWi3mOouvHgWIo1qOJJ3aqzPGU3pk6/zQ9
         +cegxnpTTa9B7M5ZuChKEIpADXgzWQeG//ROGKzwJwsJL9ZeUzp3GDd08yfx4vKrORHP
         z23gf2fhRNIQrMCxWzC/DsL+HMxLta25HiGuzalAgLHDKgbstfGlflv80CBvwe+JxnER
         gUburGc9Iu4L/TVDr+U5lVNyhh75SJLV8svYBcYIB/cSk3t1jKT1kDXllD6ZxDVWKX/3
         5h8w==
X-Gm-Message-State: AGi0PubKQSeeOZV1eOjsPEVkeIhd3oFjf6dHDCgJoKcNJSUueJsUaW7/
	kocdyEyWDXwoiiMdtxA3lvM5jWVfaQgFMg==
X-Google-Smtp-Source: APiQypIWs2SeRI0EsLzYASSvNWpHlMKXhAWdq5eWAppiLFPeY3DknLs3Enz2Gc1pk9WFwDlOqmJ75w==
X-Received: by 2002:a63:a36f:: with SMTP id v47mr1221763pgn.242.1588648791175;
        Mon, 04 May 2020 20:19:51 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 20sm503379pfx.116.2020.05.04.20.19.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 20:19:50 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/28] bzip2/pbzip2: Correct license information
Date: Mon,  4 May 2020 17:18:56 -1000
Message-Id: <05fdae7687d22e9f3476c807a15906a1f80e4daa.1588638879.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1588638879.git.steve@sakoman.com>
References: <cover.1588638879.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The license of pbzip2 looks slightly BSD like but is in fact the bzip2
license. The SPDX identifier for this is "bzip-1.0.6" since there is
another version of the bzip license out there.

To clear up all the confusion, use the SPDX license name and update
both recipes to refer to it. The copyright information is slightly
different between the codebases but the license looks the same.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/files/common-licenses/{bzip2 => bzip2-1.0.6} | 0
 meta/recipes-extended/bzip2/bzip2_1.0.8.bb        | 2 +-
 meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb     | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/files/common-licenses/{bzip2 => bzip2-1.0.6} (100%)

diff --git a/meta/files/common-licenses/bzip2 b/meta/files/common-licenses/bzip2-1.0.6
similarity index 100%
rename from meta/files/common-licenses/bzip2
rename to meta/files/common-licenses/bzip2-1.0.6
diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
index 8e9b779e67..d58f553a49 100644
--- a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
+++ b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
@@ -4,7 +4,7 @@ Huffman coding. Compression is generally considerably better than that achieved
 LZ77/LZ78-based compressors, and approaches the performance of the PPM family of statistical compressors."
 HOMEPAGE = "https://sourceware.org/bzip2/"
 SECTION = "console/utils"
-LICENSE = "bzip2"
+LICENSE = "bzip2-1.0.6"
 LIC_FILES_CHKSUM = "file://LICENSE;beginline=4;endline=37;md5=600af43c50f1fcb82e32f19b32df4664"
 
 SRC_URI = "https://sourceware.org/pub/${BPN}/${BPN}-${PV}.tar.gz \
diff --git a/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb b/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb
index 1275cc0097..d7450c73c1 100644
--- a/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb
+++ b/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb
@@ -5,7 +5,7 @@ machines. The output of this version is fully compatible with bzip2 v1.0.2 or \
 newer (ie: anything compressed with pbzip2 can be decompressed with bzip2)."
 HOMEPAGE = "http://compression.ca/pbzip2/"
 SECTION = "console/utils"
-LICENSE = "BSD-4-Clause"
+LICENSE = "bzip-1.0.6"
 LIC_FILES_CHKSUM = "file://COPYING;md5=398b8832c6f840cfebd20ab2be6a3743"
 
 DEPENDS = "bzip2"
-- 
2.17.1

