Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.20360.1607112471136932240
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Dec 2020 12:07:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FqczCci+;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id ck29so7098610edb.8
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Dec 2020 12:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nd0pgIB8vP3aN03EQf5QXCnX1BSSS9o4IvYTYJEH8lw=;
        b=FqczCci+NH2EWZBxE7RF5H4SumwpCpGUL/9SaBz6LbGQQwDDoamSp13ccmtijzuqxX
         G2x1qr6Gz69Th35TmW7CYZjbjQ9IPE40xaLGU0VR4F0cbgUEV7YfcPdzO1MLqW5LPj50
         hl/kkEDSQ2cW71NrFRYztcMo8oe7XDJ4tdosKIYjWcih1IFcsiJwQsMdEuiOWsVjxuNv
         ukSKJSJYdrJyTjD5+6GNf3AmrsgVAZmJXU3O5VXU/zOZ/fIpnZE6niUUExLiKFNHeXj9
         +VRUSjgnBph2KMCzQJV5me5eEcs7tRNN+oeZF3HVUf/o1LY+cIiulR1UoOixeic1OmNM
         Ib5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nd0pgIB8vP3aN03EQf5QXCnX1BSSS9o4IvYTYJEH8lw=;
        b=fVlKo1DYlh+N/hItvJI2pVd5fLLUeXuKuMJKzJHiog0lAkiYWVgb0x+vbJFblYRiiE
         6YgzjwzcdmYDC2+sgf3fwfqfFyq93+ZNsFybtKD0gVGizk7un+RkzXyA0IOXtJvCi47v
         1xUplhMlLiiJyCjGdjKe7v4USFed9yvULOSo3dV7XBwkNgJf+273nvuthSv1E4Gnw5s6
         Wiv64+0dYgSW2DNayqieo6Z6ZETKd7RGRLDn4YRLtQuUc+G9ymqHJVAPX8rMQpJeiG8X
         F3G/laHthFggKmv3u6MZE9LJhWob3jZFgBiWn7o0eBQNKclLy/ETTSvcUHvX9qA/SlZM
         Wvrw==
X-Gm-Message-State: AOAM530vdu5FBxrHTQeQiNFK0etNGBzkMbPbpqDzDWoLiArprDVL4gpX
	xrLyUTZ91ooROEJivfQDFHOUhjj7FP7J0Q==
X-Google-Smtp-Source: ABdhPJwdJtgAeEj4KltlbQhqiYz8OoCQkQitKZIa3tVvk6y85x9QUm54R/dtkrKsiQu9/pjnZQPSMw==
X-Received: by 2002:a50:cfcf:: with SMTP id i15mr9426419edk.351.1607112469452;
        Fri, 04 Dec 2020 12:07:49 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id d6sm3601660ejy.114.2020.12.04.12.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 12:07:48 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 05/23] bind: upgrade 9.16.7 -> 9.16.9
Date: Fri,  4 Dec 2020 21:07:18 +0100
Message-Id: <20201204200737.7072-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201204200737.7072-1-alex.kanavin@gmail.com>
References: <20201204200737.7072-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: http -> https

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../0001-avoid-start-failure-with-bind-user.patch             | 0
 ...0001-named-lwresd-V-and-start-log-hide-build-options.patch | 0
 ...bind-ensure-searching-for-json-headers-searches-sysr.patch | 0
 .../bind/{bind-9.16.7 => bind-9.16.9}/bind9                   | 0
 .../bind/{bind-9.16.7 => bind-9.16.9}/conf.patch              | 0
 .../bind/{bind-9.16.7 => bind-9.16.9}/generate-rndc-key.sh    | 0
 .../init.d-add-support-for-read-only-rootfs.patch             | 0
 .../make-etc-initd-bind-stop-work.patch                       | 0
 .../bind/{bind-9.16.7 => bind-9.16.9}/named.service           | 0
 .../bind/{bind_9.16.7.bb => bind_9.16.9.bb}                   | 4 ++--
 10 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/bind/{bind-9.16.7 => bind-9.16.9}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.7 => bind-9.16.9}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.7 => bind-9.16.9}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.7 => bind-9.16.9}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.7 => bind-9.16.9}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.7 => bind-9.16.9}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.7 => bind-9.16.9}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.7 => bind-9.16.9}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.7 => bind-9.16.9}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.16.7.bb => bind_9.16.9.bb} (96%)

