Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web08.7775.1624360896495009674
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jun 2021 04:21:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RQeRtT4A;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id q14so1812197eds.5
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Jun 2021 04:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=c20AkMVin4BW4kOH46uRANrXBVFZjNfj4slAaHaAHYE=;
        b=RQeRtT4AIXOI9GVXjjqa9rl/E7xp/7H1xg070dDSH//Wpfw/Ie7xxMyqL6bgFnT0zR
         Q+eKvhF0zrMFoubTcI8bQN6KAEoQzQDR7xRRz1seMf7G50FT46RSxtjy2uW77WZ37uEw
         i+c5yydvjhFvarToAy7Dp14hsPHyV5/4VfDcNEPvjj1FiaW4+4XLtLtyrL/wZ8Se6EH+
         x7upNLwsau87pGagvscJvhrByCj4zz3j67DemrQVFroq3dpTNoCm6gg15Mb5hkgRkCHr
         oBzwJlJjomjhtH+dKyg0v1NLygD8xYLx8XkErNdKcoerbVAZVKuDAMwJYgqm7W19cqUr
         0beg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c20AkMVin4BW4kOH46uRANrXBVFZjNfj4slAaHaAHYE=;
        b=gIDL7r4VC5ziNFps84bniwOgFXI9NOG7oMoeGv7q0T/IYRybODFNBx/Tfgdu4IzaLJ
         cXan7fpCCf42tKb8gKI34hxV/carSI2hdsKLfDOW9YNjlp5bRMsm88Ezf38Sx9r0kKpG
         uS0aJzkdbtOw0Wmh2n1JGk4o6C9lT07QoDK001Ps2l+Kn0so4gqFGx+myONGk9Z22MTO
         ntOzvZ+cj0xlNCv5L+A+y1KLNQvzcFcNmphmK/Z++x7gih1VtQGM06xpdEY73JIDCmGJ
         X9J4ULV4N+925wMfYbVGarPhbM0RbpWNTCnUhaMMXmrFoUuBCLsvJgEGDfbIIY1uWW/P
         Q3ZQ==
X-Gm-Message-State: AOAM530zlxDICNQUKjx6cCRvILg0HKgovNQA9h83v/c5Jpyc6MSKi1gN
	Cq+oFqyexFseXclAU7IWEn1Hd8Ys7RMs/g==
X-Google-Smtp-Source: ABdhPJx7YrriMV7uGdkxBPQGqBYfbfZDX7hIHC3pkIjv1dNrbBf9T3RD4UvSc12NIDRvMywE8refEw==
X-Received: by 2002:a05:6402:31b4:: with SMTP id dj20mr4293293edb.186.1624360895127;
        Tue, 22 Jun 2021 04:21:35 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id n2sm11987416edi.32.2021.06.22.04.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 04:21:34 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 07/19] bind: upgrade 9.16.16 -> 9.16.18
Date: Tue, 22 Jun 2021 13:21:14 +0200
Message-Id: <20210622112126.2026646-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210622112126.2026646-1-alex.kanavin@gmail.com>
References: <20210622112126.2026646-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../0001-avoid-start-failure-with-bind-user.patch             | 0
 ...0001-named-lwresd-V-and-start-log-hide-build-options.patch | 0
 ...bind-ensure-searching-for-json-headers-searches-sysr.patch | 0
 .../bind/{bind-9.16.16 => bind-9.16.18}/bind9                 | 0
 .../bind/{bind-9.16.16 => bind-9.16.18}/conf.patch            | 0
 .../bind/{bind-9.16.16 => bind-9.16.18}/generate-rndc-key.sh  | 0
 .../init.d-add-support-for-read-only-rootfs.patch             | 0
 .../make-etc-initd-bind-stop-work.patch                       | 0
 .../bind/{bind-9.16.16 => bind-9.16.18}/named.service         | 0
 .../bind/{bind_9.16.16.bb => bind_9.16.18.bb}                 | 4 +---
 10 files changed, 1 insertion(+), 3 deletions(-)
 rename meta/recipes-connectivity/bind/{bind-9.16.16 => bind-9.16.18}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.16 => bind-9.16.18}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.16 => bind-9.16.18}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.16 => bind-9.16.18}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.16 => bind-9.16.18}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.16 => bind-9.16.18}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.16 => bind-9.16.18}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.16 => bind-9.16.18}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.16 => bind-9.16.18}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.16.16.bb => bind_9.16.18.bb} (96%)

