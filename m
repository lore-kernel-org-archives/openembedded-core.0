Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web12.15911.1627879046655478998
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Aug 2021 21:37:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ga4ebqAb;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id u13-20020a17090abb0db0290177e1d9b3f7so674858pjr.1
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Aug 2021 21:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pJS+aj/CK/87CWg2Jtr1ZNjctfSX8Y7KWX5kEyD4PTU=;
        b=ga4ebqAb1hs/jWfY/mSEEHNzAvs3jQPnSZbbLrwBnse63SfQuiBMSPWrP6D3TUNdRE
         +5c/IjrAmG1gurvIzNntC2NrPDqnh19kBBwgjaDvutc9QUzHZNvNnQg7VVQkoxQHFuEF
         NPE17eW+QbJ1TCqDmUgft+89K2I71Sduh9CHRUH3oG8vx3+KQJCiIUZ7porshGS+MsTQ
         Bmul/OT/ozj5I+xVf/NhMcDU8M30AMpK7WuJ1IUCr8N06LIWCRkFaUIjFHgmxAkewREq
         EDqv8HBZSPW57FOSAkI/Fy/uwt9kOYxXCzP0jHoELMRCbC9WCDirH68b9759F97k7QFy
         TgQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pJS+aj/CK/87CWg2Jtr1ZNjctfSX8Y7KWX5kEyD4PTU=;
        b=duOE86sT0fMCCSS3upkUuLXCewhpnKpjJ8kYeuGfIskVNZgbRUCMkrd7YmoRdknwwW
         PCT5OaH0Nv85C3/sSVVQyKk6MmGfg5R2Jg3SM5vGT7oFgWGWMZg3lKM1n2q9BdVoLGRh
         VA1itbIZ7SLjDKezybW53YcKNqkv8caJ/gSfrAOJGTHxt7X4YyzU3QXcXtcG1Icy5pV/
         I1g+KQzG0Kq+teLHN1IVV4UpPansc8wzf0Ku+7AaVys3d2RLZjDl5zz9boQafLZMydab
         ssVqlP/e8AUQBP1A2QMp0fAB+7Wx5WcVy5lKSQjh7jurzwbSkOQTvQ6Sg8vyQcJyb3K/
         24aQ==
X-Gm-Message-State: AOAM531ruE1UwbHj9I+GozpSbTI6hYjfmrfClXXW3d9NaKlVMiTm2uSd
	GlBXLcv/CATdeBJFt8u+dVCjAkXIXp0dlg==
X-Google-Smtp-Source: ABdhPJw633wP+Ruk/cwS2v0/TY/mG6trjivGZwL1zgvgavdYWraHdLzWZ0Y2oohg8ExevD7FzsCg9w==
X-Received: by 2002:a17:90b:3747:: with SMTP id ne7mr15106302pjb.64.1627879045974;
        Sun, 01 Aug 2021 21:37:25 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::d2cb])
        by smtp.gmail.com with ESMTPSA id c23sm10060073pfn.140.2021.08.01.21.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Aug 2021 21:37:25 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 4/4] glibc: Add missing symlinks for libpthread and librt dev files
Date: Sun,  1 Aug 2021 21:37:21 -0700
Message-Id: <20210802043721.3458646-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210802043721.3458646-1-raj.khem@gmail.com>
References: <20210802043721.3458646-1-raj.khem@gmail.com>
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
