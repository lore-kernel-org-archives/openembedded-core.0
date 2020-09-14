Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
 by mx.groups.io with SMTP id smtpd.web10.61386.1600092725991273085
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2020 07:12:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=SZKDZGPc;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.194, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f194.google.com with SMTP id l126so12744698pfd.5
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2020 07:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=+SN0nf1vwXfa5HSiAmjOjbB7fUf2QUufkhdDjq+seh8=;
        b=SZKDZGPcM83oFWy1hbP6taq26RU8+HnTrxIf8q4Z4cBpQx+hudTSFjnxUBaggS+tI6
         lNg8QZihpZRyqUbH6+wl1HVFkava025VHtkyhJZVDxvzbIGBV9YWtKuAwZ0TjoXM0dIh
         ackokXK7uonvKP3/CQ3LLsb//od2l7YCuC2BEVK3HFveSn+foVXAuQTgOPy0an4kREVW
         0Rn3ThdVA9d/nSXzVL3mv9S2+txLwbiHM34FFCVq/cEjIUu0vg/EIBOx4URRZaCLYWQV
         6hkcs9crBwzUeemeJYRxfLmBHQDHSDqPHKcjylxlXGff3BvIIuSRetmwO6tOslWyfPrA
         DCTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=+SN0nf1vwXfa5HSiAmjOjbB7fUf2QUufkhdDjq+seh8=;
        b=Y3w0VO8fGhc51yGTaRHkhnssRmKlOVOnq6hFg+hEE1lkTqJC/qaSOHofnvn5l1pg3e
         eDsBhvmXsuZLRMikkcskTlfFYrVhrK+lVh7Vh8jwyR1ojp1AfhEb+qrVLCvF1MrdDbJw
         tbOcDVJhEgHk2HTK2I8yI4lGAwwePHYgWVp+2yWPp+B+mHd5WoLWi/WGe0WLkrhpDwUg
         Ztin3rXpG2jrKeRFc4xfyIH/v3/2YwFJazxmiTN8qZ4JIAlSUBU0bxtA88mV10Gzwfhw
         RLnNQ0h5ETi8CsZI60/CSJWJk8CVS2IlwhbIavPwAk7n/owkNQo0Xto6aWgKS3wzFOG0
         S3Yg==
X-Gm-Message-State: AOAM530GmtvHOjqIb86A2BTLG1wYoPwPsCSLWOUP5EW2graE9awPmxrK
	i0hf6SM6iKHsSbUGN5F4I9XOGQrSE/qKfiDJZLc=
X-Google-Smtp-Source: ABdhPJx81CpufN9hlLLRkEvrF5nzpFlq9tnk5AGGmlhrV7YIbA9ytZ79nUBhBZ3OGYHWbv/71ADI8w==
X-Received: by 2002:aa7:97a8:0:b029:13e:d13d:a105 with SMTP id d8-20020aa797a80000b029013ed13da105mr13465356pfq.33.1600092725119;
        Mon, 14 Sep 2020 07:12:05 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id z22sm11053183pjq.2.2020.09.14.07.12.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 07:12:04 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/24] uninative: Upgrade to 2.9
Date: Mon, 14 Sep 2020 04:11:19 -1000
Message-Id: <0f01fb2286335dd0da0c7be3f56c36a0fced3e42.1600092418.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1600092418.git.steve@sakoman.com>
References: <cover.1600092418.git.steve@sakoman.com>

From: Khem Raj <raj.khem@gmail.com>

This supports glibc upto 2.32 which is now rolling into distributions

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5cda8c7d642cfb72242c95f450e3391bd6537709)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/yocto-uninative.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 889695eae3..69b6edee5f 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -6,9 +6,9 @@
 # to the distro running on the build machine.
 #
 
-UNINATIVE_MAXGLIBCVERSION = "2.31"
+UNINATIVE_MAXGLIBCVERSION = "2.32"
 
-UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.8/"
-UNINATIVE_CHECKSUM[aarch64] ?= "989187344bf9539b464fb7ed9c223e51f4bdb4c7a677d2c314e6fed393176efe"
-UNINATIVE_CHECKSUM[i686] ?= "cc3e45bc8594488b407363e3fa9af5a099279dab2703c64342098719bd674990"
-UNINATIVE_CHECKSUM[x86_64] ?= "a09922172c3a439105e0ae6b943daad2d83505b17da0aba97961ff433b8c21ab"
+UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.9/"
+UNINATIVE_CHECKSUM[aarch64] ?= "9f25a667aee225b1dd65c4aea73e01983e825b1cb9b56937932a1ee328b45f81"
+UNINATIVE_CHECKSUM[i686] ?= "cae5d73245d95b07cf133b780ba3f6c8d0adca3ffc4e7e7fab999961d5e24d36"
+UNINATIVE_CHECKSUM[x86_64] ?= "d07916b95c419c81541a19c8ef0ed8cbd78ae18437ff28a4c8a60ef40518e423"
-- 
2.17.1

