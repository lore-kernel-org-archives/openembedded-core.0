Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web09.13805.1629891509862872630
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Aug 2021 04:38:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=M1e7ifzq;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id q11so8989818wrr.9
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Aug 2021 04:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uj9bLTn5em4rQfDraA2GmfLjKe3I9lrcCUrgpdAvOHk=;
        b=M1e7ifzqr3mUMbrsUsvex8VP1vvRw4ydfNLt7haKK/3x5QzpFZkMH1T0vduO5xWvQG
         gCJfVEoSsqAQlEE++fY1M7dKA8Z/lKpjoAH47u3ZmOy75djOXi4YpbFkFFzAxtJdneXE
         LIl1mX9GaRbnxCUnx2CyyQOwrH4Jlrik+hhr67xFR2dpwS4CR80+cInstGlKUIA5e6gg
         I21xzHiNLFBROpSiKCeCiQlsbvhLwZyyX7n8hiQ57UXlPPKd4r7iVOzwBOXB8LuOfdEd
         4XBWQdJA+iGE9ZQRQL8Kx1YnNAbkFaOQItjc6Pnra/4JAcXZ44GATveWcmItrFY2OWLV
         AzZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uj9bLTn5em4rQfDraA2GmfLjKe3I9lrcCUrgpdAvOHk=;
        b=N3rFsEXdn5bS212vot3bdjExv+2WcTkAaGlnwDvnTpb4W7ehasuTman3uAgfs5dM9x
         t9+2GAcy1n1cx8S3M8pazzaEw30t1JJELftTw3gbnpibr5iJCqiyU8Cq3b+LP5CviW0o
         UYaampzfPq7CZAed4ge8xEUUCzm1PnU/LuyC00+4ctxQPxj9i6z0URFLjgOwT0rjtykn
         HzTljHAsOoDjAjf/MsrUhwa6dnvjYdjTHpg+SaIloSlZ3y1YvNpMkRKxMTdlDkCdikjz
         5d1DWmGoBXiCglIGjt09c2Kj7pqKcLk/S3hr4YIKhKuHuvhXwJmlOEFKi87UT9sEIYyZ
         VOZA==
X-Gm-Message-State: AOAM5305MVVG36IVzgLTMojrtkovGHhFu5tRQkOrlf5Y4ZFWCZT5aw2U
	ZRcxfgk5NIhIhMAjVBX3Qbh/uGxUodCs9g==
X-Google-Smtp-Source: ABdhPJxH1twvCvZiu/wlRPWyxB2FD/KptrxjmTGCDrNJdmXNCt7PSzZpUa/9eEzdWk1C8nj9dDkmmA==
X-Received: by 2002:a05:6000:1627:: with SMTP id v7mr2477440wrb.54.1629891508508;
        Wed, 25 Aug 2021 04:38:28 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a1:9900:5e06:8d90:670b:86c8])
        by smtp.gmail.com with ESMTPSA id z17sm20790217wrr.66.2021.08.25.04.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 04:38:28 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 07/16] bind: upgrade 9.16.19 -> 9.16.20
Date: Wed, 25 Aug 2021 13:37:55 +0200
Message-Id: <20210825113804.779395-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210825113804.779395-1-alex.kanavin@gmail.com>
References: <20210825113804.779395-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../0001-avoid-start-failure-with-bind-user.patch               | 0
 .../0001-named-lwresd-V-and-start-log-hide-build-options.patch  | 0
 .../bind-ensure-searching-for-json-headers-searches-sysr.patch  | 0
 .../bind/{bind-9.16.19 => bind-9.16.20}/bind9                   | 0
 .../bind/{bind-9.16.19 => bind-9.16.20}/conf.patch              | 0
 .../bind/{bind-9.16.19 => bind-9.16.20}/generate-rndc-key.sh    | 0
 .../init.d-add-support-for-read-only-rootfs.patch               | 0
 .../make-etc-initd-bind-stop-work.patch                         | 0
 .../bind/{bind-9.16.19 => bind-9.16.20}/named.service           | 0
 .../bind/{bind_9.16.19.bb => bind_9.16.20.bb}                   | 2 +-
 10 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind-9.16.19 => bind-9.16.20}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.19 => bind-9.16.20}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.19 => bind-9.16.20}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.19 => bind-9.16.20}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.19 => bind-9.16.20}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.19 => bind-9.16.20}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.19 => bind-9.16.20}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.19 => bind-9.16.20}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.19 => bind-9.16.20}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.16.19.bb => bind_9.16.20.bb} (98%)

diff --git a/meta/recipes-connectivity/bind/bind-9.16.19/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.16.20/0001-avoid-start-failure-with-bind-user.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.19/0001-avoid-start-failure-with-bind-user.patch
rename to meta/recipes-connectivity/bind/bind-9.16.20/0001-avoid-start-failure-with-bind-user.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.19/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind-9.16.20/0001-named-lwresd-V-and-start-log-hide-build-options.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.19/0001-named-lwresd-V-and-start-log-hide-build-options.patch
rename to meta/recipes-connectivity/bind/bind-9.16.20/0001-named-lwresd-V-and-start-log-hide-build-options.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.19/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind-9.16.20/bind-ensure-searching-for-json-headers-searches-sysr.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.19/bind-ensure-searching-for-json-headers-searches-sysr.patch
rename to meta/recipes-connectivity/bind/bind-9.16.20/bind-ensure-searching-for-json-headers-searches-sysr.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.19/bind9 b/meta/recipes-connectivity/bind/bind-9.16.20/bind9
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.19/bind9
rename to meta/recipes-connectivity/bind/bind-9.16.20/bind9
diff --git a/meta/recipes-connectivity/bind/bind-9.16.19/conf.patch b/meta/recipes-connectivity/bind/bind-9.16.20/conf.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.19/conf.patch
rename to meta/recipes-connectivity/bind/bind-9.16.20/conf.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.19/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind-9.16.20/generate-rndc-key.sh
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.19/generate-rndc-key.sh
rename to meta/recipes-connectivity/bind/bind-9.16.20/generate-rndc-key.sh
diff --git a/meta/recipes-connectivity/bind/bind-9.16.19/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.16.20/init.d-add-support-for-read-only-rootfs.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.19/init.d-add-support-for-read-only-rootfs.patch
rename to meta/recipes-connectivity/bind/bind-9.16.20/init.d-add-support-for-read-only-rootfs.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.19/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.16.20/make-etc-initd-bind-stop-work.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.19/make-etc-initd-bind-stop-work.patch
rename to meta/recipes-connectivity/bind/bind-9.16.20/make-etc-initd-bind-stop-work.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.19/named.service b/meta/recipes-connectivity/bind/bind-9.16.20/named.service
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.19/named.service
rename to meta/recipes-connectivity/bind/bind-9.16.20/named.service
diff --git a/meta/recipes-connectivity/bind/bind_9.16.19.bb b/meta/recipes-connectivity/bind/bind_9.16.20.bb
similarity index 98%
rename from meta/recipes-connectivity/bind/bind_9.16.19.bb
rename to meta/recipes-connectivity/bind/bind_9.16.20.bb
index 9fd251b839..f7d0416858 100644
--- a/meta/recipes-connectivity/bind/bind_9.16.19.bb
+++ b/meta/recipes-connectivity/bind/bind_9.16.20.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "20bf727559302c933475904847041916bb6c279680c170babc01a76998e80ad3"
+SRC_URI[sha256sum] = "4d0d93c0d0b63080609e84625f24ff8777f8d164e78a75b1c19c334ce42d5b58"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # stay at 9.16 follow the ESV versions divisible by 4
-- 
2.31.1

