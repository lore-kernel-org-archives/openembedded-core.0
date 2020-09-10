Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web11.20715.1599740601874009858
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 05:23:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HMWFQixb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id x14so6439479wrl.12
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 05:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vD1EBDPVaF7TAuNtrBYrEftbiQO8vAD2VSYx8YMf+5A=;
        b=HMWFQixbreQvPH6FH43W0w6VpinriLRIEyKP5rg+bn9IrxRZqVaJas5dCIhp5ZcnO+
         PWL4Phsmd7j99WaYzyuz7x+rBX4ctD6b8LQgIYu+V9EmRPdqNkhmghgIlVd4zM0gKVE+
         eGNrz7j0kUlRuRCC6ZMEMEnTwDJCf6YGZG2x0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vD1EBDPVaF7TAuNtrBYrEftbiQO8vAD2VSYx8YMf+5A=;
        b=C5OHnwqtFq7VdwQvjKMjSu8CiE91Eaab7EiT+E79uhBFafjwXMAT41F5czXD3p9Rvj
         YgsiEEli/WuOeNi4lINdU52Z+bsmh0nxJi0gaYlMXqUh5Bi66n/Q5ZZnR3qp3n7L5JfS
         xrJH0ANL6VpeqaRNubIjwV8OQEmpTzkEhCcXnbf3GoFxSufg+TEKlvZNfi3nz+l1eXit
         n1jqqBmhLUV7XMO25ZSP7XtdPOyOQUpBwVOqub8jfZjuKi4x6REcKr7/3y2tu52sBJ5W
         7UVgCtV2/WNHJX4zAp292H28HXaLoQHKUGK3CylOw1nW4HojaEWmNewy5yEwgwBLoEJf
         anDw==
X-Gm-Message-State: AOAM533H6XKIzmKErzfraUiOa3cBkRSTLZyxYrb74EHdH8DaHUCz5A+r
	EqDJTWcDstQOqDJZnf6yje3LlsYZHQOZrQ==
X-Google-Smtp-Source: ABdhPJzOwbNivV/HDGNnavGfbxSOtNF+7j+m034q1E+IdfLwsz4aB911uYIlfi5w9FuH7Dbei3J9Jg==
X-Received: by 2002:adf:e9c7:: with SMTP id l7mr8485159wrn.93.1599740600033;
        Thu, 10 Sep 2020 05:23:20 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (2.f.a.6.5.4.b.4.5.7.2.f.a.5.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:605a:f275:4b45:6af2])
        by smtp.gmail.com with ESMTPSA id v17sm8810794wrr.60.2020.09.10.05.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 05:23:19 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH][warrior 14/22] uninative: Upgrade to 2.9
Date: Thu, 10 Sep 2020 13:22:58 +0100
Message-Id: <20200910122306.2040194-14-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200910122306.2040194-1-richard.purdie@linuxfoundation.org>
References: <20200910122306.2040194-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

This supports glibc upto 2.32 which is now rolling into distributions

(From OE-Core rev: 622371678ddb013fc456eaf75def26fc4e142d15)

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

