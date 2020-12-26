Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.19482.1608974866411327761
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Dec 2020 01:27:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nqbnfWr5;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id j16so5593964edr.0
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Dec 2020 01:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fZ4MBjeba6eSziUwdUeLHqE3VyJahuki67LvS31gCuw=;
        b=nqbnfWr5TIIDUGd0ChwHprlqgI/J+zSYHDi4SJVyNXx8SDgiIs6/b0WbqagkaaYrju
         sCG0ccwKfLWHg/a/dEhrocEKqkCg45XdTuz3gQDg+2s9xjnUudVBqQQXr0z0FaPWTGur
         qTktH2kuGivKGDxUbX09bc7dlUJt7LAaZ76DE9zfABW+6iCt0rJAVcm1PJwjx2grKrED
         cCwrBDZT2OIo1WlxRAvDkrYO4P+I7/OlI0k9geow4NxWU07VFT42v0tCTwVxzQGHzMY7
         L1HvA0yx8vMwO+fV/GIE+7zSGGVHOhcQ7po6TYxTICZPHnf+Zzu5YAOTcccTpRR1lHx/
         d/Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fZ4MBjeba6eSziUwdUeLHqE3VyJahuki67LvS31gCuw=;
        b=V23m7qTj4flzqzmnxekB3NS6S33SJGmR5wNEod56REkleyFvveY5Q0Rcb0fuIwX+ph
         VRr9ulLDP+5Ms8vunSK476J0uKvKWVvf9X0l9chgIsd5CvcV3GPBnhGQbKDhW5YRgWky
         05l9ZhGsg31/YefCd6j0OXviJwUFluxBEUq79In2Eyqn0I23BaIQSTh8/kf8M2LWHAEm
         xvfu+kKxmdAM2Q+sOTdqbtA+pkRSoXIS/2lksEAIfp8DutusHuOuUqQhWYRlP5NDdHdR
         gmWvCoxnjnIZBj4L6+7koqdbpFk1uu/X70nHvlMe+4z51B9aLrdZ36uhmJuPkwpT1Hba
         oY8g==
X-Gm-Message-State: AOAM532oWD4zuOMIOmE1lKozor7J788J2cUYY8xwbg61SmxIKpKAdeGZ
	E2GtoAHIxFafHBB5kiVTz5XNl+n/7dc=
X-Google-Smtp-Source: ABdhPJzC1toRq/V4YU67Qxff1O4o75uHQuqrCQf+tB7ZWsSWBRRIHF47sbaKEKMfO5B1/x6bZtyHTg==
X-Received: by 2002:a05:6402:c4:: with SMTP id i4mr34509722edu.152.1608974865000;
        Sat, 26 Dec 2020 01:27:45 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost-live.fritz.box ([2a02:2450:1011:4f7:a0c9:fd7f:e532:e1ec])
        by smtp.gmail.com with ESMTPSA id u2sm14828406ejb.65.2020.12.26.01.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Dec 2020 01:27:44 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 03/48] bind: upgrade 9.16.9 -> 9.16.10
Date: Sat, 26 Dec 2020 10:26:47 +0100
Message-Id: <20201226092732.52323-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201226092732.52323-1-alex.kanavin@gmail.com>
References: <20201226092732.52323-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../0001-avoid-start-failure-with-bind-user.patch               | 0
 .../0001-named-lwresd-V-and-start-log-hide-build-options.patch  | 0
 .../bind-ensure-searching-for-json-headers-searches-sysr.patch  | 0
 .../bind/{bind-9.16.9 => bind-9.16.10}/bind9                    | 0
 .../bind/{bind-9.16.9 => bind-9.16.10}/conf.patch               | 0
 .../bind/{bind-9.16.9 => bind-9.16.10}/generate-rndc-key.sh     | 0
 .../init.d-add-support-for-read-only-rootfs.patch               | 0
 .../make-etc-initd-bind-stop-work.patch                         | 0
 .../bind/{bind-9.16.9 => bind-9.16.10}/named.service            | 0
 .../bind/{bind_9.16.9.bb => bind_9.16.10.bb}                    | 2 +-
 10 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind-9.16.9 => bind-9.16.10}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.9 => bind-9.16.10}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.9 => bind-9.16.10}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.9 => bind-9.16.10}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.9 => bind-9.16.10}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.9 => bind-9.16.10}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.9 => bind-9.16.10}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.9 => bind-9.16.10}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.9 => bind-9.16.10}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.16.9.bb => bind_9.16.10.bb} (98%)

