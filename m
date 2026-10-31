Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3749.1793405767755620590
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 17:16:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=hVNXgCl1;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so7643625e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 17:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793405766; x=1794010566; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gMaW2rIgiTJytx2lWlTzvZR7CynM61FRDOOplTuCQMY=;
        b=hVNXgCl1UH356XVwhpKGg1UcfpQ7bscfQQHD0eYk5hgVYEPdnwSFO23gev5WmKZ5Ii
         pnqfqM3zZ+DB/uzYXdVcz0Gkj2Zm5G8OZiX5jILxl79RwFdAu2M42vS4GJJUZC2Ikea7
         en8s6OEHZ0SUiAPTMfobjgLQ7wmh8n7xL/adzrCh4FoNfAtuYvJZPU93ahY1veEETqlI
         pIDCLCit+SLVohwf31V1/ynJkDynyNFl8X+N4oYoRFJkFydXNZ1K7/ojZ2UaVNg2A75H
         tqlyghLcRELQgal9aQ/Rwkb3KKW1k1TsnsU1DGYsu02+GZCjHkw611lz0gozRBceYLC9
         uHWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793405766; x=1794010566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gMaW2rIgiTJytx2lWlTzvZR7CynM61FRDOOplTuCQMY=;
        b=TKKuHSMioL14oG+lNNGoyFaY3/wHxyxgdyAEbhGIEgh+RLh79MvNrC2krP5Y3F6gIp
         EYFLElvrSPu2vsMeHIs+iVZsKP/YTWMHJ7/9QSBAvN00/soZtI6CHhh5+JaWYgmrJVRe
         Fx+1lJc51MXIeJsZm0BuNlU6iqjkG+1L4SXCmfqEg2BezeDhBB6OjwgUgXL1ILLbtJ6U
         zdTDALZJXVuv5MLwtBnmH2l8zjWIZKZyEQhZD8SKEuHAV/WsndIKwV9mMP+taGDj0a5F
         v37masY3V9uvuZIHHukMm51SpxmK+BBgybSJdHaMh92KqqNIPblzU/UQFUvbLzRb6KQe
         /xYQ==
X-Gm-Message-State: AFq9FYLjCVE2njheHkl9fJX0D6+qd2fcocaBEigqtsrDvihF6Ov0xvg6
	qvujP/8o8Jdsv8ltrQw79cn/LZ5TQUQUTAQi9LgfW5Pw/E842IPqtWC6c5ZCaBxxLhtzCNojR5U
	NHU9ACnQ=
X-Gm-Gg: AYBFou02IpavUGBgk8DLc5V8Dw5FSfuO8iXH89s6AI8eLowE++cnGqp1UabwQuxmj5y
	D6wbm+fJhx3JwCc71BlyU5vIo+KhP5Vvks3bi4fRm5lGmyhdRReSHcAxJIFTHew4swTUMsxIC/o
	Zyunu9tm7JR+KL0RbGCxiTALMIVBhTTiEnBfyYqjD4kPIIEmrlGBp7zbPiuhPiW8ckDQxrkqMeF
	9pfxweZLXzVBIXr3HCQxWy4o1SeYmbQMyZUIc74EY/LYdOsfSHFl3NXhe01NU31bmo5NmZnRxYm
	qdtvXgwwrq4rLCD8UAlAZRqMCnuojeF8ldBA7wDlnoir0LFCoBVRrjDQddTNzwHxsik2i+2PcdY
	orCezPJ4pyG2tcFws0un4nVY6xsTewQCarJT/IUBuzoAtnM4BaKp0q+wqNMI3hH0BBtNUZgdYOO
	57QmbisDyxg55dTzEjWNHlelzHKHQdoxf3NI/xC0PrlUaQzK4wpgByERtXEQinhhZdG3Uz5BbSF
	x2EGrH4FyojtZF2H4q5sCPO3I5KISLbpYu/UVgiIEpyP1XYzOUwRyeNVS7Apr9AkbeHzp2OjOzy
	Js9p6JdS2nsZrTesDDd1AwhNtk0C0bUu9JCSvgSeGtPNplR6NMSPz2a+FblQrCkOMql/lCH75kT
	eyRYsavqdhjAmjBQjTJgg02lsHSKp
X-Received: by 2002:a05:600c:4708:b0:4a2:167a:c93b with SMTP id 5b1f17b1804b1-4ac19234ad8mr81658595e9.30.1793405766063;
        Fri, 30 Oct 2026 17:16:06 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm130350635e9.12.2026.10.30.17.16.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:16:05 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 39/55] gstreamer1.0: disable an intermittently failing test
Date: Sat, 31 Oct 2026 01:15:00 +0100
Message-ID: <b289c9ec94aba7b01154874304ddf26c9174d6c4.1793405493.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793405493.git.yoann.congal@smile.fr>
References: <cover.1793405493.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 00:16:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249114
Content-Type: text/plain; charset="utf-8"

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 79ec3a84acc65594942ca9352fddf93d90952d71)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest b/meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest
index 7fee5a3d09c..d6219ddcccb 100755
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest
@@ -23,4 +23,8 @@ GST_CHECKS_IGNORE="$GST_CHECKS_IGNORE,parser_pull_short_read"
 # https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3524
 GST_CHECKS_IGNORE="$GST_CHECKS_IGNORE,parser_convert_duration,parser_pull_frame_growth,parser_reverse_playback"
 
+# Intermittent fail
+# https://gitlab.freedesktop.org/gstreamer/gstreamer/-/work_items/5163
+GST_CHECKS_IGNORE="$GST_CHECKS_IGNORE,test_device_monitor"
+
 gnome-desktop-testing-runner gstreamer
