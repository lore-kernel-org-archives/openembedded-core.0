Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.50247.1624294998204896375
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jun 2021 10:03:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NWp4+3AE;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id p4-20020a17090a9304b029016f3020d867so396601pjo.3
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Jun 2021 10:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pqF7rSbQ3xjF8+CIH5+WCzyhee1IWrUIt69bL9Qdmjc=;
        b=NWp4+3AEsamx1H4hNJHt7D5DLLxqG8I5X04S8KKO/mUXkaMWbNw8TW3MFsHD1ALjum
         sOVzMT/vliLZAZkJnqPKq7G5HxfKCoD1n2dU4RBEZh3uY/FQS+nrcwHmf/BjkBfqBZXi
         g3+PSWezvcmLO5i4wOmfH23KQ8BJcobfS3sznuYV6ADVDayex0Ve1pEmBDH4fqC5FFiW
         6hxP9X3WltxllKFMVLHkQaHu/7Bq4E5oYniEEhLlsHwn+97kFznswxPCac0jtxzMEXNW
         zOEDBlfpnjCMPs7g2IjVa6GvsnL1pVyS96ZUbfgRxp+a22/GHtWMPIVY+VK5BFchU2u8
         GagQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pqF7rSbQ3xjF8+CIH5+WCzyhee1IWrUIt69bL9Qdmjc=;
        b=qdf45z+oTyiYWxCi/P8r7nbMQE6VW27LpliFFjhGJWoNw94kmRmOpxc8gTmsvenUWj
         Yt0yRVQpDsRkYYFDthF2/zplOsmdnxfHz/bbcsdEnawc/KkK5PJIT3cldyMJm8pYoDq4
         rGfkhSTC+A8I5E1kvrW9OqneZjiK1/X2THGEQrPXB/6deY+rxnfl6EL9mwK6yjvT2YAz
         QaJqvnIIUayVHqCi4avR6PzSHkCBJizSqhdAxEQykjEVku5+mzSKoPWmNq6pkMck0u7t
         L0gnQ4okuFgYCbUH3ierWVeFk/3O37eoJveLCrwlDnk7HdatX/5Kf2fttIGk588TbJRn
         7P5Q==
X-Gm-Message-State: AOAM531mnNGR/hI3oKIkvVVE33WaWRW/8vTOJEh0gBzrN11/SThpYrHX
	ITH/9yxCjiMvSNTTT9XwnamhgMSJ/m+UVw==
X-Google-Smtp-Source: ABdhPJxczR+z5lVf5s5ERIUJWrJhYjDm8Y2ffd7C3NZWZz1QS1HOjHf8VVGleV22Hx7jerKDXP7IRg==
X-Received: by 2002:a17:90a:c796:: with SMTP id gn22mr24955pjb.0.1624294997495;
        Mon, 21 Jun 2021 10:03:17 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from nereus.local ([2601:1c0:6000:9640:8a50:f0aa:6cd5:a7ef])
        by smtp.gmail.com with ESMTPSA id s125sm6002868pgc.63.2021.06.21.10.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 10:03:17 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@intel.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [RFC PATCH 10/10][dunfell] python3-ptest: add newly discovered missing rdeps
Date: Mon, 21 Jun 2021 10:02:57 -0700
Message-Id: <47017e2c80d3685d324d320ce8e3731e1082f84e.1624294059.git.timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1624294059.git.timothy.t.orling@intel.com>
References: <cover.1624294059.git.timothy.t.orling@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Making ptest images based on core-image-minimal uncovered quite a
few missing depenendcies from various recipes, here they are.

(From OE-Core rev: 2cda6242f2f0f6f9c6bdef72bbb271eab7e5e1f5)

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Backport to Python 3.8.10 (only python3 portion of patch)
Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 meta/recipes-devtools/python/python3_3.8.10.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3_3.8.10.bb b/meta/recipes-devtools/python/python3_3.8.10.bb
index 3e4386e57c8..c3da6718a89 100644
--- a/meta/recipes-devtools/python/python3_3.8.10.bb
+++ b/meta/recipes-devtools/python/python3_3.8.10.bb
@@ -332,6 +332,7 @@ PACKAGES =+ "libpython3 libpython3-staticdev"
 FILES_libpython3 = "${libdir}/libpython*.so.*"
 FILES_libpython3-staticdev += "${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_MAJMIN}-*/libpython${PYTHON_MAJMIN}.a"
 INSANE_SKIP_${PN}-dev += "dev-elf"
+INSANE_SKIP_${PN}-ptest += "dev-deps"
 
 # catch all the rest (unsorted)
 PACKAGES += "${PN}-misc"
@@ -347,7 +348,7 @@ FILES_${PN}-man = "${datadir}/man"
 # See https://bugs.python.org/issue18748 and https://bugs.python.org/issue37395
 RDEPENDS_libpython3_append_libc-glibc = " libgcc"
 RDEPENDS_${PN}-ctypes_append_libc-glibc = " ${MLPREFIX}ldconfig"
-RDEPENDS_${PN}-ptest = "${PN}-modules ${PN}-tests unzip bzip2 libgcc tzdata-europe coreutils sed"
+RDEPENDS_${PN}-ptest = "${PN}-modules ${PN}-tests ${PN}-dev unzip bzip2 libgcc tzdata-europe coreutils sed"
 RDEPENDS_${PN}-ptest_append_libc-glibc = " locale-base-tr-tr.iso-8859-9"
 RDEPENDS_${PN}-tkinter += "${@bb.utils.contains('PACKAGECONFIG', 'tk', 'tk tk-lib', '', d)}"
 RDEPENDS_${PN}-dev = ""
-- 
2.30.2