diff --git a/meta/recipes-connectivity/bind/bind-9.16.9/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.16.10/0001-avoid-start-failure-with-bind-user.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.9/0001-avoid-start-failure-with-bind-user.patch
rename to meta/recipes-connectivity/bind/bind-9.16.10/0001-avoid-start-failure-with-bind-user.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.9/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind-9.16.10/0001-named-lwresd-V-and-start-log-hide-build-options.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.9/0001-named-lwresd-V-and-start-log-hide-build-options.patch
rename to meta/recipes-connectivity/bind/bind-9.16.10/0001-named-lwresd-V-and-start-log-hide-build-options.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.9/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind-9.16.10/bind-ensure-searching-for-json-headers-searches-sysr.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.9/bind-ensure-searching-for-json-headers-searches-sysr.patch
rename to meta/recipes-connectivity/bind/bind-9.16.10/bind-ensure-searching-for-json-headers-searches-sysr.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.9/bind9 b/meta/recipes-connectivity/bind/bind-9.16.10/bind9
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.9/bind9
rename to meta/recipes-connectivity/bind/bind-9.16.10/bind9
diff --git a/meta/recipes-connectivity/bind/bind-9.16.9/conf.patch b/meta/recipes-connectivity/bind/bind-9.16.10/conf.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.9/conf.patch
rename to meta/recipes-connectivity/bind/bind-9.16.10/conf.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.9/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind-9.16.10/generate-rndc-key.sh
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.9/generate-rndc-key.sh
rename to meta/recipes-connectivity/bind/bind-9.16.10/generate-rndc-key.sh
diff --git a/meta/recipes-connectivity/bind/bind-9.16.9/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.16.10/init.d-add-support-for-read-only-rootfs.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.9/init.d-add-support-for-read-only-rootfs.patch
rename to meta/recipes-connectivity/bind/bind-9.16.10/init.d-add-support-for-read-only-rootfs.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.9/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.16.10/make-etc-initd-bind-stop-work.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.9/make-etc-initd-bind-stop-work.patch
rename to meta/recipes-connectivity/bind/bind-9.16.10/make-etc-initd-bind-stop-work.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.9/named.service b/meta/recipes-connectivity/bind/bind-9.16.10/named.service
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.9/named.service
rename to meta/recipes-connectivity/bind/bind-9.16.10/named.service
diff --git a/meta/recipes-connectivity/bind/bind_9.16.9.bb b/meta/recipes-connectivity/bind/bind_9.16.10.bb
similarity index 98%
rename from meta/recipes-connectivity/bind/bind_9.16.9.bb
rename to meta/recipes-connectivity/bind/bind_9.16.10.bb
index be8a294a43..71194a61bf 100644
--- a/meta/recipes-connectivity/bind/bind_9.16.9.bb
+++ b/meta/recipes-connectivity/bind/bind_9.16.10.bb
@@ -19,7 +19,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "bcb292c4d738a46e3cbcb8afaa25ecf54f77652fa575135da9a2a1d525304a5a"
+SRC_URI[sha256sum] = "bc47fc019c6205e6a6bfb839c544a1472321df0537ba905b846a4cbffe3362b3"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # stay at 9.16 follow the ESV versions divisible by 4
-- 
2.29.2

