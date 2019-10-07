Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2043A7D58A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 15:11:10 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id j11so7026763plk.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Oct 2019 08:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=6jJCR2vx8ekO68DkxkrevQ+c3DFJI5vPZitZInTpCgY=;
	b=K/BXA9WAlDFeiImsPgDXHFIhziZzEgylyiK1p9mEdCFWi26L79TGSAyCjACousGigw
	PXo2IVC3tdhCG1d9a8oto6BI5CLJ1URZbSJDlWee6JBaTprAsbbHJM+V8xhYi5an3DjO
	b5183K/0h7ZthJLDxdgzevOuantUTeuTQ+FeJLy1ZHzpnkRyWhFhSlih8QxglVPmDN4p
	jaNegkZ4qmaR+YgXBdDoDboFe+oPhgVentLZ+v0cp3FAWgiVbg4WESLRsDsA+IdqHirP
	rTyck59G/GmKZKmPHxtqu0Fq13l2pApfWu8CzwoWJRJs3ix+xPbAHSjCLcTYUBsI/qwX
	Es3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=6jJCR2vx8ekO68DkxkrevQ+c3DFJI5vPZitZInTpCgY=;
	b=kFRwOON8uqZA2ayImse094wX52Y1PfP2uyk+AdRoNyr9P9pTy4MrkuiwqfzkkhRfxm
	qEWN32kp9kbH+IbtxtQu+DErOrMEnWeZaSpzhjLdNNVgf7L56YRw+YV3JFfxQM7LUx5u
	uL+F95YYHnROHz3ou07ncCZ4MbDsnwgFS5zobfcOR+2JB6KbvExViYt06wqK8psaWFVJ
	s1+5dJ6G2HEvP1ql2sF+xoTRKtXD+ppYPJunZgpJlx4ep5lqYkdpibeXUEmPSE60P0Hz
	LIf75V7pQC+7/0GrJyNFpaLaU/tvWufHo/capx6uH+KyGVEMqFIGTN0YELplby0NDoRZ
	p5fQ==
X-Gm-Message-State: APjAAAVFiMbSkYxIGICyZrojT9nOhNnhZpLAWq1Y2NAAiqD5gAU5U6PH
	F99/Qn8W/oqKayEsqiRRQok0v+YWjaE=
X-Google-Smtp-Source: APXvYqzAK5Mtc49OMHT6la0L0cPe4mqU8sKoytllyRimlYIQqn9gjJUG3ZgRBtiwoFEzC2ePY9+7Cg==
X-Received: by 2002:a17:902:7c0c:: with SMTP id
	x12mr30659892pll.238.1570461070915; 
	Mon, 07 Oct 2019 08:11:10 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:65e8:7322:d189:1d85])
	by smtp.gmail.com with ESMTPSA id
	m102sm12786928pje.5.2019.10.07.08.11.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 07 Oct 2019 08:11:10 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Oct 2019 08:10:41 -0700
Message-Id: <75a4b4d8fb14414bbe2e38be8ccda0af94ef9b40.1570460789.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1570460789.git.akuster808@gmail.com>
References: <cover.1570460789.git.akuster808@gmail.com>
Subject: [thud 04/26] curl: fix CVE-2018-16890 CVE-2019-3822 CVE-2019-3823
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
X-List-Received-Date: Mon, 07 Oct 2019 15:11:10 -0000

From: Andrii Bordunov via Openembedded-core <openembedded-core@lists.openembedded.org>

Signed-off-by: Kevin Weng <t-keweng@microsoft.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-support/curl/curl/CVE-2018-16890.patch | 50 ++++++++++++++++++++
 meta/recipes-support/curl/curl/CVE-2019-3822.patch | 47 ++++++++++++++++++
 meta/recipes-support/curl/curl/CVE-2019-3823.patch | 55 ++++++++++++++++++++++
 meta/recipes-support/curl/curl_7.61.0.bb           |  3 ++
 4 files changed, 155 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2018-16890.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2019-3822.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2019-3823.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2018-16890.patch b/meta/recipes-support/curl/curl/CVE-2018-16890.patch
