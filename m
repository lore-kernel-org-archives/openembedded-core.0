Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3751.1793405768248431971
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 17:16:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=EoXBDTry;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48afbd2c386so699479f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 17:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793405766; x=1794010566; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ld843SK4pwH1kMpypeItx54BJTQXHbxkSsgBiP8mFmQ=;
        b=EoXBDTry+sEcIg72ymZAOCqnnnOFXX3//XsnfyRMIwUSNdwQzSxKT05JunOaAcAnE9
         1fYJSuhlBnPy0Vgsu//tHu7a0U6URkCvUL4iBw8COeVFg5jt52xz3S4tAsI9FuTzxkxh
         B5YFEBh3ggm743gtdurwQ0+OEh42CEWS8/tTbNx830iZNKXqhOiNl6DQ3FDzOFqfKqNN
         78hqvBMVR3nT+zFLaDPSGa7TNjSJmBhfZbyvu9lHEUCEnx4EIv+a6PfYIcwI79I8taQQ
         askl+uT6nQ7mUOVEGB3jZwfDQWGSIMuhGQVt8/8OkLywn9J+DhtyNIoa5cdvm0cz4xhf
         X1ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793405766; x=1794010566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ld843SK4pwH1kMpypeItx54BJTQXHbxkSsgBiP8mFmQ=;
        b=NNgB0AmNyhyn9CmsYPMUBVbA8iZQQ+LDYs88oy4uWKz2puFsnu/4A5UQVNU0UZpxsr
         Q7sCsIIh94jwLG2D0dFkND7kZGm7rMG2cljTKbIgkPSo7sIw4ggZFyTebbcH/xco5IHj
         AXSKO5fwp/Tw395+M222a+SfqNaGpgpeNMqIdV0eE43fhpxSLShP/siR/mEMp5Q4VZUp
         /H+qTvTiZtLlW/DoJ8/HOAm8LvsgXRPh7tRBwdK9YRPMezbfA1IEuDkwUvLYnBo1v+H3
         i6oI11jHEWtvOju5QqKdlcjUJHG4UU1jxV5Gxg3ry/CNQOJIoH1mTr+LCDyDShNsCgrv
         546A==
X-Gm-Message-State: AFq9FYLB9rfJmYK+jg7U/5zVVHM+FzQDxOMKIq4HB+qaLqjZYTnmnJT0
	gOl3G7KGWjeRspkybgzjDfdvXfVF18qxrxO3a4udaB9ZDL5uO3HSh8sEdWF4BUEno9RnT4oe1hu
	GyuZ3q8c=
X-Gm-Gg: AYBFou0sxAv46VkHDa/BFCHjozg2LBQH4W0jAO3GNTfCr0pmNbqPmiuASAz6XCzw4K0
	yUGIcFzzHMyRn7Zyu6IHlZUtrPrjs5IiJXgEoBCQXQhnvaQO1zit1Uq+MKB4Os0y3cluXTTT16E
	BRPhFMFyOsnNXHKNTlk3x8BDoUUrscwNm1hA3r+7xnIEoSoLiEbdbEASzIsBnsLU7CDuxSnK9KT
	2yI2C1tAPD8qVD94ghGBu9SRLoNcDr9gf+hz0zVVP4t1qgd6QrwjPgHBp/9m+SnZQdhQ2ES7Oqq
	nKaQ2gwO5+X0mTx1xI7XhbHZuOLFjmWX27Q63nVW0lycCSG9BAlSwjfO+NtJOPmsaesTnpl7hCA
	TB6oZNSnN4EE5yscA4eXI+wvtxR5YeKqPHQaeOLbYUz3n5Oo57b6ZeiLl0PXYjKTLxQ4PjHBql7
	hZIKLnAnJjWWUrdiv/o5i558UnbYNqASn+YoO0tGMa/WQgPkraAWXF1mFme0VXsw9eg7jo5ES76
	K8jNhcfoNL1cfPZzN3U6ROPGT8uMeUtn6QBH1/F71rAr+jPpd0zfha0za6tPrCakwzIZxiRI7SI
	fBAGtJXD1cwDcf4Ydr2U8P1I3tP5uuDYS0hdmB5f7Bn4+2YKGCHE+J+G6iV8JITm4M2TemO6sbm
	W3uYYaXKrKOwAx5EnSReThZOIyFId
X-Received: by 2002:a05:600c:8709:b0:4a1:9078:911 with SMTP id 5b1f17b1804b1-4ac181e75b7mr93786355e9.31.1793405766555;
        Fri, 30 Oct 2026 17:16:06 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm130350635e9.12.2026.10.30.17.16.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:16:06 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 40/55] gstreamer: skip test_queue:test_leaky_downstream test as it's flakey
Date: Sat, 31 Oct 2026 01:15:01 +0100
Message-ID: <cd4d5e4527341943a26f24a9306541548808fcc9.1793405493.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793405493.git.yoann.congal@smile.fr>
References: <cover.1793405493.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 00:16:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249115
Content-Type: text/plain; charset="utf-8"

From: Ross Burton <ross.burton@arm.com>

This test occasionally fails, so skip it.  A bug has been filed upstream.

[ YOCTO #15408 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ac8fa6ada2a0cf0ae27316837985dd57b01e727f)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest b/meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest
index d6219ddcccb..b0f2a3050b6 100755
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest
@@ -27,4 +27,7 @@ GST_CHECKS_IGNORE="$GST_CHECKS_IGNORE,parser_convert_duration,parser_pull_frame_
 # https://gitlab.freedesktop.org/gstreamer/gstreamer/-/work_items/5163
 GST_CHECKS_IGNORE="$GST_CHECKS_IGNORE,test_device_monitor"
 
+# https://bugzilla.yoctoproject.org/show_bug.cgi?id=15408
+GST_CHECKS_IGNORE="$GST_CHECKS_IGNORE,test_leaky_downstream"
+
 gnome-desktop-testing-runner gstreamer
