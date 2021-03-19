Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web12.3560.1616143511597490266
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Mar 2021 01:45:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IWmtN80G;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id r12so8362079ejr.5
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Mar 2021 01:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tt45LCRCnY2mcCfIMWNA5ak1+3BO8E4OUomG3I6Y2FI=;
        b=IWmtN80GmDPfGvIvq6X0nDzd+6t7U09XCGdcQrpn3Bo4CmmVhrLw9OEgwqpik5lsir
         93RQj8NND6Q2NEGhA1RWLGAU+S5TtOqfHoAQuUycZO0IPNQ7i/t5BLKNZOYULJNOMdGL
         9DjMHcCWqbaWF6nTezUtj0pAKqHA8q2AqlEGl7SvXkO8US5ZMDxNL+9KD94b4r2Gb62U
         7tv/gk+6T3Kjg+UoGGAx7wp4X8Oy6TUhcVpiectW3BBsi+k5hXX3RzV61jfSae/+y340
         EFUHw3YUK3HDKNpHrwpdZJOAL6B/7q37Y012NjtphuEi0GxVaUJdukLWNQsP7jHuZfsl
         4YeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tt45LCRCnY2mcCfIMWNA5ak1+3BO8E4OUomG3I6Y2FI=;
        b=rf8q3JVz+DaioCGRFdPA2fJ4XPhIbzfGxaBIoVw3M9py506UoeV+KXyHogEOiYRe7B
         u5tsXcFq/tRS0OV+DDZ7SCDzIldKZKC4urGuVc0NkqrD+IxLIrXGmHp0M0JDNCphar7z
         k9ygjrEk4GVT27ki8irt2si3LF0HSuxegwh7gfzzjgCJ792XF2IhAn2khb8LKwMicJkR
         AfqwXPYLE4mupf+D24wy/4EtUfZNa48SfhutU4H/EaXcX0J/iVbbixN7uectTBpo937e
         Wz+HGwgeD1hoVMm0q6TnPqeAomL+NuBbZ6e3oFkstpBVEdPl+PWhg7BUpq1iMECxYWr/
         IPtg==
X-Gm-Message-State: AOAM530DKKpNjNmkOAYxmChb/7w+UWTS1HNP2g9/o8e9dcVigNOM7FLT
	bBw/V90hxhZLyYGnyQcHPs4L81hWdJq0bw==
X-Google-Smtp-Source: ABdhPJzxwl1Aj2t77eOtAxTPCldxqQPFjjyiCswpPrFyq5Yv3mdvT2bQKwN7uRENlqzC6QOUUl1Lrw==
X-Received: by 2002:a17:906:3f88:: with SMTP id b8mr3183109ejj.36.1616143510200;
        Fri, 19 Mar 2021 01:45:10 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id nd36sm3262248ejc.21.2021.03.19.01.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 01:45:09 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 04/16] bind: upgrade 9.16.11 -> 9.16.12
Date: Fri, 19 Mar 2021 09:43:49 +0100
Message-Id: <20210319084401.576728-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210319084401.576728-1-alex.kanavin@gmail.com>
References: <20210319084401.576728-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adjust library packaging (see link to commit in the recipe).

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../0001-avoid-start-failure-with-bind-user.patch          | 0
 ...1-named-lwresd-V-and-start-log-hide-build-options.patch | 0
 ...d-ensure-searching-for-json-headers-searches-sysr.patch | 0
 .../bind/{bind-9.16.11 => bind-9.16.12}/bind9              | 0
 .../bind/{bind-9.16.11 => bind-9.16.12}/conf.patch         | 0
 .../{bind-9.16.11 => bind-9.16.12}/generate-rndc-key.sh    | 0
 .../init.d-add-support-for-read-only-rootfs.patch          | 0
 .../make-etc-initd-bind-stop-work.patch                    | 0
 .../bind/{bind-9.16.11 => bind-9.16.12}/named.service      | 0
 .../bind/{bind_9.16.11.bb => bind_9.16.12.bb}              | 7 +++++--
 10 files changed, 5 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/bind/{bind-9.16.11 => bind-9.16.12}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.11 => bind-9.16.12}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.11 => bind-9.16.12}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.11 => bind-9.16.12}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.11 => bind-9.16.12}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.11 => bind-9.16.12}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.11 => bind-9.16.12}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.11 => bind-9.16.12}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.11 => bind-9.16.12}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.16.11.bb => bind_9.16.12.bb} (93%)

