Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 42E1C6C10D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 14:41:58 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id b5so8278866plr.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 06:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=nar3Hy4K6CQwM/B8IZ+sJ5lzxJCiWRZs54Voh4/2G5w=;
	b=DXeysW0UlDisW443EVk9V4DBQQLcZDH25qfhe8HobPommXhWLsgBaQyFLEA/KVYGCB
	fazK8pnReSomhj2oSUB8kbISXtfIlbaCu/BQH0O6i5Eb4faWcgFSf11mArfPSq4T6lve
	55TLxDYEJwtIccGT7W34k5uVw7MoON+89P8KXvffs0U/QPlP7rzWi5JTkxHkuC0FfJ8M
	jHyU8RIb13XDXgedl69uDXQv+8WAPpOrAjaCHo62kVhTqaRhd/MKIUcOcDefrDxBx3uR
	78pPpFgBz4cJpSwFzeXv3WMOioL/W6dPczs+sblWU1q7oGkCvqLERDVQgSAv7G/ox9zy
	BzEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=nar3Hy4K6CQwM/B8IZ+sJ5lzxJCiWRZs54Voh4/2G5w=;
	b=WYTAc6LrqVqS0d7guYT0jxGhelep+MndETA1GsC43rfB6E34m3UtTMm9ONwmx+5xU7
	Zff5rKdHuIBtrBuwRYtX5E4pV7oyykXjbWQZbw2wdJJzFbEt78yzNFI06D8QXaUMG14C
	2pG/I8oc8YiEZhNXJXHJZ7uH7iLKKRk2byubKVCQQrKNUlCdnBnHZGIp6aKV/2Kkq+0j
	klP8J30KNK1IuYNNXO18SKutxB5R5VHR1TmbsYzPgWrdK42tGzEG3BFmIw3shi8ej1LI
	gbdkLPnoMdVQZPxjCQWl4+FNNBy5V+arfVp02aLIs25nMwdctELUAliLGvlpcO5tWDfm
	PcTw==
X-Gm-Message-State: AGRZ1gIXF16xAB0b7MHJGCKV4xftwQQM2qu9KjGShPDOKnyOq1UT3wol
	98lAEcOwobgHCuI+y8CTIfA=
X-Google-Smtp-Source: AJdET5fdGx4YUAaFbVNlsE0+PSj2UlnOWRXYCPvPdpQr8Rqw42sedukYQvEqHM5f3j9UhdiOgKnwhg==
X-Received: by 2002:a17:902:b282:: with SMTP id
	u2mr22941163plr.89.1542638519350; 
	Mon, 19 Nov 2018 06:41:59 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:cd6c:2c60:eff2:335a])
	by smtp.gmail.com with ESMTPSA id
	w136sm26777300pfd.169.2018.11.19.06.41.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 19 Nov 2018 06:41:58 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Mon, 19 Nov 2018 06:41:53 -0800
Message-Id: <1542638517-19735-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/5] curl: update to 7.62.0
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
X-List-Received-Date: Mon, 19 Nov 2018 14:41:59 -0000

Drop all CVE patches now included in update.

