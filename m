Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
	[209.85.216.68])
	by mail.openembedded.org (Postfix) with ESMTP id 67DCC91697
	for <openembedded-core@openembedded.org>;
	Sun, 26 Jan 2020 16:25:05 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id m4so2105422pjv.3
	for <openembedded-core@openembedded.org>;
	Sun, 26 Jan 2020 08:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=S/ZSY4c1Zu7/wI2A9XR8DUvsTmjV7c70jPFE/W6YhHU=;
	b=NQ1C1AR4H/Usjnui7NrEahmZnJzQ/L/2WLPQpOeVXUWG3U2obOA+vzsBCb0a81yida
	e/GbpvMU4BGmXDcyAJqvxSgz8eB71xPT1KmifloDMvBEPA0dRfNfO238WLDFRLjemPBw
	51M9r3lRRbKUvVgRFArMsCsNW4/Q3bJwKTjv2YggXgRAQ/WMcSypdZFZCI15gA4pRunk
	enFUmvsqS1+Tzmu7rfZg+WUzRRAG61nISl1vW7JI4Wv7QFvvYqrBhAZKXOp8A+XR0MHh
	JA2l9AUMXrlVUD7mbc7XdqMZmafgt6dQGDeAykEQycIyv2qTKocjfFknONy39WQBa8ku
	VQXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=S/ZSY4c1Zu7/wI2A9XR8DUvsTmjV7c70jPFE/W6YhHU=;
	b=PESrJUQhTTs5k/4gYPYkIomXW85NWUbGghSOHFrVhH8K3aIib6YBX5KRaE0Mf9efp9
	Wmiv2NhF+P3a8R/RLByDrkfJqhFRG1HUybGigHEgshVvYJS1XaW7g8fp8cUdWtNC/wHr
	mDnb/MBFdqtmqm+ZB46qS6mx5tTWfToM4UbdOiLmAQuRODziNVsbohtmrtzVMvKG777t
	4KtRmfFy/X3VMtyfa/bO+2+UTSS4jTk4Zat8Zf23S6ohAlyyZt3+saRwgAch0szsC4Y2
	YmH6eejgTu5EG3zYaYeUt/h7xwRFqxrnV7RRNjRY7oF0hoIVSmGtQgNEG2O4hDuoxE1M
	Vq/w==
X-Gm-Message-State: APjAAAUAqty8BkVKqDS1XWEdTawH1lwsz/VMJD1UYKTenoACgN+mTyjZ
	gDzaXDq63FsFYmZQx8CgwdDXDt2q
X-Google-Smtp-Source: APXvYqzbRgR8g/5csQfytHV78drawI/JuYLVz+RtGClx60oB1cKEq4UlsKNiI1oywqtJP17xsFAS0Q==
X-Received: by 2002:a17:902:8d93:: with SMTP id
	v19mr13911685plo.327.1580055906624; 
	Sun, 26 Jan 2020 08:25:06 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:bddb:633c:e712:cec2])
	by smtp.gmail.com with ESMTPSA id
	f43sm13046556pje.23.2020.01.26.08.25.05
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 26 Jan 2020 08:25:06 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun, 26 Jan 2020 08:24:37 -0800
Message-Id: <abc2d1fad91f1378be3946e35d8f8f450823599e.1580055797.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1580055797.git.akuster808@gmail.com>
References: <cover.1580055797.git.akuster808@gmail.com>
Subject: [warrior 12/29] lighttpd: Backport the CVE-2019-11072 fix
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
X-List-Received-Date: Sun, 26 Jan 2020 16:25:06 -0000

From: Adrian Bunk <bunk@stusta.de>

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...x-abort-in-http-parseopts-fixes-2945.patch | 54 +++++++++++++++++++
 .../lighttpd/lighttpd_1.4.53.bb               |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-extended/lighttpd/lighttpd/0001-core-fix-abort-in-http-parseopts-fixes-2945.patch

diff --git a/meta/recipes-extended/lighttpd/lighttpd/0001-core-fix-abort-in-http-parseopts-fixes-2945.patch b/meta/recipes-extended/lighttpd/lighttpd/0001-core-fix-abort-in-http-parseopts-fixes-2945.patch
new file mode 100644
index 0000000000..123bb94c60
--- /dev/null
+++ b/meta/recipes-extended/lighttpd/lighttpd/0001-core-fix-abort-in-http-parseopts-fixes-2945.patch
@@ -0,0 +1,54 @@
+From 32120d5b8b3203fc21ccb9eafb0eaf824bb59354 Mon Sep 17 00:00:00 2001
+From: Glenn Strauss <gstrauss@gluelogic.com>
+Date: Wed, 10 Apr 2019 11:28:10 -0400
+Subject: [core] fix abort in http-parseopts (fixes #2945)
+
+fix abort in server.http-parseopts with url-path-2f-decode enabled
+
+(thx stze)
+
+x-ref:
+  "Security - SIGABRT during GET request handling with url-path-2f-decode enabled"
+  https://redmine.lighttpd.net/issues/2945
+
+CVE: CVE-2019-11072
+Upstream-Status: Backport
+Signed-off-by: Adrian Bunk <bunk@stusta.de>
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
+-- 
+2.17.1
+
diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.53.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.53.bb
index a0b350f358..1259e63bfe 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.53.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.53.bb
@@ -17,6 +17,7 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
         file://lighttpd.conf \
         file://lighttpd \
         file://0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch \
+        file://0001-core-fix-abort-in-http-parseopts-fixes-2945.patch \
         "
 
 SRC_URI[md5sum] = "f93436d8d400b2b0e26ee4bcc60b9ac7"
-- 
2.17.1


