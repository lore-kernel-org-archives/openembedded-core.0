Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30062.1793868229902208497
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 00:43:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=C39kiCA2;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so14463345e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 00:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793868228; x=1794473028; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=t029OmNeQLRN0LV5J1U3ysVuMfzHmS3is2WlNq+SdnA=;
        b=C39kiCA2ysuLa1tFmAUciQZt3suYgnrHlA1QkBH+GkMaVJ9/o8b78W7vDDyYMPNtDp
         Knlk4gzKnlO6UD8TZS21uFN5+sr4mhkCgBkbVyXiTO6UYfmP3hV4LFvjqVY6aLyNoSRf
         AfSZ0fSpyaihCJium+ECugfqgUUkNbyC2U5DSC+eGhBd20b3BWdK3vTPzgwVRKV92Eqt
         gMcvDaAM052gDYhP2pJNXqqwQLcsBpwto4lNzYcY0OWwyxCc/1jfroTdcLaPer2HRxKJ
         ITcNkykoEyRU/DtTVu9QRHAeTzYLIrQnD+EWnlqNuTHV9GgB6W282U0PDq8wOGX8YpMT
         F/fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868228; x=1794473028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=t029OmNeQLRN0LV5J1U3ysVuMfzHmS3is2WlNq+SdnA=;
        b=dTaaxvrhulBRZZhVTPV3hFh8RZsqX21yCf3VzmQqp7woYvhzT+IJb4rf3pCPmIbiEg
         saLDArGdxif/8XFXvVvt23XNzFWVV9Zv1Z2dYb4F7hHHeir8EnRia0pjHngALahxy4I2
         lSVsC2Vm3DI8XH2QBOhnwtOZG8STXClSAt6wP6VDdP81w8TPj618hm2E271QPBYlcrPz
         l2eEGrPU9A4Rk1jZ2pSNbJq04okgeCTd3NQ48ObWTEX1HBNrZOpc+ReT525nw3hZvD91
         Nr3/HT2wYJW8ZTKJu7UW36ZAfgVOP+dCDqC/Liijej9aDrDAKpWLPY5ym+KYcroAniN5
         PVUw==
X-Gm-Message-State: APuU4Z9+WIF+JZ7o/aArQxI8hnAlu2SjK44nfTKE+Fgw2324iiQcTLBY
	s+Yz3KSDINgjzLdCAbYEbcnoYywOXZAvFvwt+j4TAtlpLJKLvTWT8dvhMp5qZG8t/tz+5ZCaPDw
	XstljdTE=
X-Gm-Gg: AYBFou0SDdOTosWOfUfnghFenMkgXErHoCJBIl4AuINjb9GGcDRuVTsH3AyWMiUxrZA
	rQfa5eMyZdWo5PMl+ntjp/FS66XaLPgKqIg20CilfL6N7LjarRqq1lYEEgSbC0ikga0YwpktFB/
	vxF01zR3B9IHp+L/dhBm8quLPzFFQ1mDqnb754CZ0CTXbnZ4dqSFAe2iuWCwlEq+z+wlkwDaiuw
	nxxCdITJifcPrDpmyjX+iwFbqDxFHMyV5aK7vGTOwH6JUtvaKi/e2eenenvzs5Ybb4OcKjJAHwi
	etGC83yGRXC2HDOVDyWUDNCXuFzfj0T3W7OJi0nQqka+jqQKolxuSK3S+P9Xi6uxDi3TSVojnlO
	XA4Uen2Wm9Uqn1bbbTxHL27Hb7sMs4wm9ZWI4S0+vNTkBTPIk23ekDT/Sl1JRGKIim2cCqrjAnq
	H1dODYpEHdXNzqXVfqYhnaAZ08NqgCRlsHL9K9Yol8Z7uB4bhRhluyyN2r32Tse+wSX58InbjWM
	K+hINUL0OTTijhK949FC4OB02/EYOt9CBH8g+LJs7oOryfSjPJDgK08LAh0Vj1V9VKBsWOwbrBU
	sFH5JxTnlOptE/s8BYCyDqOz6DAlIzCgYrBZhC6IjzTf2kznx6bYnHuBeJZ5I6j+sv+//IKX4g6
	7FNhIgZSp74w1s93jQV3HYuHvp/xM
X-Received: by 2002:a05:600c:8b0a:b0:4a2:e0c:2b0a with SMTP id 5b1f17b1804b1-4ac1709a200mr423067315e9.16.1793868228072;
        Thu, 05 Nov 2026 00:43:48 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm9200620f8f.19.2026.11.05.00.43.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:43:47 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 20/60] pseudo: Upgrade 1.9.11 -> 1.9.12+git
Date: Thu,  5 Nov 2026 09:42:39 +0100
Message-ID: <9b0d9a9e05b0989b0b66cf24f155962569b703de.1793867929.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793867929.git.yoann.congal@smile.fr>
References: <cover.1793867929.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 08:43:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249479
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
