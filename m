Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web11.12424.1624892760879741655
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jun 2021 08:06:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=a+fx26Yf;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.176, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f176.google.com with SMTP id t80so865383oie.8
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Jun 2021 08:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Sm+UwlVTdM4C+MTx8ROfYQvFq74ybZ/Efyj9cuDHM+I=;
        b=a+fx26YfzBmh3lkD2J5aW22ZUqvup9/QbcW446W1btA4sWwVsG32Y5tXYcCK4vBvGU
         XQFFFcbQ1lvfZHI4EmL8aJpUU4e12WQU6zEDiuoFT+RgCRYNaBeqjnx2ByS7NHSkKpol
         35CawICUGh7DcNe1b/WhGeoJMSbtKj/q5rnirBr2WMEAvmUH8NWBe4E1PGnhajzTk+lk
         VlOtaHNr0Z9qo+Y44lGM8xz0UzPuURMv3GHAU3QL4Tx1PGaNSmZp4bIqEOUfctATYS9b
         vYk+I3LOgSm3+S6bYmGfwxewodDOwaS+tXeFcc2c6MJp99RV3sLu0YBMJs9Uh7fZrKmV
         X+fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Sm+UwlVTdM4C+MTx8ROfYQvFq74ybZ/Efyj9cuDHM+I=;
        b=LWxx8WnM9NixGw2BvPgsSRHJP849hZg1WX7ZdvWdKnMXtp5A1pX5Zq4+IIHvGIIwWA
         mb8UuJjtrAvMMj3EO71FPsPFGIB/Yd/IRe4N2E5FAu4n6G5z8zKnBnmAVckKkY+cPmQN
         TQnjvSnlcoQuAQ77orKD7xEIZrAjU90ebf5uuJqHW8if0TPHNgtm0BnrIFI6wdnuzTKC
         MydTkq/I1FoNSxaZhbhU3yd+KYLs5yZJiyQJaXyQ+1puvqx8tKxjgXP61PUdoR8aVZ21
         CL34S3BpzYnqOWRx6TPCj5ZJOmQ3t1w/XEFxTz2ADjNBVHRL14fujthyZ2IGgkvmKZvZ
         6KWw==
X-Gm-Message-State: AOAM530XSmqGuFcIDL+iD7OIKwC6WiGZyGiHRd2llZLSQaQq2mSppSIV
	ze0LyC4qHxRWD10NO6IaEf1E74p3V8YbClXX8no=
X-Google-Smtp-Source: ABdhPJzrhre5B23TGYFBAFMAZEte0ihKxNo1fQc73nP0lc7K4BjbOwL5ctDRdTv3rtMKmyZBbH7EKQ==
X-Received: by 2002:aca:4f16:: with SMTP id d22mr5670380oib.44.1624892759740;
        Mon, 28 Jun 2021 08:05:59 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id c21sm2095892otp.8.2021.06.28.08.05.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jun 2021 08:05:59 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/14] uninative: Upgrade to 3.2 (gcc11 support)
Date: Mon, 28 Jun 2021 05:05:18 -1000
Message-Id: <6af101983c5e7e9d0d000f9fe64b9bd40792bbc9.1624892565.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1624892565.git.steve@sakoman.com>
References: <cover.1624892565.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Michael Halstead <mhalstead@linuxfoundation.org>

This upgrade builds unnative with gcc11 allowing it to work with newer distros
using gcc 11.

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a1c7b71c109ca68931d098f4149ab8284d56108e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/yocto-uninative.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 05b79d14c3..740cca0ecf 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -8,7 +8,7 @@
 
 UNINATIVE_MAXGLIBCVERSION = "2.33"
 
-UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/3.1/"
-UNINATIVE_CHECKSUM[aarch64] ?= "7fa12b9fe7a95934cc09beb0e8a25ff97179ef3105116015d32548eadd27b024"
-UNINATIVE_CHECKSUM[i686] ?= "bbfcdd48336800b5af97e294918c6586a0a8fa903f127f813b0bd5110de8c55c"
-UNINATIVE_CHECKSUM[x86_64] ?= "5d0611df544edff6428cef7d871257a91aa6ba1bd92f5365a2df8deb54b6b31e"
+UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/3.2/"
+UNINATIVE_CHECKSUM[aarch64] ?= "4f0872cdca2775b637a8a99815ca5c8dd42146abe903a24a50ee0448358c764b"
+UNINATIVE_CHECKSUM[i686] ?= "e2eeab92e67263db37d9bb6d4c58579abd1f47ff4cded3171bde572fece124b2"
+UNINATIVE_CHECKSUM[x86_64] ?= "3ee8c7d55e2d4c7ae3887cddb97219f97b94efddfeee2e24923c0cb0e8ce84c6"
-- 
2.25.1