diff --git a/meta/recipes-connectivity/bind/bind-9.16.16/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.16.18/0001-avoid-start-failure-with-bind-user.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.16/0001-avoid-start-failure-with-bind-user.patch
rename to meta/recipes-connectivity/bind/bind-9.16.18/0001-avoid-start-failure-with-bind-user.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.16/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind-9.16.18/0001-named-lwresd-V-and-start-log-hide-build-options.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.16/0001-named-lwresd-V-and-start-log-hide-build-options.patch
rename to meta/recipes-connectivity/bind/bind-9.16.18/0001-named-lwresd-V-and-start-log-hide-build-options.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.16/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind-9.16.18/bind-ensure-searching-for-json-headers-searches-sysr.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.16/bind-ensure-searching-for-json-headers-searches-sysr.patch
rename to meta/recipes-connectivity/bind/bind-9.16.18/bind-ensure-searching-for-json-headers-searches-sysr.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.16/bind9 b/meta/recipes-connectivity/bind/bind-9.16.18/bind9
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.16/bind9
rename to meta/recipes-connectivity/bind/bind-9.16.18/bind9
diff --git a/meta/recipes-connectivity/bind/bind-9.16.16/conf.patch b/meta/recipes-connectivity/bind/bind-9.16.18/conf.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.16/conf.patch
rename to meta/recipes-connectivity/bind/bind-9.16.18/conf.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.16/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind-9.16.18/generate-rndc-key.sh
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.16/generate-rndc-key.sh
rename to meta/recipes-connectivity/bind/bind-9.16.18/generate-rndc-key.sh
diff --git a/meta/recipes-connectivity/bind/bind-9.16.16/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.16.18/init.d-add-support-for-read-only-rootfs.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.16/init.d-add-support-for-read-only-rootfs.patch
rename to meta/recipes-connectivity/bind/bind-9.16.18/init.d-add-support-for-read-only-rootfs.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.16/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.16.18/make-etc-initd-bind-stop-work.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.16/make-etc-initd-bind-stop-work.patch
rename to meta/recipes-connectivity/bind/bind-9.16.18/make-etc-initd-bind-stop-work.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.16/named.service b/meta/recipes-connectivity/bind/bind-9.16.18/named.service
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.16/named.service
rename to meta/recipes-connectivity/bind/bind-9.16.18/named.service
diff --git a/meta/recipes-connectivity/bind/bind_9.16.16.bb b/meta/recipes-connectivity/bind/bind_9.16.18.bb
similarity index 96%
rename from meta/recipes-connectivity/bind/bind_9.16.16.bb
rename to meta/recipes-connectivity/bind/bind_9.16.18.bb
index b152598402..e7a1c5d9e9 100644
--- a/meta/recipes-connectivity/bind/bind_9.16.16.bb
+++ b/meta/recipes-connectivity/bind/bind_9.16.18.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "6c913902adf878e7dc5e229cea94faefc9d40f44775a30213edd08860f761d7b"
+SRC_URI[sha256sum] = "3c6263a4364eb5dce233f9f22b90acfa1ec2488d534f91d21663d0ac25ce5e65"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # stay at 9.16 follow the ESV versions divisible by 4
@@ -62,8 +62,6 @@ SYSTEMD_SERVICE_${PN} = "named.service"
 
 do_install_append() {
 
-	rmdir "${D}${localstatedir}/run"
-	rmdir --ignore-fail-on-non-empty "${D}${localstatedir}"
 	install -d -o bind "${D}${localstatedir}/cache/bind"
 	install -d "${D}${sysconfdir}/bind"
 	install -d "${D}${sysconfdir}/init.d"
-- 
2.31.1

