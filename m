Return-Path: <misla011@fiu.edu>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 795487D23C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 21:52:59 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id n7so21582839qtb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Oct 2019 14:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=fiu-edu.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version:reply-to
	:content-transfer-encoding;
	bh=9oexCw1PjQEK20JJxo/H3YfBrnRJ3eIsPukGoCZLZ+I=;
	b=1N2LdG+yhrxKqCDvNxNJK/8G7uNNAwLuFaG2Ie9X+bfie4CpEaLC+eXbA2vNH2yp7n
	o7WZDDMZkhKrE1o/ZT6qYOMUDmRlaHwX0JfaTn83DS/eW6oYyFU76pOgtCxDtJZ7anYx
	wOyPafDybNIzD3Ov3H+l8Xpy5Nmjs9AgEBQcmlezDCME9/Aji/qLsqoP2hJYTUb6jt5N
	3gtryaXuhQHVJqsl693jljswq4ldLmbAZy5Y2aW24C3qxz3zwEaiTuUGiXyEWCl1ONIl
	Io4uOh2N5nQyUrCy6NBSaq+LLQiUUE7f7CpwT3fTCt6ktO9/zWsAQACL4YCf64wmlh5f
	xNkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:reply-to:content-transfer-encoding;
	bh=9oexCw1PjQEK20JJxo/H3YfBrnRJ3eIsPukGoCZLZ+I=;
	b=fmbjanir5fvUH8HqLgWvBOac55HrY2UF+ACbHgMmdSJI/10gaqqD9QUo+n0m2AXyMp
	33cDSFsY6zZ4kzzq1LNfMLPocZRQPGjnr6uUh3zsx03duoH/et/k0xBj+NsAhvKwQD5o
	uDlab+2cVPJmwoEBY78vxGoHOUfug7qbXIPzakQKROozkk35fo08xelU1sLpuTI3ipFR
	HJGkqeaf1u3iUTs3zn6tn+7lz6msVVpmozc9Mt3BUs87x9dzk9PxhZCP+TqTyO1V/tpZ
	c4m0fS67FAYbU1BFncFEoNunA3woXxzaCy2NgoxNsMBOuJpR+BKqW4Apb3UCV43Ncs0U
	5v6A==
X-Gm-Message-State: APjAAAU8Hqhy4F0Gwkj5VylU0mAKhsZlORNP5v8JiQ9DS6xBd0gsCvc8
	5qFcQbJGul10ltIyF4W5Q0w7MTXPC8o=
X-Google-Smtp-Source: APXvYqyjvr168xTKD0q6Sz6Z10BGBQiZPqYUwLQGxkcQGWPJges1EsXNisGGbpIB8+B25ed416ka7g==
X-Received: by 2002:ac8:2e58:: with SMTP id s24mr33315271qta.52.1570485180060; 
	Mon, 07 Oct 2019 14:53:00 -0700 (PDT)
Received: from
	muislam-yocto.h0ebkyng4k5ejcojahceueqbfb.cx.internal.cloudapp.net
	([40.84.59.7]) by smtp.gmail.com with ESMTPSA id
	199sm8468418qkk.112.2019.10.07.14.52.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 07 Oct 2019 14:52:59 -0700 (PDT)
From: Muminul Islam <misla011@fiu.edu>
X-Google-Original-From: Muminul Islam <muislam@microsoft.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Oct 2019 21:52:53 +0000
Message-Id: <20191007215253.106710-1-muislam@microsoft.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Reply-To: muislam@microsoft.com
Subject: [thud][PATCH v2] curl: Security fix for CVE-2019-5482
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
X-List-Received-Date: Mon, 07 Oct 2019 21:52:59 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Muminul Islam <muislam@microsoft.com>
---
 .../curl/curl/CVE-2019-5482.patch             | 68 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.61.0.bb      |  1 +
 2 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2019-5482.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2019-5482.patch b/meta/recipes-support/curl/curl/CVE-2019-5482.patch
new file mode 100644
index 0000000000..91b186699d
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2019-5482.patch
@@ -0,0 +1,68 @@
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
+
+CVE: CVE-2019-5482
+
+Upstream-Status: Backport
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
2.20.1


