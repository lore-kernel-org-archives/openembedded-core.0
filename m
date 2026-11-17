Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2094.1794939641026691528
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 10:20:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=Epp4iF2u;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4b467581b98so2289215e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 10:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794939639; x=1795544439; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aZUV7MtmKPrIcD6qMg5AcMWz5+TrxSeUf5O2Z1XjwHo=;
        b=Epp4iF2uZBmLnxIea3K+wKZ0Dfpkym2Yct0avGk8dj1Sq+Of+6U6FxYty3qIN8jcJC
         9MrbdpC8Pb8USs9CvwCjHXes8HfNjgVCftbsGvtN7RYYr3I9Y/DKoLYpe6DqAItHGjph
         VwbAaBTxXkAa/Qtq6WGO4OW9Up9VBcXgkBFt3mAF5FyZhRew19ksq0UsqNrL3KH2hkTD
         Xe0JS7zkalEuhnHkFYudHGUv+Ja4nAzkfIUqDXIE+xXccNO4ASmCvAPUb3/K6GtG324x
         uDb2zHa7aPjKsJngjlxMJplam9nmjYFm0xpYzMdch3vjRBXvzIw6VsYOeCiwoE7q8cNQ
         ONQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794939639; x=1795544439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=aZUV7MtmKPrIcD6qMg5AcMWz5+TrxSeUf5O2Z1XjwHo=;
        b=caTL6sjGAZyKwm0QcoXC9gUChj5Ps/XlG2YYAkSwJ4UDKd7el1Ku+zs+r09ppZK4LV
         seHwpr8ubCVtYjnV1D7jJViRY9sMoeZj7exfSv84YuRiqpdlqkm4jvA7u4BynQ0nBSPm
         obZZhQzQ0uIZUapRiO+RjCZgwz/VBDSHgiX3Rc6WUK4Ut3MZrRZqddxGKGKcDq9wKpmS
         FG1QfSUQlbySIjEuyK2YSWe14tUEqTbmf2xNVQ+IOLTVho1fZ2w8riycrr9+dkPuUApp
         quZj7HT4eRyJ16o5SJPfha6DGN+vV7JyksNC8echmzD0opAVmwCujDxaL/zRI8qyvXN0
         QxsA==
X-Gm-Message-State: APuU4Z+lArSm+uCPkJJt8U3Xw5kXzijBeBmQdXnuZ6MerRKtiOBtbb86
	fI7tgtGZH7MEwWWsNGVAQ0iym2Mq8fB4/x1XaCOBi6Gu+RaooTIZ4Pf+ljsERUDOpokXfMFrSm/
	ypT3pO7U=
X-Gm-Gg: AYBFou2lzixDSXllqytNyumHEorqIpfxKYNFU3hWwIGGIxIlaSxE9UzqZyh55Er1jfv
	bDY88Szc34N5WMCmDxlGidHWUpVehWkT4hTDgUXxRV28JipfTuj1xZOKHISX7vMDscqnGxZ0tAz
	v/AKF3gKPeuReFn02N0jwEhp0YwjdUQPeI2rtrPfTWb+VgLTv8sdL6UJ/4dwyaNRJSHW873P2bS
	KYlgmnwP0ocXL47A5bKjKG/VpysSy7QW+q0K9rt5QbFjAO1bcCG42N4s45e0vKh8lhAF+vyV+Z1
	snBNeBPlW2KQoxJz2KkWJaQ8LXJZd0C+Tdxmq/fEIfLS0zCyNMHpWLUHQf14+2l5wfCJrF3o/6e
	N6rbaQx75TXzB5KDKSX6EH+B0waD5PGyuGU6cK2a9ojCMaY2mwrSDJIxIDwOlDOQFBoZUQihZbT
	ZIAc6cNkjQpyjx3bgYmjVS3AqDdgdD2fhf1HX74DmsLxhuPQtJtZVp5AwJ/mx+Qe99YmJC4ktPn
	CMfpoZAt9E27otvaWUv1bLJyedS68i/5SEecquNZG52/WQR/I2UvgwMsNtJoWGcOj4b4YE/qCF9
	JZIEGNgVz3y10i8S41aUrext9PWoX9p5gIer4EUB0HwSOqd9gtKLe8VKaane48dTXnYGKkiRzSe
	g+fRxP7RGqFCKQCOnoq54qExbRHD3
X-Received: by 2002:a05:600c:1912:b0:4bb:6375:aa41 with SMTP id 5b1f17b1804b1-4bb6375ab25mr237132155e9.27.1794939639247;
        Tue, 17 Nov 2026 10:20:39 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654997681sm114337f8f.15.2026.11.17.10.20.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:20:38 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 10/17] curl: fix CVE-2026-86409
