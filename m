Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1470.1795801791089930526
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 09:49:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=ZKOPQoow;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e46e449e8so5502783f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 09:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795801789; x=1796406589; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+S9b6yhU+DoxDtTbVQFr6zcIw/e3Xvxl5Tl0CMeFqV0=;
        b=ZKOPQoownmYADHr1gJdSsjG3Ph8OyzaXyESGlqre4uTxviYwOE+VmQa1Ty14fxZCss
         gKP4pZsp++aO+2hS6f9cA0C/olpwHa3qpqifH/dbY/skFWQHa3E/C+QXzr+39PPa8s1k
         u6GwnJ3+BYsUZew+kxq4uaRtm9al5Dv171jb8EIdLdNVwY11hM0X49p914RBqJih0tLK
         LjcPzGX6gdkdGlD6NYI+1p1CFOWF3t/dIG3gZ/3wTCNw+r6Sjlq1fsa3EmSwXDEv+wSp
         IuAbmaoPAOu7owjqpx3aY0cnj3kWj4AsX26gtyTVWOA8IpS0cadwgmHZe9Qdf+y7umTG
         goZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795801789; x=1796406589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+S9b6yhU+DoxDtTbVQFr6zcIw/e3Xvxl5Tl0CMeFqV0=;
        b=RCPhXdACbUF6zZ1HxacNswzDnUE1f/GDlDfrTz60snaSv+Xajkf1SXLV829IwqTtRJ
         hYzFOI13CcmWgS4zWCxfQq0d1TDawkDOq5hTVB8VM+j/RaSmpRGZPbheLYBAvm0sBRhZ
         zNgcXj4QCCFUlOEdV0eWarcsVh3vm6w15iQx+n98rZD3Oba7IVuz+d/B9W19aUSYYuyb
         Vof1FF+02CDfB5EjWY3mlT40lCnL7dXm5VdeXUg4rO3vzum/ymC0+Pg5OOdElDew3upw
         51t80GQeYbMTOhel69Wz286cb40Jh2brg6epymUGEl57bmdyrkeCLlociUwFzV56VFjC
         Qb+A==
X-Gm-Message-State: APuU4Z+baSx90HiQ2Ss4Ot3DIywJ7mMpiYfFW+x4sN/hXb3LXNG0bH+f
	LQ7A9bt22HGHOugghdFDPkJiiwIXxmkm3H91OsKJ86d4z+1sc+olqcFDc/6JdiHcU1lTuhm3N1f
	ALP6tn28=
X-Gm-Gg: AZFdTZcJhTsY8eHEIE4c6dqx+vdlh6C96rnC1SXyW7HXRh4aVhJyfF8mQ9Fi+OhU4Dh
	+WJl9o4AvrjK21CTIH7q4CEhwrCb4AFqIW8JQJSt2tFFn6mroRyi8ibSxE9/2vQomRMPD9fYTB5
	JRSeId3U205vpuGI9RcwKF1bAixcp2KNE+mcz8YjHDUQ7btBPY0hqt5T2zbRptMNd7kKjzduIyE
	cw6foRzBtQikxqFpEgRDnEXu8JOCH/qvBc5JWRuYDS8swAsphz9VHPbNnKKAPeozDAzO5otxz7N
	hidP1z6oIDHkCw1U00KiYAAVmcBLE9PKGe5xrvWsjSNUexWqgwjEvb4BlUDVp+jU5/tLGQdoKDX
	6HArBNYUJZRLT7Wr4RdDdfGL4mrK0GM0vv/IDPR2JDdihj0oTVmSaRCVW738CnJQlxYawrx8KcU
	kPJUUzAPoJQdrsMe8tTpvfdEnRghgfL+UJyH5rjHDbHtXYoDajB3b6RBgzyEH8v+iiX8ypqbVX6
	HZ0zJwGJqc1w0Bl4N33/OewPjpqDuhMMSOaVVzlOKa5jceO3uNP+7tZcL53dpitDcz1MGFY2MI5
	mmPCU8y77UYuWcM9OJJTjXb+3yLB7vwGR/LGdF4nACL3uURTYnnKz80858qJDo6A9fYG2JFeIKn
	0JkJCf9YyJov7n9nsFfzSMr04KOkRHw==
X-Received: by 2002:a05:6000:26ca:b0:4aa:8fc3:2909 with SMTP id ffacd0b85a97d-4abad5ac730mr45473403f8f.2.1795801789035;
        Fri, 27 Nov 2026 09:49:49 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm49374624f8f.16.2026.11.27.09.49.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:49:48 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 26/37] linux-yocto/6.6: update CVE exclusions (6.6.162)
Date: Fri, 27 Nov 2026 18:49:09 +0100
Message-ID: <8f1bf3e301dcbc3399c27ce54ed6669a9a31b642.1795798718.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795798718.git.yoann.congal@smile.fr>
References: <cover.1795798718.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 17:49:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251432
Content-Type: text/plain; charset="utf-8"

From: Yoann Congal <yoann.congal@smile.fr>

$ ./meta/recipes-kernel/linux/generate-cve-exclusions.py .../cvelistV5/ 6.6.162 > meta/recipes-kernel/linux/cve-exclusion_6.6.inc

Generated at 2026-11-21 23:19:46.787108+00:00 for kernel version 6.6.162
From cvelistV5 cve_2026-11-21_2200Z-4-g2e9db7b0ebc

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../linux/cve-exclusion_6.6.inc               | 1322 +++++++++++++++--
 1 file changed, 1237 insertions(+), 85 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.6.inc b/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
index 24961f31688..da26078546b 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
@@ -1,11 +1,11 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2026-10-29 13:34:05.293881+00:00 for kernel version 6.6.160
-# From cvelistV5 cve_2026-10-29_1300Z-1-g135f63d1c5d
+# Generated at 2026-11-21 23:19:46.787108+00:00 for kernel version 6.6.162
+# From cvelistV5 cve_2026-11-21_2200Z-4-g2e9db7b0ebc
 
 
 python check_kernel_cve_status_version() {
-    this_version = "6.6.160"
+    this_version = "6.6.162"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -18746,7 +18746,7 @@ CVE_STATUS[CVE-2025-39963] = "fixed-version: only affects 6.10 onwards"
 
 CVE_STATUS[CVE-2025-39964] = "cpe-stable-backport: Backported in 6.6.108"
 
-CVE_STATUS[CVE-2025-39965] = "fixed-version: only affects 6.15.11 onwards"
+CVE_STATUS[CVE-2025-39965] = "cpe-stable-backport: Backported in 6.6.109"
 
 CVE_STATUS[CVE-2025-39966] = "fixed-version: only affects 6.11 onwards"
 
@@ -20514,6 +20514,12 @@ CVE_STATUS[CVE-2026-100078] = "cpe-stable-backport: Backported in 6.6.157"
 
 CVE_STATUS[CVE-2026-100079] = "cpe-stable-backport: Backported in 6.6.157"
 
+CVE_STATUS[CVE-2026-100080] = "cpe-stable-backport: Backported in 6.6.162"
+
+CVE_STATUS[CVE-2026-100081] = "cpe-stable-backport: Backported in 6.6.162"
+
+CVE_STATUS[CVE-2026-100082] = "cpe-stable-backport: Backported in 6.6.162"
+
 CVE_STATUS[CVE-2026-17523] = "fixed-version: Fixed from version 5.4"
 
 CVE_STATUS[CVE-2026-22976] = "cpe-stable-backport: Backported in 6.6.121"
@@ -21270,7 +21276,7 @@ CVE_STATUS[CVE-2026-23353] = "fixed-version: only affects 6.19 onwards"
 
 CVE_STATUS[CVE-2026-23354] = "fixed-version: only affects 6.9 onwards"
 
-CVE_STATUS[CVE-2026-23355] = "fixed-version: only affects 6.18.14 onwards"
+# CVE-2026-23355 needs backporting (fixed from 6.19.7)
 
 CVE_STATUS[CVE-2026-23356] = "cpe-stable-backport: Backported in 6.6.130"
 
@@ -21462,7 +21468,7 @@ CVE_STATUS[CVE-2026-23449] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-23450] = "cpe-stable-backport: Backported in 6.6.130"
 
