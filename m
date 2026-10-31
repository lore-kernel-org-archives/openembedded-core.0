Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3758.1793405778337078282
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 17:16:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=nMWnGAwt;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a218c463d1so7693635e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 17:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793405776; x=1794010576; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1PL9L2UYoGclyu0WjR6qYDpZAq0FQd0qynZdH/frOag=;
        b=nMWnGAwtOyfXHrz3b9OocKVGF2J/ec0PhrbRO9TMOYfry6gA9xLSKFrovwakU0fCSZ
         MrAx6+eKpBKrS37bm0Q6nR64adqK+V1HKQBZTWQJ0NP9TIVpEWA5t8QiW5cjfBSH3+45
         yjsAFqS6A+RdlE070Rz+YMNffkmVlb4CuqGfadkd/2yISD2KQ4UZPE8v4T47FB3CQu8X
         Ywvw7hZBq8kroahgtizUnzxhhUxKfHI2dDSrBKOuvk02ASrbSB1epsszAs7Me/7l5efA
         z0SOVu5Tn0aNBCMHhtUd8YpAgCtnaS5c9Lwcv7bB58h2GY/3HKnuzqqm2lJpGibQCl5v
         AliQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793405776; x=1794010576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1PL9L2UYoGclyu0WjR6qYDpZAq0FQd0qynZdH/frOag=;
        b=Y+bElH48yTIXOKr9FSSZK9YGz5pkaHLznCt7kLoAZqRXPHhbpyw6ZjsFsbESuDWTUf
         ztTdCvqAbipN+MwCcYYSebDRPvFIJ0xLXCHWbUFvL/eXgZ74vFYRDQnI/sDedl4UA2ju
         3EtpBqTD9al0zsCllBYaWcxbpditfSXgN1hQpJx3kFn/3hNY6t+b3U3ebKze6mcAlNHI
         6YuUx8g2Y9wVQCruO75Uhc8oC8VLs4RgC0I86F+rZHKAbLMcCQTQcUXIxHIxhVa1E0iU
         qI2DGb8Nk7XMmtHjSAc1HMQKcu3ExnlWMCQUKKDGoOGw5brJToD+X0ReuUXLOp9bvaut
         /qnw==
X-Gm-Message-State: AFq9FYIgono1HErEtE2RCOBX0Spcfns0kqLfcVWG6pDyZxpCDgz5R8nF
	3XG06zP9Do/6M1kyNPvK72fnXgPG3ueWXWhpXqoHT6gVzY5BxdHQ7oWdIs/1MKQJvCYMlHQHqlO
	pJuL75pU=
X-Gm-Gg: AYBFou1nGe4YYJNAVWi9T7b830naV3WhOZGA3Zq6GdfIHSk7b9pIrp3YsBYhxLnENWi
	8fzArANpPSQenoeyoK02rbTYGsqZ5fvmiP6mOEUM+dy2D9fYCZLh+mPtBemHYfOlpubP9Uopz7A
	L7+yje2Qh+Xymzx0/IQ0QdV1ELkysfW37APTpK7BjhQHB9ZaeLqe1FsmD+PXRoSvYLmcjghs7zY
	gFZkG9yxkPVJy2Uqt0y45kG+UwS/LjQBHjR65LntmUu06Li2YvunnJO0HzXLY1BRINQSyJSzODH
	zJ9styMHN4wSVIHK/bRg07uaZP5nfxwLGnT1EYI82fPVc05qXy0PJgjS2EaegTG8cF4AKl7WEqS
	s591D4x0Ik0vQubkvk69FTeBwNdBhJudLu2mzAGrjujJFY6EUu5T0YOHOkcX+EUoh1wR1t7U/1S
	7dokk9NYgFIe6K3ATvGaKaoOjy0/MRD/fy6+rfAx8tB8QVCjkmavaRte+9NHuf3mDx66hkmiUmW
	AnZll4y7eOm2IXMTGu+u238AISvNcfP97v7p2Z2QMrc613FX+b56hClLrMnn7bYT4iSJ/SzwVBb
	ZjtO+QuoZlg35XSnvkNv/Htwb7Eo2E9Bpb8z/PzLlre1nbT/cEjGX3+Fe3rzlUh6t/T1ha3RQz0
	jBAReHFsmZiFaaeyRc3NmXVLKS5m0
X-Received: by 2002:a05:600c:8b55:b0:4a1:ddca:8b66 with SMTP id 5b1f17b1804b1-4ac19234a06mr85338175e9.31.1793405776591;
        Fri, 30 Oct 2026 17:16:16 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm130350635e9.12.2026.10.30.17.16.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:16:15 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 55/55] util-linux: patch CVE-2026-53615
Date: Sat, 31 Oct 2026 01:15:16 +0100
Message-ID: <d8d1c0ccd8b51574af64c8781aaa4cf46f1d3211.1793405493.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793405493.git.yoann.congal@smile.fr>
References: <cover.1793405493.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 00:16:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249130
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1] from 2.41 branch.
Resolve minor conflict with [2] (unrelated const variable).

