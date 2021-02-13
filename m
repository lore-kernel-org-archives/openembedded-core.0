Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.478.1613197804928752440
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Feb 2021 22:30:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IqgNtsfR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.215.177, mailfrom: mhalstead@linuxfoundation.org)
Received: by mail-pg1-f177.google.com with SMTP id n10so1048537pgl.10
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Feb 2021 22:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=epwt3iBI0T303ovovS1t4ycwyIHBxVT9WS4iIEmSIyw=;
        b=IqgNtsfRxAdI5J4QBQO5CQJMTeLiuigjeP/3Qou+f7gjlVUGYFOw83NY140pmMgLXy
         r9gMYUitPbUsuTzzcln+WCUaaXeecRaQ4Ei0u949BkPLQ8AoeuiCoF4cNDbK5i/vuNK+
         Ay52TAxHKre3mdaRzMJxKhAn2RaJXIkeaVZw8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=epwt3iBI0T303ovovS1t4ycwyIHBxVT9WS4iIEmSIyw=;
        b=X/PSu4E+KzJMG+imfTI2dBFbQ8ZPf/hnVFUP+dYceNjthZQ8d4grJBvGWiSTTbgnFP
         DhF722dC37eSOXjuDvR3xN/cM9KV9uwZrfb5cTQd2axhs2ktaxxHUPijyL2VU90tBs1a
         T3o7kEfzOLzDbzEGPF1Ifh1O2gYNaqOcalgByoyceuyTdr5frDqrKAK1yeWKCsorvAUe
         g4cOeVwqe9Bng1PqoixSpSHSn/HipNVpY2K5uSTDj6XmJ3AtBxpQCvFmcdfYmmIzfzS2
         Yf33ntm88/atMT88ME0QF62IbHQtY06lAaQw4tlu20xasgs8BwdS3h0GOyMEnAjThBMo
         WBbQ==
X-Gm-Message-State: AOAM533dGyycxXFaeFzdi41r/B6xdbNa5Nt80a0jOcNlRyjfFUom3q1A
	cDSMuHjI2tet9HArTFgu3dAdtAfiH3hArw==
X-Google-Smtp-Source: ABdhPJxV6yjH+qgX42wvHmN+wJje9UZOAfCtlEYJbrDDu7TO1ua4ylA87Mqpdeb8WdfKDEbIB6V+/Q==
X-Received: by 2002:a05:6a00:15d2:b029:1b7:30c1:8495 with SMTP id o18-20020a056a0015d2b02901b730c18495mr6169456pfu.32.1613197803863;
        Fri, 12 Feb 2021 22:30:03 -0800 (PST)
Return-Path: <mhalstead@linuxfoundation.org>
Received: from localhost.localdomain.org (c-24-21-216-192.hsd1.or.comcast.net. [24.21.216.192])
        by smtp.gmail.com with ESMTPSA id f3sm10025100pgj.6.2021.02.12.22.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Feb 2021 22:30:03 -0800 (PST)
From: "Michael Halstead" <mhalstead@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: rpurdie@linuxfoundation.org,
	Michael Halstead <mhalstead@linuxfoundation.org>
Subject: [PATCH] yocto-uninative.inc: version 3.0 incorporate seccomp filter workaround
Date: Fri, 12 Feb 2021 22:27:54 -0800
Message-Id: <20210213062754.38867-1-mhalstead@linuxfoundation.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
---
 meta/conf/distro/include/yocto-uninative.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index bc47083978..a2a2dd18ec 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -8,7 +8,7 @@
 
 UNINATIVE_MAXGLIBCVERSION = "2.33"
 
-UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.11/"
-UNINATIVE_CHECKSUM[aarch64] ?= "fa703e25c26eaebb1afd895337b92a24cc5077818e093af74912e53846a117fe"
-UNINATIVE_CHECKSUM[i686] ?= "638901c990ffbe716a34400134a2ad49a1c3104e3b48cdafd6fcd28e9b133294"
-UNINATIVE_CHECKSUM[x86_64] ?= "047ddd78d6b5cabd2a102120e27755a9eaa1d5724c6a8f4007daa3f10ecb6871"
+UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/3.0/"
+UNINATIVE_CHECKSUM[aarch64] ?= "1c668909098c5b56132067adc69a249cb771f4560428e5822de903a12d97bf33"
+UNINATIVE_CHECKSUM[i686] ?= "e6cc2fc056234cffa6a2ff084cce27d544ea3f487a62b5e253351cefd4421900"
+UNINATIVE_CHECKSUM[x86_64] ?= "5ec5a9276046e7eceeac749a18b175667384e1f445cd4526300a41404d985a5b"
-- 
2.29.2