diff --git a/meta/recipes-connectivity/bind/bind-9.16.7/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.16.9/0001-avoid-start-failure-with-bind-user.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.7/0001-avoid-start-failure-with-bind-user.patch
rename to meta/recipes-connectivity/bind/bind-9.16.9/0001-avoid-start-failure-with-bind-user.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.7/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind-9.16.9/0001-named-lwresd-V-and-start-log-hide-build-options.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.7/0001-named-lwresd-V-and-start-log-hide-build-options.patch
rename to meta/recipes-connectivity/bind/bind-9.16.9/0001-named-lwresd-V-and-start-log-hide-build-options.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.7/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind-9.16.9/bind-ensure-searching-for-json-headers-searches-sysr.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.7/bind-ensure-searching-for-json-headers-searches-sysr.patch
rename to meta/recipes-connectivity/bind/bind-9.16.9/bind-ensure-searching-for-json-headers-searches-sysr.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.7/bind9 b/meta/recipes-connectivity/bind/bind-9.16.9/bind9
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.7/bind9
rename to meta/recipes-connectivity/bind/bind-9.16.9/bind9
diff --git a/meta/recipes-connectivity/bind/bind-9.16.7/conf.patch b/meta/recipes-connectivity/bind/bind-9.16.9/conf.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.7/conf.patch
rename to meta/recipes-connectivity/bind/bind-9.16.9/conf.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.7/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind-9.16.9/generate-rndc-key.sh
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.7/generate-rndc-key.sh
rename to meta/recipes-connectivity/bind/bind-9.16.9/generate-rndc-key.sh
diff --git a/meta/recipes-connectivity/bind/bind-9.16.7/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.16.9/init.d-add-support-for-read-only-rootfs.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.7/init.d-add-support-for-read-only-rootfs.patch
rename to meta/recipes-connectivity/bind/bind-9.16.9/init.d-add-support-for-read-only-rootfs.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.7/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.16.9/make-etc-initd-bind-stop-work.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.7/make-etc-initd-bind-stop-work.patch
rename to meta/recipes-connectivity/bind/bind-9.16.9/make-etc-initd-bind-stop-work.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.7/named.service b/meta/recipes-connectivity/bind/bind-9.16.9/named.service
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.7/named.service
rename to meta/recipes-connectivity/bind/bind-9.16.9/named.service
diff --git a/meta/recipes-connectivity/bind/bind_9.16.7.bb b/meta/recipes-connectivity/bind/bind_9.16.9.bb
similarity index 96%
rename from meta/recipes-connectivity/bind/bind_9.16.7.bb
rename to meta/recipes-connectivity/bind/bind_9.16.9.bb
index fbe3de63cb..be8a294a43 100644
--- a/meta/recipes-connectivity/bind/bind_9.16.7.bb
+++ b/meta/recipes-connectivity/bind/bind_9.16.9.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://www.isc.org/bind/"
 SECTION = "console/network"
 
 LICENSE = "MPL-2.0"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=188b8d0644bd6835df43b84e3f180be1"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=4673dc07337cace3b93c65e9ffe57b60"
 
 DEPENDS = "openssl libcap zlib libuv"
 
@@ -19,7 +19,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "9f7d1812ebbd26a699f62b6fa8522d5dec57e4bf43af0042a0d60d39ed8314d1"
+SRC_URI[sha256sum] = "bcb292c4d738a46e3cbcb8afaa25ecf54f77652fa575135da9a2a1d525304a5a"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # stay at 9.16 follow the ESV versions divisible by 4
-- 
2.29.2

