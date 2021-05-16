Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.11565.1621204372249855372
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 May 2021 15:32:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=L4lcWtk5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id d11so4447367wrw.8
        for <openembedded-core@lists.openembedded.org>; Sun, 16 May 2021 15:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=1tS6Ur/99Be8bHJ9/vdst3F7zG3Wm7ajzzEqOpt94C8=;
        b=L4lcWtk5I3LRDz49IcY1LOfSpDwNGCoQqzVObHypoLBzfLiKFpaDQRufY1GHQa960s
         rqHpeaTgoXb8i44vq94bubDtl6dPHoLdL3AmWdc9bzFWGDDWLO84PPvehx9odACvuEvX
         4XON5m9aQZmMaaFliaNSh7OZykXWVmStqZy8M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1tS6Ur/99Be8bHJ9/vdst3F7zG3Wm7ajzzEqOpt94C8=;
        b=W/tEG3CkL0viQ9bKdAquxRc5KnoFDm+DeSHrsWp+491qgH7kFtk6fsugUd5nB5st1B
         2Lp9ga+CCixkI14qc1VxurLNAAWHq/6qaHmH8LrrIY6orzZMZvA4dWdyBmrFPBVCmzRw
         RuLiP+WVlFGW1KqId4NlxwjmhKgtAe0HikBiaC87wPiH3JXWeV+rfkDF0DEXl3/SI7A4
         +Cz2+QhEaXZ9pLckfgz2YlgFClJwt3b2Xl8r7T8jwCg/0muMnOaaYkqAl/VUHOBI0CEy
         yoMDSsnyuSv7YLC+BaOQRwWRrDwdVMG7j6QpjRMvL1M5/Olk29rEgNZgAiXAqHlHwnwm
         /CgA==
X-Gm-Message-State: AOAM531D8Zc3YNhAk230r3lE2T8flPsVqgN1dUxNiMkva/I6Dwr8ssUW
	jNvF3wK8aTDTQJ6U8BPpxE1tNR6IoGw+xQ==
X-Google-Smtp-Source: ABdhPJyMV/jlcR1u8Ig3+4jB87NrWmWCEv2Jf1Nlr4MO20bnto4oe6s5EFNL+nd+t7/UqUh+MqbZNw==
X-Received: by 2002:adf:dfca:: with SMTP id q10mr25951413wrn.343.1621204370733;
        Sun, 16 May 2021 15:32:50 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:1b39:2a3f:a2c2:a4fc])
        by smtp.gmail.com with ESMTPSA id f8sm11621759wmg.43.2021.05.16.15.32.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 15:32:50 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/27] bind: upgrade 9.16.13 -> 9.16.15
Date: Sun, 16 May 2021 23:32:25 +0100
Message-Id: <20210516223247.2401235-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210516223247.2401235-1-richard.purdie@linuxfoundation.org>
References: <20210516223247.2401235-1-richard.purdie@linuxfoundation.org>
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
index 38825f1cf77..25c4f2524a3 100644
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

