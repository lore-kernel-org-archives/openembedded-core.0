Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web11.1761.1612578168813930944
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Feb 2021 18:22:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=W+tZnb5O;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.222.169, mailfrom: mhalstead@linuxfoundation.org)
Received: by mail-qk1-f169.google.com with SMTP id k193so8968853qke.6
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Feb 2021 18:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l4I/LZuDrhP5xNlFrXI1pUCPsjl2cN7cu/zQTs6oF18=;
        b=W+tZnb5OgDr21fCw24yTjw8Rtvd/pmeezT9unr3PGoJEeGPnjTdWA4eUSJ0ZwwH16+
         Vp+J8R5FqPg9r20Y+xodgnpZqxsY7NUsayAztu3g2NxmguwLGEelnybrN1Rs5D9WePcU
         Z3WloTbliKUhLVqAolmtndJ6ubHWSgNfixWrE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l4I/LZuDrhP5xNlFrXI1pUCPsjl2cN7cu/zQTs6oF18=;
        b=phTsSagpXGIUTX9toC8lhNHIztkkL1yRT5dCllgsDIXz8dIiNod5iuBJLpJc3ch6DE
         lgOf9B6RT2fiagd0C84ERwo8OmhqkCO4KR08Z+ghJfNNeUdq/O54vOfuCnGQCLhdMdoW
         0PoUHfOkY5pxHIX6GzNobB4ryq6EdkVbBOvW223MnWLQIEqlpg/TL1mO6nyM4vFgnxvZ
         TiFaYM9Fqx85o1OH6ic4SxTBNN/rsuL5owiBNxHYB1MAOTP2HMZXd9JlTwjCORi0MZf+
         7tF+iRFerw9j4g2U80IeHq0xZeT5TZ82Ni4DrOXPbgcatgM2wGZNghPsi3avJ6pJUO05
         5SHw==
X-Gm-Message-State: AOAM5330uN1IDsEPZjxpdX5kcwdK8fiazjctrNZDAHGdEf/obqLm9K6y
	OpbKlff4BFYAe9yXyFTXTetPR9nAqG69Zg==
X-Google-Smtp-Source: ABdhPJzrnE9GcucC2KMuGZBQf8BDLEjZ7nVPAP5TtYvSB2bu9lDCq7YTlht2OXYr6AKqnJunMjSkmg==
X-Received: by 2002:a05:620a:16c9:: with SMTP id a9mr7089445qkn.41.1612578167693;
        Fri, 05 Feb 2021 18:22:47 -0800 (PST)
Return-Path: <mhalstead@linuxfoundation.org>
Received: from localhost.lan1 (068-113-044-012.res.spectrum.com. [68.113.44.12])
        by smtp.gmail.com with ESMTPSA id v135sm12072697qka.98.2021.02.05.18.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 18:22:46 -0800 (PST)
From: "Michael Halstead" <mhalstead@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: rpurdie@linuxfoundation.org,
	Michael Halstead <mhalstead@linuxfoundation.org>
Subject: [PATCH] uninative: Upgrade to 2.10
Date: Fri,  5 Feb 2021 18:22:27 -0800
Message-Id: <20210206022227.7573-1-mhalstead@linuxfoundation.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Final glibc 2.32 based uninative.

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
---
 meta/conf/distro/include/yocto-uninative.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 69b6edee5f..85336014b1 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -8,7 +8,7 @@
 
 UNINATIVE_MAXGLIBCVERSION = "2.32"
 
-UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.9/"
-UNINATIVE_CHECKSUM[aarch64] ?= "9f25a667aee225b1dd65c4aea73e01983e825b1cb9b56937932a1ee328b45f81"
-UNINATIVE_CHECKSUM[i686] ?= "cae5d73245d95b07cf133b780ba3f6c8d0adca3ffc4e7e7fab999961d5e24d36"
-UNINATIVE_CHECKSUM[x86_64] ?= "d07916b95c419c81541a19c8ef0ed8cbd78ae18437ff28a4c8a60ef40518e423"
+UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.10/"
+UNINATIVE_CHECKSUM[aarch64] ?= "645e5c50b2b48aabb8b10f783a9f94b4b7c5ddc7cfceb5386d43b86d30253202"
+UNINATIVE_CHECKSUM[i686] ?= "233e09b5ff30e15341232a0c16fa8448ff31dccb8f3f3e2ad3948cdac8c4a598"
+UNINATIVE_CHECKSUM[x86_64] ?= "04333677f81990ce2cf55c3bc256cd84a66085d18fc95ccddfab8581e4aec014"
-- 
2.29.2

