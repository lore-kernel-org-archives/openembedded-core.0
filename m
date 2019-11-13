Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
	[209.85.210.178])
	by mail.openembedded.org (Postfix) with ESMTP id 3C69A7F7C9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 15:20:10 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id q13so1877563pff.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 07:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=JMwubMdWpFifMzl89mTTlj/8AHwkDlvQW6SDTDOW4/s=;
	b=G5ru/4tUAVGyw7AWWB7FV4KB4ifQoWcgm0CSin57MF9BtMRLV8SB3QP5s3PC2y5vd4
	PkARZLDun4S+Z7hRBwShZHWFNe/i7ICgXPuWvcWuFWC4P1W9ySVFwIVl5hHvJ6oUaggU
	FJgpBuBp4kDsnyw+kPnNDW4QXJ7IiBTu0SHF0nDwdvyxzv1WFEWUe3LYdyg7g4bH6kRo
	NPrF8fhXZSDQd+FkvpB5xtDWdvihGl6/LrK9BH9TwsOafa/H879wovp6Ig4roDcU71Js
	vu8b00UwAs3w3rU+ggfV+XSjijOjUkBnwC7WFxz0kujZEDvGuTU8ETXiItpuwa0nQTw+
	AZcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=JMwubMdWpFifMzl89mTTlj/8AHwkDlvQW6SDTDOW4/s=;
	b=jHaW6zSnNcJlDjY2M9T3ro6b9zRE4/BiQWC7F4dIyXcUp5ojXXBrE64GdhQxO7r5Wt
	7AFVlXvc9V9JvpM1y6iMCMNpmbcSn57MEzwVyuXUBQ5cPbiee3kvGe0trt0vUlkfqBoi
	YZ3U0UbAmvHoYm5zMCzKoBMccT9gnoiOqJWYnWgDW5za8ybCbj+zTiDuPD3hAQmd9wsZ
	aqzBVA3z8AQSMa4e0K1qRZoUhk0SKuZxSL6w6EXGEFLVkeGyJ/mu7ApoKi2Y+unu3SnV
	FSgguoie5/2cIdL7EqRasy+OEIJH5DRbIsO3StQXR+3VGtLwveuB5RBO/lZOM0RGy1fV
	aoYQ==
X-Gm-Message-State: APjAAAWBkVyPGbx11nNHlGdamLh9iY7atG7ZFU/F6EO2PpZhBkro23rQ
	ESTgOpVFNWKp+SjpwLB4Zv1WZbtX
X-Google-Smtp-Source: APXvYqyGTZXo7lnppYepJXWh/5/HLWJv8kFsfny42roVhcAHFJ3OMN8on/ukPb4XEsm2omS23vBQxw==
X-Received: by 2002:a17:90a:d155:: with SMTP id
	t21mr5492679pjw.84.1573658410923; 
	Wed, 13 Nov 2019 07:20:10 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id t8sm2622242pjr.25.2019.11.13.07.20.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Nov 2019 07:20:10 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2019 07:19:28 -0800
Message-Id: <0a1b1e88b936177344392e185fbd077622d88b3e.1573658232.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573658232.git.akuster808@gmail.com>
References: <cover.1573658232.git.akuster808@gmail.com>
Subject: [warrior 25/25] file: fix CVE-2019-18218
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
X-List-Received-Date: Wed, 13 Nov 2019 15:20:10 -0000

From: Ross Burton <ross.burton@intel.com>

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../file/file/CVE-2019-18218.patch                 | 55 ++++++++++++++++++++++
 meta/recipes-devtools/file/file_5.36.bb            |  3 +-
 2 files changed, 57 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/file/file/CVE-2019-18218.patch

diff --git a/meta/recipes-devtools/file/file/CVE-2019-18218.patch b/meta/recipes-devtools/file/file/CVE-2019-18218.patch
new file mode 100644
index 0000000..3d02c5a
--- /dev/null
+++ b/meta/recipes-devtools/file/file/CVE-2019-18218.patch
@@ -0,0 +1,55 @@
+cdf_read_property_info in cdf.c in file through 5.37 does not restrict the
+number of CDF_VECTOR elements, which allows a heap-based buffer overflow (4-byte
+out-of-bounds write).
+
+CVE: CVE-2019-18218
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 46a8443f76cec4b41ec736eca396984c74664f84 Mon Sep 17 00:00:00 2001
+From: Christos Zoulas <christos@zoulas.com>
+Date: Mon, 26 Aug 2019 14:31:39 +0000
+Subject: [PATCH] Limit the number of elements in a vector (found by oss-fuzz)
+
+---
+ src/cdf.c | 9 ++++-----
+ src/cdf.h | 1 +
+ 2 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/src/cdf.c b/src/cdf.c
+index 9d6396742..bb81d6374 100644
+--- a/src/cdf.c
++++ b/src/cdf.c
+@@ -1016,8 +1016,9 @@ cdf_read_property_info(const cdf_stream_t *sst, const cdf_header_t *h,
+ 				goto out;
+ 			}
+ 			nelements = CDF_GETUINT32(q, 1);
+-			if (nelements == 0) {
+-				DPRINTF(("CDF_VECTOR with nelements == 0\n"));
++			if (nelements > CDF_ELEMENT_LIMIT || nelements == 0) {
++				DPRINTF(("CDF_VECTOR with nelements == %"
++				    SIZE_T_FORMAT "u\n", nelements));
+ 				goto out;
+ 			}
+ 			slen = 2;
+@@ -1060,8 +1061,6 @@ cdf_read_property_info(const cdf_stream_t *sst, const cdf_header_t *h,
+ 					goto out;
+ 				inp += nelem;
+ 			}
+-			DPRINTF(("nelements = %" SIZE_T_FORMAT "u\n",
+-			    nelements));
+ 			for (j = 0; j < nelements && i < sh.sh_properties;
+ 			    j++, i++)
+ 			{
+diff --git a/src/cdf.h b/src/cdf.h
+index 2f7e554b7..05056668f 100644
+--- a/src/cdf.h
++++ b/src/cdf.h
+@@ -48,6 +48,7 @@
+ typedef int32_t cdf_secid_t;
+ 
+ #define CDF_LOOP_LIMIT					10000
++#define CDF_ELEMENT_LIMIT				100000
+ 
+ #define CDF_SECID_NULL					0
+ #define CDF_SECID_FREE					-1
diff --git a/meta/recipes-devtools/file/file_5.36.bb b/meta/recipes-devtools/file/file_5.36.bb
index 1a81fde..f169671 100644
--- a/meta/recipes-devtools/file/file_5.36.bb
+++ b/meta/recipes-devtools/file/file_5.36.bb
@@ -14,7 +14,8 @@ DEPENDS_class-native = "zlib-native"
 # Blacklist a bogus tag in upstream check
 UPSTREAM_CHECK_GITTAGREGEX = "FILE(?P<pver>(?!6_23).+)"
 
-SRC_URI = "git://github.com/file/file.git"
+SRC_URI = "git://github.com/file/file.git \
+           file://CVE-2019-18218.patch"
 
 SRCREV = "f3a4b9ada3ca99e62c62b9aa78eee4935a8094fe"
 S = "${WORKDIR}/git"
-- 
2.7.4


