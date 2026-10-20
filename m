Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4739.1792538582534544914
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 16:23:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20251104.gappssmtp.com header.s=20251104 header.b=BfhH18Tq;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1e266fca2so668305e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 16:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20251104.gappssmtp.com; s=20251104; t=1792538581; x=1793143381; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2fIBbwM15bOJivtg94721OTNd70lOl9KPSd5BxJk2pI=;
        b=BfhH18TqcP794aSanZsiExEh4V3RzhTUj0wQ5d4arGlXELVprO/oZx7zw2LqGXBzv0
         1/Qpt2HnedtmEHP5T7Wk4U3bphmsPzVVr/KPut5gGusUnxII4DDwJr46Aa9XNnV44I5a
         NED0RuzL5sd+xAluIm4qN0Bhyca0be7k+Wx2OPcsJQo8hVC4Ev8OaF6ff0BuCjhzlPNQ
         Oe8faVDGwrXestZQrmpNrssE5//86XfWcSojd2CxP9Mq2qkKoqNIQu2e6hrdbFAvFMVy
         8d1ZMD7cZzI+HmvHhZEs5EOqdmI985FrXwsv0IZe14O1DhCOrKjLxBtqNBVbmE+bZkWI
         jBQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792538581; x=1793143381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2fIBbwM15bOJivtg94721OTNd70lOl9KPSd5BxJk2pI=;
        b=vZCUajYmtNeTZJmh+/VJ36JzOd4TSH16rmz1b3GUCfsDck1lybmQs/CUbuPci/hDUs
         TKw93WefwK5160vbnteCxo8d4l9Rf/xDTBfArYqph0Bp1gKURX/b6M0F4Wu/YbLe9Ono
         RZDl2TIrvgpYr+LlzB62P748ujt/dYeis9AMGoaEwtKk2jZYBuE+YH/5GMyOIebBV8zc
         j8AHzzMeKYpBeeJPuDkm5xXdrjWBfOKpxLjMuCJ6GFj3gOfdIS9Du3BhgvAzk2VRnDVD
         jLLq1t5Uss8Znyv8CkhnLcEyqZWnCU5uPcJyqzab7d3hhxxoxowRJV99g5W8to352DSU
         coLw==
X-Gm-Message-State: AFq9FYK3x8CyL4AW2mJagMijJ22yA/hZf6cLdShWN7h0GShNobM0JNOx
	2FLtSLJGHtWct5cvKJTh0Cn5MYMU/rhjxIZPrglHmlC6odcV4iKzxjaJOlZTvyR14KMXD6vv/TO
	YydoUbPY=
X-Gm-Gg: AYBFou34ublMAX0bb4z5T82kTub/+6wsS20SbCgXZw8W0sHzPXVL4G2xmB17BFAT2tN
	fS3cdEI304AnF45qwo5J4jiorXARSu3QaJug9KTdxLoO0ShEyeOX2vWCmHihfeuX0kqhkSHUVcP
	wMTdYfJv1zNTbro3GeyUIapiwEzDMcMVmTMeXTIkMksUzME82uiCoDhflY2NFhMSjT51QehfgCp
	qjYvziy/9+f7dzdMjew7SkSpD3jFkbRWPVspkzAk3R4ZxGgEFRsYK8nGyrcUGuUV4YFdPenPBw+
	gUowWvzrk5+AGjD2/770rk/xQ/0MLs78AleFOAv+K2k3r4volzRgSPNdev5ow3kQBHb0DaGhgdA
	MZ3OiRrVf4aHhsVwqGd+XSMJIQyWxLMa8UlkIebd3i8HbVTmBLZ4AZQ9I0dbdvLAi0pA1b2QdEX
	4Cem8jdjPhX1tNhB6UHIgtTSEvwgnzQ6fO+RibDZz/ynKeLqIWcGRLJY0A6cqMYPYp6ITILVUNF
	EC19T+nwuQmE+On4JRbiSV0ukI4ofGeByp/+aW5/d0pLrHHoveGRIbpUYBus512YpElc9c0k74N
	GKcDuvHGx2EfYpWdpc9z9VAit9aE9+RzVd2BS3aTMMiDW5gGCnyC1gRb
