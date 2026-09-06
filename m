Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9199C79FA2
	for <webhook@archiver.kernel.org>; Sun,  6 Sep 2026 08:06:11 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9865.1788681966176343839
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Sep 2026 01:06:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OJ5aTQbL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso22893205e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Sep 2026 01:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788681964; x=1789286764; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SaLkWvufyXlDChcHe3upK3Cf3rjUhFpo7Z9adsuTQLI=;
        b=OJ5aTQbL9kWzsIkZ6v/TYQwk7fcriEx1sTcLp2YDk5w0RxGU/L4cClqdLMbf/qIuvl
         2hS0V+zLRgjo+DBXBMIK+yrJE3ZMC0F0Mn4CAjCbDPNB4l25kEEL/VJRuSnJKjGedl1J
         zNcGO5QWXbE1inzJ3/zmfI6cF1ISkJR/7ajyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788681964; x=1789286764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SaLkWvufyXlDChcHe3upK3Cf3rjUhFpo7Z9adsuTQLI=;
        b=arEtOaL20T5Y4AHveTwOaO3+ADfrl5bzDLjFsSrtI9qBmqLAU4TIaSOSG1pJfVK0IW
         y+9AMRVy16wVTr4Jm+oIePZTI8wsLBZAnCESeCIJLk0PFzBEv8Gt/24EFQldzfoE4TxB
         jMBCikYUTdm9slfrvriiS3n4KgxUMp3mUqA1SZKmz3+a52/3Dh+e9riGl1W7aH6enjQu
         QA2jSiVr84KJy5YDOCEcuQhNRFycMzGiV/TQQXtz8cZ4V6bg8c0VYMnPaynHUegkhk2H
         ZwytNj/JdaZU2wp5Vqb1bkh6LLNGSIzyVyCHioq3XZNozNP4Uzd0griZXOw5fjnDti2M
         wmrw==
X-Gm-Message-State: AFuF++ksvo12LMxcw3/bt+uOTZLjvMvF6cZf5JxiKKJ0IEIgp+eQx9uY
	KMbc8YQmkggZrgJNd0dvvQn1+lIsiSxBFOdYej39rAHXRfzyni6EQZn7n5bv6dfPUFGIWWa+v/U
	fO2SW744=
X-Gm-Gg: AYBFou3a91837BkqB8hLQbihXNSAq4JJmeDqHDCNJVOp326fk60YLgbGlV9ok5v0aPM
	d0xWm3wBS894sL/wH9hJdq4tiS2P9dLZ+2UF6T31MbTn1trpXuby+9gPerFhH5JuFveXlLZIeHc
	J9HAjipLR/Ps4/ExCRval3rOaZ/JvVNAgMpGmNo2fNIGyEZQAGXLHC/lUaTr/SAnhTCToaZw/ed
	iK13PByTlcMG6iybjc5V1Xnvp49hUTazLTCSs757XxhPyM1J8kluhaXjtLrec/jKXz+0+ZMz3P3
	dZjYszb2nHAKZUyvWn/vMCRhv2ykT3JV2glBJQU8BA0pELMNy/qIW4K2SR+F4LmdRRTSjuSTINJ
	gGVYHOKbGXEMN/HWPNwtaMklWJpgxmcCwoLfynN4OLB5IOWvlnZGxvwQBOeLpjMX7tgQTyNnIzE
	6HqbuXGPmJ9S9lBmOT34H3mthTKZdIriaRjVj0EmJnRpGYm8RcCVWdmNmmvmbFKY9xOmyPiHzFW
	crjLCixyhniKOvq8A==
X-Received: by 2002:a05:600d:6451:10b0:49c:fa21:1c8c with SMTP id 5b1f17b1804b1-49cfa211d1amr95463645e9.33.1788681964029;
        Sun, 06 Sep 2026 01:06:04 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:a7e4:ecad:c000:9c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfbdacc45sm183691545e9.11.2026.09.06.01.06.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 01:06:03 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/6] swig: upgrade 4.5.0 -> 4.5.1
Date: Sun,  6 Sep 2026 09:05:52 +0100
Message-ID: <20260906080553.3151802-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260906080553.3151802-1-richard.purdie@linuxfoundation.org>
References: <20260906080553.3151802-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Sep 2026 08:06:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245206

- Regression fix for %rename using a format string, such as Ruby's -autorename,
  dropping a class template's partial specializations.
- Regression fix restoring the %typemaps_string_alloc macro for string classes
  using custom allocators.
- Python fix for compile errors in a module that %imports another module already
  using the STL containers.
- MinGW configure and CMake PCRE2 version build fixes.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/swig/swig/determinism.patch           | 2 +-
 meta/recipes-devtools/swig/{swig_4.5.0.bb => swig_4.5.1.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/swig/{swig_4.5.0.bb => swig_4.5.1.bb} (94%)

diff --git a/meta/recipes-devtools/swig/swig/determinism.patch b/meta/recipes-devtools/swig/swig/determinism.patch
index 9b021091cd9..c298dec322d 100644
--- a/meta/recipes-devtools/swig/swig/determinism.patch
+++ b/meta/recipes-devtools/swig/swig/determinism.patch
@@ -1,4 +1,4 @@
-From 218e2a20ff978cb28fefdf7b35af8a27768df4db Mon Sep 17 00:00:00 2001
+From db5d5b5fc68eb99ea69f85dfadde541c786ac6d1 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Mon, 10 Aug 2026 11:13:20 +0000
 Subject: [PATCH] swig: Fix reproducibility issue
diff --git a/meta/recipes-devtools/swig/swig_4.5.0.bb b/meta/recipes-devtools/swig/swig_4.5.1.bb
similarity index 94%
rename from meta/recipes-devtools/swig/swig_4.5.0.bb
rename to meta/recipes-devtools/swig/swig_4.5.1.bb
index 161c23f0af3..250fc57a3a6 100644
--- a/meta/recipes-devtools/swig/swig_4.5.0.bb
+++ b/meta/recipes-devtools/swig/swig_4.5.1.bb
@@ -15,7 +15,7 @@ DEPENDS = "libpcre2 bison-native"
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
            file://determinism.patch \
            "
-SRC_URI[sha256sum] = "22ae0e887f8cca8031a325c67d005207653200b40e71edb3f88780e28e47d0ff"
+SRC_URI[sha256sum] = "7fec50b27deddab5455a9633780b6341eddfb96215a7619e93a76eb27178f653"
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/swig/files/swig/"
 UPSTREAM_CHECK_REGEX = "swig-(?P<pver>\d+(\.\d+)+)"
 

