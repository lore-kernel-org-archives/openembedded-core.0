Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web12.5738.1602333415516140486
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Oct 2020 05:36:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MEeYPc3D;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id t9so13011433wrq.11
        for <openembedded-core@lists.openembedded.org>; Sat, 10 Oct 2020 05:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bvv8Gt5g2bu5A9UoCk1G9PiBJwnprne/jKmktDXRmZg=;
        b=MEeYPc3DJ1g93Og4EQDeRhxZ1wtA2d0htc7uWdYQuQkvFSeGlCOUjdOZuw0qIlSuTr
         6NU3Z/OvcEI0dh1nj60MCMuZ6JnmgLcTYOdRmPF7O3yC5apMzdlBaI2z4bU4vnWr4d++
         YXHO00xHps/B1k3eTEeYpOHJaOyeOAAZKFNPM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bvv8Gt5g2bu5A9UoCk1G9PiBJwnprne/jKmktDXRmZg=;
        b=sSE7rpn8ivoUQKjRqdYbYolMcFquzNRl3GT4AqRmtTkqFGVTeJk+lMTkpEk+vkurIb
         fv4+LChWG3zb0koP3LFiLvJ22HWxb6YO/aYbFbKmj6subFNZI9DROACxo9Q9JDYTTcEx
         Gcml49JT68UdCgs98ll1MSM/M0htYUlRj3Q+jEUpMx63CY7rf8E12mLPRzSwGRReqAn2
         h5OrtToo7EglwbiAQUWfKuMRojZfxsbDo4UQoGAuKvS+b+DsoZ1AJqIP4geZqNnHpu66
         CVlmiajaal7x2Isr0v5xA+MtiT4OKPMtxhq32N1A3BywhGtmuzOo/6cxUPUfNwx400jR
         +TYA==
X-Gm-Message-State: AOAM533iwjYBX6zjTP3fN+dqfcB4mJcRDX/ia2UHSMCdArST5+ZybO4K
	5OTW/wPmdnglxqHAH0/TdaJCfgGUcNTzcA==
X-Google-Smtp-Source: ABdhPJw63eujN/Eapy6DLT3nffeL3uMwGlLDrpEkPT1ZRqV9knJzyqBwxnHyNTCFlQAtFgsB/WI6tA==
X-Received: by 2002:adf:a70b:: with SMTP id c11mr14086859wrd.257.1602333413600;
        Sat, 10 Oct 2020 05:36:53 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (0.6.6.4.7.a.b.4.4.1.e.0.e.3.c.2.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:2c3e:e14:4ba7:4660])
        by smtp.gmail.com with ESMTPSA id u12sm16478387wrt.81.2020.10.10.05.36.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2020 05:36:53 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] skeleton/baremetal-helloworld: Fix trailing slash
Date: Sat, 10 Oct 2020 13:36:51 +0100
Message-Id: <20201010123652.3321544-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This fixes a warning about a trailing slash on ${S}.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../baremetal-examples/baremetal-helloworld_git.bb              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-skeleton/recipes-baremetal/baremetal-examples/baremetal-helloworld_git.bb b/meta-skeleton/recipes-baremetal/baremetal-examples/baremetal-helloworld_git.bb
index 3acc523a884..7a580bd885d 100644
--- a/meta-skeleton/recipes-baremetal/baremetal-examples/baremetal-helloworld_git.bb
+++ b/meta-skeleton/recipes-baremetal/baremetal-examples/baremetal-helloworld_git.bb
@@ -8,7 +8,7 @@ PV = "0.1+git${SRCPV}"
 
 SRC_URI = "git://github.com/aehs29/baremetal-helloqemu.git;protocol=https;branch=master"
 
-S = "${WORKDIR}/git/"
+S = "${WORKDIR}/git"
 
 # The following variables should be set to accomodate each application
 BAREMETAL_BINNAME ?= "hello_baremetal_${MACHINE}"
-- 
2.25.1

