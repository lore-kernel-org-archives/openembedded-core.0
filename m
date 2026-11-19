Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.98.1795101867800227723
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 07:24:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=SOiW/c85;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so17879745e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 07:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795101866; x=1795706666; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dw4VAovE/a92cuzsg2cG05H8Nf5LNb2rGLcZ7KrtMzM=;
        b=SOiW/c855hqaOvoc3D0H3ps7Xkjbe1Gl+0LontqauF0LVUWEHfA+/ctdkXTeOi4sRn
         ywF7F5sEMXhAuZh8k+nZdrv6BI/3Ywv70RNLkaokrAK0/Z6RBWr5XA4gExgnw+SM9dKE
         LgVXIo3/xUExO1aiqCcqRF+VQ3npkHA3IuVMpflxCd0OrEOY72FmUWmfcONnbgdwyTdd
         GUhoaOyymmnYP4CVfA2BozI+aeIdzF1Dq3atkqbobTqw0FcExTfPfVT4b/rT+WwtUSjs
         TWyHgLZbBgjFztWaIZZMxPz/UCteQQG28Oya1SU6VP0pYQ7Wlxm1cRZGtw4KOiP3Tirb
         hEkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795101866; x=1795706666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dw4VAovE/a92cuzsg2cG05H8Nf5LNb2rGLcZ7KrtMzM=;
        b=Juawj0lbUmZoj739+eLpbutk6w5/oZQH9YFkoROlGhzkf8l11gLsnhU/AfN/CxCH/U
         3SrSmxVreBB1qobD8qv4OLaB+ERNcRbxcW03et7dRSH+43SCqr3qaKyDf8PJfU74v5XU
         HKKkbm6tKU2xv3XDmUqEHbkvhugZXihdLCDIWfhMjmpu5LNOiyvemMESZESwO1RC3sDz
         Jn49hfXzN+lxz/d2B2t4QamDl/XpIxIJdrklipZbfgScSPdD7gqbGjia1A4PzFdGZkIm
         lUxvvy7IOJPqF1GwYbjxcCLxxJRCYg67ZUa6fk/Fv8AMOG/k94+aWpTuPNQEJvAIWcb5
         oVIQ==
X-Gm-Message-State: APuU4Z+R8EXUV3Cq9sslDURxzTPNOC1x0d5prtCumOxUo4Yy2q3JxzQh
	/UqMjbSPifWvChDuNDHk9jSFB1M3b+ojtZSLLoGz4SC4ZmVI49FnzCuXVkJlwkMP0x8qmZ/3Wd0
	geyybwRw=
X-Gm-Gg: AYBFou1+TV/xqQ6+j7596uxrTfO0Y2BQvdcbZa9tGe1BqqmTNWap7FWPH763hyoVglz
	iR7xERNu/2oo6VzkmE1sFAXlo+J5ldRcIsTqBnfoxYHbRFsDSxZIJCURpsZNIFtM3mf1hvO9AAM
	IlrvURzYdCGmzRgMj7+V9yxhkoLBKhdoEOKUEgu4bUNEE4TN6IbgpZe5L20rm04Amamb/j1JQP9
	3TW3kunghZrYfrtjGfeeUczC5Ymj7f5jCg8zZfIdx/m8AJ3nmtdcYoJuzK7AZPNq3BTCOnNd4MG
	/HgezMGwSY1NpdxXn6KyYvsK+aIBnL17drc+3l0EBCDX/eM/D3l0s4Inae4qbf1w/UtOyIo77aQ
	omk7PJklodqi8WGQG09SmdDj55z5rbNcGWSdBp2qI3+W/2sOLXcDaAryCtPbLWD0r82gB96vxfB
	CLjTaPlJLm+Mr09V5Yp+7xPypm4yUK934JZwNQgmGcOVjutqAzlPC9QyPq/q60tVFfESKpChrsp
	b0uZO3jght51XTnJgTLrFSuuBoOCAsQhffM6ZxDZr1vNV6wD1TdLHHknrY312pQzKUp6PzxY2Lf
	DSe+nYRxI9ekC6QLiTtHZwPOK6fWwVVFjd9aM0W0AH3y3Z8b+dZbGEKAaWYD588U/UgScnESzKP
	AUYF+NcHbyWTwQG52ufoO+v4STemz086MSuyfOZ7nhI8OMFbQqZf2SVA=
