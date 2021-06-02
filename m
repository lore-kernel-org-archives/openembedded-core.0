Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web12.9738.1622618732491820042
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jun 2021 00:25:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OWG5xvSJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id m18so598116wmq.0
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Jun 2021 00:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NAA0Re5HpakgnwBdMBb/3fB2yvY3r/FeBstc2jXcWss=;
        b=OWG5xvSJSyre0vhezZPd3vccKXGF1ALhzX7Xfs5ZaVxoA/1qBBlqCkJvzanfP7rFUJ
         oZWIyGPHRB8nA5cJEaBV0774MuflEOYky8pNp1YH/nCnTxkgIrTd0c5bRptwi+sBTPBP
         4HRUDoM5A57R4s1eVnGVQlSdXTUOu9HAtW2Js=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NAA0Re5HpakgnwBdMBb/3fB2yvY3r/FeBstc2jXcWss=;
        b=arrwkHgHrxYEJ3ESrpkvAwtj1zjQQBgeAxxY34gmGSwrXhdKtYX/Ej9qz5ANK6qPky
         DL9xyOBDYgwPY8yMj5jk2FEQvLmwZrcCiRv0H/YfQIPFnqVKOmj+daubYcZmIXWPcgAa
         QkyZCQMP3ywauRDhmSjjZyBXAuTHNYl6oGAlY6Z6iZ+xcQF31pBl6wUefQnbKhHXLXTf
         XV7plYAul9z9NycjZhwtOH1ru0oU3qeL2cZvUbhvgE7crILgxZlWQYD7CvoolCkA+m02
         nufQWOk0LJYu5lCgQwDA1mNCnoZZXVyKjAgv1UONcrQka9XFXUFNK+A/6ZrdnMTkIp/b
         pAKA==
X-Gm-Message-State: AOAM532XR6OktsA3WRg0x4swFcyM8TFwyMJRC3bqiXkfH57lD6jnEe3S
	UwqT6mt4AOPxhavicJ92eznmpa4Z/d0N8w==
X-Google-Smtp-Source: ABdhPJz3SDxwlmldyZRidu5ANC/qFmeIrzbGW1uqsERxl/AuVxTXMqD1aQ9Dw2PrEuwFkseUxJN2kw==
X-Received: by 2002:a1c:7907:: with SMTP id l7mr14903595wme.147.1622618730750;
        Wed, 02 Jun 2021 00:25:30 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:743:408f:2993:133e])
        by smtp.gmail.com with ESMTPSA id q11sm1052916wmq.1.2021.06.02.00.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 00:25:30 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [hardknott] [PATCH 2/7] bind: upgrade 9.16.12 -> 9.16.13
Date: Wed,  2 Jun 2021 08:25:24 +0100
Message-Id: <20210602072529.2896899-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210602072529.2896899-1-richard.purdie@linuxfoundation.org>
References: <20210602072529.2896899-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
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
index 09f77038fa7..6127b13e8dc 100644
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
2.30.2