-CVE_STATUS[CVE-2026-23451] = "fixed-version: only affects 6.18.19 onwards"
+# CVE-2026-23451 needs backporting (fixed from 6.19.10)
 
 CVE_STATUS[CVE-2026-23452] = "cpe-stable-backport: Backported in 6.6.130"
 
@@ -22524,7 +22530,7 @@ CVE_STATUS[CVE-2026-43113] = "cpe-stable-backport: Backported in 6.6.136"
 
 CVE_STATUS[CVE-2026-43114] = "cpe-stable-backport: Backported in 6.6.136"
 
-CVE_STATUS[CVE-2026-43115] = "cpe-stable-backport: Backported in 6.6.160"
+# CVE-2026-43115 needs backporting (fixed from 7.0)
 
 CVE_STATUS[CVE-2026-43116] = "cpe-stable-backport: Backported in 6.6.143"
 
@@ -25732,7 +25738,7 @@ CVE_STATUS[CVE-2026-64015] = "cpe-stable-backport: Backported in 6.6.142"
 
 CVE_STATUS[CVE-2026-64016] = "fixed-version: only affects 6.18.33 onwards"
 
-# CVE-2026-64017 may need backporting (fixed from 6.7)
+CVE_STATUS[CVE-2026-64017] = "cpe-stable-backport: Backported in 6.6.161"
 
 CVE_STATUS[CVE-2026-64018] = "cpe-stable-backport: Backported in 6.6.142"
 
@@ -28654,7 +28660,7 @@ CVE_STATUS[CVE-2026-72491] = "cpe-stable-backport: Backported in 6.6.145"
 
 CVE_STATUS[CVE-2026-72492] = "cpe-stable-backport: Backported in 6.6.145"
 
-# CVE-2026-72493 needs backporting (fixed from 7.2)
+CVE_STATUS[CVE-2026-72493] = "fixed-version: only affects 6.10 onwards"
 
 CVE_STATUS[CVE-2026-72494] = "cpe-stable-backport: Backported in 6.6.160"
 
@@ -30250,8 +30256,6 @@ CVE_STATUS[CVE-2026-80809] = "cpe-stable-backport: Backported in 6.6.154"
 
 CVE_STATUS[CVE-2026-80810] = "fixed-version: only affects 6.15 onwards"
 
-CVE_STATUS[CVE-2026-80811] = "fixed-version: only affects 6.15 onwards"
-
 CVE_STATUS[CVE-2026-80812] = "cpe-stable-backport: Backported in 6.6.154"
 
 CVE_STATUS[CVE-2026-80813] = "fixed-version: only affects 6.13 onwards"
@@ -30468,8 +30472,6 @@ CVE_STATUS[CVE-2026-80918] = "cpe-stable-backport: Backported in 6.6.154"
 
 CVE_STATUS[CVE-2026-80919] = "fixed-version: only affects 7.1 onwards"
 
-CVE_STATUS[CVE-2026-80920] = "cpe-stable-backport: Backported in 6.6.160"
-
 CVE_STATUS[CVE-2026-80921] = "cpe-stable-backport: Backported in 6.6.156"
 
 CVE_STATUS[CVE-2026-80922] = "fixed-version: only affects 6.7 onwards"
@@ -30646,10 +30648,6 @@ CVE_STATUS[CVE-2026-81007] = "cpe-stable-backport: Backported in 6.6.157"
 
 CVE_STATUS[CVE-2026-81008] = "cpe-stable-backport: Backported in 6.6.157"
 
-CVE_STATUS[CVE-2026-81009] = "fixed-version: only affects 6.18 onwards"
-
-CVE_STATUS[CVE-2026-81010] = "fixed-version: only affects 6.7 onwards"
-
 CVE_STATUS[CVE-2026-81011] = "cpe-stable-backport: Backported in 6.6.157"
 
 CVE_STATUS[CVE-2026-81012] = "cpe-stable-backport: Backported in 6.6.157"
@@ -32686,7 +32684,7 @@ CVE_STATUS[CVE-2026-92489] = "cpe-stable-backport: Backported in 6.6.157"
 
 CVE_STATUS[CVE-2026-92490] = "cpe-stable-backport: Backported in 6.6.157"
 
-CVE_STATUS[CVE-2026-92491] = "fixed-version: only affects 6.9 onwards"
+# CVE-2026-92491 needs backporting (fixed from 7.3)
 
 CVE_STATUS[CVE-2026-92492] = "fixed-version: only affects 7.1 onwards"
 
@@ -33748,8 +33746,6 @@ CVE_STATUS[CVE-2026-97616] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-97617] = "fixed-version: only affects 6.10 onwards"
 
-CVE_STATUS[CVE-2026-97618] = "fixed-version: only affects 6.12 onwards"
-
 CVE_STATUS[CVE-2026-97619] = "cpe-stable-backport: Backported in 6.6.160"
 
 CVE_STATUS[CVE-2026-97620] = "fixed-version: only affects 6.8 onwards"
@@ -34452,7 +34448,7 @@ CVE_STATUS[CVE-2026-98247] = "cpe-stable-backport: Backported in 6.6.158"
 
 CVE_STATUS[CVE-2026-98249] = "cpe-stable-backport: Backported in 6.6.158"
 
-CVE_STATUS[CVE-2026-98250] = "fixed-version: only affects 7.2 onwards"
+CVE_STATUS[CVE-2026-98250] = "fixed-version: only affects 6.18.64 onwards"
 
 CVE_STATUS[CVE-2026-98251] = "cpe-stable-backport: Backported in 6.6.158"
 
@@ -36102,7 +36098,7 @@ CVE_STATUS[CVE-2026-99075] = "fixed-version: only affects 6.18 onwards"
 
 # CVE-2026-99076 needs backporting (fixed from 7.3)
 
-# CVE-2026-99077 needs backporting (fixed from 7.3)
+CVE_STATUS[CVE-2026-99077] = "cpe-stable-backport: Backported in 6.6.161"
 
 CVE_STATUS[CVE-2026-99078] = "cpe-stable-backport: Backported in 6.6.160"
 
@@ -36120,7 +36116,7 @@ CVE_STATUS[CVE-2026-99084] = "fixed-version: only affects 7.1 onwards"
 
 CVE_STATUS[CVE-2026-99085] = "fixed-version: only affects 6.12 onwards"
 
-CVE_STATUS[CVE-2026-99086] = "fixed-version: only affects 6.18.16 onwards"
+CVE_STATUS[CVE-2026-99086] = "fixed-version: only affects 6.12.75 onwards"
 
 # CVE-2026-99087 needs backporting (fixed from 7.3)
 