diff --git a/meta/recipes-connectivity/bind/bind-9.16.11/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.16.12/0001-avoid-start-failure-with-bind-user.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.11/0001-avoid-start-failure-with-bind-user.patch
rename to meta/recipes-connectivity/bind/bind-9.16.12/0001-avoid-start-failure-with-bind-user.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.11/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind-9.16.12/0001-named-lwresd-V-and-start-log-hide-build-options.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.11/0001-named-lwresd-V-and-start-log-hide-build-options.patch
rename to meta/recipes-connectivity/bind/bind-9.16.12/0001-named-lwresd-V-and-start-log-hide-build-options.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.11/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind-9.16.12/bind-ensure-searching-for-json-headers-searches-sysr.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.11/bind-ensure-searching-for-json-headers-searches-sysr.patch
rename to meta/recipes-connectivity/bind/bind-9.16.12/bind-ensure-searching-for-json-headers-searches-sysr.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.11/bind9 b/meta/recipes-connectivity/bind/bind-9.16.12/bind9
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.11/bind9
rename to meta/recipes-connectivity/bind/bind-9.16.12/bind9
diff --git a/meta/recipes-connectivity/bind/bind-9.16.11/conf.patch b/meta/recipes-connectivity/bind/bind-9.16.12/conf.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.11/conf.patch
rename to meta/recipes-connectivity/bind/bind-9.16.12/conf.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.11/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind-9.16.12/generate-rndc-key.sh
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.11/generate-rndc-key.sh
rename to meta/recipes-connectivity/bind/bind-9.16.12/generate-rndc-key.sh
diff --git a/meta/recipes-connectivity/bind/bind-9.16.11/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.16.12/init.d-add-support-for-read-only-rootfs.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.11/init.d-add-support-for-read-only-rootfs.patch
rename to meta/recipes-connectivity/bind/bind-9.16.12/init.d-add-support-for-read-only-rootfs.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.11/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.16.12/make-etc-initd-bind-stop-work.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.11/make-etc-initd-bind-stop-work.patch
rename to meta/recipes-connectivity/bind/bind-9.16.12/make-etc-initd-bind-stop-work.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.11/named.service b/meta/recipes-connectivity/bind/bind-9.16.12/named.service
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.11/named.service
rename to meta/recipes-connectivity/bind/bind-9.16.12/named.service
diff --git a/meta/recipes-connectivity/bind/bind_9.16.11.bb b/meta/recipes-connectivity/bind/bind_9.16.12.bb
similarity index 93%
rename from meta/recipes-connectivity/bind/bind_9.16.11.bb
rename to meta/recipes-connectivity/bind/bind_9.16.12.bb
index f48cc74c2e..09f77038fa 100644
--- a/meta/recipes-connectivity/bind/bind_9.16.11.bb
+++ b/meta/recipes-connectivity/bind/bind_9.16.12.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "0111f64dd7d8f515cfa129e181cce96ff82070d1b27f11a21f6856110d0699c1"
+SRC_URI[sha256sum] = "9914af9311fd349cab441097898d94fb28d0bfd9bf6ed04fe1f97f042644da7f"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # stay at 9.16 follow the ESV versions divisible by 4
@@ -113,7 +113,10 @@ FILES_${PN}-dev += "${bindir}/isc-config.h"
 FILES_${PN} += "${sbindir}/generate-rndc-key.sh"
 
 PACKAGE_BEFORE_PN += "${PN}-libs"
-FILES_${PN}-libs = "${libdir}/*.so* ${libdir}/named/*.so*"
+# special arrangement below due to
+# https://github.com/isc-projects/bind9/commit/0e25af628cd776f98c04fc4cc59048f5448f6c88
+FILES_SOLIBSDEV = "${libdir}/*[!0-9].so ${libdir}/libbind9.so"
+FILES_${PN}-libs = "${libdir}/named/*.so* ${libdir}/*-${PV}.so"
 FILES_${PN}-staticdev += "${libdir}/*.la"
 
 PACKAGE_BEFORE_PN += "${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3-bind', '', d)}"
-- 
2.29.2

