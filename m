Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2088.1794939642762287659
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 10:20:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=Cqai2tgy;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-491971ac844so60461f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 10:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794939641; x=1795544441; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=i4Avd3qZb61e1+PVUdwRfhgczriYbqnLiJ00cXa6DLA=;
        b=Cqai2tgyZ6qa57MZvNQhlUBLV0kfOfpbEgKCbvXP/6ieDywBV+V+M0K6zLXM9736m+
         KDaoHEmHyhDd3jzm/5cAslhPSOGNsqLWrJBfKSnK8GRApolKDPF/igJku/oxnBNi5gAu
         S2gHKARCp5YAccVkBcTxK0B3J0ESoFsh7IC7fQ8Tzqp8Hgt0ze+Up5bGfqkSgYIrlhtq
         qEf5aUJOSWoKRlb4RvRItkN63oKiK1bZW2r3RGMUkaEGcFZgPuDVApXIt8oYLFFCL8Zi
         OJBCS96NHWF8BkdYmsVDzohzPiNpdBoUIXo7X/hj5hyHutQc2fIYhXltol6hnaGTDhuQ
         2Mbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794939641; x=1795544441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=i4Avd3qZb61e1+PVUdwRfhgczriYbqnLiJ00cXa6DLA=;
        b=lc/jpPsbF1W1K6kA2eZESabEHY3FWYSIiUKK4WacQi/aGMKV34QgmQFTzGVd4t8n/B
         iUGP++84pKqLAwatM6F/6YqaHGrPXkZa6WV9u+F1C8JAdPakLneLoUDy9cUDAFo9kmAQ
         apvLEMSyuf26/sFUIHY6DWeiZG5XTiJl/HTYMWF7akZKJb/a3Nr0a1Q7hXSUpNz0lwhC
         J62hWLYEqk09e5Ie59Ta9DbGl6vbO9zMcycVcnx476RZCLiZwnepvISx8OisUR3UzN0z
         iWcvIsoMBUOl/a3Bt/36pXa41WBWTCxnv9h8sDx4cCRA5VZF/7ZVDTgu8c6BsZKryH4w
         zOAA==
X-Gm-Message-State: APuU4Z9hy1oh0NLNsSzNp6buU0u/ciuBiu0uilJEMaUizLNBWK8xuHAm
	VzLLE5zlKskR2jaFgREo2vxYCaFRLlum2c4RCXTyNuYYqlL3aoH+QfqBnm60FAeozAqqxyuBhvB
	TyqFuzjQ=
X-Gm-Gg: AZFdTZcj9Fzp0/2rM5+rFHTLNCYQYp0q2JH4k35oU+WbyHBsvKPDzujSX0rsXbeS04n
	AhaIxB+LF8foDoE8ymtaNVgHfYVtOfFHgQNeRxseV42xu/e/OsRacILkLVGlWJDcOvtW9p4XLMz
	ngebGOL4FfYUdjYnA/PnMgJepjbZyCYuXwFybOMmdhNGHIYh4pb9vQ92UoPhoqIPiGMlT861ahU
	tFhkYs527e2vFOffU+3mmHZaEj6fZCxPUppjyYaXCTHUNTJg+0fR6qnG4RKiXZzrC/EZKj1oen2
	uI+LOszLgQw6rZjQh96Q2C7MXiNxHZbj3LIOHQh+K2yU6nF0a+VYu2BPczEDBaTyXuUNxJrpHVC
	teBOgq1XKWq8Y+8sgiwJElAt0MkRny3wGKyrPxBt5eQf0xTtE8rTdNi0pVHFI7cywWy+dsiXfvf
	dTQ6pCGqzibM5KOSW2YxGTHoaS2tCT9jQNl5SRibjehKjDSSZNOt/Gtp0VeUiFHLLwc87lg6rek
	bFXnuGBwt6lXTo4TNkINoPWF1zKaa1z6IuNt14yjaifjqV7vWbtgm0aeb54HJfzwoPqpzAglR0d
	EVpFAp0Y8PUaefA6xP8QsMcVgjc78GGOZ32lmOGGnspQ9i/Cjo7VsBbozqPyeYxdfE6pyFtLaYO
	u6sSSYKqAZbQThs6mdnYpFAXBNNgiXaxUtYjGpQZ+Y8r+T455RQ==
