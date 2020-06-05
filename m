Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.13547.1591370979546539095
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2020 08:29:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OwFee0Qg;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id x93so7757005ede.9
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2020 08:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=k5/i2aXHeMHXufa7c0CH9a8VSWnKOrT5l1z4aUMgJNc=;
        b=OwFee0Qg4thxhbzCodaIXYTAHYLPpDm+Q1Q9oDM47Tju3dRhbQAfmMOqXtv15ft1AW
         0xUMIBRMLEuFxeLCJg0JLU2FJYl14QjAfEWQqIBAlBasG8OYSCmyMKcdqhmWniEZaxsj
         26fWYkvS4zKRIowLlLMBksvt/fGL58zr6WiaEJQCNs7QsW1uZ50AEdZHX1oIukFO8kTX
         tGhBuKBuRb6jR14QTFNZ8Kgfo3Hrs1IGojGE40XXqKI0SPU1LAXPo37vrc7jKZNqnrQ4
         zYrJ4LFhL+MmmqTu76x2zsGkK7TN2pHdSp+abM/fJaz9iLuKqyoRvGIsRbfCNSvZlKnl
         qFww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k5/i2aXHeMHXufa7c0CH9a8VSWnKOrT5l1z4aUMgJNc=;
        b=eKlzw6tZITmHKzl+Xdh+w9R8HCsowXlgBZNfCJYB2ZDfj0sztv4ogAhi7lmQLjDJSh
         cVIiJEXa1UMqsMGhcn9RuITzDSadQ7BKpdyyKMxKRlmSLVvs8roimPJPRpwv7qyIDxKD
         3S8uWiCGW+c7hXqzSIEBftDXXCVMVs/WwlH7w1L1G6MmXfKYWmmCgDGQxPDRdenBnM7o
         a8ySUwAxAc1vk5nY7vZBFYpfYj+N4xKDunuG/1ddutET8Me+3/3uG0cUuPoPprn3mdAj
         6x3a4Z8zrSCYLiNtebfs386/aLNK/XAEOeHljjKBx2pOcvezRx0wUt8ojO4XCP8x1dNW
         YYHQ==
X-Gm-Message-State: AOAM533kFw10HR1enwt0hHeFNPIRoSkN9SDcSjxokrAnvGg1qyyWdFL/
	vOdSQUl2x7vFEyBdc5436Ij4w1QCkfY=
X-Google-Smtp-Source: ABdhPJzxsAgdvzva2ryARUFI71PzWw0emQ1iepDHCJG/NW8mbghsNc0t4HRDuC6ELqlAjdlUVag/zQ==
X-Received: by 2002:a50:9b16:: with SMTP id o22mr9622866edi.130.1591370977672;
        Fri, 05 Jun 2020 08:29:37 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f0816493dd1634773746530.dip0.t-ipconnect.de. [2003:f0:7f08:1649:3dd1:6347:7374:6530])
        by smtp.gmail.com with ESMTPSA id o12sm5189609edq.7.2020.06.05.08.29.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2020 08:29:37 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] harfbuzz: upgrade 2.6.4 -> 2.6.7
Date: Fri,  5 Jun 2020 17:29:26 +0200
Message-Id: <20200605152927.3428858-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200605152927.3428858-1-schnitzeltony@gmail.com>
References: <20200605152927.3428858-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* Seems they stopped maintaining freedesktop downloads so we missed few versions.
  To stay tuned add UPSTREM_CHECKs.
* License checksum was changed by credits & date changes [1]

[1] https://github.com/harfbuzz/harfbuzz/commit/5440313924172e155e34391f033f5e6c5e2390b3#diff-7116ef0705885343c9e1b2171a06be0e

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../harfbuzz/{harfbuzz_2.6.4.bb => harfbuzz_2.6.7.bb} | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_2.6.4.bb => harfbuzz_2.6.7.bb} (77%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_2.6.4.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_2.6.7.bb
similarity index 77%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_2.6.4.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_2.6.7.bb
index ee08c12bee..4f79da4170 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_2.6.4.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_2.6.7.bb
@@ -4,12 +4,15 @@ HOMEPAGE = "http://www.freedesktop.org/wiki/Software/HarfBuzz"
 BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=HarfBuzz"
 SECTION = "libs"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=e11f5c3149cdec4bb309babb020b32b9 \
+LIC_FILES_CHKSUM = "file://COPYING;md5=8f787620b7d3866d9552fd1924c07572 \
                     file://src/hb-ucd.cc;beginline=1;endline=15;md5=29d4dcb6410429195df67efe3382d8bc"
 
-SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/${BP}.tar.xz"
-SRC_URI[md5sum] = "2b3a4dfdb3e5e50055f941978944da9f"
-SRC_URI[sha256sum] = "9413b8d96132d699687ef914ebb8c50440efc87b3f775d25856d7ec347c03c12"
+UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
+UPSTREAM_CHECK_REGEX = "harfbuzz-(?P<pver>\d+(\.\d+)+).tar"
+
+SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "3b884586a09328c5fae76d8c200b0e1c"
+SRC_URI[sha256sum] = "49e481d06cdff97bf68d99fa26bdf785331f411614485d892ea4c78eb479b218"
 
 inherit autotools pkgconfig lib_package gtk-doc
 
-- 
2.26.2

