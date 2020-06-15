Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.26483.1592249768244508650
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2020 12:36:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=aDNEkDGF;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id d6so295720pjs.3
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2020 12:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=F89hbB680/tFYZcmaROJYch7ggQ+89cYJstDwWMalPU=;
        b=aDNEkDGFrlgOe6kxbai10YWj525Q33xelfPWNy20zyha0wH8jLYI2jE8ZhbbukSeN8
         /tyZI6Lnu1sxKwXtv7N+/BJLB5SjTbNRY2bwJoB0SLB+osJ9BiayQgrzxeM7SoNEaz3O
         vi0pmyK/CMB/vOiRf6ZhYO9+EcK/5FAZ2YtpZQi/4kk647QqYa2XTDl0tePriICOvURs
         XiuCVZOOIgsCf/+gH2Hu5SIW7rZTBFOgKV0Ml2uAHSJHUBvMEgEnAo+CkSjXEVxFqirs
         tcArmuyEX/YubTY1r7utC00lSVECj/nTNijyZ0YQiDD9EgJTdH4Gi/w/raQTHSR0c0ht
         syQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=F89hbB680/tFYZcmaROJYch7ggQ+89cYJstDwWMalPU=;
        b=po5IjY0ESSDeFx8lrcOB6c1EDijKYCwjFvyeNIc1FYzyecHMQSUFtsT4sNhVbSRag6
         4w/BPTCYNEqsQdNpwnDpxjEzMTWRuuuKOyuNatMRHXkMCRY5VqqCghztVGuakTBJoa0T
         vk9YmAWeyq3rYanwWx4Ac6i8yP/x915reoaHDaKjHqwmbdncBP19hTx8Nunw3zk5vkng
         sMpyeNVn4LeFTyiryMvaUDSEXohpixkxMQaliVtt3Ic42cTEexDSESQ0cudw4g3oBwDc
         pK2axN6duClVCh4/i1ydzHK4knQe8woaIaojnqk8paVUWqTa2DZC05Yn7lYiToXUuE2W
         5Fgg==
X-Gm-Message-State: AOAM5318NkJvy4Qu7rDbvE4nAmMs1Z5cGqugXoOe7IG/K+ToSkIlgD81
	Zw8NTPldcP+cFFhtyMRgE1g2TxM0T7M=
X-Google-Smtp-Source: ABdhPJw36NW+lplSC0Tq9rxeqe1cn0bR6SMMt2xlYVPbbcAUJkGcjBumo5+Z4+R3yLi0WAbwEpxl4Q==
X-Received: by 2002:a17:90a:e08f:: with SMTP id q15mr883214pjy.178.1592249767318;
        Mon, 15 Jun 2020 12:36:07 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id u1sm12405492pgf.28.2020.06.15.12.36.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 12:36:06 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/21] util-linux: alternatify rtcwake
Date: Mon, 15 Jun 2020 09:35:22 -1000
Message-Id: <29ada652108335b4074ed330586f893bba1c5dce.1592249381.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592249381.git.steve@sakoman.com>
References: <cover.1592249381.git.steve@sakoman.com>

From: Marco Felsch <m.felsch@pengutronix.de>

This tool can be turned on in busybox which lead into a error during
do_rootfs.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit eb22e7a1190a79fd74ae54f23a13ec4932f41b0d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 0566569a61..532cceb935 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -257,6 +257,7 @@ ALTERNATIVE_LINK_NAME[readprofile] = "${sbindir}/readprofile"
 ALTERNATIVE_LINK_NAME[renice] = "${bindir}/renice"
 ALTERNATIVE_LINK_NAME[rev] = "${bindir}/rev"
 ALTERNATIVE_LINK_NAME[rfkill] = "${sbindir}/rfkill"
+ALTERNATIVE_LINK_NAME[rtcwake] = "${sbindir}/rtcwake"
 ALTERNATIVE_LINK_NAME[setpriv] = "${bindir}/setpriv"
 ALTERNATIVE_LINK_NAME[setsid] = "${bindir}/setsid"
 ALTERNATIVE_LINK_NAME[su] = "${base_bindir}/su"
-- 
2.17.1

