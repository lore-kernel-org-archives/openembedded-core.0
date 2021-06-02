Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web08.9889.1622618732700993257
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jun 2021 00:25:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AMQhU6r2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id n17-20020a7bc5d10000b0290169edfadac9so3099722wmk.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Jun 2021 00:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=5/oX/4UTnmcfox90KUDk45YFDxlZ+LQtY6UmzFLcjhY=;
        b=AMQhU6r2QJoiL+z9+7Xl8+55XNeHRJCR1o8DY9mtcFDUEqanAZkCN+L+HuD/JoxZwl
         xt4r8lNHz8uCPdkZxkfmOxsrV/qhVlHRHGHfyvbSd+e0eEfGxY3U2vw6bghY0HrnTQ4e
         mcHEFPEoGNMrgELHmLXkBn/SAxWnlSQDn3fQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5/oX/4UTnmcfox90KUDk45YFDxlZ+LQtY6UmzFLcjhY=;
        b=rLa6PzAAhLkM8AWmNNKAFK1T9GEWJuTxQwlcCN9rr1/PLBm3c7cBjNZhL4gHxbOEFq
         7z3lb7oFZIsPrcmwGk45tpnBDIXPAfFT+nOjDSpXuqdRCX3LfM1pQvpnrqbFDEvP0JB1
         SUxBqovxlUJ9LCxuk8MoROVWAxeKPgWLhv537AZqIWyX9a6DTFcaw8rqzgKHoNKzFkGC
         m7eayn9g+gh7h2bvMMhtiTlERJ6HRU2MJrdJqbYxHuWbJYEgh/s+W53L6IRO8/oVUZ95
         on+1wqUy5rM+uci8zTNSE5pfjUBCw9TepRY77oEUCMzGy0yT6HBWaqJ7/9G7fatbK5N1
         uT/w==
X-Gm-Message-State: AOAM532xabeo5SZnbHy7uZ2wDKEuuPIiHqmiAj5r6ClarBKp6JAlRLRA
	DreP0vrDAF9ZuLCSYaieu7YzYMaZXl4lWQ==
X-Google-Smtp-Source: ABdhPJxej/DRU81hegQBYJc6IJL6+4clUnZxrqk//Yn/khaNYjSD4pxbBj9da4poZCuAq3oo9Du2jQ==
X-Received: by 2002:a1c:4b13:: with SMTP id y19mr3697323wma.102.1622618731065;
        Wed, 02 Jun 2021 00:25:31 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:743:408f:2993:133e])
        by smtp.gmail.com with ESMTPSA id q11sm1052916wmq.1.2021.06.02.00.25.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 00:25:30 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott] [PATCH 3/7] bind: upgrade 9.16.13 -> 9.16.15
Date: Wed,  2 Jun 2021 08:25:25 +0100
Message-Id: <20210602072529.2896899-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210602072529.2896899-1-richard.purdie@linuxfoundation.org>
References: <20210602072529.2896899-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../0001-avoid-start-failure-with-bind-user.patch               | 0
 .../0001-named-lwresd-V-and-start-log-hide-build-options.patch  | 0
 .../bind-ensure-searching-for-json-headers-searches-sysr.patch  | 0
 .../bind/{bind-9.16.13 => bind-9.16.15}/bind9                   | 0
 .../bind/{bind-9.16.13 => bind-9.16.15}/conf.patch              | 0
 .../bind/{bind-9.16.13 => bind-9.16.15}/generate-rndc-key.sh    | 0
 .../init.d-add-support-for-read-only-rootfs.patch               | 0
 .../make-etc-initd-bind-stop-work.patch                         | 0
 .../bind/{bind-9.16.13 => bind-9.16.15}/named.service           | 0
 .../bind/{bind_9.16.13.bb => bind_9.16.15.bb}                   | 2 +-
 10 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind-9.16.13 => bind-9.16.15}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.13 => bind-9.16.15}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.13 => bind-9.16.15}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.13 => bind-9.16.15}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.13 => bind-9.16.15}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.13 => bind-9.16.15}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.13 => bind-9.16.15}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.13 => bind-9.16.15}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.13 => bind-9.16.15}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.16.13.bb => bind_9.16.15.bb} (98%)

diff --git a/meta/recipes-connectivity/bind/bind-9.16.13/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.16.15/0001-avoid-start-failure-with-bind-user.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.13/0001-avoid-start-failure-with-bind-user.patch
rename to meta/recipes-connectivity/bind/bind-9.16.15/0001-avoid-start-failure-with-bind-user.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.13/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind-9.16.15/0001-named-lwresd-V-and-start-log-hide-build-options.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.13/0001-named-lwresd-V-and-start-log-hide-build-options.patch
rename to meta/recipes-connectivity/bind/bind-9.16.15/0001-named-lwresd-V-and-start-log-hide-build-options.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.13/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind-9.16.15/bind-ensure-searching-for-json-headers-searches-sysr.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.13/bind-ensure-searching-for-json-headers-searches-sysr.patch
rename to meta/recipes-connectivity/bind/bind-9.16.15/bind-ensure-searching-for-json-headers-searches-sysr.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.13/bind9 b/meta/recipes-connectivity/bind/bind-9.16.15/bind9
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.13/bind9
rename to meta/recipes-connectivity/bind/bind-9.16.15/bind9
diff --git a/meta/recipes-connectivity/bind/bind-9.16.13/conf.patch b/meta/recipes-connectivity/bind/bind-9.16.15/conf.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.13/conf.patch
rename to meta/recipes-connectivity/bind/bind-9.16.15/conf.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.13/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind-9.16.15/generate-rndc-key.sh
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.13/generate-rndc-key.sh
rename to meta/recipes-connectivity/bind/bind-9.16.15/generate-rndc-key.sh
diff --git a/meta/recipes-connectivity/bind/bind-9.16.13/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.16.15/init.d-add-support-for-read-only-rootfs.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.13/init.d-add-support-for-read-only-rootfs.patch
rename to meta/recipes-connectivity/bind/bind-9.16.15/init.d-add-support-for-read-only-rootfs.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.13/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.16.15/make-etc-initd-bind-stop-work.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.13/make-etc-initd-bind-stop-work.patch
rename to meta/recipes-connectivity/bind/bind-9.16.15/make-etc-initd-bind-stop-work.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.13/named.service b/meta/recipes-connectivity/bind/bind-9.16.15/named.service
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.13/named.service
rename to meta/recipes-connectivity/bind/bind-9.16.15/named.service
diff --git a/meta/recipes-connectivity/bind/bind_9.16.13.bb b/meta/recipes-connectivity/bind/bind_9.16.15.bb
similarity index 98%
rename from meta/recipes-connectivity/bind/bind_9.16.13.bb
rename to meta/recipes-connectivity/bind/bind_9.16.15.bb
index 6127b13e8dc..e362b21294d 100644
--- a/meta/recipes-connectivity/bind/bind_9.16.13.bb
+++ b/meta/recipes-connectivity/bind/bind_9.16.15.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "a54cc793fa5b69b35f610f2095760f8238dff5cfd52419f7ee1c9c227da4cc08"
+SRC_URI[sha256sum] = "98b6f432d878a7bf8f57eb7b3c28be27278cf6b9989154bfe6c81104b38e7839"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # stay at 9.16 follow the ESV versions divisible by 4
-- 
2.30.2

