Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id 238127EE4F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jul 2019 14:25:47 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id m9so17808051pls.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jul 2019 07:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=/nt0ErfpvOJadmsi5U3vsasjtwSucOvfJ9h1qaHoNSk=;
	b=dNZMnzyi774MVZlsGJG3wNomfGYTXNVWY0mqJmlQR3KW4yfNm6g6Cqop6FxZOoTanv
	IEfSITJIayRshVCbxqWrtUxvBLlxSAL0NWcECD21qcUL+VRrKhbwJZMgajQsnGM8qs0C
	KOWdzjxUAnIDPzx55G6E/8VgJa7RuCbrZZi6o/dv6fVMo5lTjMO8nsgMhBCfDWANhk08
	GZ9PhCi/XWHk874KzjlLuXsK5h32L/sSdHTGxdiy3oGpuXQ5dpKA9VwEvP6Vn90Drpk5
	fnjZaW5Bk6/CqNOVfxrVyvPIGZ84RH1qLuIIh3gSThnzdV7WGbDnCv09B+rJS21m7yTg
	bafg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=/nt0ErfpvOJadmsi5U3vsasjtwSucOvfJ9h1qaHoNSk=;
	b=cIgIQEjeKA7XH+3dsjnEiVcd9zHVDyH4jRFcYr0hroaElbyzod5LQy3pK1VgmYoFRn
	8z02GZsEQsBPFKjkIxFX54TIuFcR2LGUWgDh4IfGBDfzer44T65QrdfoT09rKNJWqJmS
	JSrk1nRT5JmJMot2/xheOQF0oKWSq4bdi+7/kiL6z4I6ILyiYXSx7Hp3SFjQGmrJNVR0
	uiAaBanqgJnNJ/y9qIoZcAVNWmgb8UL0ppGDg2HRwDQFjym+adL9SleEjeqm79ob7KIw
	1hSc6pJ++nR+S2JJRTiR35RouR84oPut7/rjAn0VMUfS9CiQz2f9SMW8bX2NvVz4s3Oh
	Ds4A==
X-Gm-Message-State: APjAAAWGy8MuvsCdXIuOc2UDkKnuMFL79nnZCzuszQwC3wQUZsCyKQKE
	Yq7gvhq/7By/2aRU2QroAsNcvXPv
X-Google-Smtp-Source: APXvYqxgnbKIgXJni8gQnLWyTtF48AX911SFeAwr1KX8BhktmJrfKcMny2GBEJ1wyi6A1/JqP3++cQ==
X-Received: by 2002:a17:902:20e9:: with SMTP id
	v38mr70964613plg.62.1563719149122; 
	Sun, 21 Jul 2019 07:25:49 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:bd4d:a6f4:da99:27b4])
	by smtp.gmail.com with ESMTPSA id
	a3sm28807750pfc.70.2019.07.21.07.25.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 21 Jul 2019 07:25:48 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 Jul 2019 07:25:15 -0700
Message-Id: <0dbd16a40a28bb75962f38c6ce450c909c22ee79.1563719003.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1563719003.git.akuster808@gmail.com>
References: <cover.1563719003.git.akuster808@gmail.com>
Subject: [thud] 26/30] lighttpd: fix CVE-2019-11072
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
X-List-Received-Date: Sun, 21 Jul 2019 14:25:48 -0000

From: Ross Burton <ross.burton@intel.com>

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../lighttpd/lighttpd/fix-http-parseopts.patch     | 51 ++++++++++++++++++++++
 meta/recipes-extended/lighttpd/lighttpd_1.4.51.bb  |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-extended/lighttpd/lighttpd/fix-http-parseopts.patch

diff --git a/meta/recipes-extended/lighttpd/lighttpd/fix-http-parseopts.patch b/meta/recipes-extended/lighttpd/lighttpd/fix-http-parseopts.patch
new file mode 100644
index 0000000..f3a0402
--- /dev/null
+++ b/meta/recipes-extended/lighttpd/lighttpd/fix-http-parseopts.patch
@@ -0,0 +1,51 @@
+CVE: CVE-2019-11072
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 32120d5b8b3203fc21ccb9eafb0eaf824bb59354 Mon Sep 17 00:00:00 2001
+From: Glenn Strauss <gstrauss@gluelogic.com>
+Date: Wed, 10 Apr 2019 11:28:10 -0400
+Subject: [PATCH] [core] fix abort in http-parseopts (fixes #2945)
+
+fix abort in server.http-parseopts with url-path-2f-decode enabled
+
+(thx stze)
+
+x-ref:
+  "Security - SIGABRT during GET request handling with url-path-2f-decode enabled"
+  https://redmine.lighttpd.net/issues/2945
+---
+ src/burl.c        | 6 ++++--
+ src/t/test_burl.c | 2 ++
+ 2 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/src/burl.c b/src/burl.c
+index 51182628..c4b928fd 100644
+--- a/src/burl.c
++++ b/src/burl.c
+@@ -252,8 +252,10 @@ static int burl_normalize_2F_to_slash_fix (buffer *b, int qs, int i)
+         }
+     }
+     if (qs >= 0) {
+-        memmove(s+j, s+qs, blen - qs);
+-        j += blen - qs;
++        const int qslen = blen - qs;
++        memmove(s+j, s+qs, (size_t)qslen);
++        qs = j;
++        j += qslen;
+     }
+     buffer_string_set_length(b, j);
+     return qs;
+diff --git a/src/t/test_burl.c b/src/t/test_burl.c
+index 7be9be50..f7a16815 100644
+--- a/src/t/test_burl.c
++++ b/src/t/test_burl.c
+@@ -97,6 +97,8 @@ static void test_burl_normalize (void) {
+     flags |= HTTP_PARSEOPT_URL_NORMALIZE_PATH_2F_DECODE;
+     run_burl_normalize(psrc, ptmp, flags, __LINE__, CONST_STR_LEN("/a/b?c=/"), CONST_STR_LEN("/a/b?c=/"));
+     run_burl_normalize(psrc, ptmp, flags, __LINE__, CONST_STR_LEN("/a/b?c=%2f"), CONST_STR_LEN("/a/b?c=/"));
++    run_burl_normalize(psrc, ptmp, flags, __LINE__, CONST_STR_LEN("%2f?"), CONST_STR_LEN("/?"));
++    run_burl_normalize(psrc, ptmp, flags, __LINE__, CONST_STR_LEN("/%2f?"), CONST_STR_LEN("//?"));
+     run_burl_normalize(psrc, ptmp, flags, __LINE__, CONST_STR_LEN("/a%2fb"), CONST_STR_LEN("/a/b"));
+     run_burl_normalize(psrc, ptmp, flags, __LINE__, CONST_STR_LEN("/a%2Fb"), CONST_STR_LEN("/a/b"));
+     run_burl_normalize(psrc, ptmp, flags, __LINE__, CONST_STR_LEN("/a%2fb?c=/"), CONST_STR_LEN("/a/b?c=/"));
diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.51.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.51.bb
index f28fd2f..5c828da 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.51.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.51.bb
@@ -18,6 +18,7 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
         file://lighttpd \
         file://lighttpd.service \
         file://0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch \
+        file://fix-http-parseopts.patch \
         "
 
 SRC_URI[md5sum] = "6e68c19601af332fa3c5f174245f59bf"
-- 
2.7.4