X-Received: by 2002:a05:6000:2312:b0:485:8cc8:1f5f with SMTP id ffacd0b85a97d-4a63c6590f3mr590661f8f.42.1794939640923;
        Tue, 17 Nov 2026 10:20:40 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654997681sm114337f8f.15.2026.11.17.10.20.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:20:40 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 12/17] curl: fix CVE-2026-18924
Date: Tue, 17 Nov 2026 19:20:12 +0100
Message-ID: <fb6e9840754777102607034667e3d8a003c02e47.1794939400.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1794939400.git.yoann.congal@smile.fr>
References: <cover.1794939400.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 18:20:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250479
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

Make accepted HTTP/2 push handles inherit their parent's share object.
Use the curl 8.19.0 share setter to retain its locking, reference
counting and shared-cache handling during cleanup.

[1] https://github.com/curl/curl/commit/90325ff0444cbdff368bda5d26d6405a0bb6ee43
[2] https://curl.se/docs/CVE-2026-18924.html

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../curl/curl/CVE-2026-18924.patch            | 57 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-18924.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-18924.patch b/meta/recipes-support/curl/curl/CVE-2026-18924.patch
new file mode 100644
index 00000000000..5d744138fa6
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-18924.patch
@@ -0,0 +1,57 @@
+From 90325ff0444cbdff368bda5d26d6405a0bb6ee43 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Wed, 5 Aug 2026 10:02:53 +0200
+Subject: [PATCH] http2: make server push transfers inherit share from
+ parent
+
+Reported-by: Stephan Zeisberg
+Closes #22488
+
+CVE: CVE-2026-18924
+Upstream-Status: Backport [https://github.com/curl/curl/commit/90325ff0444cbdff368bda5d26d6405a0bb6ee43]
+
+Backport Changes:
+- Use curl_easy_setopt(second, CURLOPT_SHARE, (CURLSH *)data->share)
+  instead of Curl_share_easy_link(), which is absent from curl 8.19.0.
+  The cast satisfies curl's CURLOPT_SHARE type check. The setter
+  locks the share, updates its dirty counter and links shared caches.
+- Retain curl_easy_duphandle() instead of the later curl_easy_init()
+  change in [1], preserving curl 8.19.0's documented push-option
+  inheritance. In 8.19.0, duplication leaves second->share NULL.
+  The share setter increments share->dirty before the push callback.
+  When the pushed transfer joins the multi handle, conncache.c
+  selects data->share->cpool when connection sharing is enabled.
+  Curl_close() drops the use count on rejection or cleanup;
+  curl_share_cleanup() refuses to free a share still in use. The
+  share lifetime fix does not require the later handle-creation
+  change.
+
+[1] https://github.com/curl/curl/commit/fad90b666df98c93ee165341b0c8101c7b10ad7b
+
+(cherry picked from commit 90325ff0444cbdff368bda5d26d6405a0bb6ee43)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ lib/http2.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/lib/http2.c b/lib/http2.c
+index e1c5798..ffeb0f4 100644
+--- a/lib/http2.c
++++ b/lib/http2.c
+@@ -46,6 +46,7 @@
+ #include "bufref.h"
+ #include "curlx/dynbuf.h"
+ #include "headers.h"
++#include "curl_share.h"
+ 
+ #if (NGHTTP2_VERSION_NUM < 0x010c00)
+ #error too old nghttp2 version, upgrade!
+@@ -709,6 +710,8 @@ static struct Curl_easy *h2_duphandle(struct Curl_cfilter *cf,
+     struct h2_stream_ctx *second_stream;
+     http2_data_setup(cf, second, &second_stream);
+     second->state.priority.weight = data->state.priority.weight;
++    if(data->share)
++      (void)curl_easy_setopt(second, CURLOPT_SHARE, (CURLSH *)data->share);
+   }
+   return second;
+ }
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index 7807780c965..734f9c37b69 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -38,6 +38,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2026-80229.patch \
            file://CVE-2026-9546-01.patch \
            file://CVE-2026-9546-02.patch \
+           file://CVE-2026-18924.patch \
            file://CVE-2026-82208.patch \
            file://CVE-2026-80230.patch \
            file://CVE-2026-87864.patch \