@@ -36148,9 +36144,9 @@ CVE_STATUS[CVE-2026-99098] = "fixed-version: only affects 6.11 onwards"
 
 CVE_STATUS[CVE-2026-99099] = "fixed-version: only affects 6.15 onwards"
 
-# CVE-2026-99100 needs backporting (fixed from 7.3)
+CVE_STATUS[CVE-2026-99100] = "cpe-stable-backport: Backported in 6.6.161"
 
-# CVE-2026-99101 needs backporting (fixed from 7.3)
+CVE_STATUS[CVE-2026-99101] = "fixed-version: only affects 7.1 onwards"
 
 CVE_STATUS[CVE-2026-99102] = "fixed-version: only affects 7.1 onwards"
 
@@ -36160,7 +36156,7 @@ CVE_STATUS[CVE-2026-99104] = "fixed-version: only affects 7.1 onwards"
 
 CVE_STATUS[CVE-2026-99105] = "fixed-version: only affects 6.12 onwards"
 
-# CVE-2026-99106 needs backporting (fixed from 7.3)
+CVE_STATUS[CVE-2026-99106] = "cpe-stable-backport: Backported in 6.6.161"
 
 CVE_STATUS[CVE-2026-99107] = "fixed-version: only affects 7.1 onwards"
 
@@ -36168,73 +36164,73 @@ CVE_STATUS[CVE-2026-99108] = "fixed-version: only affects 7.1 onwards"
 
 # CVE-2026-99109 needs backporting (fixed from 7.3)
 
-# CVE-2026-99110 needs backporting (fixed from 7.3)
+CVE_STATUS[CVE-2026-99110] = "cpe-stable-backport: Backported in 6.6.161"
 
 CVE_STATUS[CVE-2026-99111] = "fixed-version: only affects 6.18 onwards"
 
-# CVE-2026-99112 needs backporting (fixed from 7.3)
+CVE_STATUS[CVE-2026-99112] = "cpe-stable-backport: Backported in 6.6.161"
 
-# CVE-2026-99113 needs backporting (fixed from 7.3)
+CVE_STATUS[CVE-2026-99113] = "cpe-stable-backport: Backported in 6.6.161"
 
-# CVE-2026-99114 needs backporting (fixed from 7.3)
+CVE_STATUS[CVE-2026-99114] = "cpe-stable-backport: Backported in 6.6.161"
 
-# CVE-2026-99115 needs backporting (fixed from 7.3)
+CVE_STATUS[CVE-2026-99115] = "cpe-stable-backport: Backported in 6.6.161"
 
 CVE_STATUS[CVE-2026-99116] = "fixed-version: only affects 6.18 onwards"
 
-# CVE-2026-99117 needs backporting (fixed from 7.3)
+CVE_STATUS[CVE-2026-99117] = "cpe-stable-backport: Backported in 6.6.161"
 
-# CVE-2026-99118 needs backporting (fixed from 7.3)
+CVE_STATUS[CVE-2026-99118] = "cpe-stable-backport: Backported in 6.6.161"
 
 CVE_STATUS[CVE-2026-99119] = "fixed-version: only affects 7.2 onwards"
 
 CVE_STATUS[CVE-2026-99120] = "fixed-version: only affects 6.18 onwards"
 
-# CVE-2026-99121 needs backporting (fixed from 7.3)
+CVE_STATUS[CVE-2026-99121] = "cpe-stable-backport: Backported in 6.6.161"
 
 # CVE-2026-99122 needs backporting (fixed from 7.3)
 
-# CVE-2026-99123 needs backporting (fixed from 7.3)
+CVE_STATUS[CVE-2026-99123] = "cpe-stable-backport: Backported in 6.6.161"
 
-# CVE-2026-99124 needs backporting (fixed from 7.3)
+CVE_STATUS[CVE-2026-99124] = "cpe-stable-backport: Backported in 6.6.161"
 
 CVE_STATUS[CVE-2026-99125] = "fixed-version: only affects 6.11 onwards"
 
-# CVE-2026-99126 needs backporting (fixed from 7.3)
+CVE_STATUS[CVE-2026-99126] = "cpe-stable-backport: Backported in 6.6.161"
 
-# CVE-2026-99127 needs backporting (fixed from 7.3)
+CVE_STATUS[CVE-2026-99127] = "cpe-stable-backport: Backported in 6.6.161"
 
-# CVE-2026-99128 needs backporting (fixed from 7.3)
+CVE_STATUS[CVE-2026-99128] = "cpe-stable-backport: Backported in 6.6.161"
 
 CVE_STATUS[CVE-2026-99129] = "fixed-version: only affects 7.0 onwards"
 
-# CVE-2026-99130 needs backporting (fixed from 7.3)
+CVE_STATUS[CVE-2026-99130] = "cpe-stable-backport: Backported in 6.6.161"
 
-# CVE-2026-99131 needs backporting (fixed from 7.3)
+CVE_STATUS[CVE-2026-99131] = "cpe-stable-backport: Backported in 6.6.161"
 
-# CVE-2026-99132 needs backporting (fixed from 7.3)
+CVE_STATUS[CVE-2026-99132] = "cpe-stable-backport: Backported in 6.6.161"
 
-# CVE-2026-99133 needs backporting (fixed from 7.3)
+CVE_STATUS[CVE-2026-99133] = "cpe-stable-backport: Backported in 6.6.161"
 
 CVE_STATUS[CVE-2026-99134] = "fixed-version: only affects 6.8 onwards"
 
-# CVE-2026-99135 needs backporting (fixed from 7.3)
+CVE_STATUS[CVE-2026-99135] = "cpe-stable-backport: Backported in 6.6.161"
 
-# CVE-2026-99136 needs backporting (fixed from 7.3)
+CVE_STATUS[CVE-2026-99136] = "cpe-stable-backport: Backported in 6.6.161"
 
 CVE_STATUS[CVE-2026-99137] = "fixed-version: only affects 6.18 onwards"
 
-# CVE-2026-99138 needs backporting (fixed from 7.3)
+CVE_STATUS[CVE-2026-99138] = "cpe-stable-backport: Backported in 6.6.161"
 
-# CVE-2026-99139 needs backporting (fixed from 7.3)
+CVE_STATUS[CVE-2026-99139] = "cpe-stable-backport: Backported in 6.6.161"
 
-# CVE-2026-99140 needs backporting (fixed from 7.3)
+CVE_STATUS[CVE-2026-99140] = "cpe-stable-backport: Backported in 6.6.161"
 
 CVE_STATUS[CVE-2026-99141] = "fixed-version: only affects 6.19 onwards"
 
-# CVE-2026-99142 needs backporting (fixed from 7.3)
+CVE_STATUS[CVE-2026-99142] = "cpe-stable-backport: Backported in 6.6.161"
 
-# CVE-2026-99143 needs backporting (fixed from 7.3)
+CVE_STATUS[CVE-2026-99143] = "cpe-stable-backport: Backported in 6.6.161"
 
 CVE_STATUS[CVE-2026-99144] = "fixed-version: only affects 7.1 onwards"
 
@@ -36242,27 +36238,27 @@ CVE_STATUS[CVE-2026-99145] = "fixed-version: only affects 7.1 onwards"
 
 # CVE-2026-99146 needs backporting (fixed from 7.3)
 