Date: Tue, 17 Nov 2026 19:20:10 +0100
Message-ID: <3d7ab114e8a0fb0a3fe8a7502c6e2da032bd132f.1794939400.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1794939400.git.yoann.congal@smile.fr>
References: <cover.1794939400.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 18:20:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250477
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

Clear CURLAUTH_AWS_SIGV4 when CURLOPT_AWS_SIGV4 is reset to NULL.
Retain the upstream handle-reuse regression in test1978, using the
existing test_setopt() helper.

[1] https://github.com/curl/curl/commit/c3c70440e8d9938c0bb732595751e8aebc614f24
[2] https://curl.se/docs/CVE-2026-86409.html

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../curl/curl/CVE-2026-86409.patch            | 88 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |  1 +
 2 files changed, 89 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-86409.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-86409.patch b/meta/recipes-support/curl/curl/CVE-2026-86409.patch
new file mode 100644
index 00000000000..bdfee79dc6a
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-86409.patch
@@ -0,0 +1,88 @@
+From 534252a345be58d6d1a79eee697244f27524b7d2 Mon Sep 17 00:00:00 2001
+From: Viktor Szakats <commit@vsz.me>
+Date: Wed, 26 Aug 2026 09:41:03 +0200
+Subject: [PATCH] setopt: make NULL `CURLOPT_AWS_SIGV4` disable aws-sigv4 auth
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
+Backport Changes:
+- Use test_setopt() in lib1978.c instead of easy_setopt(), matching
+  the curl 8.19.0 test harness.
+
+(cherry picked from commit c3c70440e8d9938c0bb732595751e8aebc614f24)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ lib/setopt.c            |  2 ++
+ tests/data/test1978     | 19 +++++++++++++++++++
+ tests/libtest/lib1978.c |  5 +++++
+ 3 files changed, 26 insertions(+)
+
+diff --git a/lib/setopt.c b/lib/setopt.c
+index 3603912..ae77ae8 100644
+--- a/lib/setopt.c
++++ b/lib/setopt.c
+@@ -1992,6 +1992,8 @@ static CURLcode setopt_cptr(struct Curl_easy *data, CURLoption option,
+      */
+     if(s->str[STRING_AWS_SIGV4])
+       s->httpauth = CURLAUTH_AWS_SIGV4;
++    else
++      s->httpauth &= ~(uint32_t)CURLAUTH_AWS_SIGV4;
+     break;
+ #endif
+   case CURLOPT_REFERER:
+diff --git a/tests/data/test1978 b/tests/data/test1978
+index 3ad4c67..8b6e6af 100644
+--- a/tests/data/test1978
++++ b/tests/data/test1978
+@@ -69,6 +69,25 @@ header-no-value:
+ header-some-no-value:
+ header-some-no-value: value
+ 
++PUT /%TESTNUMBER/testapi/test HTTP/1.1
++Host: 127.0.0.1:9000
++x-amz-meta-test: test2
++some-other-header: value
++x-amz-meta-test: test1
++duplicate-header: duplicate
++x-amz-meta-test: test3
++X-amz-meta-test2: test2
++x-amz-meta-blah: blah
++x-Amz-meta-test2: test1
++x-amz-Meta-test2: test3
++curr-header-no-colon: value
++next-header-no-colon: value
++duplicate-header: duplicate
++header-no-value:
++header-no-value:
++header-some-no-value:
++header-some-no-value: value
++
+ </protocol>
+ </verify>
+ </testcase>
+diff --git a/tests/libtest/lib1978.c b/tests/libtest/lib1978.c
+index 4f3ef11..d3f5c7d 100644
+--- a/tests/libtest/lib1978.c
++++ b/tests/libtest/lib1978.c
+@@ -91,6 +91,11 @@ static CURLcode test_lib1978(const char *URL)
+   test_setopt(curl, CURLOPT_CONNECT_TO, connect_to);
+ 
+   result = curl_easy_perform(curl);
++  if(result)
++    goto test_cleanup;
++
++  test_setopt(curl, CURLOPT_AWS_SIGV4, NULL);
++  result = curl_easy_perform(curl);
+ 
+ test_cleanup:
+ 
+-- 
+2.35.6
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index 8f1caebb973..80352a592a5 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -44,6 +44,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2026-92388-1.patch \
            file://CVE-2026-92388-2.patch \
            file://CVE-2026-92389.patch \
+           file://CVE-2026-86409.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
