Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7710B7F377
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2019 04:48:41 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id v27so6648795pgk.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2019 21:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=L0Eh6jqbNqEqek377ALVXnJou16+RD4DO8r1L06uFZ8=;
	b=eByvYvqhVmxn89jI4KiVvIRKMWTC7Sk31ePLo62vkQRE4KL4L+VShIEg3Zv/Lz3uTo
	S+ofIymBB9YlrirRA+iM7dgqL8iK9ouyYNehYNQ+c274X1zPynt9BUoUy63mVOz+5HYS
	V22tdJtAZAErdduDMbrm7hks+B/ed1d3h17AT3Xw7dxgmiR+SpEWQutF4XrlDmVEY3VL
	KapzV8UMwcMyJgYPeko9UNxKuVx4/ZH/zgDDk4+p33I/I1olG/X95XxGcta7ZfPtS+2M
	HkbKVOa+UStMYz4YX784w0Zh3BPt9rSW/CqWMQcF72/CNp+wa7JFfGbbT6FqIBToo0+v
	S9iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=L0Eh6jqbNqEqek377ALVXnJou16+RD4DO8r1L06uFZ8=;
	b=eSTVoMU20gIgwyPpZnGBwJihVpT2KEilS8Z8iDbKXOt9u+38Mg+hd1fFpHm+722bLa
	U/XNZ33CZ9WtKCsn201ushRpwdEXMJ1ehomWw+l6EwlbFIOLJxS1RzPPuy1ZQ0BW20I0
	8DvObPEk3TZDk78fBvYNMCeo5IYFmmm1Lzp3zdn8gDpX6nAatk6FF46WvjIIcxIIll6Q
	UqzzEuBYTf+7lxPqB/nfwD4S7mNo92fFi8hiDQZ9Dq8LkX3Jbkck4evXYNz9LSjMmJp1
	EP4zagwg49YB2IkUojkcCnOlObxgSO+lNoSSSjk2Do5QGOtSiSwSQAPASFKwLcH1BtV0
	q1Hw==
X-Gm-Message-State: APjAAAVK+7Io5MW/zOC5dgeNZzL0qhiWBjLvUgKK2QS0Kt6mWXkwqeBu
	WT1YFcX2FiPNhdr3oyFuhIGMVov2ehU=
X-Google-Smtp-Source: APXvYqyI4eS1ArDAMq0zECVZ7pJ7GrTRR2QoS0IZie8V2VEVuCoULOGU4s4ODbqxQUiRKM0f5IMN2A==
X-Received: by 2002:a17:90a:8002:: with SMTP id
	b2mr25197349pjn.0.1569818922678; 
	Sun, 29 Sep 2019 21:48:42 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:edf9:811d:ad92:85c2])
	by smtp.gmail.com with ESMTPSA id
	h15sm18888493pgn.76.2019.09.29.21.48.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 29 Sep 2019 21:48:42 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Sep 2019 21:47:42 -0700
Message-Id: <d2e5558133f970a8a196c545dd00af9315c1a06a.1569818533.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569818533.git.akuster808@gmail.com>
References: <cover.1569818533.git.akuster808@gmail.com>
Subject: [warrior-next 47/54] Curl: Security fix for CVE-2019-5482
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
X-List-Received-Date: Mon, 30 Sep 2019 04:48:42 -0000

From: Armin Kuster <akuster@mvista.com>

Source: curl.org
MR: 99905
Type: Security Fix
Disposition: Backport from https://github.com/curl/curl/commit/facb0e4662415b5f28163e853dc6742ac5fafb3d
ChangeID: e0c807da8937f687a4b2e28eaa6b4b5a51845bc5
Description:

Fixes CVE-2019-5482
- Affected versions: libcurl >= 7.19.4 to and including 7.65.3
- Not affected versions: libcurl < 7.19.4

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-support/curl/curl/CVE-2019-5482.patch | 65 ++++++++++++++++++++++
 meta/recipes-support/curl/curl_7.64.1.bb           |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2019-5482.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2019-5482.patch b/meta/recipes-support/curl/curl/CVE-2019-5482.patch
new file mode 100644
index 0000000..30122d1
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2019-5482.patch
@@ -0,0 +1,65 @@
+From facb0e4662415b5f28163e853dc6742ac5fafb3d Mon Sep 17 00:00:00 2001
+From: Thomas Vegas <>
+Date: Sat, 31 Aug 2019 17:30:51 +0200
+Subject: [PATCH] tftp: Alloc maximum blksize, and use default unless OACK is
+ received
+
+Fixes potential buffer overflow from 'recvfrom()', should the server
+return an OACK without blksize.
+
+Bug: https://curl.haxx.se/docs/CVE-2019-5482.html
+CVE-2019-5482
+
+Upstream-Status: Backport
+CVE: CVE-2019-5482
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ lib/tftp.c | 12 +++++++++---
+ 1 file changed, 9 insertions(+), 3 deletions(-)
+
+Index: curl-7.64.1/lib/tftp.c
+===================================================================
+--- curl-7.64.1.orig/lib/tftp.c
++++ curl-7.64.1/lib/tftp.c
+@@ -973,6 +973,7 @@ static CURLcode tftp_connect(struct conn
+ {
+   tftp_state_data_t *state;
+   int blksize;
++  int need_blksize;
+ 
+   blksize = TFTP_BLKSIZE_DEFAULT;
+ 
+@@ -987,15 +988,20 @@ static CURLcode tftp_connect(struct conn
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
+@@ -1009,7 +1015,7 @@ static CURLcode tftp_connect(struct conn
+   state->sockfd = state->conn->sock[FIRSTSOCKET];
+   state->state = TFTP_STATE_START;
+   state->error = TFTP_ERR_NONE;
+-  state->blksize = blksize;
++  state->blksize = TFTP_BLKSIZE_DEFAULT; /* Unless updated by OACK response */
+   state->requested_blksize = blksize;
+ 
+   ((struct sockaddr *)&state->local_addr)->sa_family =
diff --git a/meta/recipes-support/curl/curl_7.64.1.bb b/meta/recipes-support/curl/curl_7.64.1.bb
index 00c8c5a..151d74a 100644
--- a/meta/recipes-support/curl/curl_7.64.1.bb
+++ b/meta/recipes-support/curl/curl_7.64.1.bb
@@ -9,6 +9,7 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
            file://CVE-2019-5435.patch \
            file://CVE-2019-5436.patch \
+           file://CVE-2019-5482.patch \
 "
 
 SRC_URI[md5sum] = "790c101927845208a9d7e8c429ddd1b2"
-- 
2.7.4