-# CVE-2026-99147 needs backporting (fixed from 7.3)
+CVE_STATUS[CVE-2026-99147] = "cpe-stable-backport: Backported in 6.6.161"
 
 CVE_STATUS[CVE-2026-99148] = "fixed-version: only affects 6.16 onwards"
 
 CVE_STATUS[CVE-2026-99149] = "fixed-version: only affects 6.19 onwards"
 
-# CVE-2026-99150 needs backporting (fixed from 7.3)
+CVE_STATUS[CVE-2026-99150] = "cpe-stable-backport: Backported in 6.6.161"
 
 CVE_STATUS[CVE-2026-99151] = "fixed-version: only affects 7.2.9 onwards"
 
-# CVE-2026-99152 needs backporting (fixed from 7.3)
+CVE_STATUS[CVE-2026-99152] = "cpe-stable-backport: Backported in 6.6.161"
 
-# CVE-2026-99153 needs backporting (fixed from 7.3)
+CVE_STATUS[CVE-2026-99153] = "cpe-stable-backport: Backported in 6.6.161"
 
-# CVE-2026-99154 needs backporting (fixed from 7.3)
+CVE_STATUS[CVE-2026-99154] = "cpe-stable-backport: Backported in 6.6.161"
 
-# CVE-2026-99155 needs backporting (fixed from 7.3)
+CVE_STATUS[CVE-2026-99155] = "cpe-stable-backport: Backported in 6.6.161"
 
-# CVE-2026-99156 needs backporting (fixed from 7.3)
+CVE_STATUS[CVE-2026-99156] = "cpe-stable-backport: Backported in 6.6.161"
 
-# CVE-2026-99157 needs backporting (fixed from 7.3)
+CVE_STATUS[CVE-2026-99157] = "cpe-stable-backport: Backported in 6.6.161"
 
 CVE_STATUS[CVE-2026-99158] = "fixed-version: only affects 6.10 onwards"
 
@@ -36270,49 +36266,49 @@ CVE_STATUS[CVE-2026-99159] = "fixed-version: only affects 6.12 onwards"
 
 CVE_STATUS[CVE-2026-99160] = "fixed-version: only affects 6.12 onwards"
 
-# CVE-2026-99161 needs backporting (fixed from 7.3)
+CVE_STATUS[CVE-2026-99161] = "cpe-stable-backport: Backported in 6.6.161"
 
 CVE_STATUS[CVE-2026-99162] = "fixed-version: only affects 6.19 onwards"
 
-# CVE-2026-99163 needs backporting (fixed from 7.3)
+CVE_STATUS[CVE-2026-99163] = "cpe-stable-backport: Backported in 6.6.161"
 
 CVE_STATUS[CVE-2026-99164] = "fixed-version: only affects 7.0 onwards"
 
-# CVE-2026-99165 needs backporting (fixed from 7.3)
+CVE_STATUS[CVE-2026-99165] = "cpe-stable-backport: Backported in 6.6.161"
 
-# CVE-2026-99166 needs backporting (fixed from 7.3)
+CVE_STATUS[CVE-2026-99166] = "cpe-stable-backport: Backported in 6.6.161"
 
-# CVE-2026-99167 needs backporting (fixed from 7.3)
+CVE_STATUS[CVE-2026-99167] = "cpe-stable-backport: Backported in 6.6.161"
 
 CVE_STATUS[CVE-2026-99168] = "fixed-version: only affects 6.19 onwards"
 
-# CVE-2026-99169 needs backporting (fixed from 7.3)
+CVE_STATUS[CVE-2026-99169] = "cpe-stable-backport: Backported in 6.6.161"
 
 CVE_STATUS[CVE-2026-99170] = "fixed-version: only affects 7.1 onwards"
 
-# CVE-2026-99171 needs backporting (fixed from 7.3)
+CVE_STATUS[CVE-2026-99171] = "cpe-stable-backport: Backported in 6.6.161"
 
 # CVE-2026-99172 needs backporting (fixed from 7.3)
 
-# CVE-2026-99173 may need backporting (fixed from 6.7)
+CVE_STATUS[CVE-2026-99173] = "cpe-stable-backport: Backported in 6.6.161"
 
-# CVE-2026-99174 needs backporting (fixed from 7.3)
+CVE_STATUS[CVE-2026-99174] = "cpe-stable-backport: Backported in 6.6.161"
 
-# CVE-2026-99175 needs backporting (fixed from 7.3)
+CVE_STATUS[CVE-2026-99175] = "cpe-stable-backport: Backported in 6.6.161"
 
-# CVE-2026-99176 needs backporting (fixed from 7.3)
+CVE_STATUS[CVE-2026-99176] = "cpe-stable-backport: Backported in 6.6.161"
 
 CVE_STATUS[CVE-2026-99177] = "fixed-version: only affects 7.2 onwards"
 
 # CVE-2026-99178 needs backporting (fixed from 7.3)
 
-# CVE-2026-99179 needs backporting (fixed from 7.3)
+CVE_STATUS[CVE-2026-99179] = "cpe-stable-backport: Backported in 6.6.161"
 
-# CVE-2026-99180 needs backporting (fixed from 7.3)
+CVE_STATUS[CVE-2026-99180] = "cpe-stable-backport: Backported in 6.6.161"
 
-# CVE-2026-99181 needs backporting (fixed from 7.3)
+CVE_STATUS[CVE-2026-99181] = "cpe-stable-backport: Backported in 6.6.161"
 
-# CVE-2026-99182 needs backporting (fixed from 7.3)
+CVE_STATUS[CVE-2026-99182] = "cpe-stable-backport: Backported in 6.6.161"
 
 CVE_STATUS[CVE-2026-99183] = "fixed-version: only affects 6.18 onwards"
 
@@ -36322,7 +36318,7 @@ CVE_STATUS[CVE-2026-99185] = "fixed-version: only affects 6.19 onwards"
 
 CVE_STATUS[CVE-2026-99186] = "fixed-version: only affects 6.19 onwards"
 
-# CVE-2026-99187 needs backporting (fixed from 7.3)
+CVE_STATUS[CVE-2026-99187] = "cpe-stable-backport: Backported in 6.6.161"
 
 CVE_STATUS[CVE-2026-99188] = "fixed-version: only affects 6.19 onwards"
 
@@ -36330,9 +36326,9 @@ CVE_STATUS[CVE-2026-99188] = "fixed-version: only affects 6.19 onwards"
 
 CVE_STATUS[CVE-2026-99190] = "fixed-version: only affects 6.12.114 onwards"
 
-# CVE-2026-99191 needs backporting (fixed from 7.3)
+CVE_STATUS[CVE-2026-99191] = "cpe-stable-backport: Backported in 6.6.161"
 
-# CVE-2026-99192 needs backporting (fixed from 7.3)
+CVE_STATUS[CVE-2026-99192] = "cpe-stable-backport: Backported in 6.6.161"
 
 CVE_STATUS[CVE-2026-99193] = "fixed-version: only affects 7.2 onwards"
 
@@ -36350,17 +36346,17 @@ CVE_STATUS[CVE-2026-99199] = "fixed-version: only affects 7.2 onwards"
 
 CVE_STATUS[CVE-2026-99200] = "fixed-version: only affects 7.2 onwards"
 
-# CVE-2026-99201 needs backporting (fixed from 7.3)
+CVE_STATUS[CVE-2026-99201] = "cpe-stable-backport: Backported in 6.6.161"
 
