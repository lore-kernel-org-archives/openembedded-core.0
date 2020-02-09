Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id EE44F60CC9
	for <openembedded-core@openembedded.org>;
	Sun,  9 Feb 2020 16:10:04 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id w21so2520946pgl.9
	for <openembedded-core@openembedded.org>;
	Sun, 09 Feb 2020 08:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version:in-reply-to:references
	:content-transfer-encoding;
	bh=rwuUYYUEGsTopItuYxGrVvoSU1QeCwUQQkJf7Gg1OoI=;
	b=XArdnaMCh688WEbO2A/llhugDyStM/bggvCoftjCQteG5xYEf7sMLSTKW+nTRqwXE/
	MdH99YG1HxVSmfhtethpNlR69ctxAI/NrB29BBL0Dxohb8d21EX3jRHEsDW+WPnn/7qu
	tVSG2QXgxLdJcZVGNngeuWUU2aH6AVJDbVJDxofcM0q6TLpAHUvd1yUltN845I6Cz+En
	GpdSHMpvXvCY8cqujKqEeUllKYQkIPFwJFqZrH60epKo73mvjbF9MTsWBuK3HGZnd33p
	NGJ04mTcX1rDl5z3dyBJWZuvRXlSkWRSUbljTtiggEC+lXEl8qVXmak3Ox6xGPIueJrv
	Bv0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:in-reply-to:references:content-transfer-encoding;
	bh=rwuUYYUEGsTopItuYxGrVvoSU1QeCwUQQkJf7Gg1OoI=;
	b=dNPbnEZBS8jhfJJ3i4suatN1y+hOO3prkd8m/pUbUnsvKsiVjaZnF35QJKaPKEjTAZ
	EWItifx+bbIkO7tmrsf2B5z16CFYC+sNi5q1VJf7QrxMKyUwhm6l9Uz01TSnSqHSGQut
	w8hi15ZVnFGAn6Ve/HnkHwfmnuspe9eElleZvCu3bhDrYjBIuQLEh4OKVvh6xNQf6pOP
	hO51IPOCqyOPmTDV1zrcim1QEZwh/lqB+5HEdpHWPpSzMsWSvK5YRVMCjeARLecTeqv8
	8mJrSwfDIdmc65cdmJEmaLZMYWHVLixvMfvZH+EQqTIRu9na4dAK79qH9rPAHdEOG0VO
	GmcA==
X-Gm-Message-State: APjAAAXp9RBZ/IrN50zrmy5R80s00t3ia36FGG3dWmU82pGgCf76sTUF
	bIosMkRJwzddji1Zibo5pxIBjeeE
X-Google-Smtp-Source: APXvYqwcbw6q4dG/y7KUeFNArUhGicAHFiWbub/z68vDJSqRl7BlC0TX7e+pYOhz3MevtLRwzrQnCA==
X-Received: by 2002:a63:6dc1:: with SMTP id i184mr9579483pgc.321.1581264605800;
	Sun, 09 Feb 2020 08:10:05 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:154b:3780:5122:4aa9])
	by smtp.gmail.com with ESMTPSA id
	u126sm9408153pfu.182.2020.02.09.08.10.04
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 08:10:05 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun,  9 Feb 2020 08:09:31 -0800
Message-Id: <ea9c2f0892e44f2db30b0305f8ab09f3b86da8c6.1581264380.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
In-Reply-To: <cover.1581264380.git.akuster808@gmail.com>
References: <cover.1581264380.git.akuster808@gmail.com>
Subject: [zeus 03/29] curl: fix CVE-2019-15601
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
X-List-Received-Date: Sun, 09 Feb 2020 16:10:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Anuj Mittal <anuj.mittal@intel.com>

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../curl/curl/CVE-2019-15601.patch            | 46 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.66.0.bb      |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2019-15601.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2019-15601.patch b/meta/recipes-support/curl/curl/CVE-2019-15601.patch
new file mode 100644
index 0000000000..7bfaae7b21
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2019-15601.patch
@@ -0,0 +1,46 @@
+Upstream-Status: Backport [https://github.com/curl/curl/commit/1b71bc532bde8621fd3260843f8197182a467ff2]
+CVE: CVE-2019-15601
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+
+From 1b71bc532bde8621fd3260843f8197182a467ff2 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Thu, 7 Nov 2019 10:13:01 +0100
+Subject: [PATCH] file: on Windows, refuse paths that start with \\
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+... as that might cause an unexpected SMB connection to a given host
+name.
+
+Reported-by: Fernando Muñoz
+CVE-2019-15601
+Bug: https://curl.haxx.se/docs/CVE-2019-15601.html
+---
+ lib/file.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/lib/file.c b/lib/file.c
+index d349cd9241..166931d7f1 100644
+--- a/lib/file.c
++++ b/lib/file.c
+@@ -136,7 +136,7 @@ static CURLcode file_connect(struct connectdata *conn, bool *done)
+   struct Curl_easy *data = conn->data;
+   char *real_path;
+   struct FILEPROTO *file = data->req.protop;
+-  int fd;
++  int fd = -1;
+ #ifdef DOS_FILESYSTEM
+   size_t i;
+   char *actual_path;
+@@ -181,7 +181,9 @@ static CURLcode file_connect(struct connectdata *conn, bool *done)
+       return CURLE_URL_MALFORMAT;
+     }
+ 
+-  fd = open_readonly(actual_path, O_RDONLY|O_BINARY);
++  if(strncmp("\\\\", actual_path, 2))
++    /* refuse to open path that starts with two backslashes */
++    fd = open_readonly(actual_path, O_RDONLY|O_BINARY);
+   file->path = actual_path;
+ #else
+   if(memchr(real_path, 0, real_path_len)) {
diff --git a/meta/recipes-support/curl/curl_7.66.0.bb b/meta/recipes-support/curl/curl_7.66.0.bb
index d1975f2460..a54e0536e9 100644
--- a/meta/recipes-support/curl/curl_7.66.0.bb
+++ b/meta/recipes-support/curl/curl_7.66.0.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=be5d9e1419c4363f4b32037a2d3b7ffa"
 
 SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
+           file://CVE-2019-15601.patch \
 "
 
 SRC_URI[md5sum] = "c238aa394e3aa47ca4fcb0491774149f"
-- 
2.17.1


