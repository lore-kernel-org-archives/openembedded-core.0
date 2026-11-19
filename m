Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.91.1795101872384658745
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 07:24:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=EHeB7fAR;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4b467581b98so28336225e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 07:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795101871; x=1795706671; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6JMvjPHhUnqr67BA13vscWh/NM6pVebQ3PB+WNL0+1Q=;
        b=EHeB7fAR1zjjbYk8TgSo9aymfTdsv2xBGcchJ1jdp3RXSebJuYKVGVAUzNgGJcg6lF
         DB+fNZSWRGWozynctdq5J9Wlzmfq/sohzT9mpIxgYQ3gv/yqhe7HRvCjbxXeyan9QGHH
         2jSZ1UWnXCZ1ENVockGFN393tXQBGCI6ql712aO1kY0sToKDPx9UAYfPNdVjt9VOGbHU
         RwHeb9IE3Nigg4RBAxBKfy0auyjYMSRWvs4/XoJGBfZXAEHY5+slJf1Rwg8UfG35/T57
         GeqAQjwbk7ODPc0nJa+CAChNx+ZTpJo80wmaTDdaBUNa6EIgzFIKjyI4XgdhO6MtSIhl
         N5Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795101871; x=1795706671;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6JMvjPHhUnqr67BA13vscWh/NM6pVebQ3PB+WNL0+1Q=;
        b=pFxSyW1g8UUTqyVBA6s6SljGPxlNEPcxF0Mb0uNUapq4NNXJ3F/gMmWJ0IpfED7kjS
         exUhCW8Y0sXn6GXSnmwXNck7cd3WMA7lvHsggzKYm5Cxklf/U5W4R1+7bg+cqnwPB5oX
         DaS7h22StJNfquHXueCioKRbq9FkDv8yJVKFXGAVoZuYUQ1qSXQB2oLTcCj+N96Cv7p1
         i2ijmBi+9m3VADm1x4O01VHgSfSRWFgPpPcGXDq4Sy+sKl6EIt50H6f1t7mkU9E9tjAD
         ldNCT4l77UgD0Xy4GY/b5f6xlE1IYoT808BLUVTm+UELg4AdhsiHh/8Qaf5X3gh1Vwzs
         EDgg==
X-Gm-Message-State: APuU4Z/RK2x4NhlQj4MosSHWrM6WI1OhhlrepOs0x+WextjCukpl5L3d
	+qTHkbsza7S44mwrTwZ/k/FR/W00TofMQbg9Wh4UVkzFtZRxoB4KiApapqY9rxKlV1sKrK9yncA
	kIgKNnn0=
X-Gm-Gg: AYBFou06/VzP56I7CLVZVnfK+Meh0VQxFGlTlCI4/mTC2oaIsFDYNYDCjyndfYZFDGp
	W7rKRYg0n0yDyZMQ46DOkcWWuW4mRJaKluY1YgTD9kZ8Gmk0P4otgi/adlrK8++uOrXrVuhVCKd
	Oc2qK84UWC/7UrU/Q6yBZYyBIJ4QIHm71TFxjYgiabnkaDmMEy0c8VFxpup+oWpESZV/MIBfPjm
	j1erGzPIs1ZFJJIaW01Mn8FRgNKpmvEve/FlMxJ274pu+G95G4VAgUVrxs3Doz/qK3tiGUXYzKv
	D7nRaNn2AzaKD6uCEndRwe66EaT3yHZkSqOxopA1E8KFdLtBgCoDywojtZXflF5HYtzgPVpOclT
	UlV2YEs/ow7TRUk7mcSx3yN4YUAVjBl62LPVpcxKfOpUHlpIs6awJdLtLkWFsappJbCrCT5zdbP
	err01U5LyErcEE8A8cFAW5Uy2NshiCo9inQgfGFLlyNG8A7zAeNQb6PPFiZTtPkkI/6N7Ljgg9v
	ua8dUST7ETbJgq/+7zgLR4RsYNgvBfSviLs84mp5J4Yj6FJ3QKkAuPNlGWlvkeo3wefgvOqhUqr
	/ljqEJUGIXPmZzhoswZkzng/m2g2skAju1BaH7JOUXX8xaKaAXjMezAivlrSkyPQ0RNfbtGmBHJ
	CHO8vJt4GK8UhRNISBzMGcQjD80ZpEjz1ZoNe+C/b0BxxPV9J9j6opvI=