new file mode 100644
index 0000000..3776f36
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2018-16890.patch
@@ -0,0 +1,50 @@
+From 53d3c2f92b4a7561b1006494badf8cf2ef9110c0 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Wed, 2 Jan 2019 20:33:08 +0100
+Subject: [PATCH 1/3] NTLM: fix size check condition for type2 received data
+
+Bug: https://curl.haxx.se/docs/CVE-2018-16890.html
+Reported-by: Wenxiang Qian
+CVE-2018-16890
+
+Upstream-Status: Backport
+[https://github.com/curl/curl/commit
+/b780b30d1377adb10bbe774835f49e9b237fb9bb]
+
+CVE: CVE-2018-16890
+
+Signed-off-by: Kevin Weng <t-keweng@microsoft.com>
+---
+ lib/vauth/ntlm.c | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/lib/vauth/ntlm.c b/lib/vauth/ntlm.c
+index cdb8d8f0d..0212756ab 100644
+--- a/lib/vauth/ntlm.c
++++ b/lib/vauth/ntlm.c
+@@ -5,7 +5,7 @@
+  *                            | (__| |_| |  _ <| |___
+  *                             \___|\___/|_| \_\_____|
+  *
+- * Copyright (C) 1998 - 2017, Daniel Stenberg, <daniel@haxx.se>, et al.
++ * Copyright (C) 1998 - 2019, Daniel Stenberg, <daniel@haxx.se>, et al.
+  *
+  * This software is licensed as described in the file COPYING, which
+  * you should have received as part of this distribution. The terms
+@@ -182,10 +182,11 @@ static CURLcode ntlm_decode_type2_target(struct Curl_easy *data,
+     target_info_len = Curl_read16_le(&buffer[40]);
+     target_info_offset = Curl_read32_le(&buffer[44]);
+     if(target_info_len > 0) {
+-      if(((target_info_offset + target_info_len) > size) ||
++      if((target_info_offset >= size) ||
++         ((target_info_offset + target_info_len) > size) ||
+          (target_info_offset < 48)) {
+         infof(data, "NTLM handshake failure (bad type-2 message). "
+-                    "Target Info Offset Len is set incorrect by the peer\n");
++              "Target Info Offset Len is set incorrect by the peer\n");
+         return CURLE_BAD_CONTENT_ENCODING;
+       }
+ 
+-- 
+2.22.0
+
diff --git a/meta/recipes-support/curl/curl/CVE-2019-3822.patch b/meta/recipes-support/curl/curl/CVE-2019-3822.patch
new file mode 100644
index 0000000..4f612dd
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2019-3822.patch
@@ -0,0 +1,47 @@
+From 761b51f66c7b1cd2cd6c71b807bfdb6a27c49b30 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Thu, 3 Jan 2019 12:59:28 +0100
+Subject: [PATCH 2/3] ntlm: fix *_type3_message size check to avoid buffer
+ overflow
+
+Bug: https://curl.haxx.se/docs/CVE-2019-3822.html
+Reported-by: Wenxiang Qian
+CVE-2019-3822
+
+Upstream-Status: Backport
+[https://github.com/curl/curl/commit
+/50c9484278c63b958655a717844f0721263939cc]
+
+CVE: CVE-2019-3822
+
+Signed-off-by: Kevin Weng <t-keweng@microsoft.com>
+---
+ lib/vauth/ntlm.c | 11 +++++++----
+ 1 file changed, 7 insertions(+), 4 deletions(-)
+
+diff --git a/lib/vauth/ntlm.c b/lib/vauth/ntlm.c
+index 0212756ab..3be0403d9 100644
+--- a/lib/vauth/ntlm.c
++++ b/lib/vauth/ntlm.c
+@@ -777,11 +777,14 @@ CURLcode Curl_auth_create_ntlm_type3_message(struct Curl_easy *data,
+   });
+ 
+ #ifdef USE_NTRESPONSES
+-  if(size < (NTLM_BUFSIZE - ntresplen)) {
+-    DEBUGASSERT(size == (size_t)ntrespoff);
+-    memcpy(&ntlmbuf[size], ptr_ntresp, ntresplen);
+-    size += ntresplen;
++  /* ntresplen + size should not be risking an integer overflow here */
++  if(ntresplen + size > sizeof(ntlmbuf)) {
++    failf(data, "incoming NTLM message too big");
++    return CURLE_OUT_OF_MEMORY;
+   }
++  DEBUGASSERT(size == (size_t)ntrespoff);
++  memcpy(&ntlmbuf[size], ptr_ntresp, ntresplen);
++  size += ntresplen;
+ 
+   DEBUG_OUT({
+     fprintf(stderr, "\n   ntresp=");
+-- 
+2.22.0
+
diff --git a/meta/recipes-support/curl/curl/CVE-2019-3823.patch b/meta/recipes-support/curl/curl/CVE-2019-3823.patch
new file mode 100644
index 0000000..194e6e6
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2019-3823.patch
@@ -0,0 +1,55 @@
+From 40f6c913f63cdbfa81daa7ac7f1c7415bb99edeb Mon Sep 17 00:00:00 2001
+From: Daniel Gustafsson <daniel@yesql.se>
+Date: Sat, 19 Jan 2019 00:42:47 +0100
+Subject: [PATCH 3/3] smtp: avoid risk of buffer overflow in strtol
+
+If the incoming len 5, but the buffer does not have a termination
+after 5 bytes, the strtol() call may keep reading through the line
+buffer until is exceeds its boundary. Fix by ensuring that we are
+using a bounded read with a temporary buffer on the stack.
+
+Bug: https://curl.haxx.se/docs/CVE-2019-3823.html
+Reported-by: Brian Carpenter (Geeknik Labs)
+CVE-2019-3823
+
+Upstream-Status: Backport
+[https://github.com/curl/curl/commit
+/39df4073e5413fcdbb5a38da0c1ce6f1c0ceb484]
+
+CVE: CVE-2019-3823
+
+Signed-off-by: Kevin Weng <t-keweng@microsoft.com>
+---
+ lib/smtp.c | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/lib/smtp.c b/lib/smtp.c
+index ecf10a41a..1b9f92d30 100644
+--- a/lib/smtp.c
++++ b/lib/smtp.c
+@@ -5,7 +5,7 @@
+  *                            | (__| |_| |  _ <| |___
+  *                             \___|\___/|_| \_\_____|
+  *
+- * Copyright (C) 1998 - 2018, Daniel Stenberg, <daniel@haxx.se>, et al.
++ * Copyright (C) 1998 - 2019, Daniel Stenberg, <daniel@haxx.se>, et al.
+  *
+  * This software is licensed as described in the file COPYING, which
+  * you should have received as part of this distribution. The terms
+@@ -207,8 +207,12 @@ static bool smtp_endofresp(struct connectdata *conn, char *line, size_t len,
+      Section 4. Examples of RFC-4954 but some e-mail servers ignore this and
+      only send the response code instead as per Section 4.2. */
+   if(line[3] == ' ' || len == 5) {
++    char tmpline[6];
++
+     result = TRUE;
+-    *resp = curlx_sltosi(strtol(line, NULL, 10));
++    memset(tmpline, '\0', sizeof(tmpline));
++    memcpy(tmpline, line, (len == 5 ? 5 : 3));
++    *resp = curlx_sltosi(strtol(tmpline, NULL, 10));
+ 
+     /* Make sure real server never sends internal value */
+     if(*resp == 1)
+-- 
+2.22.0
+
diff --git a/meta/recipes-support/curl/curl_7.61.0.bb b/meta/recipes-support/curl/curl_7.61.0.bb
index 1027f75..c1e4342 100644
--- a/meta/recipes-support/curl/curl_7.61.0.bb
+++ b/meta/recipes-support/curl/curl_7.61.0.bb
@@ -13,6 +13,9 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://CVE-2018-16842.patch \
            file://CVE-2019-5435.patch \
            file://CVE-2019-5436.patch \
+           file://CVE-2018-16890.patch \
+           file://CVE-2019-3822.patch \
+           file://CVE-2019-3823.patch \
 "
 
 SRC_URI[md5sum] = "31d0a9f48dc796a7db351898a1e5058a"
-- 
2.7.4


