Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web12.1761.1612578488949336478
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Feb 2021 18:28:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Omg5cTpv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.222.171, mailfrom: mhalstead@linuxfoundation.org)
Received: by mail-qk1-f171.google.com with SMTP id l27so8955449qki.9
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Feb 2021 18:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m4jpbbKQscAcM6KgVF6D2Wekzuu6QUHXowLJoGOi2KI=;
        b=Omg5cTpvwBVt8eqqZDfYA8t/e0Dk7XGZ+P03gHienRrEWl13csN9xTqUEDbXi8j1Cb
         qTpNftV9ZKA0KgJw7hzvdPJPaTnn/Y7ZLXum0vS/eoVZFLawRwLDSYDCELCgyKYENlhC
         bfVTbyHSeneh1qnC2lk7aAMH3PgBmLzEVvWXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m4jpbbKQscAcM6KgVF6D2Wekzuu6QUHXowLJoGOi2KI=;
        b=Ca3MjWIQvF0c6uMbAFqRVd/KN94lDGPWk76py1+kZDYV20v4meveFMR1E6pWh7ei8M
         HPA3Vobl01K4xF6LFvtE5k2ZTxyuCp43V80Vtjko7ozXTWn7qK4rmAqLBRYNO3auwEvZ
         9Hq8W9OwRcPHhu0lsv1eBHwERk/d+zpAgtfb9kd5fFHgnjyn5YovPXvqKkukf2NBmPls
         IKFTZxiCpD5opt75MOOw/zPMvazlHUGZNRPHpRYwIlUUPSd6HPp3pYxK17xaX5mKNvOl
         CcdjdPSO7f0bVUQGYCuTfqoaT+mEIplIQOVNVbwyI6JWqD1+aUch1VwbHcd70GD4eEOZ
         mLiw==
X-Gm-Message-State: AOAM532a8In1I6bk8kuiVqmxDSg5VBsoM3zXwVeoPpZHqUWeYcyaqYhg
	a1EzSV21lbnbbNkn8+wZQ3xDXH7TVz6H7A==
X-Google-Smtp-Source: ABdhPJxCF/t8Jp7vhp9N4BLX4jKgqfVfnRPBM9YvZNQWzsVUT1hR9kvRuQfa+79yNu9QWYGSbQVfVA==
X-Received: by 2002:a05:620a:530:: with SMTP id h16mr7461339qkh.136.1612578487793;
        Fri, 05 Feb 2021 18:28:07 -0800 (PST)
Return-Path: <mhalstead@linuxfoundation.org>
Received: from localhost.lan1 (068-113-044-012.res.spectrum.com. [68.113.44.12])
        by smtp.gmail.com with ESMTPSA id r17sm10034155qta.78.2021.02.05.18.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 18:28:07 -0800 (PST)
From: "Michael Halstead" <mhalstead@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: rpurdie@linuxfoundation.org,
	Michael Halstead <mhalstead@linuxfoundation.org>
Subject: [PATCH] yocto-uninative.inc: version 2.11 updates glibc to 2.33
Date: Fri,  5 Feb 2021 18:27:50 -0800
Message-Id: <20210206022750.8001-1-mhalstead@linuxfoundation.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Support glibc 2.33.

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
---
 meta/conf/distro/include/yocto-uninative.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 69b6edee5f..bc47083978 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -6,9 +6,9 @@
 # to the distro running on the build machine.
 #
 
-UNINATIVE_MAXGLIBCVERSION = "2.32"
+UNINATIVE_MAXGLIBCVERSION = "2.33"
 
-UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.9/"
-UNINATIVE_CHECKSUM[aarch64] ?= "9f25a667aee225b1dd65c4aea73e01983e825b1cb9b56937932a1ee328b45f81"
-UNINATIVE_CHECKSUM[i686] ?= "cae5d73245d95b07cf133b780ba3f6c8d0adca3ffc4e7e7fab999961d5e24d36"
-UNINATIVE_CHECKSUM[x86_64] ?= "d07916b95c419c81541a19c8ef0ed8cbd78ae18437ff28a4c8a60ef40518e423"
+UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.11/"
+UNINATIVE_CHECKSUM[aarch64] ?= "fa703e25c26eaebb1afd895337b92a24cc5077818e093af74912e53846a117fe"
+UNINATIVE_CHECKSUM[i686] ?= "638901c990ffbe716a34400134a2ad49a1c3104e3b48cdafd6fcd28e9b133294"
+UNINATIVE_CHECKSUM[x86_64] ?= "047ddd78d6b5cabd2a102120e27755a9eaa1d5724c6a8f4007daa3f10ecb6871"
-- 
2.29.2

