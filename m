Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web10.20734.1599740696412929488
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 05:24:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RKhVt/P/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id x14so6444709wrl.12
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 05:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mF6lOE7FjFbAj7APVXQrIA0c5MNq9cuMP8dqWi1xakA=;
        b=RKhVt/P/DZTNlqhgUYFD+hfvCyrPNcqZSnUc/zGXOJFW2nHI4AGe1Ax06uv2qQ6E5j
         7tkrRhTb0djQm8gFiTckwgJbgZz01oWoxSkt0JKZH6ZktkdxtVn5vYYfhkuxD2tbpOK7
         dLy1qG2Gstrdn/l2HOjSRUFIWdAt3Aq3NiyJ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mF6lOE7FjFbAj7APVXQrIA0c5MNq9cuMP8dqWi1xakA=;
        b=hcdvoXoTcBGC6y6lP2orkp6Yrcii/1TmTqWY7DEdPpsOnQzF2xRJcr/AhOP6A8lBbc
         m9D60DkhVl58aer2EaJvHLr+2UAo+HwM3AlPfLXDl8IfQLh7OzVa/u1qDbrRc4RU++G8
         l9lUc4PB5F+LO6UXbbdeeWtGNwe37wd+oqocoSCyeJaTCWDKAqwLe2jqWlUW1xxWkudr
         OkwtQ9kVJacNPwcRi+N7FkY3oCnTSbGAJt424UznfyJF4e/jRnMh+Bye/h37wMdUTwxs
         lmrKpvlPobR+h1rfbheyqt1QpcfndijHCHXaHH+qtBt76VIblSuI31fFca9+cZLp2lT6
         1k4Q==
X-Gm-Message-State: AOAM533dgaEiyYmTiVOtn90WWXkncsGz2hjmBG/qMwJa5Fi7XebhDnCx
	w0yiHe1PgVSQSYDzwPtJh67Kmm076AVOCA==
X-Google-Smtp-Source: ABdhPJzFlx40jIAsfs+6qHA1pXv5oLtBBmWwePDWktwDQOZsb2jtCO0OTeqWnl2yuYeTX/q8/1dSNA==
X-Received: by 2002:adf:f852:: with SMTP id d18mr8681791wrq.245.1599740694641;
        Thu, 10 Sep 2020 05:24:54 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (2.f.a.6.5.4.b.4.5.7.2.f.a.5.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:605a:f275:4b45:6af2])
        by smtp.gmail.com with ESMTPSA id j7sm8590498wrs.11.2020.09.10.05.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 05:24:53 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH][thud 21/29] uninative: Upgrade to 2.9
Date: Thu, 10 Sep 2020 13:24:25 +0100
Message-Id: <20200910122433.2040293-21-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200910122433.2040293-1-richard.purdie@linuxfoundation.org>
References: <20200910122433.2040293-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

This supports glibc upto 2.32 which is now rolling into distributions

(From OE-Core rev: 622371678ddb013fc456eaf75def26fc4e142d15)

(From OE-Core rev: 4543eeacd65eebe74ff3a44182915a732ba26e47)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/yocto-uninative.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 889695eae34..69b6edee5f7 100644
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
2.25.1

