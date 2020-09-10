Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web12.20436.1599740677014926970
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 05:24:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Y6RvUCaE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id z4so6499778wrr.4
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 05:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YiRHk6uAosA3Q18VD05F8MlHI/NrWszT6mI8skMfJwA=;
        b=Y6RvUCaEfw5ykbzT+E1wSgmp6HuZtHm7BM1XN/b0EKvdxYQ21sptgFXb4wXU31jaol
         3L/w93NcbnqajkNR684jzY9HCm3TC8VS5r8P1EoKT6n/YNav/tUBfYnRN8CWB3udZn2G
         ODymg4PtWQbacYMW2ju5RNKOSk1gDbsBkZ3X4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YiRHk6uAosA3Q18VD05F8MlHI/NrWszT6mI8skMfJwA=;
        b=MzhGGeoFmMFE6N+GK9zE90esDfgvoX8aYfsOreyN8ZRlGfm+E/nL9Xxit+Ej7qvMGG
         YUGcDc9yXyp04dudUFMA/EewzTzDgKGsiJ5VoPSYWTfgSDayu54ckQV66OWtCqGFp1lh
         xkPMRgydeincid/8fgO0Hysc/e8aDTp4/pr/DM6j4gLS3LXXyZuO4xizeSyuIqDoDr3b
         hnUgQGgfKcPeYjeUDyl3Unvsc4oi9Q2VXD25mYV0bccJsNrDDJZwBxQlyJyaaYnPlQIy
         e+5tRKZSH1kqsxhTuaAsedLBxWfr0Ei81K7F4jnOhgbeHJGLUjtfjUXRsiHvk0EE1AZp
         YNGw==
X-Gm-Message-State: AOAM530gHZXyy/P6BUTDlFGRC2tAFRHJi1ZWk47zGJp6MsvMGyDEzzSF
	RHZ8d27mIw4lpGrx8ziidOLQar6riSfxRg==
X-Google-Smtp-Source: ABdhPJxUWS6EdENyjVHsuj4E6Y6JFOLIE3eTn4hZhZXD+bUlPhQEUUgZT55MFMKP40rLSve8NEkeqQ==
X-Received: by 2002:adf:f6c2:: with SMTP id y2mr8589386wrp.79.1599740675290;
        Thu, 10 Sep 2020 05:24:35 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (2.f.a.6.5.4.b.4.5.7.2.f.a.5.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:605a:f275:4b45:6af2])
        by smtp.gmail.com with ESMTPSA id j7sm8590498wrs.11.2020.09.10.05.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 05:24:34 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Michael Halstead <mhalstead@linuxfoundation.org>
Subject: [PATCH][thud 02/29] yocto-uninative.inc: version 2.8 updates glibc to 2.31
Date: Thu, 10 Sep 2020 13:24:06 +0100
Message-Id: <20200910122433.2040293-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200910122433.2040293-1-richard.purdie@linuxfoundation.org>
References: <20200910122433.2040293-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Michael Halstead <mhalstead@linuxfoundation.org>

Allow sstate use in Tumbleweed and other distros as they update glibc.

(From OE-Core rev: ccb374c279b260b1fd3460f6bfd1567240816055)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/yocto-uninative.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index ad75d3e2a39..889695eae34 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -6,9 +6,9 @@
 # to the distro running on the build machine.
 #
 
-UNINATIVE_MAXGLIBCVERSION = "2.30"
+UNINATIVE_MAXGLIBCVERSION = "2.31"
 
-UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.7/"
-UNINATIVE_CHECKSUM[aarch64] ?= "e76a45886ee8a0b3904b761c17ac8ff91edf9811ee455f1832d10763ba794dfc"
-UNINATIVE_CHECKSUM[i686] ?= "810d027dfb1c7675226afbcec07808770516c969ee7378f6d8240281083f8924"
-UNINATIVE_CHECKSUM[x86_64] ?= "9498d8bba047499999a7310ac2576d0796461184965351a56f6d32c888a1f216"
+UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.8/"
+UNINATIVE_CHECKSUM[aarch64] ?= "989187344bf9539b464fb7ed9c223e51f4bdb4c7a677d2c314e6fed393176efe"
+UNINATIVE_CHECKSUM[i686] ?= "cc3e45bc8594488b407363e3fa9af5a099279dab2703c64342098719bd674990"
+UNINATIVE_CHECKSUM[x86_64] ?= "a09922172c3a439105e0ae6b943daad2d83505b17da0aba97961ff433b8c21ab"
-- 
2.25.1

