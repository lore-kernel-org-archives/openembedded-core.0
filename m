Return-Path: <misla011@fiu.edu>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id E47217D0B1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Oct 2019 19:53:08 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id p10so6902081qkg.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Oct 2019 12:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=fiu-edu.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version:reply-to
	:content-transfer-encoding;
	bh=9dJmhv1VhDYDlA8c3LSWf2I28wKTBHSX5ZYBfu7dw7Q=;
	b=PyBeSVPM1aMLp3o4OUcv4bsq26WyZY+iwALMcVHmytGsk6BBG2OCSDvGeZ+FiIRW2m
	lq8ZXZo9g5rFMHsAcNT2KM2b8QRD1eIPyldgxMaSh8Z24pEHH4043nEmrydXtjryFQzX
	UWDn2ZUKtwbF+o7tTZZcsj8bYIE8NjKKoVq1h9jZFSrPqU+CJS58bTlLOfMKJQQ7UCuN
	7vXFsx+ln70QdVXj8/9GUR7pCfddklJ8W9PU6RBHK8+oprMxF6he9quTFFIUn24BDo5g
	eWrPwwqr/o6r5FNbGEMfa3jCmF60sGgJlX84WwM2UCMAiyh0hupOfqGAqFNmy1rPopQ8
	OEoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:reply-to:content-transfer-encoding;
	bh=9dJmhv1VhDYDlA8c3LSWf2I28wKTBHSX5ZYBfu7dw7Q=;
	b=XKruA4UpLr25mGDgMwyUvMNAvG08Z9mToixafaEfaV4+vA/LZ7JgX9Tpz2htnyo8EW
	XnoZE8Gv5Vktlf3waoXn6oZ0Vhg2HSpDYZE2Hw/vZZPKbYFdCVx9WKWySh4/O6KIBZtg
	5DVLY8sBdrabh8drOp9/TGuXY+km4MFq00B/7VMbMRiFYZEY7qW1WiJ3ZXc7z1+vdFVj
	aNO0JV8LnjUkb9OuO/rnoPhpMZgEifNsj3WwDOS6BZ4TkHB8Ct++Q0ns0DvqP3Gf2r7N
	z7HfoSr1SfRZ0bxtgZtY0PzSqZZzfD2pJFHUAM4q7Z/7ZFq80y0dKWXJGc2WnLkYtcYn
	wYxg==
X-Gm-Message-State: APjAAAX3EzRLXHKgbcNuI2tQRSyTmFEzepGzOe+hlC7T3h+jP9LIwHIC
	Xvodrl5sFMOpwMqqQGBu+MTkEqmLsgo=
X-Google-Smtp-Source: APXvYqy1kb8daIDCx2PdiTecgWempB2SEjUTTH93r38RYnqEG9mz96ZOcQKhy8H1xojG/pT/2JwCBQ==
X-Received: by 2002:a37:4c4d:: with SMTP id z74mr11492577qka.459.1570218788454;
	Fri, 04 Oct 2019 12:53:08 -0700 (PDT)
Received: from
	muislam-yocto.h0ebkyng4k5ejcojahceueqbfb.cx.internal.cloudapp.net
	([40.84.59.7]) by smtp.gmail.com with ESMTPSA id
	a134sm3620938qkc.95.2019.10.04.12.53.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 04 Oct 2019 12:53:07 -0700 (PDT)
From: Muminul Islam <misla011@fiu.edu>
X-Google-Original-From: Muminul Islam <muislam@microsoft.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Oct 2019 19:53:00 +0000
Message-Id: <20191004195300.109644-1-muislam@microsoft.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Reply-To: muislam@microsoft.com
Subject: [thud][PATCH] curl: Security fix for CVE-2019-5482
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
X-List-Received-Date: Fri, 04 Oct 2019 19:53:09 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Muminul Islam <muislam@microsoft.com>
---
 .../curl/curl/CVE-2019-5482.patch             | 65 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.61.0.bb      |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2019-5482.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2019-5482.patch b/meta/recipes-support/curl/curl/CVE-2019-5482.patch
new file mode 100644
index 0000000000..c540f2d53b
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2019-5482.patch
@@ -0,0 +1,65 @@
+From 38319e0717844c32464a6c7630de9be226f1c6f4 Mon Sep 17 00:00:00 2001
+From: Thomas Vegas <>
+Date: Sat, 31 Aug 2019 17:30:51 +0200
+Subject: [PATCH] tftp: Alloc maximum blksize, and use default unless OACK is
+ received
+Reply-To: muislam@microsoft.com
+
+Fixes potential buffer overflow from 'recvfrom()', should the server
+return an OACK without blksize.
+
+Bug: https://curl.haxx.se/docs/CVE-2019-5482.html
+CVE-2019-5482
+
+Signed-off-by: Muminul Islam <muislam@microsoft.com>
+---
+ lib/tftp.c | 12 +++++++++---
+ 1 file changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/lib/tftp.c b/lib/tftp.c
+index 064eef318..2c148e3e1 100644
+--- a/lib/tftp.c
++++ b/lib/tftp.c
+@@ -969,6 +969,7 @@ static CURLcode tftp_connect(struct connectdata *conn, bool *done)
+ {
+   tftp_state_data_t *state;
+   int blksize;
++  int need_blksize;
+ 
+   blksize = TFTP_BLKSIZE_DEFAULT;
+ 
+@@ -983,15 +984,20 @@ static CURLcode tftp_connect(struct connectdata *conn, bool *done)
+       return CURLE_TFTP_ILLEGAL;
+   }
+ 
++  need_blksize = blksize;
++  /* default size is the fallback when no OACK is received */
++  if(need_blksize < TFTP_BLKSIZE_DEFAULT)
++    need_blksize = TFTP_BLKSIZE_DEFAULT;
++
+   if(!state->rpacket.data) {
+-    state->rpacket.data = calloc(1, blksize + 2 + 2);
++    state->rpacket.data = calloc(1, need_blksize + 2 + 2);
+ 
+     if(!state->rpacket.data)
+       return CURLE_OUT_OF_MEMORY;
+   }
+ 
+   if(!state->spacket.data) {
+-    state->spacket.data = calloc(1, blksize + 2 + 2);
++    state->spacket.data = calloc(1, need_blksize + 2 + 2);
+ 
+     if(!state->spacket.data)
+       return CURLE_OUT_OF_MEMORY;
+@@ -1005,7 +1011,7 @@ static CURLcode tftp_connect(struct connectdata *conn, bool *done)
+   state->sockfd = state->conn->sock[FIRSTSOCKET];
+   state->state = TFTP_STATE_START;
+   state->error = TFTP_ERR_NONE;
+-  state->blksize = blksize;
++  state->blksize = TFTP_BLKSIZE_DEFAULT; /* Unless updated by OACK response */
+   state->requested_blksize = blksize;
+ 
+   ((struct sockaddr *)&state->local_addr)->sa_family =
+-- 
+2.23.0
+
diff --git a/meta/recipes-support/curl/curl_7.61.0.bb b/meta/recipes-support/curl/curl_7.61.0.bb
index 1027f75e9e..3b54774b9d 100644
--- a/meta/recipes-support/curl/curl_7.61.0.bb
+++ b/meta/recipes-support/curl/curl_7.61.0.bb
@@ -13,6 +13,7 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://CVE-2018-16842.patch \
            file://CVE-2019-5435.patch \
            file://CVE-2019-5436.patch \
+           file://CVE-2019-5482.patch \
 "
 
 SRC_URI[md5sum] = "31d0a9f48dc796a7db351898a1e5058a"
-- 
2.23.0


