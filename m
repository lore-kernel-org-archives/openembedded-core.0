Return-Path: <otavio.salvador@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E46EDC433F5
	for <webhook@archiver.kernel.org>; Mon,  3 Jan 2022 16:19:19 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web09.30337.1641226758696992458
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 08:19:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id t66so20297907qkb.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 08:19:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:organization:content-transfer-encoding;
        bh=MyIKxisIQJnMrmslbN+1htJ+81gtpTE0+6jWUcI/x4E=;
        b=eLmS6HiG1ZvUzoyjfDjyDVCvFvsYWTpzo78HFVtcfG5DTUwtRFbvrVMpZgRydTbhRr
         ZynXQ1q3b9C10xM7Z2Cp4QKFmlqTCtoWBnZalNG7kzXKd+pyrjV/NvpcXvmFmpEVzZ0u
         ab4pWLdGVhENwl2+HA9ptYc5mejgtmTnnPpYn7Fwm5f51qbFZ+6mqBK/x9HvAE7tXOnX
         ZQmwpS8vwAAB8Hwyh8k1DvnGYxUoJRrVUkJXpRklX0xKyy10XQS54Jc5vd0Ap/3V3Ypm
         hQr/DtBf6AjzTn5Aum2g2edRhmSgFCzYvFDUVBnNuRmMFqLBXGU5tK8pNI2Z2WDLMD/v
         0uKA==
X-Gm-Message-State: AOAM531nlpVnK+6AKlg0qiXvTdjvsk5Th2t/XMSPVwD489MmpNypz1YV
	wagtTpWOFq+XJ9ia7/iEdmHt+CrvFN8xdqn/
X-Google-Smtp-Source: 
 ABdhPJy/JEiuFBF8AhsdOsG189xMVcDiCKKS4vvSItbSvyNremZH+DxhK3rQoicXRLznQyF8Qy1a3Q==
X-Received: by 2002:a05:620a:121c:: with SMTP id
 u28mr33084887qkj.12.1641226757481;
        Mon, 03 Jan 2022 08:19:17 -0800 (PST)
Received: from localhost (201-34-65-230.user3p.brasiltelecom.net.br.
 [201.34.65.230])
        by smtp.gmail.com with ESMTPSA id
 f141sm26276436qke.92.2022.01.03.08.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 08:19:17 -0800 (PST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 04/24] bind: upgrade 9.16.23 -> 9.16.24
Date: Mon,  3 Jan 2022 13:18:34 -0300
Message-Id: <20220103161854.301148-4-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220103161854.301148-1-otavio@ossystems.com.br>
References: <20220103161854.301148-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jan 2022 16:19:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160121

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../0001-avoid-start-failure-with-bind-user.patch               | 0
 .../0001-named-lwresd-V-and-start-log-hide-build-options.patch  | 0
 .../bind-ensure-searching-for-json-headers-searches-sysr.patch  | 0
 .../bind/{bind-9.16.23 => bind-9.16.24}/bind9                   | 0
 .../bind/{bind-9.16.23 => bind-9.16.24}/conf.patch              | 0
 .../bind/{bind-9.16.23 => bind-9.16.24}/generate-rndc-key.sh    | 0
 .../init.d-add-support-for-read-only-rootfs.patch               | 0
 .../make-etc-initd-bind-stop-work.patch                         | 0
 .../bind/{bind-9.16.23 => bind-9.16.24}/named.service           | 0
 .../bind/{bind_9.16.23.bb => bind_9.16.24.bb}                   | 2 +-
 10 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind-9.16.23 => bind-9.16.24}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.23 => bind-9.16.24}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.23 => bind-9.16.24}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.23 => bind-9.16.24}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.23 => bind-9.16.24}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.23 => bind-9.16.24}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.23 => bind-9.16.24}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.23 => bind-9.16.24}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.23 => bind-9.16.24}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.16.23.bb => bind_9.16.24.bb} (98%)

diff --git a/meta/recipes-connectivity/bind/bind-9.16.23/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.16.24/0001-avoid-start-failure-with-bind-user.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.23/0001-avoid-start-failure-with-bind-user.patch
rename to meta/recipes-connectivity/bind/bind-9.16.24/0001-avoid-start-failure-with-bind-user.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.23/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind-9.16.24/0001-named-lwresd-V-and-start-log-hide-build-options.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.23/0001-named-lwresd-V-and-start-log-hide-build-options.patch
rename to meta/recipes-connectivity/bind/bind-9.16.24/0001-named-lwresd-V-and-start-log-hide-build-options.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.23/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind-9.16.24/bind-ensure-searching-for-json-headers-searches-sysr.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.23/bind-ensure-searching-for-json-headers-searches-sysr.patch
rename to meta/recipes-connectivity/bind/bind-9.16.24/bind-ensure-searching-for-json-headers-searches-sysr.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.23/bind9 b/meta/recipes-connectivity/bind/bind-9.16.24/bind9
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.23/bind9
rename to meta/recipes-connectivity/bind/bind-9.16.24/bind9
diff --git a/meta/recipes-connectivity/bind/bind-9.16.23/conf.patch b/meta/recipes-connectivity/bind/bind-9.16.24/conf.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.23/conf.patch
rename to meta/recipes-connectivity/bind/bind-9.16.24/conf.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.23/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind-9.16.24/generate-rndc-key.sh
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.23/generate-rndc-key.sh
rename to meta/recipes-connectivity/bind/bind-9.16.24/generate-rndc-key.sh
diff --git a/meta/recipes-connectivity/bind/bind-9.16.23/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.16.24/init.d-add-support-for-read-only-rootfs.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.23/init.d-add-support-for-read-only-rootfs.patch
rename to meta/recipes-connectivity/bind/bind-9.16.24/init.d-add-support-for-read-only-rootfs.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.23/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.16.24/make-etc-initd-bind-stop-work.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.23/make-etc-initd-bind-stop-work.patch
rename to meta/recipes-connectivity/bind/bind-9.16.24/make-etc-initd-bind-stop-work.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.23/named.service b/meta/recipes-connectivity/bind/bind-9.16.24/named.service
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.23/named.service
rename to meta/recipes-connectivity/bind/bind-9.16.24/named.service
diff --git a/meta/recipes-connectivity/bind/bind_9.16.23.bb b/meta/recipes-connectivity/bind/bind_9.16.24.bb
similarity index 98%
rename from meta/recipes-connectivity/bind/bind_9.16.23.bb
rename to meta/recipes-connectivity/bind/bind_9.16.24.bb
index c1bf250c26..c9e6f79dba 100644
--- a/meta/recipes-connectivity/bind/bind_9.16.23.bb
+++ b/meta/recipes-connectivity/bind/bind_9.16.24.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "dedb5e27aa9cb6a9ce3e872845887ff837b99e4e9a91a5e2fcd67cf6e1ef173c"
+SRC_URI[sha256sum] = "5582f3734bd6232284f93f14206b8a46d1f819dea4797ae157066f6963b08507"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # stay at 9.16 follow the ESV versions divisible by 4
-- 
2.34.0