-CVE_STATUS[CVE-2026-99202] = "fixed-version: only affects 6.18.44 onwards"
+CVE_STATUS[CVE-2026-99202] = "cpe-stable-backport: Backported in 6.6.161"
 
-# CVE-2026-99203 needs backporting (fixed from 7.3)
+CVE_STATUS[CVE-2026-99203] = "cpe-stable-backport: Backported in 6.6.161"
 
-# CVE-2026-99204 needs backporting (fixed from 7.3)
+CVE_STATUS[CVE-2026-99204] = "cpe-stable-backport: Backported in 6.6.161"
 
 CVE_STATUS[CVE-2026-99205] = "fixed-version: only affects 7.0 onwards"
 
-# CVE-2026-99206 needs backporting (fixed from 7.3)
+CVE_STATUS[CVE-2026-99206] = "cpe-stable-backport: Backported in 6.6.161"
 
 CVE_STATUS[CVE-2026-99207] = "fixed-version: only affects 7.1 onwards"
 
@@ -36370,17 +36366,1173 @@ CVE_STATUS[CVE-2026-99209] = "fixed-version: only affects 6.8 onwards"
 
 CVE_STATUS[CVE-2026-99210] = "fixed-version: only affects 6.18 onwards"
 
-# CVE-2026-99211 needs backporting (fixed from 7.3)
+CVE_STATUS[CVE-2026-99211] = "cpe-stable-backport: Backported in 6.6.161"
 
-# CVE-2026-99212 needs backporting (fixed from 7.3)
+CVE_STATUS[CVE-2026-99212] = "cpe-stable-backport: Backported in 6.6.161"
 
-# CVE-2026-99213 needs backporting (fixed from 7.3)
+CVE_STATUS[CVE-2026-99213] = "cpe-stable-backport: Backported in 6.6.161"
 
 CVE_STATUS[CVE-2026-99214] = "fixed-version: only affects 6.11 onwards"
 
 # CVE-2026-99215 needs backporting (fixed from 7.3)
 
