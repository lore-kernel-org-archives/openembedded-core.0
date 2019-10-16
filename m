Return-Path: <misla011@fiu.edu>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 118D27F33F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 21:10:42 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id h126so24173569qke.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 14:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=fiu-edu.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version:reply-to
	:content-transfer-encoding;
	bh=Hqok6QEC2GlIPg856rD4As0ntZsh6AzQ6XvSCKkbD+k=;
	b=wF9oJLV4s4bDN1Q6V0XKVkJFYkZVfI0VGkxaCA7f0gfd80uCI83LlNjrtZTZmhw2WE
	HbRXHpyIlgkRzSpVc51nf2rYfwnsMno352ItfVYP4bknVK82wM3ZAQhzMpL0fco9Eimd
	0MM8D3qITMoDMEFsaexT5X56sHf77HyYnebH+aJx5VSgne6DLxZazo+GgDY5bVM3BaMy
	i2rNHxG5qjQBz2VeJiI4aDB8pAgOXU1x6QPo8F+euO07JuPowjH4TXH5iaDKMdtKplmG
	i78cNalWm4xcNsA6ohklpmT7jMtC0ruOTkTjIQMoEAJsMu3aMmY2HNdJbEk6nywtp+9m
	HWoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:reply-to:content-transfer-encoding;
	bh=Hqok6QEC2GlIPg856rD4As0ntZsh6AzQ6XvSCKkbD+k=;
	b=m9PG7mYNuEnKd9FYIIovL83gNcCcxdsHJkeQ6GWl5D1YBWm7qGZ9vjMyCYqBnwJD/Z
	ubEenM9pyrTo9o8iL7Lx122nfDzsIQFuhRBV8qdvUNJR1Xfowo5wZw+LDvkRqwWQCV9B
	FXvOddmsqd5PqeRgu5sRCHQ5eA9qrTQ3cL6em95LesFZdqRvLYakfkIV7j5TnCWZVndk
	kRFN1ahevnzKCMlvpPk4SLj9zunnrGgTqSadFG8Uw3rBp/YTQheFVDVyhmFYpUrOCoqy
	XO8vI5akbdp6HSgWOcNGM9x00XGn9xDGMJc43NN9jG7EYjaqpBhUGbDL78an2o7+Hlcj
	Xjcw==
X-Gm-Message-State: APjAAAWcGrwG4U1uC3T/3DkwVbggi8c6O1fX4ONhQWhYEoolRxZTik4a
	/ho0SSkKYiz3TKePfXeL6F9HTfcQ87U=
X-Google-Smtp-Source: APXvYqwmPGAe91gpqLHv5ZfBwVvPPgfG/UGcBdB6Vp7attMmmqxUPVRHNYrZPJ/kIG2anIJkLalWKg==
X-Received: by 2002:a05:620a:2001:: with SMTP id
	c1mr5425700qka.261.1571260243416; 
	Wed, 16 Oct 2019 14:10:43 -0700 (PDT)
Received: from
	muislam-yocto.h0ebkyng4k5ejcojahceueqbfb.cx.internal.cloudapp.net
	([40.84.59.7])
	by smtp.gmail.com with ESMTPSA id j7sm145945qtc.73.2019.10.16.14.10.42
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 16 Oct 2019 14:10:42 -0700 (PDT)
From: Muminul Islam <misla011@fiu.edu>
X-Google-Original-From: Muminul Islam <muislam@microsoft.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Oct 2019 21:10:35 +0000
Message-Id: <20191016211035.2270-1-muislam@microsoft.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Reply-To: muislam@microsoft.com
Subject: [thud][PATCH] curl: Security fix for CVE-2019-5481
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
X-List-Received-Date: Wed, 16 Oct 2019 21:10:43 -0000
Content-Transfer-Encoding: 8bit

CVE: CVE-2019-5481

Upstream-Status: Backport

Signed-off-by: Muminul Islam <muislam@microsoft.com>
---
 .../curl/curl/CVE-2019-5481.patch             | 52 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.61.0.bb      |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2019-5481.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2019-5481.patch b/meta/recipes-support/curl/curl/CVE-2019-5481.patch
new file mode 100644
index 0000000000..a97a95a268
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2019-5481.patch
@@ -0,0 +1,52 @@
+From f6fa4dffb2b973f3c7f2e8c2b6a7dc94c016f455 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Tue, 3 Sep 2019 22:59:32 +0200
+Subject: [PATCH] security:read_data fix bad realloc()
+Reply-To: muislam@microsoft.com
+
+... that could end up a double-free
+
+CVE-2019-5481
+Bug: https://curl.haxx.se/docs/CVE-2019-5481.html
+
+Signed-off-by: Muminul Islam <muislam@microsoft.com>
+
+CVE: CVE-2019-5481
+
+Upstream-Status: Backport
+
+Upstream commit: https://github.com/curl/curl/commit/9069838b30fb3b48af0123e39f664cea683254a5
+---
+ lib/security.c | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/lib/security.c b/lib/security.c
+index abf242c38..52cce97d0 100644
+--- a/lib/security.c
++++ b/lib/security.c
+@@ -191,7 +191,6 @@ static CURLcode read_data(struct connectdata *conn,
+                           struct krb5buffer *buf)
+ {
+   int len;
+-  void *tmp = NULL;
+   CURLcode result;
+ 
+   result = socket_read(fd, &len, sizeof(len));
+@@ -201,12 +200,11 @@ static CURLcode read_data(struct connectdata *conn,
+   if(len) {
+     /* only realloc if there was a length */
+     len = ntohl(len);
+-    tmp = Curl_saferealloc(buf->data, len);
++    buf->data = Curl_saferealloc(buf->data, len);
+   }
+-  if(tmp == NULL)
++  if(!len || !buf->data)
+     return CURLE_OUT_OF_MEMORY;
+ 
+-  buf->data = tmp;
+   result = socket_read(fd, buf->data, len);
+   if(result)
+     return result;
+-- 
+2.23.0
+
diff --git a/meta/recipes-support/curl/curl_7.61.0.bb b/meta/recipes-support/curl/curl_7.61.0.bb
index 3b54774b9d..29aaff20a1 100644
--- a/meta/recipes-support/curl/curl_7.61.0.bb
+++ b/meta/recipes-support/curl/curl_7.61.0.bb
@@ -14,6 +14,7 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://CVE-2019-5435.patch \
            file://CVE-2019-5436.patch \
            file://CVE-2019-5482.patch \
+           file://CVE-2019-5481.patch \
 "
 
 SRC_URI[md5sum] = "31d0a9f48dc796a7db351898a1e5058a"
-- 
2.23.0