For details see: https://curl.haxx.se/changes.html

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-support/curl/curl/CVE-2018-14618.patch | 37 -------------------
 .../recipes-support/curl/curl/CVE-2018-16839.patch | 35 ------------------
 .../recipes-support/curl/curl/CVE-2018-16840.patch | 43 ----------------------
 .../recipes-support/curl/curl/CVE-2018-16842.patch | 35 ------------------
 .../curl/{curl_7.61.0.bb => curl_7.62.0.bb}        |  8 +---
 5 files changed, 2 insertions(+), 156 deletions(-)
 delete mode 100644 meta/recipes-support/curl/curl/CVE-2018-14618.patch
 delete mode 100644 meta/recipes-support/curl/curl/CVE-2018-16839.patch
 delete mode 100644 meta/recipes-support/curl/curl/CVE-2018-16840.patch
 delete mode 100644 meta/recipes-support/curl/curl/CVE-2018-16842.patch
 rename meta/recipes-support/curl/{curl_7.61.0.bb => curl_7.62.0.bb} (91%)

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
diff --git a/meta/recipes-support/curl/curl/CVE-2018-16839.patch b/meta/recipes-support/curl/curl/CVE-2018-16839.patch
deleted file mode 100644
index bf972d2..0000000
--- a/meta/recipes-support/curl/curl/CVE-2018-16839.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 55b90532f9190dce40a325b3312d014c66dc3ae1 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Thu, 1 Nov 2018 15:27:35 +0800
-Subject: [PATCH] Curl_auth_create_plain_message: fix too-large-input-check
-
-CVE-2018-16839
-Reported-by: Harry Sintonen
-Bug: https://curl.haxx.se/docs/CVE-2018-16839.html
-
-Upstream-Status: Backport [https://github.com/curl/curl/commit
-/f3a24d7916b9173c69a3e0ee790102993833d6c5?diff=unified]
-
-CVE: CVE-2018-16839
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- lib/vauth/cleartext.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/vauth/cleartext.c b/lib/vauth/cleartext.c
-index 5d61ce6..1367143 100644
---- a/lib/vauth/cleartext.c
-+++ b/lib/vauth/cleartext.c
-@@ -74,7 +74,7 @@ CURLcode Curl_auth_create_plain_message(struct Curl_easy *data,
-   plen = strlen(passwdp);
- 
-   /* Compute binary message length. Check for overflows. */
--  if((ulen > SIZE_T_MAX/2) || (plen > (SIZE_T_MAX/2 - 2)))
-+  if((ulen > SIZE_T_MAX/4) || (plen > (SIZE_T_MAX/2 - 2)))
-     return CURLE_OUT_OF_MEMORY;
-   plainlen = 2 * ulen + plen + 2;
- 
--- 
-2.7.4
-
diff --git a/meta/recipes-support/curl/curl/CVE-2018-16840.patch b/meta/recipes-support/curl/curl/CVE-2018-16840.patch
deleted file mode 100644
index 3d086c4..0000000
--- a/meta/recipes-support/curl/curl/CVE-2018-16840.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 3c2846bec008e03d456e181d9ab55686da83f140 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Thu, 1 Nov 2018 15:33:35 +0800
-Subject: [PATCH] Curl_close: clear data->multi_easy on free to avoid
- use-after-free
-
-Regression from b46cfbc (7.59.0)
-CVE-2018-16840
-Reported-by: Brian Carpenter (Geeknik Labs)
-
-Bug: https://curl.haxx.se/docs/CVE-2018-16840.html
-
-Upstream-Status: Backport [https://github.com/curl/curl/commit/
-81d135d67155c5295b1033679c606165d4e28f3f]
-
-CVE: CVE-2018-16840
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- lib/url.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/lib/url.c b/lib/url.c
-index 27b2c1e..7ef7c20 100644
---- a/lib/url.c
-+++ b/lib/url.c
-@@ -320,10 +320,12 @@ CURLcode Curl_close(struct Curl_easy *data)
-        and detach this handle from there. */
-     curl_multi_remove_handle(data->multi, data);
- 
--  if(data->multi_easy)
-+  if(data->multi_easy) {
-     /* when curl_easy_perform() is used, it creates its own multi handle to
-        use and this is the one */
-     curl_multi_cleanup(data->multi_easy);
-+    data->multi_easy = NULL;
-+  }
- 
-   /* Destroy the timeout list that is held in the easy handle. It is
-      /normally/ done by curl_multi_remove_handle() but this is "just in
--- 
-2.7.4
-
diff --git a/meta/recipes-support/curl/curl/CVE-2018-16842.patch b/meta/recipes-support/curl/curl/CVE-2018-16842.patch
deleted file mode 100644
index 82e7557..0000000
--- a/meta/recipes-support/curl/curl/CVE-2018-16842.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 0e4a6058b130f07cfa52fde8a3cb6f2abfe4c700 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Thu, 1 Nov 2018 15:30:56 +0800
-Subject: [PATCH] voutf: fix bad arethmetic when outputting warnings to stderr
-
-CVE-2018-16842
-Reported-by: Brian Carpenter
-Bug: https://curl.haxx.se/docs/CVE-2018-16842.html
-
-Upstream-Status: Backport [https://github.com/curl/curl/commit
-/d530e92f59ae9bb2d47066c3c460b25d2ffeb211]
-
-CVE: CVE-2018-16842
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- src/tool_msgs.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/tool_msgs.c b/src/tool_msgs.c
-index 9cce806..05bec39 100644
---- a/src/tool_msgs.c
-+++ b/src/tool_msgs.c
-@@ -67,7 +67,7 @@ static void voutf(struct GlobalConfig *config,
-         (void)fwrite(ptr, cut + 1, 1, config->errors);
-         fputs("\n", config->errors);
-         ptr += cut + 1; /* skip the space too */
--        len -= cut;
-+        len -= cut + 1;
-       }
-       else {
-         fputs(ptr, config->errors);
--- 
-2.7.4
-
diff --git a/meta/recipes-support/curl/curl_7.61.0.bb b/meta/recipes-support/curl/curl_7.62.0.bb
similarity index 91%
rename from meta/recipes-support/curl/curl_7.61.0.bb
rename to meta/recipes-support/curl/curl_7.62.0.bb
index 56327a6..2baab2b 100644
--- a/meta/recipes-support/curl/curl_7.61.0.bb
+++ b/meta/recipes-support/curl/curl_7.62.0.bb
@@ -7,14 +7,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ef889a37a5a874490ac7ce116396f29a"
 
 SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
-           file://CVE-2018-14618.patch \
-           file://CVE-2018-16839.patch \
-           file://CVE-2018-16840.patch \
-           file://CVE-2018-16842.patch \
 "
 
-SRC_URI[md5sum] = "31d0a9f48dc796a7db351898a1e5058a"
-SRC_URI[sha256sum] = "5f6f336921cf5b84de56afbd08dfb70adeef2303751ffb3e570c936c6d656c9c"
+SRC_URI[md5sum] = "7adf426f80c68bbdd04d44b9bc171d61"
+SRC_URI[sha256sum] = "7802c54076500be500b171fde786258579d60547a3a35b8c5a23d8c88e8f9620"
 
 CVE_PRODUCT = "curl libcurl"
 inherit autotools pkgconfig binconfig multilib_header
-- 
2.7.4


