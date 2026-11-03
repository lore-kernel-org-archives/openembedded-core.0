Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7758.1793700706338566506
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 02:11:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=DJDw3606;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48df8fe8513so3427930f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 02:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793700704; x=1794305504; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t029OmNeQLRN0LV5J1U3ysVuMfzHmS3is2WlNq+SdnA=;
        b=DJDw3606XmQn/ltK9CMcxYWGpSBzFD60G/Lc7wLYlKpHzpXOb4k1ASrTYhdk0wrcyk
         +3H8tUIzGLa8R9IEPNaWikQgxEL3tXhvuQYz3q1HuTsN8E/VFjybG2XSf23u7Lgefzau
         1kxn2IhiNsRYOMG+4CP93GiXEjLpiLeFXh3YTbhsEMO/i2eilb6Z2idYLPk3bh1sk47q
         GY9MYonHlgwjWulQx+DII8OiLgLSr1LpvOs95fcd/8l8oeazD6m8d5dD/NtY2q7iMCzj
         K2mW2OMChHXLFOEHd6ro0aM9JV92LANmFgiqyISAtnV6ET3klJWP4M5hOAOUWZEtqSLV
         Prkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793700704; x=1794305504;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t029OmNeQLRN0LV5J1U3ysVuMfzHmS3is2WlNq+SdnA=;
        b=hE/4dEJYQMkqN4LmZnJ8ocb46T5ns9BRtfkR1X9V+Eg+gv0JEuVs6/s6N5Hum6MwGZ
         Gl48kV1YotGbH0TgXnHrO3KGOhtD8tKfsokmY2xojW1PbaSxPccvYSdTcna86zUuDua6
         xtd1us/Iyf9TzFfIEh8zebET9Z4ayplO76HzTKjk8ZEO6Eg7g+8E/dBl+D7yRsS9Ir0f
         AKoIXcjN20eZbUirmntg9Npo2PMl1IAOGFblfeThli8bNYOe2OT0ol21AOD/S8DnaJr4
         nMghNpX0UEZoCHNe427zDa5wuMIWGa8famfiuiSbM06aTsIqvU1asKDTdvjjc7GSBHoU
         6N4g==
X-Gm-Message-State: APuU4Z9iBcQ8kti6AWGCU9gtriLgn8rPStR/e3YHwtnlnxX1fXPhH0Zq
	IHDZNF4IM97FO9XOl5rrl5aCalSvniqH1Rcg86bJiuGVMBi1E+KAr0Sw0t/ZMf7WUaZTAxwMaMc
	K7a34rZI=
X-Gm-Gg: AYBFou2NGTQRJzzWj5tDwA/JmkGQ1UWpmDzOn/wRZYvPMbdh2vu+FolLdwf9gwo3cz9
	G7VjbhUM70EfVkwttrt1dAt3kbHNFLsviJgcAP8ZOALFQ3TRpvZF3CBSAKPL9IgL5MvCOdqVRGy
	f2lXk19tCGMAdTtzPHIstOkPFpna1jRiy9ren6jbEpdmssBZMEYKEODHA4jVKkBv0Ar1Rr0wm1e
	4zb3w3tCjIr0AZbVRoVg/Atl8bLy54KjeKX4O/czrRxVnqxFgvwoBcs4zdP3V6+AZK1jSqSdvrk
	fzGhThSpU7IIjLOw/nrT5hxQ7iSfjzewhTYKIyHYwa4RtCKht44L5pIMO/BC7loxaT5I6DnuZma
	Tmr5OJoqAoiQEES+9RBxhTa0paD7F77zum4SZkUKuvFxWdMOVthzLZo8iDd91A5VqRLfN9Hh+rC
	zRrzHFj6VckCp/deVH6vs1lXOrfKRgbj7SmPon/+WsG3VAZEdVOiCFSBQUBHSkaWPIwQLyEvtHI
	WiZ9RtELK0Ufs0fD33LxYIsObaVuR/pDjQSX4x3HUOXdhOL34XXNJyqcBI+PmYdEhm+Z7MrPRYH
	F9p/iFdncUzBbs130iHofdp+uiYB8giuRCs10J4229KPCdY15vb1m9bqZc9P+H1yE+zO2dQZpkx
	NKPSOuVdoEQz40VgtaepnJE2jIHja537RAccorjw3T+83+1g7LqrgLc6b0Q==
X-Received: by 2002:a05:6000:29cf:b0:48c:4a62:9af7 with SMTP id ffacd0b85a97d-48e6e50090bmr17438558f8f.28.1793700704438;
        Tue, 03 Nov 2026 02:11:44 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fbba47a32sm1015068f8f.1.2026.11.03.02.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:11:44 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [blacksail][PATCH] pseudo: Upgrade 1.9.11 -> 1.9.12+git
Date: Tue,  3 Nov 2026 11:11:31 +0100
Message-ID: <20261103101131.870592-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 10:11:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249274
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