X-Received: by 2002:a05:600c:a204:b0:4a1:e9c2:6c84 with SMTP id 5b1f17b1804b1-4a1fdd2c140mr2142295e9.18.1792538580664;
        Tue, 20 Oct 2026 16:23:00 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583523asm1436615f8f.37.2026.10.20.16.23.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 16:23:00 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 16/25] libarchive: fix CVE-2026-15028
Date: Wed, 21 Oct 2026 01:22:26 +0200
Message-ID: <96192dff907f6142903513c854e0a27361fa0949.1792537664.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792537664.git.yoann.congal@smile.fr>
References: <cover.1792537664.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 23:23:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248335
Content-Type: text/plain; charset="utf-8"

From: Jakub Szczudlo (Nokia) <jakub.szczudlo@nokia.com>

Backport patch to fix CVE-2026-15028.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-15028

The link in NVD is wrong. Based on project own pull request:
  https://github.com/libarchive/libarchive/pull/3252

Fixing commit is the below one:
  https://github.com/libarchive/libarchive/commit/40b92de1def08e4fc319d55702785f82cedb7ef2

Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
[YC: For master and blacksail, the proper fix is included in v3.8.9
via an upstream cherrypick
https://github.com/libarchive/libarchive/commit/22ffe8e8e459970f3bc86b0267493fc4aa8249b8 ]
---
 .../libarchive/CVE-2026-15028.patch           | 41 +++++++++++++++++++
 .../libarchive/libarchive_3.8.7.bb            |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2026-15028.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2026-15028.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2026-15028.patch
new file mode 100644
index 00000000000..c63fcf22f20
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2026-15028.patch
@@ -0,0 +1,41 @@
+From 40b92de1def08e4fc319d55702785f82cedb7ef2 Mon Sep 17 00:00:00 2001
+From: datauwu <datauwu@users.noreply.github.com>
+Date: Mon, 6 Jul 2026 21:51:15 +0800
+Subject: [PATCH] tar: fix 1-byte OOB read in SUN.holesdata parsing
+
+header_pax_extension() passes PAX attribute values without the trailing
+newline to pax_attribute(). The SUN.holesdata parser read one byte past
+the supplied value when the last numeric field ended at the value
+boundary.
+
+Handle length == 0 before checking *e.
+
+CVE: CVE-2026-15028
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/40b92de1def08e4fc319d55702785f82cedb7ef2]
+Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>
+---
+ libarchive/archive_read_support_format_tar.c | 11 ++++-------
+ 1 file changed, 4 insertions(+), 7 deletions(-)
+
+diff --git a/libarchive/archive_read_support_format_tar.c b/libarchive/archive_read_support_format_tar.c
+index e07cfdb63b..1c0441db6c 100644
+--- a/libarchive/archive_read_support_format_tar.c
++++ b/libarchive/archive_read_support_format_tar.c
+@@ -3448,13 +3448,10 @@ pax_attribute_SUN_holesdata(struct archive_read *a, struct tar *tar,
+ 				return (ARCHIVE_FATAL);
+ 			tar->sparse_last->hole = hole;
+ 		}
+-		if (length == 0 || *e == '\n') {
+-			if (length == 0 && *e == '\n') {
+-				return (ARCHIVE_OK);
+-			} else {
+-				return (ARCHIVE_WARN);
+-			}
+-		}
++		if (length == 0)
++			return (ARCHIVE_OK);
++		if (*e == '\n')
++			return (ARCHIVE_WARN);
+ 		p = e + 1;
+ 		length--;
+ 		hole = hole == 0;
diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.7.bb b/meta/recipes-extended/libarchive/libarchive_3.8.7.bb
index c0a29211434..dea22287fce 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.8.7.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.7.bb
@@ -31,6 +31,7 @@ EXTRA_OECONF += "--enable-largefile --without-iconv"
 
 SRC_URI = "https://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://run-ptest \
+           file://CVE-2026-15028.patch \
           "
 UPSTREAM_CHECK_URI = "https://www.libarchive.org/"
 
