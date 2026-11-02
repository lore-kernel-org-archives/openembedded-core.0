Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14904.1793632971261392879
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2026 07:22:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=B56jP8m5;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-35b2c599f43so5223039eec.0
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2026 07:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793632970; x=1794237770; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5zus1Zzjt5/bPNJoCKB/zR0Cyuya7S8s3LRFXqqsW3M=;
        b=B56jP8m52W7AWA4yUHba8n6p+fs+VbyIvGcBYKp6ix5dskLsASqMZovC5KL6OEex33
         8l7Qw1xdVS3IKRLDQdThDNlw08CUFUR0toJJfbnp7csf6HW8mDYgi9+WHxQFCEykZ5gV
         CQnsZIt5XCh/wNrm2mrCk154Wvxaqk+gH+GJLGx3dcABShoXGbyZ4flFjvjA8otwEWKO
         OQj7ryQNOIxB+a3uJTzKChCLk9pXP5ZXRgUZpDbhN296mE9iS+vE+qgRKM1ZFVQ2pPcx
         9+ijHpW0T1/W1Gwdn/UkwyQ8oJBdWdLKR6EdU6bO3zOxfh/jPKF4DSXhmiXg4qLWq2iw
         q0jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793632970; x=1794237770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5zus1Zzjt5/bPNJoCKB/zR0Cyuya7S8s3LRFXqqsW3M=;
        b=TxhPvlOOQUBrg26b1JMKoCfeyu6ExX4hrqYPOqxiF5rv7tFv4/r94Nk2gYNMySy3/P
         qBgaDtMlSroOCqCfuY19fq/8v5VHxVIwfMAK+W2/s/USs2/Bmemixb7X94DVR7hut0lI
         cet1fDhTbEHDMNgpwNMrfsMKWdZZ2hwOfkSj7JheTUxrDCVUVD6S5IqUHxVQUIIEcbRd
         7YXtm+ElZqKEwaDaKCE4H0i0c/qeCsbtyPLkLypX0Fj/qzowIXrKU0quDYiv4T3lXWKy
         wzfkupcjHtoHiG6m1nyr1d5xXas3zW6+R9NY6WFgI4KDxWL4q3gE3cBNT+Thy0KcKIv1
         sBBA==
X-Gm-Message-State: APuU4Z/qjvxJTdXXW6eqfnmQT7EUPz9uOX/SkhqZO8nLI2TXTJjKkFh+
	Bv/vbrSznELBNPxhGRIdQ/bIFBDvlilGIabTxeuOvMgM7rcpeDpuil3J/39YQz/EGug=
X-Gm-Gg: AYBFou3cTjEEDVsLhCPSUY9VoF/ehbKG2VvRTw00AolwWnw0sJYNWIymwfFcqTSJF+T
	DQT5KVx3DMjznhe4pNnHxHOFm01NxbDHQ7ttnjh+/Fupe6n8cWtr0vb14XheB99sLY1xYUvCah4
	wgOvenRaAoPER8DZK4L6lWy0XnSFjloAkbfdg4aiKqQHC+7Fh3QcXZSSuibHOWAFnrXah+G5LE7
	3dX9KzK9Ma8cEGsrdufFk3IZGFoadwYdYGBR3HxBAT0/mV964NoyBQxhv7aFq9ydM+DfqFwUQyX
	iWXxycWLR51MgkiG7dUDHSY+q37MZeKvXKKHDWYyCkdKnTrw05rYcRWeSk20bm/NySXc8Lte55r
	bTIEmA9OY+cAgAxcD5yEra9gqZu1koPZaOXC/SPXglB0cu1gprVi+I9nDAn074iDkr6/G7QlcPm
	DrNzRmS0PhVojMqm9aS4fuF3c9K6++keSmZalrW8iG4jCrcgvG7Cq4fm5sdJ4JppXlG2MZvnC7Q
	1JBt/Ucs2YrSySC7IqO6W4J51NIieTNKVpJXUdYQJRJvtMMv2Aif2TJUZWmAGjUxQkXWKnsijKs
	7rt+oPNbRd0UvjEemcVWGvgF4YKCicLfjOK3mxncAlBJcivCHibcLWH3lY16B08WMxEap8lPBXr
	7m4hv8KlZgNApZjEaJfarlvhWPvb0rzn2yuknt1litB79VfqHhAnwVF3ZzaoZa3ddQjieuBdMCW
	t/TnoguPCfC82doBuC56T94HhkBJO1K9JGpOrj+8MnoxdRlLcebE/OdxtK33B5p5HGcJCZB2zi0
	XERA32hYMZc+F8ki5pRgiY4ZNs+zZJPfpq5qbJHYiGt3X+yzY9Byc7Sz4jUctirvzqa0YfE6veF
	KoIyrA==
X-Received: by 2002:a05:7301:da83:b0:366:83dd:46f3 with SMTP id 5a478bee46e88-36a423a1f05mr15428389eec.14.1793632970364;
        Mon, 02 Nov 2026 07:22:50 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a6f7f9sm45175115eec.25.2026.11.02.07.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:22:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] libx11: stage the X11 locale data in all sysroots
Date: Mon,  2 Nov 2026 07:22:46 -0800
Message-ID: <20261102152246.3236176-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2026 15:22:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249216
Content-Type: text/plain; charset="utf-8"

Commit 63204f5551 moved the X11 locale data from the native to the
target sysroot for meson-based ibus 1.5.35.

ibus 1.5.34, which is what meta-oe currently ships, still copies
en_US.UTF-8/Compose from STAGING_DATADIR_NATIVE, so its do_compile now
fails.

On distros without x11 there is no target libx11 to provide the
data either. Keep the directory in every sysroot so both ibus versions
find it.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb b/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb
index 42f52f3de2..bb9538d3be 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb
@@ -39,6 +39,6 @@ FILES:${PN} += "${datadir}/X11/XKeysymDB ${datadir}/X11/XErrorDB ${datadir}/X11/
 FILES:${PN}-xcb += "${libdir}/libX11-xcb.so.*"
 FILES:${PN}-locale += "${datadir}/X11/locale ${libdir}/X11/locale"
 
-SYSROOT_DIRS_IGNORE:remove:class-target = "${datadir}/X11/locale"
+SYSROOT_DIRS_IGNORE:remove = "${datadir}/X11/locale"
 
 BBCLASSEXTEND = "native nativesdk"