[1] https://security-tracker.debian.org/tracker/CVE-2026-53615
[2] https://github.com/util-linux/util-linux/commit/7eba8f98bdc3ed9c0ef1c8527aa61e1a3656449c

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/util-linux/util-linux.inc   |   1 +
 .../util-linux/CVE-2026-53615.patch           | 109 ++++++++++++++++++
 2 files changed, 110 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2026-53615.patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index fdc8c62f6e5..66616f06527 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -63,6 +63,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://CVE-2026-78410-02.patch \
            file://CVE-2026-78410-03.patch \
            file://CVE-2026-76642.patch \
+           file://CVE-2026-53615.patch \
            "
 
 SRC_URI[sha256sum] = "7b6605e48d1a49f43cc4b4cfc59f313d0dd5402fa40b96810bd572e167dfed0f"
diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2026-53615.patch b/meta/recipes-core/util-linux/util-linux/CVE-2026-53615.patch
new file mode 100644
index 00000000000..f06f175e9c9
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/CVE-2026-53615.patch
@@ -0,0 +1,109 @@
+From 05c2dbadf34cc74192287f377904afaaf4061623 Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Wed, 25 Mar 2026 11:54:28 +0100
+Subject: [PATCH] libblkid: dos: validate EBR data and links within extended
+ partition
+
+The parse_dos_extended() function processes EBR (Extended Boot Record)
+chains, but does not properly validate that partitions and links stay
+within the master extended partition area [ex_start, ex_start+ex_size).
+
+For EBR data partitions at index 0 and 1, there are no bounds checks
+at all, unlike entries at index 2 and 3. This allows a crafted disk
+image to register partitions at arbitrary sectors via uint32_t overflow
+in the abs_start calculation (cur_start + start wraps to a small value).
+
+Fix by:
+ - using 64-bit arithmetic for the abs_start calculation to avoid
+   uint32_t wraparound
+ - applying the extended partition area bounds check to all EBR data
+   entries, not just index >= 2
+ - validating EBR link targets stay within the extended area and
+   advance forward (preventing backward links that could loop)
+
+Reported-by: Michele Piccinni <piccinni.michele@gmail.com>
+Signed-off-by: Karel Zak <kzak@redhat.com>
+(cherry picked from commit e9d544d013267ea86b70ee8ff78abd280e6641af)
+
+CVE: CVE-2026-53615
+Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit/05c2dbadf34cc74192287f377904afaaf4061623]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ libblkid/src/partitions/dos.c | 38 +++++++++++++++++++++++++++--------
+ 1 file changed, 30 insertions(+), 8 deletions(-)
+
+diff --git a/libblkid/src/partitions/dos.c b/libblkid/src/partitions/dos.c
+index d5a8aa3ae..5c78aac21 100644
+--- a/libblkid/src/partitions/dos.c
++++ b/libblkid/src/partitions/dos.c
+@@ -46,6 +46,7 @@ static int parse_dos_extended(blkid_probe pr, blkid_parttable tab,
+ {
+ 	blkid_partlist ls = blkid_probe_get_partlist(pr);
+ 	uint32_t cur_start = ex_start, cur_size = ex_size;
++	uint64_t ex_end = (uint64_t) ex_start + ex_size;
+ 	unsigned char *data;
+ 	int ct_nodata = 0;	/* count ext.partitions without data partitions */
+ 	int i;
+@@ -88,24 +89,31 @@ static int parse_dos_extended(blkid_probe pr, blkid_parttable tab,
+ 		/* Parse data partition */
+ 		for (p = p0, i = 0; i < 4; i++, p++) {
+ 			uint32_t abs_start;
++			uint64_t abs;
+ 			blkid_partition par;
+ 
+ 			/* the start is relative to the parental ext.partition */
+ 			start = dos_partition_get_start(p) * ssf;
+ 			size = dos_partition_get_size(p) * ssf;
+-			abs_start = cur_start + start;	/* absolute start */
+ 
+ 			if (!size || is_extended(p))
+ 				continue;
++
++			abs = (uint64_t) cur_start + start;
++
++			/* data partition must be within the extended area */
++			if (abs < ex_start || abs + size > ex_end) {
++				DBG(LOWPROBE, ul_debug("#%d: EBR data partition outside "
++					"extended -- ignore", i + 1));
++				continue;
++			}
++			abs_start = (uint32_t) abs;
++
+ 			if (i >= 2) {
+-				/* extra checks to detect real data on
++				/* extra check to detect real data on
+ 				 * 3rd and 4th entries */
+ 				if (start + size > cur_size)
+ 					continue;
+-				if (abs_start < ex_start)
+-					continue;
+-				if (abs_start + size > ex_start + ex_size)
+-					continue;
+ 			}
+ 
+ 			/* Avoid recursive non-empty links, see ct_nodata counter */
+@@ -142,8 +150,22 @@ static int parse_dos_extended(blkid_probe pr, blkid_parttable tab,
+ 		if (i == 4)
+ 			goto leave;
+ 
+-		cur_start = ex_start + start;
+-		cur_size = size;
++		{
++			uint64_t next = (uint64_t) ex_start + start;
++
++			if (next + size > ex_end) {
++				DBG(LOWPROBE, ul_debug("EBR link outside "
++					"extended area -- leave"));
++				goto leave;
++			}
++			if (next <= cur_start) {
++				DBG(LOWPROBE, ul_debug("EBR link does not "
++					"advance -- leave"));
++				goto leave;
++			}
++			cur_start = (uint32_t) next;
++			cur_size = size;
++		}
+ 	}
+ leave:
+ 	return BLKID_PROBE_OK;
