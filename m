Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web09.15941.1627879905032159306
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Aug 2021 21:51:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fOmYH/c5;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id j3so3217880plx.4
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Aug 2021 21:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pJS+aj/CK/87CWg2Jtr1ZNjctfSX8Y7KWX5kEyD4PTU=;
        b=fOmYH/c5rxdFuUuJcLMGryV16rJd9G6FWo5so7gTsE7He3KY/tIzZyI3PcPgX1S6K8
         XfBCEQVtuL8s+VnGT8lcKFkC1p3I6qMh/q88G2hIP63V8tS9Ycv7bg4cRiilKAiHjsRr
         fkVzIIeAmWilN6A3B3LaBj/fovFyf4+m8DPrnrc7plXQNCKxb29WEQw2b24A2lNKhyMk
         fecO0jl0aiKYnURCZu/jl8XHaYLvuLV3nRdN1JuRm1vBO8P4lgZgsktTZJSXFqmx1xnf
         5RuZ0JwmHvkT9Tx2QOOwlJdSMAtq4W82+pCEdbX4+29/CFOItGFYn3y9YLVQMmWaOZRX
         v/vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pJS+aj/CK/87CWg2Jtr1ZNjctfSX8Y7KWX5kEyD4PTU=;
        b=r4IlNac9wOA8qpY1RqgTQt1+rd2rHM0lCJ5/zTO8s8sg652NPnns8Mar6yhXs5h57l
         mx0NrWcONUDj4AfOERlZp8SCfLleyj59XxAtaWOnXOueWe1uNj/1/AehPV0R7WV0DkEw
         cK8n+zPadVXmUUEyYwSGgtWWRrYW1D0INIHM8fi6x9JU51SZs+7ot4M8cNNH00UVjzmN
         fAvKURBOLk9ExbpQ1TWngJSjawz8CJcXDdT2tIp5zOdNuXlY7KGrrUpdK7WHg7HjcIY0
         4IdMChYWwv/ZDlCwEKolBlTxj7OWkxeuBKDikm9igoK3LvpwcaniiVVH8isO0jP4Lv1+
         exYA==
X-Gm-Message-State: AOAM5316hF8L1mSvxsXZYemRATnEye49xZO4+XUR7bNHDdfguqlIuYJG
	g3CVfqQqYcRC7r8v6K9RY/stfianKuLBiw==
X-Google-Smtp-Source: ABdhPJzPCegEAGWamNK5vi0Pmsr4JnhDD5+KZJLTojAzbkKyaGiPjCN32aOA5p+1uMM6A//LkQ91dA==
X-Received: by 2002:a17:902:e8d8:b029:117:8e2c:1ed5 with SMTP id v24-20020a170902e8d8b02901178e2c1ed5mr12653962plg.39.1627879904471;
        Sun, 01 Aug 2021 21:51:44 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::d2cb])
        by smtp.gmail.com with ESMTPSA id 16sm10153313pfu.109.2021.08.01.21.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Aug 2021 21:51:44 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 4/4] glibc: Add missing symlinks for libpthread and librt dev files
Date: Sun,  1 Aug 2021 21:51:39 -0700
Message-Id: <20210802045139.3481193-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210802045139.3481193-1-raj.khem@gmail.com>
References: <20210802045139.3481193-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/glibc-package.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index f031a90a33..aeab7de48c 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -119,6 +119,8 @@ do_install() {
 		ln -s ${@oe.path.relative('${root_prefix}/lib', '${base_libdir}')}/${ARCH_DYNAMIC_LOADER} \
 				${D}${root_prefix}/lib/${ARCH_DYNAMIC_LOADER}
 	fi
+        lnr ${D}${base_libdir}/libpthread.so.0 ${D}${libdir}/libpthread.so
+        lnr ${D}${base_libdir}/librt.so.1 ${D}${libdir}/librt.so
 }

 def get_libc_fpu_setting(bb, d):
--
2.32.0
