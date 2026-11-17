Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2086.1794939635282367084
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 10:20:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=ZBlDKkmB;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4a2f4ca0dcfso35512f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 10:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794939633; x=1795544433; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=t029OmNeQLRN0LV5J1U3ysVuMfzHmS3is2WlNq+SdnA=;
        b=ZBlDKkmBKeVELC4sdfu9yVn2UWVzvW1vlclnL99WFoLQRrDE0FLjmHvpQ3tDYZhXfs
         nssdVX9PmFks8EWvYs0AoM1+38HRuw1wUu5zt9il2ZpGRDEz5d6VMixuJByOuCpw75d9
         +y+a5WG9rZo+XpZVLQo7IbJd+Y6/qF+nZ5kGCTXktpJ9V0E8KIm+2V0Tw/zMHsUT1n0Q
         wWqYu095CgEcsCFnS6WRKBT83FhbevlO6u38PCe4NGzh1FEZnVS0xoWbU0Cy5l1looUa
         0xgoJG7qFBRTvnTdeq/bnmoqQTLM5Lm3JRzw5Uhe1m/ONQEqBbm3CvtBpMEXjnvCaFo1
         UYqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794939633; x=1795544433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=t029OmNeQLRN0LV5J1U3ysVuMfzHmS3is2WlNq+SdnA=;
        b=BWQuJmkgumb5I0JwGimZw309eZixWH8Lu87eTK9R4b9TrqvEODqD0e6WViza+Mnuyf
         L+o3C+eSUmr3bERRyhG0kca7mNfyK8s8tgWOAjZGRCjMSJFhxm5UcHR3pszu64A/A13U
         rv04/WQG//0sfVPDIXFiPht3OKGxgyV3pX1RJksJtqGXLZCWvLxFaKwcoWMsjtk0jwHB
         uO9euBJYL+yiXPYEwpheg0yeu6LB76NJBhoFZxShBVeoJVCCt/19g9t1GPbYO1DKbtFm
         2RZNOSBU+8ZKtZKsAAhLKwZxhZv0gqg0EmsS+8lCxPskOoJtHqv4yDvi4DkYi0ImZ2mo
         dXbQ==
X-Gm-Message-State: APuU4Z9lZ/xjMWTfq+bx0flkUtqiTe1uBznbrZl60GiDTNTGzke7EzVq
	P6RB5N8iMVKFDLJgo9ylruOpnBmvCInWVfymUGiauZ3iGum6UTxbKIlyOWRxFRGXUH2nRIJ4owM
	Q11rw43I=
X-Gm-Gg: AZFdTZfSpXNtKEGr4SxrFlRKTv9qmg3XC74PR8uiMJ1nJL5NFB2BAGwl99AVFruHtQq
	JMlUNt1yKycjbEghacT7H9XybBGOfc6JYVWMDIMW+0T9iOKPaJLzVsJ1lCg2yaJb92i+LoNsqPN
	w4vRPmWJN1NRSubWwR8mFDCyISJhI4cWAv2mK1RClMAfyYGYKGAl35B4arvCshy92p21UczN5ZZ
	Q13RjPKaKluZ7CJyxSryfK5XeWMRJ5g7Jl/caks7/8rMLRbteUsiokK7lFqU35gXDh/ZJZLvYXs
	zkC8a1lVl52BVmAQxlMuYFcmr2BhXFHXRS32/dJk9vV8KzPBxoY2XYmPqyIiVCpQ07/r1u7Zlbp
	f5xtNhJyCtTnLB1XNGlEhQVOUbMSKoGuSLoB3XaMuM2D8t1mtl8u5tK1RD/Tmo2Hxd5SLv0F0VT
	7ej6s5VhcKdTXCUw9OA2ZuwpLSmvWsZNRmn+q/VhkY5Ki8Li0ShowdkQmWSLzWftuIwDaU7f2iN
	dytrk9AZYZtDa57W4jENg2llSRt04saZouq300GDXgeU3tJAkJ8irNFTB2UwfWInNaIKAi20YyF
	wC8XI3hNvpIF2qvTSVwVmVNnfr/5/eKu2o+NaM+Ba6QOvS5D+q6luE1o02BOaruSrcrF8AxG0uw
	6jMq7UxmXRkB1CqDF9oXq0QChtOrNc1OqvgVnDvvzWs2NMKKgLw==
X-Received: by 2002:a5d:584b:0:b0:48d:e101:5707 with SMTP id ffacd0b85a97d-4a63c657c97mr620212f8f.13.1794939633339;
        Tue, 17 Nov 2026 10:20:33 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654997681sm114337f8f.15.2026.11.17.10.20.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:20:32 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 01/17] pseudo: Upgrade 1.9.11 -> 1.9.12+git
Date: Tue, 17 Nov 2026 19:20:01 +0100
Message-ID: <0abfc2d49408b51896ab9eeed0bbd2da3f0e6e7a.1794939400.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1794939400.git.yoann.congal@smile.fr>
References: <cover.1794939400.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 18:20:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250468
Content-Type: text/plain; charset="utf-8"

From: Yoann Congal <yoann.congal@smile.fr>

Switch from master to the pseudo-1.9 stable branch.

Changelog:
* pseudo_client: Fix xattr/rename handling with empty paths
* ports/linux/guts: Add open_tree wrapper
* test: Add open_tree test
* ports/linux/pseudo_wrappers.c: Add syscall support for open_tree() wrapper
* test: Add open_tree syscall test
* test: Add open_tree_attr syscall test
* ports/linux/guts: Add open_tree_attr wrapper
* ports/linux/pseudo_wrappers: forward pre-init syscall/prctl to the real function
* pseudo_util: bound pseudo_get_value()'s recovery re-init
* Makefile.in: Bump to 1.9.12
* ports/linux: Add missing header
* ports/linux: Fix header ordering for Ubuntu 22.04
* ports/linux/guts: Fix uninitialized pseudo_path in open_tree wrappers

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index d8466b018e1..02e86799f7b 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -1,6 +1,6 @@
 require pseudo.inc
 
-SRC_URI = "git://git.yoctoproject.org/pseudo;branch=master;protocol=https;tag=pseudo-${PV} \
+SRC_URI = "git://git.yoctoproject.org/pseudo;branch=pseudo-1.9;protocol=https \
            file://fallback-passwd \
            file://fallback-group \
            "
@@ -12,8 +12,8 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "ba8887e5f1e922f866681ec7dec1a00b602a9328"
-PV = "1.9.11"
+SRCREV = "e627b0dcb639f387db935fae1f9b93b30cded5e1"
+PV = "1.9.12+git"
 
 # largefile and 64bit time_t support adds these macros via compiler flags globally
 # remove them for pseudo since pseudo intercepts some of the functions which will be
