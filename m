Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.9843.1620227958444843501
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 08:19:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vewRPoBG;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id y7so3433935ejj.9
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 08:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LHX1xVWsfTzDMGA9EFVqKYIZqAfwR9800urEZDrNBBc=;
        b=vewRPoBGa2R70Cf9tun0bzPwm3P8ZeANVBKhl8Owtv/9rmLIitFmdwEMY+5tHKFgSs
         ySu4ai+5/+B6Q+8H1Qcelo/McuTNkcmFHOp6EftiJg0I+qCzTrWjJuQ3BgOxO9e3yr0h
         EWX391AqSupwc/o52sxjljve4nmj/bR74dWYFBxjbzKQdL1+TARswY88NbjAGLnx42bB
         ZqzmZ8JSZ0Aa6xkw+dejMJ7UksmTryJ42b/a3fxVVeafwKf7b60Z6vjMfwNpqH6oPMNb
         ssdGzJqLZWBhVieIBPUtXZSMLNkZ9mcUFg6bqlHvXBPuRx6ut8JVvPVwhYcOmW+5Vgrx
         4/Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LHX1xVWsfTzDMGA9EFVqKYIZqAfwR9800urEZDrNBBc=;
        b=J+3u9a6hWFrW4T2YkEdylNd2ntf7U6P2G3GO8fCiccGFN6/kw4JbHLABSOIO7y5eLo
         sx8XlPASTlTx3gwm0ujHbe98fbVdLMkpB/2qEgzLs5HBGJBwhM2NZJcW6P/H110EsVjq
         hDdkDBoCAcoGdALZLucm6xrVZXVRp8CetJ6TmbWmPW+lrC50aiajBA26xtOYxtWZhsoJ
         KdyHLkMztmYkyvE97VbvKu8OAtuEDUnmjDuJcVSloTJoHpl9e180A1KFNynaY0jgWjSO
         BiWeA6BwhXtJK39Cgr6MDTKtCU3JiqcnQ7fvTqO9y4jvK3qmBzmUwWIj3MaR8novaELa
         n23w==
X-Gm-Message-State: AOAM531SfdqAVlmlGcNUjaTvv8r30LTgCEmRq9huBw3VAiGe6wtoTiLN
	MHCjy41e9k5ivsZpUmiCmF20afEyxD2y5A==
X-Google-Smtp-Source: ABdhPJxJEKnQUZL43TNuQ427u6xlftSmXe3N6vKOyUywq/Bn3GQNHScZgenCC7Cvzz+iiuNuHf939Q==
X-Received: by 2002:a17:907:3f1c:: with SMTP id hq28mr25996257ejc.349.1620227956991;
        Wed, 05 May 2021 08:19:16 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id y11sm3018479ejj.55.2021.05.05.08.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 08:19:16 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 26/61] bind: upgrade 9.16.12 -> 9.16.13
Date: Wed,  5 May 2021 17:18:15 +0200
Message-Id: <20210505151850.660512-26-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505151850.660512-1-alex.kanavin@gmail.com>
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../0001-avoid-start-failure-with-bind-user.patch               | 0
 .../0001-named-lwresd-V-and-start-log-hide-build-options.patch  | 0
 .../bind-ensure-searching-for-json-headers-searches-sysr.patch  | 0
 .../bind/{bind-9.16.12 => bind-9.16.13}/bind9                   | 0
 .../bind/{bind-9.16.12 => bind-9.16.13}/conf.patch              | 0
 .../bind/{bind-9.16.12 => bind-9.16.13}/generate-rndc-key.sh    | 0
 .../init.d-add-support-for-read-only-rootfs.patch               | 0
 .../make-etc-initd-bind-stop-work.patch                         | 0
 .../bind/{bind-9.16.12 => bind-9.16.13}/named.service           | 0
 .../bind/{bind_9.16.12.bb => bind_9.16.13.bb}                   | 2 +-
 10 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind-9.16.12 => bind-9.16.13}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.12 => bind-9.16.13}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.12 => bind-9.16.13}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.12 => bind-9.16.13}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.12 => bind-9.16.13}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.12 => bind-9.16.13}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.12 => bind-9.16.13}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.12 => bind-9.16.13}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.12 => bind-9.16.13}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.16.12.bb => bind_9.16.13.bb} (98%)

diff --git a/meta/recipes-connectivity/bind/bind-9.16.12/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.16.13/0001-avoid-start-failure-with-bind-user.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.12/0001-avoid-start-failure-with-bind-user.patch
rename to meta/recipes-connectivity/bind/bind-9.16.13/0001-avoid-start-failure-with-bind-user.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.12/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind-9.16.13/0001-named-lwresd-V-and-start-log-hide-build-options.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.12/0001-named-lwresd-V-and-start-log-hide-build-options.patch
rename to meta/recipes-connectivity/bind/bind-9.16.13/0001-named-lwresd-V-and-start-log-hide-build-options.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.12/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind-9.16.13/bind-ensure-searching-for-json-headers-searches-sysr.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.12/bind-ensure-searching-for-json-headers-searches-sysr.patch
rename to meta/recipes-connectivity/bind/bind-9.16.13/bind-ensure-searching-for-json-headers-searches-sysr.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.12/bind9 b/meta/recipes-connectivity/bind/bind-9.16.13/bind9
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.12/bind9
rename to meta/recipes-connectivity/bind/bind-9.16.13/bind9
diff --git a/meta/recipes-connectivity/bind/bind-9.16.12/conf.patch b/meta/recipes-connectivity/bind/bind-9.16.13/conf.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.12/conf.patch
rename to meta/recipes-connectivity/bind/bind-9.16.13/conf.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.12/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind-9.16.13/generate-rndc-key.sh
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.12/generate-rndc-key.sh
rename to meta/recipes-connectivity/bind/bind-9.16.13/generate-rndc-key.sh
diff --git a/meta/recipes-connectivity/bind/bind-9.16.12/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.16.13/init.d-add-support-for-read-only-rootfs.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.12/init.d-add-support-for-read-only-rootfs.patch
rename to meta/recipes-connectivity/bind/bind-9.16.13/init.d-add-support-for-read-only-rootfs.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.12/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.16.13/make-etc-initd-bind-stop-work.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.12/make-etc-initd-bind-stop-work.patch
rename to meta/recipes-connectivity/bind/bind-9.16.13/make-etc-initd-bind-stop-work.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.12/named.service b/meta/recipes-connectivity/bind/bind-9.16.13/named.service
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.12/named.service
rename to meta/recipes-connectivity/bind/bind-9.16.13/named.service
diff --git a/meta/recipes-connectivity/bind/bind_9.16.12.bb b/meta/recipes-connectivity/bind/bind_9.16.13.bb
similarity index 98%
rename from meta/recipes-connectivity/bind/bind_9.16.12.bb
rename to meta/recipes-connectivity/bind/bind_9.16.13.bb
index 09f77038fa..6127b13e8d 100644
--- a/meta/recipes-connectivity/bind/bind_9.16.12.bb
+++ b/meta/recipes-connectivity/bind/bind_9.16.13.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "9914af9311fd349cab441097898d94fb28d0bfd9bf6ed04fe1f97f042644da7f"
+SRC_URI[sha256sum] = "a54cc793fa5b69b35f610f2095760f8238dff5cfd52419f7ee1c9c227da4cc08"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # stay at 9.16 follow the ESV versions divisible by 4
-- 
2.31.1

