Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web11.53585.1606230843332602904
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2020 07:14:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=R/xcRcXE;
 spf=pass (domain: konsulko.com, ip: 209.85.128.65, mailfrom: pbarker@konsulko.com)
Received: by mail-wm1-f65.google.com with SMTP id a65so3239586wme.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2020 07:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0EfU+63GYy6YNgw+3jUd4OFO068i1mn4nofW7bavsxY=;
        b=R/xcRcXETwetS+u9JKrHTMOZK8cgkavBiwT0OoSKjOQRqKfITlHho4+mNefRUlbr4M
         JoKGe0y/fhN/zL5+eeBa4jKX6V8wuW5Jxt0AJDZ8z1TP0j/xCz69ztMWoF3Cv5c+Ih6I
         mYuAQphTwKGn1h9fqXNm4Yi1gtf3j0MzaMatE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0EfU+63GYy6YNgw+3jUd4OFO068i1mn4nofW7bavsxY=;
        b=l9cMVYoHPE3Atmr1flWhEyesh/gQYZNSbvFriwTPp72Ms+NTDDbWq5mu2/2P1cJZQ9
         oYLxoA77WrTzyobZtabsUkWv9iic6buWzf1qoOp07FRE/8k69ssnrey6U1T81euBbrVr
         mJsBV+oeIYqUVoMx4JGpM/Zl7zsir4z1Tpz+KxKf8shS2BKdzsbSHfK2dQ18zSUCyOvr
         azLhdtSxl5+kjvJdZt18hzZoPlthdWtX0KYkHl2jliFGtPRM/8aZjwXsF+FymuFmSKsC
         HabxuMBepSt/oNd6Ng1MmLEZV+xAOF9wZ32qIdK7FEhWyGJ5RF/WSe1A2EKztHLUuGnC
         lwHQ==
X-Gm-Message-State: AOAM532Wiz2XAvoxxiSHLYTe+Rg7IAKlllT9LBWR2F7gNnhRic4cJ8Es
	Au+NNs6+VYWKEYK3aR0Cf3bXXPhGvtwg0A==
X-Google-Smtp-Source: ABdhPJwuVD/ki16Ac6lBHZAo7trMKTKL98DyYsemC3bSSZLmsucTym9scLd3Jz8IEo0J3NcaPu4lxw==
X-Received: by 2002:a1c:2d84:: with SMTP id t126mr4793473wmt.132.1606230841399;
        Tue, 24 Nov 2020 07:14:01 -0800 (PST)
Return-Path: <pbarker@konsulko.com>
Received: from alpha.home.b5net.uk (cpc76148-clif11-2-0-cust524.12-4.cable.virginm.net. [82.1.54.13])
        by smtp.gmail.com with ESMTPSA id 140sm6039909wme.14.2020.11.24.07.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 07:14:00 -0800 (PST)
From: "Paul Barker" <pbarker@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [PATCH 1/2] poky.conf: Add opensuseleap-15.2 and fedora-33 to tested distros
Date: Tue, 24 Nov 2020 15:13:57 +0000
Message-Id: <20201124151358.30845-1-pbarker@konsulko.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The autobuilder contains workers for both of these distros.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 meta-poky/conf/distro/poky.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-poky/conf/distro/poky.conf b/meta-poky/conf/distro/poky.conf
index 31dc110bf6..bdf46f4038 100644
--- a/meta-poky/conf/distro/poky.conf
+++ b/meta-poky/conf/distro/poky.conf
@@ -52,12 +52,14 @@ SANITY_TESTED_DISTROS ?= " \
             fedora-30 \n \
             fedora-31 \n \
             fedora-32 \n \
+            fedora-33 \n \
             centos-7 \n \
             centos-8 \n \
             debian-8 \n \
             debian-9 \n \
             debian-10 \n \
             opensuseleap-15.1 \n \
+            opensuseleap-15.2 \n \
             "
 # add poky sanity bbclass
 INHERIT += "poky-sanity"
-- 
2.26.2