-# CVE-2026-99216 needs backporting (fixed from 7.3)
+CVE_STATUS[CVE-2026-99216] = "cpe-stable-backport: Backported in 6.6.161"
+
+CVE_STATUS[CVE-2026-99218] = "cpe-stable-backport: Backported in 6.6.161"
+
+CVE_STATUS[CVE-2026-99219] = "cpe-stable-backport: Backported in 6.6.161"
+
+CVE_STATUS[CVE-2026-99220] = "cpe-stable-backport: Backported in 6.6.161"
+
+CVE_STATUS[CVE-2026-99221] = "cpe-stable-backport: Backported in 6.6.161"
+
+CVE_STATUS[CVE-2026-99222] = "cpe-stable-backport: Backported in 6.6.161"
+
+CVE_STATUS[CVE-2026-99223] = "cpe-stable-backport: Backported in 6.6.161"
+
+CVE_STATUS[CVE-2026-99224] = "cpe-stable-backport: Backported in 6.6.161"
+
+CVE_STATUS[CVE-2026-99225] = "cpe-stable-backport: Backported in 6.6.161"
+
+CVE_STATUS[CVE-2026-99226] = "cpe-stable-backport: Backported in 6.6.161"
+
+CVE_STATUS[CVE-2026-99227] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-99228] = "cpe-stable-backport: Backported in 6.6.161"
+
+CVE_STATUS[CVE-2026-99229] = "cpe-stable-backport: Backported in 6.6.161"
+
+CVE_STATUS[CVE-2026-99230] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-99231] = "fixed-version: only affects 6.12.113 onwards"
+
+CVE_STATUS[CVE-2026-99232] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-99233] = "cpe-stable-backport: Backported in 6.6.161"
+
+CVE_STATUS[CVE-2026-99234] = "cpe-stable-backport: Backported in 6.6.161"
+
+CVE_STATUS[CVE-2026-99235] = "cpe-stable-backport: Backported in 6.6.161"
+
+CVE_STATUS[CVE-2026-99236] = "cpe-stable-backport: Backported in 6.6.161"
+
+CVE_STATUS[CVE-2026-99237] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-99238] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-99239] = "cpe-stable-backport: Backported in 6.6.161"
+
+CVE_STATUS[CVE-2026-99240] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-99241] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-99242] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-99244] = "cpe-stable-backport: Backported in 6.6.161"
+
+CVE_STATUS[CVE-2026-99245] = "cpe-stable-backport: Backported in 6.6.161"
+
+CVE_STATUS[CVE-2026-99246] = "cpe-stable-backport: Backported in 6.6.161"
+
+CVE_STATUS[CVE-2026-99247] = "cpe-stable-backport: Backported in 6.6.161"
+
+CVE_STATUS[CVE-2026-99248] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-99249] = "cpe-stable-backport: Backported in 6.6.161"
+
+CVE_STATUS[CVE-2026-99250] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-99251] = "cpe-stable-backport: Backported in 6.6.161"
+
+CVE_STATUS[CVE-2026-99253] = "fixed-version: only affects 7.2 onwards"
+
+CVE_STATUS[CVE-2026-99254] = "cpe-stable-backport: Backported in 6.6.161"
+
+CVE_STATUS[CVE-2026-99255] = "cpe-stable-backport: Backported in 6.6.161"
+
+CVE_STATUS[CVE-2026-99256] = "cpe-stable-backport: Backported in 6.6.161"
+
+CVE_STATUS[CVE-2026-99257] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-99258] = "fixed-version: only affects 6.12.41 onwards"
+
+CVE_STATUS[CVE-2026-99259] = "fixed-version: only affects 7.2 onwards"
+
+CVE_STATUS[CVE-2026-99260] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-99261] = "fixed-version: only affects 7.2 onwards"
+
+CVE_STATUS[CVE-2026-99269] = "fixed-version: only affects 7.1 onwards"
+
+# CVE-2026-99270 needs backporting (fixed from 7.1)
+
+# CVE-2026-99271 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99272 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99273 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99274 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99275 needs backporting (fixed from 7.4rc1)
+
+CVE_STATUS[CVE-2026-99276] = "fixed-version: only affects 7.2.8 onwards"
+
+CVE_STATUS[CVE-2026-99277] = "fixed-version: only affects 7.2.8 onwards"
+
+CVE_STATUS[CVE-2026-99278] = "fixed-version: only affects 7.2.8 onwards"
+
+CVE_STATUS[CVE-2026-99279] = "fixed-version: only affects 7.2.8 onwards"
+
+CVE_STATUS[CVE-2026-99280] = "fixed-version: only affects 7.2.8 onwards"
+
+# CVE-2026-99281 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99282 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99283 needs backporting (fixed from 7.3)
+
+# CVE-2026-99284 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99285 may need backporting (fixed from 6.7)
+
+CVE_STATUS[CVE-2026-99286] = "fixed-version: only affects 6.12.116 onwards"
+
+# CVE-2026-99287 needs backporting (fixed from 7.4rc3)
+
+# CVE-2026-99288 needs backporting (fixed from 7.4rc2)
+
+CVE_STATUS[CVE-2026-99289] = "fixed-version: only affects 7.2 onwards"
+
+# CVE-2026-99290 may need backporting (fixed from 6.7)
+
+CVE_STATUS[CVE-2026-99291] = "fixed-version: only affects 7.2.6 onwards"
+
+# CVE-2026-99292 needs backporting (fixed from 7.4rc1)
+
+CVE_STATUS[CVE-2026-99293] = "fixed-version: only affects 6.14 onwards"
+
+# CVE-2026-99294 needs backporting (fixed from 7.1)
+
+# CVE-2026-99295 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99296 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99297 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99298 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99299 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99300 needs backporting (fixed from 7.4rc1)
+
+CVE_STATUS[CVE-2026-99301] = "fixed-version: only affects 6.9 onwards"
+
+# CVE-2026-99302 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99303 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99304 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99305 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99306 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99307 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99308 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99309 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99310 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99311 may need backporting (fixed from 6.7)
+
+# CVE-2026-99312 needs backporting (fixed from 7.4rc2)
+
+CVE_STATUS[CVE-2026-99313] = "cpe-stable-backport: Backported in 6.6.158"
+
+# CVE-2026-99314 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99315 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99316 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99317 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99318 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99319 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99320 needs backporting (fixed from 7.4rc2)
+
+CVE_STATUS[CVE-2026-99321] = "fixed-version: only affects 7.3 onwards"
+
+CVE_STATUS[CVE-2026-99322] = "fixed-version: only affects 7.2.6 onwards"
+
+# CVE-2026-99323 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99324 needs backporting (fixed from 7.4rc1)
+
+CVE_STATUS[CVE-2026-99325] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-99326] = "fixed-version: only affects 7.1 onwards"
+
+# CVE-2026-99327 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99328 needs backporting (fixed from 7.4rc1)
+
+CVE_STATUS[CVE-2026-99329] = "fixed-version: only affects 7.1 onwards"
+
+# CVE-2026-99330 may need backporting (fixed from 6.7)
+
+# CVE-2026-99331 needs backporting (fixed from 7.4rc1)
+
+CVE_STATUS[CVE-2026-99332] = "fixed-version: only affects 6.12.83 onwards"
+
+# CVE-2026-99333 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99334 needs backporting (fixed from 7.4rc1)
+
+CVE_STATUS[CVE-2026-99335] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-99336] = "fixed-version: only affects 6.12.59 onwards"
+
+CVE_STATUS[CVE-2026-99337] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-99338] = "fixed-version: only affects 6.16 onwards"
+
+# CVE-2026-99339 needs backporting (fixed from 7.4rc1)
+
+CVE_STATUS[CVE-2026-99340] = "fixed-version: only affects 6.7 onwards"
+
+# CVE-2026-99341 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99342 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99343 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99344 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99345 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99346 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99347 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99348 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99349 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99350 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99351 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99352 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99353 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99354 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99355 needs backporting (fixed from 7.4rc1)
+
+CVE_STATUS[CVE-2026-99356] = "fixed-version: only affects 6.12.42 onwards"
+
+# CVE-2026-99357 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99358 needs backporting (fixed from 7.4rc1)
+
+CVE_STATUS[CVE-2026-99359] = "fixed-version: only affects 6.10 onwards"
+
+# CVE-2026-99360 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99361 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99362 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99363 needs backporting (fixed from 7.4rc1)
+
+CVE_STATUS[CVE-2026-99364] = "fixed-version: only affects 6.7 onwards"
+
+# CVE-2026-99365 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99366 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99367 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99368 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99369 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99370 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99371 needs backporting (fixed from 7.4rc1)
+
+CVE_STATUS[CVE-2026-99372] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-99373] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-99374] = "fixed-version: only affects 6.18 onwards"
+
+# CVE-2026-99375 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99376 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99377 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99378 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99379 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99380 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99381 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99382 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99383 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99384 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99385 needs backporting (fixed from 7.4rc1)
+
+CVE_STATUS[CVE-2026-99386] = "fixed-version: only affects 6.12.2 onwards"
+
+# CVE-2026-99387 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99388 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99389 needs backporting (fixed from 7.4rc1)
+
+CVE_STATUS[CVE-2026-99390] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-99391] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-99392] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-99393] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-99394] = "fixed-version: only affects 6.10 onwards"
+
+# CVE-2026-99395 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99396 needs backporting (fixed from 7.4rc1)
+
+CVE_STATUS[CVE-2026-99397] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-99398] = "fixed-version: only affects 6.10 onwards"
+
+# CVE-2026-99399 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99400 needs backporting (fixed from 7.4rc1)
+
+CVE_STATUS[CVE-2026-99401] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-99402] = "fixed-version: only affects 7.3 onwards"
+
+# CVE-2026-99403 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99404 needs backporting (fixed from 7.4rc1)
+
+CVE_STATUS[CVE-2026-99405] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-99406] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-99407] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-99408] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-99409] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-99410] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-99411] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-99412] = "fixed-version: only affects 6.14 onwards"
+
+# CVE-2026-99413 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99414 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99415 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99416 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99417 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99418 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99419 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99420 needs backporting (fixed from 7.4rc1)
+
+CVE_STATUS[CVE-2026-99421] = "cpe-stable-backport: Backported in 6.6.73"
+
+# CVE-2026-99422 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99423 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99424 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99425 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99426 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99427 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99428 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99429 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99430 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99431 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99432 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99433 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99434 needs backporting (fixed from 7.4rc1)
+
+CVE_STATUS[CVE-2026-99435] = "fixed-version: only affects 6.12.93 onwards"
+
+CVE_STATUS[CVE-2026-99436] = "fixed-version: only affects 6.12.93 onwards"
+
+CVE_STATUS[CVE-2026-99437] = "fixed-version: only affects 6.12.93 onwards"
+
+# CVE-2026-99438 needs backporting (fixed from 7.4rc1)
+
+CVE_STATUS[CVE-2026-99439] = "fixed-version: only affects 6.12.93 onwards"
+
+CVE_STATUS[CVE-2026-99440] = "fixed-version: only affects 6.12.93 onwards"
+
+# CVE-2026-99441 needs backporting (fixed from 7.4rc1)
+
+CVE_STATUS[CVE-2026-99442] = "fixed-version: only affects 6.12.31 onwards"
+
+CVE_STATUS[CVE-2026-99443] = "fixed-version: only affects 6.14 onwards"
+
+# CVE-2026-99444 needs backporting (fixed from 7.4rc1)
+
+CVE_STATUS[CVE-2026-99445] = "fixed-version: only affects 6.19 onwards"
+
+# CVE-2026-99446 needs backporting (fixed from 7.4rc1)
+
+CVE_STATUS[CVE-2026-99447] = "fixed-version: only affects 6.9 onwards"
+
+# CVE-2026-99448 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99449 needs backporting (fixed from 7.4rc1)
+
+CVE_STATUS[CVE-2026-99450] = "fixed-version: only affects 7.0 onwards"
+
+# CVE-2026-99451 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99452 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99453 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99454 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99455 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99456 needs backporting (fixed from 7.4rc1)
+
+CVE_STATUS[CVE-2026-99457] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-99458] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-99459] = "fixed-version: only affects 6.19 onwards"
+
+# CVE-2026-99460 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99461 needs backporting (fixed from 7.4rc1)
+
+CVE_STATUS[CVE-2026-99462] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-99463] = "fixed-version: only affects 6.11 onwards"
+
+# CVE-2026-99464 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99465 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99466 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99467 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99468 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99469 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99470 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99471 needs backporting (fixed from 7.4rc1)
+
+CVE_STATUS[CVE-2026-99472] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-99473] = "fixed-version: only affects 6.8 onwards"
+
+# CVE-2026-99474 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99475 needs backporting (fixed from 7.4rc1)
+
+CVE_STATUS[CVE-2026-99476] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-99477] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-99478] = "fixed-version: only affects 6.19 onwards"
+
+# CVE-2026-99479 needs backporting (fixed from 7.4rc1)
+
+CVE_STATUS[CVE-2026-99480] = "fixed-version: only affects 6.12.114 onwards"
+
+CVE_STATUS[CVE-2026-99481] = "fixed-version: only affects 6.12.46 onwards"
+
+# CVE-2026-99482 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99483 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99484 needs backporting (fixed from 7.4rc1)
+
+CVE_STATUS[CVE-2026-99485] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-99486] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-99487] = "fixed-version: only affects 6.17 onwards"
+
+# CVE-2026-99488 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99489 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99490 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99491 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99492 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99493 may need backporting (fixed from 6.7)
+
+# CVE-2026-99494 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99495 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99496 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99497 needs backporting (fixed from 7.4rc1)
+
+CVE_STATUS[CVE-2026-99498] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-99499] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-99500] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-99501] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-99502] = "fixed-version: only affects 6.19 onwards"
+
+# CVE-2026-99503 needs backporting (fixed from 7.4rc1)
+
+CVE_STATUS[CVE-2026-99504] = "fixed-version: only affects 6.14 onwards"
+
+# CVE-2026-99505 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99506 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99507 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99508 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99509 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99510 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99511 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99512 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99513 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99514 needs backporting (fixed from 7.4rc1)
+
+CVE_STATUS[CVE-2026-99515] = "fixed-version: only affects 6.11 onwards"
+
+# CVE-2026-99516 needs backporting (fixed from 7.4rc1)
+
+CVE_STATUS[CVE-2026-99517] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-99518] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-99519] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-99520] = "fixed-version: only affects 6.14 onwards"
+
+# CVE-2026-99521 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99522 needs backporting (fixed from 7.4rc1)
+
+CVE_STATUS[CVE-2026-99523] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-99524] = "fixed-version: only affects 7.1 onwards"
+
+# CVE-2026-99525 may need backporting (fixed from 6.7)
+
+# CVE-2026-99526 needs backporting (fixed from 7.4rc1)
+
+CVE_STATUS[CVE-2026-99527] = "fixed-version: only affects 6.14 onwards"
+
+# CVE-2026-99528 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99529 needs backporting (fixed from 7.4rc1)
+
+CVE_STATUS[CVE-2026-99530] = "fixed-version: only affects 6.18 onwards"
+
+# CVE-2026-99531 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99532 needs backporting (fixed from 7.4rc1)
+
+CVE_STATUS[CVE-2026-99533] = "fixed-version: only affects 7.2 onwards"
+
+# CVE-2026-99534 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99535 needs backporting (fixed from 7.4rc1)
+
+CVE_STATUS[CVE-2026-99536] = "fixed-version: only affects 7.1.5 onwards"
+
+# CVE-2026-99537 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99538 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99539 may need backporting (fixed from 6.7)
+
+# CVE-2026-99540 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99541 may need backporting (fixed from 6.7)
+
+# CVE-2026-99542 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99543 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99544 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99545 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99546 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99547 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99548 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99549 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99550 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99551 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99552 needs backporting (fixed from 7.4rc1)
+
+CVE_STATUS[CVE-2026-99553] = "fixed-version: only affects 6.14 onwards"
+
+# CVE-2026-99554 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99555 may need backporting (fixed from 6.7)
+
+# CVE-2026-99556 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99557 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99558 needs backporting (fixed from 7.4rc1)
+
+CVE_STATUS[CVE-2026-99559] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-99560] = "fixed-version: only affects 7.3 onwards"
+
+# CVE-2026-99561 needs backporting (fixed from 7.4rc1)
+
+CVE_STATUS[CVE-2026-99562] = "fixed-version: only affects 7.3 onwards"
+
+CVE_STATUS[CVE-2026-99563] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-99564] = "fixed-version: only affects 7.1 onwards"
+
+# CVE-2026-99565 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99566 has no known resolution
+
+# CVE-2026-99567 has no known resolution
+
+# CVE-2026-99568 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99569 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99570 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99571 may need backporting (fixed from 6.7)
+
+CVE_STATUS[CVE-2026-99572] = "fixed-version: only affects 7.1 onwards"
+
+# CVE-2026-99573 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99574 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99575 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99576 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99577 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99578 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99579 needs backporting (fixed from 7.4rc2)
+
+CVE_STATUS[CVE-2026-99580] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-99581] = "fixed-version: only affects 6.19 onwards"
+
+# CVE-2026-99582 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99583 needs backporting (fixed from 7.4rc1)
+
+CVE_STATUS[CVE-2026-99584] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-99585] = "fixed-version: only affects 6.18 onwards"
+
+# CVE-2026-99586 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99587 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99588 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99589 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99590 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99591 needs backporting (fixed from 7.4rc3)
+
+CVE_STATUS[CVE-2026-99592] = "fixed-version: only affects 6.15 onwards"
+
+# CVE-2026-99593 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99594 needs backporting (fixed from 7.4rc2)
+
+CVE_STATUS[CVE-2026-99595] = "fixed-version: only affects 6.18 onwards"
+
+# CVE-2026-99596 may need backporting (fixed from 6.7)
+
+# CVE-2026-99597 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99598 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99599 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99600 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99601 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99602 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99603 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99604 needs backporting (fixed from 7.4rc2)
+
+CVE_STATUS[CVE-2026-99605] = "fixed-version: only affects 7.0 onwards"
+
+# CVE-2026-99606 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99607 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99608 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99609 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99610 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99611 needs backporting (fixed from 7.4rc2)
+
+CVE_STATUS[CVE-2026-99612] = "fixed-version: only affects 6.18.57 onwards"
+
+# CVE-2026-99613 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99614 needs backporting (fixed from 7.4rc2)
+
+CVE_STATUS[CVE-2026-99615] = "fixed-version: only affects 6.11 onwards"
+
+# CVE-2026-99616 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99617 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99618 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99619 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99620 needs backporting (fixed from 7.4rc2)
+
+CVE_STATUS[CVE-2026-99621] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-99622] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-99623] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-99624] = "fixed-version: only affects 6.12 onwards"
+
+# CVE-2026-99625 needs backporting (fixed from 7.4rc2)
+
+CVE_STATUS[CVE-2026-99626] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-99627] = "fixed-version: only affects 6.11 onwards"
+
+# CVE-2026-99628 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99629 needs backporting (fixed from 7.4rc2)
+
+CVE_STATUS[CVE-2026-99630] = "fixed-version: only affects 7.2 onwards"
+
+CVE_STATUS[CVE-2026-99631] = "fixed-version: only affects 6.16.4 onwards"
+
+# CVE-2026-99632 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99633 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99634 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99635 needs backporting (fixed from 7.4rc2)
+
+CVE_STATUS[CVE-2026-99636] = "fixed-version: only affects 6.12.114 onwards"
+
+# CVE-2026-99637 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99638 needs backporting (fixed from 7.4rc2)
+
+CVE_STATUS[CVE-2026-99639] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-99640] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-99641] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-99642] = "fixed-version: only affects 6.11 onwards"
+
+# CVE-2026-99643 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99644 needs backporting (fixed from 7.4rc2)
+
+CVE_STATUS[CVE-2026-99645] = "fixed-version: only affects 7.0 onwards"
+
+# CVE-2026-99646 needs backporting (fixed from 7.4rc2)
+
+CVE_STATUS[CVE-2026-99647] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-99648] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-99649] = "fixed-version: only affects 7.0 onwards"
+
+# CVE-2026-99650 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99651 needs backporting (fixed from 7.4rc2)
+
+CVE_STATUS[CVE-2026-99652] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-99653] = "fixed-version: only affects 6.11 onwards"
+
+# CVE-2026-99654 may need backporting (fixed from 6.7)
+
+# CVE-2026-99655 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99656 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99657 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99658 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99659 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99660 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99661 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99662 needs backporting (fixed from 7.4rc2)
+
+CVE_STATUS[CVE-2026-99663] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-99664] = "fixed-version: only affects 6.10 onwards"
+
+# CVE-2026-99665 needs backporting (fixed from 7.4rc2)
+
+CVE_STATUS[CVE-2026-99666] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-99667] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-99668] = "fixed-version: only affects 6.19 onwards"
+
+# CVE-2026-99669 may need backporting (fixed from 6.7)
+
+# CVE-2026-99670 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99671 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99672 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99673 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99674 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99675 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99676 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99677 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99678 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99679 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99680 needs backporting (fixed from 7.4rc2)
+
+CVE_STATUS[CVE-2026-99681] = "fixed-version: only affects 6.16.4 onwards"
+
+# CVE-2026-99682 may need backporting (fixed from 6.7)
+
+# CVE-2026-99683 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99684 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99685 needs backporting (fixed from 7.4rc2)
+
+CVE_STATUS[CVE-2026-99686] = "fixed-version: only affects 6.17 onwards"
+
+# CVE-2026-99687 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99688 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99689 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99690 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99691 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99692 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99693 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99694 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99695 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99696 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99697 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99698 needs backporting (fixed from 7.4rc2)
+
+CVE_STATUS[CVE-2026-99699] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-99700] = "fixed-version: only affects 6.18.51 onwards"
+
+# CVE-2026-99701 needs backporting (fixed from 7.4rc2)
+
+CVE_STATUS[CVE-2026-99702] = "fixed-version: only affects 6.19 onwards"
+
+# CVE-2026-99703 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99704 needs backporting (fixed from 7.4rc2)
+
+CVE_STATUS[CVE-2026-99705] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-99706] = "fixed-version: only affects 6.10 onwards"
+
+# CVE-2026-99707 needs backporting (fixed from 7.4rc2)
+
+CVE_STATUS[CVE-2026-99708] = "fixed-version: only affects 6.9 onwards"
+
+# CVE-2026-99709 may need backporting (fixed from 6.7)
+
+# CVE-2026-99710 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99711 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99712 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99713 needs backporting (fixed from 7.4rc2)
+
+CVE_STATUS[CVE-2026-99714] = "fixed-version: only affects 7.2.10 onwards"
+
+CVE_STATUS[CVE-2026-99715] = "fixed-version: only affects 7.3 onwards"
+
+CVE_STATUS[CVE-2026-99716] = "fixed-version: only affects 6.9 onwards"
+
+# CVE-2026-99717 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99718 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99719 needs backporting (fixed from 7.4rc2)
+
+CVE_STATUS[CVE-2026-99720] = "fixed-version: only affects 6.9 onwards"
+
+# CVE-2026-99721 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99722 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99723 needs backporting (fixed from 7.4rc2)
+
+CVE_STATUS[CVE-2026-99724] = "fixed-version: only affects 7.1 onwards"
+
+# CVE-2026-99725 needs backporting (fixed from 7.4rc2)
+
+CVE_STATUS[CVE-2026-99726] = "fixed-version: only affects 6.18.36 onwards"
+
+CVE_STATUS[CVE-2026-99727] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-99728] = "fixed-version: only affects 7.2 onwards"
+
+# CVE-2026-99729 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99730 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99731 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99732 needs backporting (fixed from 7.4rc2)
+
+CVE_STATUS[CVE-2026-99733] = "fixed-version: only affects 7.2 onwards"
+
+# CVE-2026-99734 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99735 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99736 needs backporting (fixed from 7.4rc2)
+
+CVE_STATUS[CVE-2026-99737] = "fixed-version: only affects 6.12.69 onwards"
+
+CVE_STATUS[CVE-2026-99738] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-99739] = "fixed-version: only affects 6.12.69 onwards"
+
+# CVE-2026-99740 may need backporting (fixed from 6.7)
+
+# CVE-2026-99741 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99742 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99743 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99744 needs backporting (fixed from 7.4rc2)
+
+CVE_STATUS[CVE-2026-99745] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-99746] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-99747] = "fixed-version: only affects 7.2.8 onwards"
+
+# CVE-2026-99748 may need backporting (fixed from 6.7)
+
+# CVE-2026-99749 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99750 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99751 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99752 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99753 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99754 needs backporting (fixed from 7.4rc2)
+
+CVE_STATUS[CVE-2026-99755] = "fixed-version: only affects 6.7 onwards"
+
+# CVE-2026-99756 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99757 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99758 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99759 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99760 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99761 needs backporting (fixed from 7.4rc2)
+
+CVE_STATUS[CVE-2026-99762] = "fixed-version: only affects 6.8 onwards"
+
+# CVE-2026-99763 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99764 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99765 needs backporting (fixed from 7.4rc2)
+
+CVE_STATUS[CVE-2026-99766] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-99767] = "fixed-version: only affects 6.14 onwards"
+
+# CVE-2026-99768 needs backporting (fixed from 7.4rc2)
+
+CVE_STATUS[CVE-2026-99769] = "fixed-version: only affects 6.15 onwards"
+
+# CVE-2026-99770 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99771 needs backporting (fixed from 7.4rc2)
+
+CVE_STATUS[CVE-2026-99772] = "fixed-version: only affects 7.1 onwards"
+
+# CVE-2026-99773 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99774 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99775 needs backporting (fixed from 7.4rc2)
+
+CVE_STATUS[CVE-2026-99776] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-99777] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-99778] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-99779] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-99780] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-99781] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-99782] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-99783] = "fixed-version: only affects 6.12 onwards"
+
+# CVE-2026-99784 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99785 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99786 needs backporting (fixed from 7.4rc2)
+
+CVE_STATUS[CVE-2026-99787] = "fixed-version: only affects 7.0 onwards"
+
+# CVE-2026-99788 needs backporting (fixed from 7.4rc1)
+
+CVE_STATUS[CVE-2026-99789] = "fixed-version: only affects 7.2.4 onwards"
+
+CVE_STATUS[CVE-2026-99790] = "fixed-version: only affects 6.10 onwards"
+
+# CVE-2026-99791 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99792 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99793 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99794 needs backporting (fixed from 7.4rc1)
+
+CVE_STATUS[CVE-2026-99795] = "fixed-version: only affects 6.15 onwards"
+
+# CVE-2026-99796 needs backporting (fixed from 7.4rc2)
+
+# CVE-2026-99797 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99798 needs backporting (fixed from 7.4rc1)
+
+# CVE-2026-99799 needs backporting (fixed from 7.4rc1)
+
+CVE_STATUS[CVE-2026-99800] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-99801] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-99802] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-99803] = "fixed-version: only affects 7.0 onwards"
+
+# CVE-2026-99804 needs backporting (fixed from 7.4rc1)
 
 CVE_STATUS[CVE-2026-99999] = "cpe-stable-backport: Backported in 6.6.159"
 
