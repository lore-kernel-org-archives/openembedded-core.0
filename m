Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.10948.1602240664848176962
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Oct 2020 03:51:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fk01eGyC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id e18so9779535wrw.9
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Oct 2020 03:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g0IGgCq1uU4x1FZ4X5mn2H7niOo//ASa1lo/cZ8UYgo=;
        b=fk01eGyC1j+h2GK9k+tKaapp41U1FUid+baQ1TqdJhjnSp2GmElpLuLrYvtJdFCuoz
         43UPdXLcTZWfo3UVOYP0hIIkGYvO9NcP5KwFWjItR1qQXIMcg91Ntw2XFCQp46pExhUs
         XV2i2Hs2tKghRtaHdXEEwJxsPyE5JXSfRsjC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g0IGgCq1uU4x1FZ4X5mn2H7niOo//ASa1lo/cZ8UYgo=;
        b=FJ0btrPDdhU9/gU5S3JkxWKDmVa61gQyFRCBwRsbhbF1CBJ7pjohr9g8LuXk1YEoTr
         E4be4173xkFKFbnvqo5opha6lEwKvRdjoele+A+RxtSNzwhCH1uvv6UZXbC3G9KtiH3p
         saigp46NP/s04mncl1vSN8lqHhNooHU9dkBbPqFI7t8QD3L8HJOeVRCBb6WN8SmObqRD
         hMaMctvC4b63BID6BHJf2Z6OK8WYrkkodDGeNfpuV21UINYMB4xTmnaM2XXhgfGOxKX1
         0snFIntEU35AbZu7U0w4hYmxJmzqtbqfkXgNwXbUD7PStFud/WkG25IKaJaNMmXNP4BU
         /bRg==
X-Gm-Message-State: AOAM533ucpNX/eqDnazXFMmrMiQ8CjvRNPlCoY6M6/U6K8gsJBk/OejK
	Eq0p+KOgc3mcxTMqYJliwUgxtu3dYw29XA==
X-Google-Smtp-Source: ABdhPJxhHKCyDO8S4EeUzDPIc0SVQAAPGPx3nSpLIfyVjmSjjtpBEhVnqoHJOR2tB1JtmHlIg+wuSQ==
X-Received: by 2002:adf:f74e:: with SMTP id z14mr14025276wrp.312.1602240663258;
        Fri, 09 Oct 2020 03:51:03 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (0.6.6.4.7.a.b.4.4.1.e.0.e.3.c.2.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:2c3e:e14:4ba7:4660])
        by smtp.gmail.com with ESMTPSA id y6sm11678682wrt.80.2020.10.09.03.51.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 03:51:02 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] pseudo: Upgrade to include mkostemp64 wrapper
Date: Fri,  9 Oct 2020 11:51:02 +0100
Message-Id: <20201009105102.3279914-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Newer systems are using this currently unwrapped glibc function,
add it.

[YOCTO #14080]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 8df92f3f23c..77207905c21 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -7,7 +7,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
            file://fallback-group \
            "
 
-SRCREV = "07141f919dc8582460f984ed1d2fb73e05f82ef3"
+SRCREV = "cca0d7f15b7197095cd587420d31b187620c3093"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.25.1

