Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6800B7EADD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 02:50:20 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id t10so269842plr.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 19:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=L0Eh6jqbNqEqek377ALVXnJou16+RD4DO8r1L06uFZ8=;
	b=BZwtiRlaRGVEs5lXlTKZ+snTe39kWpkQ75JwzDsmmw54c4Ck2rqqAIh/AsbBHzaDRG
	bZDlCUdztfS/5df5CbT10FvwNjImwAT5dX500ak5JTIXOQ5sTxA9XFwb/ZpdYCjXKpot
	Q3W3L0hNg+TF8+DlGsvbJdiYxPNs9TsNe63k9ZM3VbEla9b6UNlhVzw47T+bvvj+aqS1
	iWUqwprrrTVn2DYn/I1sMDgcyUVMgQCft4C7IVW2KkkzK/yPSJmBf16TTMyyQE+iMhlH
	NJ15zSAaIUgwX1m9uN9yWJfmKY4xDJ8zrlqGsx1emqLjbEQM1B36oGhNGLbjCpTyHJrj
	X7/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=L0Eh6jqbNqEqek377ALVXnJou16+RD4DO8r1L06uFZ8=;
	b=Zwmgnn0T1NZ7YZMzetzjDdUPuk6CsN23tqXPzn03dFpXExS6gUdxmccoYLmtff+bNg
	1dLYVFbQZDroZdJnlUm4hMkvUnECblQElIEoIPl/SadX9Qjaw5cHD1vouk7xxZTcSdnB
	uijhEf1gUf63tAR46M7bwjjIPjHjkohRkZb/TduAFs6teKNC+3chFy2flBo5BzLqxLYr
	XRJiqMnnb0f/+geR05K0YzUXa7qLGKCYOtX5i5U502fGzLDSDdJVwMuKRqTNoQmn7P9H
	KqB0UxZMsiuOIE4jQG5VmR2oNnQaN/mebcA7tpKz6ryEgd3KK6zNZ453H3HuGWQ/u9tA
	OdPA==
X-Gm-Message-State: APjAAAVHb2C47LK2L5Heoqb1eZzsN7Bs4847W7VBIdlDNhLVRIGnq5MB
	HCXVkcc6onTmsYGg4eZdnFQqj7BOWHg=
X-Google-Smtp-Source: APXvYqw4i1WyItKrIaJeR9S6+9+naLMcdepBY2f0QVI887MK51dpJ+W1mewT4nA06eqBUlBOqmxThQ==
X-Received: by 2002:a17:902:6bc5:: with SMTP id
	m5mr471176plt.169.1569293421493; 
	Mon, 23 Sep 2019 19:50:21 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:ec07:55c0:9c8c:b3de])
	by smtp.gmail.com with ESMTPSA id
	q204sm146791pfc.11.2019.09.23.19.50.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Sep 2019 19:50:21 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Sep 2019 19:49:28 -0700
Message-Id: <7b63be7e2a2fd8ed240f188fad36660d6f31bdf8.1569292053.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569292053.git.akuster808@gmail.com>
References: <cover.1569292053.git.akuster808@gmail.com>
Subject: [warrior][ 48/50] Curl: Security fix for CVE-2019-5482
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
X-List-Received-Date: Tue, 24 Sep 2019 02:50:20 -0000

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


