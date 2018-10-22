Return-Path: <akuster808@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 342747453F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 14:05:27 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id q7-v6so17272428wrr.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 07:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=MZmh4lOQiIfEWT9KhJtD+j6t5oXxsby4+YjPYJsNWEE=;
	b=NS5KoBD3UhweWsPQyqQJDdCDEvG0S+llF/OfRR+ZHqOxLj1OENY6bVoNz99viCB4Bq
	pTMMPb9pqb/4lq+YIGMsplmyIqDo8+jSUsnURNVnbWa7trltutLXHqevrgM1zwqpvd8L
	RhTr+EkJ3mLkGzUfdGhFKlGAAyWg/1TElOvCSAvlrvHCIuGFe8mjAGIhWnrTX+eB0adD
	i9YIuIvJc/xKB4tudVfb2o+MsrhuvmVBK4fGoROR4IlGhLMjhmCl8KicusgKok23Ylwu
	2A6SslWg+cAKzkEezpeW+dnHb8FAMT9J+lxSmblxQTaXVh8W6huhYSyuSaE+eUu+QAmm
	LU3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=MZmh4lOQiIfEWT9KhJtD+j6t5oXxsby4+YjPYJsNWEE=;
	b=X73jiGSmOALtYa4TZLkcw0GO8cEvPEWi9RlZFuFeV4qXSsThpOnGXI84YuqLSfUpxx
	Kzz1k7VqVXbUDWd5FV1JUeOauVZYs52s80f1eSXfgIBaUfxPxtQmsVjVekrX3Y7LXcfq
	kJ0I7yklUVq0AolZuIJhRT0097d0YDVqAaKw3J3biU47nAbLKg3odOjPKgIbvvYUJ7rA
	Yv63ACEdACBkuxn9cc1QEAdS62yVB5ulVJS5jbxUy29TVz4sefYpBsWCaqV6cPhXMlHP
	Q233dKXMtLLXLxXU7WNxFlp8nlw7IyrcQQ6FOyIj/sBHl/GwKdU2F9QG9+x7q+2yEqmG
	uMig==
X-Gm-Message-State: ABuFfoifXC2Il7rkRQcBhmY/P1qzbQde0GEs1uvGs05RxiL7O7r3suH1
	QK3K0fwuDv7+ymVz/GPICHBYN91HedU=
X-Google-Smtp-Source: ACcGV60m8YaWjUbD366FaDXuw+SqXtpz4cbpxcpTnmsqDwXnlz7yQ+suQQVoX7uOL6AiZRDP6vLnEA==
X-Received: by 2002:adf:9102:: with SMTP id j2-v6mr46872874wrj.3.1540217127803;
	Mon, 22 Oct 2018 07:05:27 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.event.pylonone.net ([185.7.230.214])
	by smtp.gmail.com with ESMTPSA id
	o130-v6sm9209989wmd.11.2018.10.22.07.05.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Oct 2018 07:05:27 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Mon, 22 Oct 2018 15:05:04 +0100
Message-Id: <1540217112-24479-6-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1540217112-24479-1-git-send-email-akuster808@gmail.com>
References: <1540217112-24479-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 05/13] curl: update to 7.61.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Oct 2018 14:05:27 -0000

drop patch for CVE-2018-14618 now included
Notable: INTERNALS: require GnuTLS >= 2.11.3

See: https://curl.haxx.se/changes.html#7_61_0

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-support/curl/curl/CVE-2018-14618.patch | 37 ----------------------
 .../curl/{curl_7.61.0.bb => curl_7.61.1.bb}        |  5 ++-
 2 files changed, 2 insertions(+), 40 deletions(-)
 delete mode 100644 meta/recipes-support/curl/curl/CVE-2018-14618.patch
 rename meta/recipes-support/curl/{curl_7.61.0.bb => curl_7.61.1.bb} (94%)

diff --git a/meta/recipes-support/curl/curl/CVE-2018-14618.patch b/meta/recipes-support/curl/curl/CVE-2018-14618.patch
deleted file mode 100644
index db07b43..0000000
--- a/meta/recipes-support/curl/curl/CVE-2018-14618.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 57d299a499155d4b327e341c6024e293b0418243 Mon Sep 17 00:00:00 2001
-From: Daniel Stenberg <daniel@haxx.se>
-Date: Mon, 13 Aug 2018 10:35:52 +0200
-Subject: [PATCH] Curl_ntlm_core_mk_nt_hash: return error on too long password
-
-... since it would cause an integer overflow if longer than (max size_t
-/ 2).
-
-This is CVE-2018-14618
-
-Bug: https://curl.haxx.se/docs/CVE-2018-14618.html
-Closes #2756
-Reported-by: Zhaoyang Wu
-
-CVE: CVE-2018-14618
-Upstream-Status: Backport
-Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
----
- lib/curl_ntlm_core.c | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/lib/curl_ntlm_core.c b/lib/curl_ntlm_core.c
-index e27cab353c..922e85a926 100644
---- a/lib/curl_ntlm_core.c
-+++ b/lib/curl_ntlm_core.c
-@@ -557,8 +557,11 @@ CURLcode Curl_ntlm_core_mk_nt_hash(struct Curl_easy *data,
-                                    unsigned char *ntbuffer /* 21 bytes */)
- {
-   size_t len = strlen(password);
--  unsigned char *pw = len ? malloc(len * 2) : strdup("");
-+  unsigned char *pw;
-   CURLcode result;
-+  if(len > SIZE_T_MAX/2) /* avoid integer overflow */
-+    return CURLE_OUT_OF_MEMORY;
-+  pw = len ? malloc(len * 2) : strdup("");
-   if(!pw)
-     return CURLE_OUT_OF_MEMORY;
diff --git a/meta/recipes-support/curl/curl_7.61.0.bb b/meta/recipes-support/curl/curl_7.61.1.bb
similarity index 94%
rename from meta/recipes-support/curl/curl_7.61.0.bb
rename to meta/recipes-support/curl/curl_7.61.1.bb
index 9b6406b..7a51bfa 100644
--- a/meta/recipes-support/curl/curl_7.61.0.bb
+++ b/meta/recipes-support/curl/curl_7.61.1.bb
@@ -7,11 +7,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ef889a37a5a874490ac7ce116396f29a"
 
 SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
-           file://CVE-2018-14618.patch \
 "
 
-SRC_URI[md5sum] = "31d0a9f48dc796a7db351898a1e5058a"
-SRC_URI[sha256sum] = "5f6f336921cf5b84de56afbd08dfb70adeef2303751ffb3e570c936c6d656c9c"
+SRC_URI[md5sum] = "593432e5ff863474d8d880f74b705d6d"
+SRC_URI[sha256sum] = "a308377dbc9a16b2e994abd55455e5f9edca4e31666f8f8fcfe7a1a4aea419b9"
 
 CVE_PRODUCT = "libcurl"
 inherit autotools pkgconfig binconfig multilib_header
-- 
2.7.4