X-Received: by 2002:a05:600c:a54:b0:4bb:6375:aa41 with SMTP id 5b1f17b1804b1-4bb7da48344mr118595985e9.27.1795101865889;
        Thu, 19 Nov 2026 07:24:25 -0800 (PST)
Return-Path: <fabien.thomas@smile.fr>
Received: from FRSMI25-GIGUE ([2a01:e0a:8cc:5b00:2270:efa7:7aaf:bcdc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865b1sm4222275e9.5.2026.11.19.07.24.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:24:25 -0800 (PST)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/19] curl: fix CVE-2026-92389
Date: Thu, 19 Nov 2026 16:22:36 +0100
Message-ID: <95df3a2155305579bf7bf38cc433e11708466ffb.1795101267.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1795101267.git.fabien.thomas@smile.fr>
References: <cover.1795101267.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 15:24:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250693
Content-Type: text/plain; charset="utf-8"

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Backport patch to fix CVE-2026-92389.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-92389

Upstream fix:
  https://github.com/curl/curl/commit/63dd390fab905a239a97e270

Tested with ptest:
Before: PASSED: 857, FAILED: 0, SKIPPED: 0, ABORTED: 0
After: PASSED: 857, FAILED: 0, SKIPPED: 0, ABORTED: 0

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
[bajau: fixed recipe files list]
Signed-off-by: Bastien Jauny <bastien.jauny@smile.fr>
---
 .../curl/curl/CVE-2026-92389.patch            | 60 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92389.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-92389.patch b/meta/recipes-support/curl/curl/CVE-2026-92389.patch
new file mode 100644
index 0000000000..387cca9ee1
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-92389.patch
@@ -0,0 +1,60 @@
+From a1705881527f7ee59606a61c4ba52e0737655571 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Wed, 16 Sep 2026 23:46:44 +0200
+Subject: [PATCH] tftp: verify direction in a few places
+
+Closes #22974
+
+Conflicts Resolved:
+
+Adaptation notes:
+- Upstream moved tftp_tx() above tftp_connect_for_tx(); kept 8.7.1 layout and added the upload check in tftp_tx().
+
+Assisted-by: kiro:claude-opus-5.5
+
+CVE: CVE-2026-92389
+Upstream-Status: Backport [https://github.com/curl/curl/commit/63dd390fab905a239a97e270]
+
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ lib/tftp.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/lib/tftp.c b/lib/tftp.c
+index ff2b7b7457..371902c0d8 100644
+--- a/lib/tftp.c
++++ b/lib/tftp.c
+@@ -545,10 +545,14 @@ static CURLcode tftp_send_first(struct tftp_state_data *state,
+     break;
+ 
+   case TFTP_EVENT_ACK: /* Connected for transmit */
++    if(!data->state.upload)
++      return CURLE_TFTP_ILLEGAL;
+     result = tftp_connect_for_tx(state, event);
+     break;
+ 
+   case TFTP_EVENT_DATA: /* Connected for receive */
++    if(data->state.upload)
++      return CURLE_TFTP_ILLEGAL;
+     result = tftp_connect_for_rx(state, event);
+     break;
+ 
+@@ -709,6 +713,9 @@ static CURLcode tftp_tx(struct tftp_state_data *state, tftp_event_t event)
+   char *bufptr;
+   bool eos;
+ 
++  if(!data->state.upload)
++    return CURLE_TFTP_ILLEGAL;
++
+   switch(event) {
+ 
+   case TFTP_EVENT_ACK:
+@@ -1131,6 +1138,8 @@ static CURLcode tftp_receive_packet(struct Curl_easy *data)
+ 
+     switch(state->event) {
+     case TFTP_EVENT_DATA:
++      if(data->state.upload)
++        return CURLE_TFTP_ILLEGAL;
+       /* Don't pass to the client empty or retransmitted packets */
+       if(state->rbytes > 4 &&
+          (NEXT_BLOCKNUM(state->block) == getrpacketblock(&state->rpacket))) {
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index ab33d4aa77..e08ca2f930 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -43,6 +43,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2026-13608.patch \
            file://CVE-2026-8286.patch \
            file://CVE-2026-80230.patch \
+           file://CVE-2026-92389.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