X-Received: by 2002:a05:600c:354b:b0:4ba:4395:56c9 with SMTP id 5b1f17b1804b1-4bb7da47681mr118843505e9.26.1795101869959;
        Thu, 19 Nov 2026 07:24:29 -0800 (PST)
Return-Path: <fabien.thomas@smile.fr>
Received: from FRSMI25-GIGUE ([2a01:e0a:8cc:5b00:2270:efa7:7aaf:bcdc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865b1sm4222275e9.5.2026.11.19.07.24.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:24:28 -0800 (PST)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 14/19] curl: fix CVE-2026-86409
Date: Thu, 19 Nov 2026 16:22:40 +0100
Message-ID: <39251fe6b94dc6fa18b44b6dd65eaab6391d740b.1795101267.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1795101267.git.fabien.thomas@smile.fr>
References: <cover.1795101267.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 15:24:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250697
Content-Type: text/plain; charset="utf-8"

From: João Marcos Costa (Schneider Electric) <joaomarcos.costa@bootlin.com>

This vulnerability, marked as High [1], was fixed upstream [2] since
v8.22.0.

Backport the fix to curl v8.7.1.

The only changes not included in the backport are the ones related to
test1978, which is not available in v8.7.1.

[1] https://nvd.nist.gov/vuln/detail/cve-2026-86409
[2] https://curl.se/docs/CVE-2026-86409.html

Signed-off-by: João Marcos Costa (Schneider Electric) <joaomarcos.costa@bootlin.com>
[bajau: updated the SRC_URI patch list]
Signed-off-by: Bastien Jauny <bastien.jauny@smile.fr>
---
 .../curl/curl/CVE-2026-86409.patch            | 36 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-86409.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-86409.patch b/meta/recipes-support/curl/curl/CVE-2026-86409.patch
new file mode 100644
index 0000000000..55a4def13b
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-86409.patch
@@ -0,0 +1,36 @@
+From 0d375942119d6a8fe6a4c6874a2f1f05d3312ad0 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
+Date: Thu, 5 Nov 2026 17:55:56 +0100
+Subject: [PATCH] setopt: make NULL CURLOPT_AWS_SIGV4 disable aws-sigv4 auth
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Disable `CURLAUTH_AWS_SIGV4` when `CURLOPT_AWS_SIGV4` is set to NULL.
+Syncing behavior with `CURLAUTH_HTTPSIG`.
+
+Reported-by: Stanislav Fort
+
+Closes #22681
+
+CVE: CVE-2026-86409
+Upstream-Status: Backport [https://github.com/curl/curl/commit/c3c70440e8d9938c0bb732595751e8aebc614f24]
+
+Signed-off-by: João Marcos Costa <joaomarcos.costa@bootlin.com>
+---
+ lib/setopt.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/lib/setopt.c b/lib/setopt.c
+index 8a5a5d7c33..bcf41807e7 100644
+--- a/lib/setopt.c
++++ b/lib/setopt.c
+@@ -693,6 +693,8 @@ CURLcode Curl_vsetopt(struct Curl_easy *data, CURLoption option, va_list param)
+      */
+     if(data->set.str[STRING_AWS_SIGV4])
+       data->set.httpauth = CURLAUTH_AWS_SIGV4;
++    else
++      data->set.httpauth &= ~(uint32_t)CURLAUTH_AWS_SIGV4;
+     break;
+ #endif
+ 
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index ab784b4d73..eade4f8d31 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -45,6 +45,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2026-80230.patch \
            file://CVE-2026-92389.patch \
            file://CVE-2026-18924.patch \
+           file://CVE-2026-86409.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
