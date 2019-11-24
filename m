Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id 0D8B27FCC8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 23:51:08 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id o9so5601468plk.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 15:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=r1g73/lbr3zLMFInBRcaYkY3daDX/c8u2606Ed+ZZlc=;
	b=OpJ6vkj2f9vUfKYs+XzafKGRh03QaaPIciVk9HLbhRtZCQzbSdXX1zQeFeisAYSPeg
	E6FRmcjhlnURiYa9GYfl0Q19Ro/HmQ+Dl0Op77a7Qe5phO2ALXy8pxGTXGqiwrgYlFB0
	KzJgjP4YVyotj88vVqNDgovoJdNgyvTQI2B5FzkbccRXNM5bgZKYSStPG5Yw4wSoIvZA
	aY7JarKSY74zNoaD0qusA81pPJaW++ewp745ex7HU1a+Www8MpgVaMLViN0rzo9VSqCi
	PzjpRoGCKFFazLM0tObZg3udBQEaXfGKkrKrhom4GkEd1v7CRXXWfdGPb8pUlcLETvbm
	7mOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=r1g73/lbr3zLMFInBRcaYkY3daDX/c8u2606Ed+ZZlc=;
	b=FYQtJcdhg2M5exAlWN1L9UnkGJo24ot2jvYiN1ZpTd/1KQ5ZQ15KR//JbtK4rpcK8e
	ibCNx/Ql1Shew8GYKQxvwro9MKykkFsFmxQ/LozBvgg2o8QXdNh1AHYk3q6SQaq0Ef+F
	oRYV5KsIFQjBN9st5w2Mw7Apld0/NxU0BnBQ6vr/iFFHPdbasXVpp1nfkNXCh1mI/5G3
	QyFxD7bI0qx2JAev83Tuziq1OvrNcZBQW6uVv2Sq7YMvRN+2r1zDl0EPgy2tR+AU/d7k
	qCCZSOifPrachR2n2FnbvznOJzLQ7PEgbigeYcj/eQOVziqq1PgWfjpqnG8o4szaOJoU
	IF0g==
X-Gm-Message-State: APjAAAXPJlV9K2CXgqoVxnPCnBwAomncTzuilehWiiVz5e9+wtrY1BQ9
	swIyrAkss2X36xDvsPPrcqkCJQdT
X-Google-Smtp-Source: APXvYqzNoc/WYFpXJZZcM1F0kug5g5om5R0BpHzJ3NAaIcflAIOKCW+0VU44IhKzpohlEk6zDua/5A==
X-Received: by 2002:a17:90a:cb8f:: with SMTP id
	a15mr34369449pju.111.1574639469919; 
	Sun, 24 Nov 2019 15:51:09 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:69ac:e4d2:e89f:98da])
	by smtp.gmail.com with ESMTPSA id
	q200sm5619783pfq.87.2019.11.24.15.51.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 24 Nov 2019 15:51:09 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Nov 2019 15:50:33 -0800
Message-Id: <fe7f1effce4e441ccc5b145a5a4bbca2c557d32c.1574639349.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1574639349.git.akuster808@gmail.com>
References: <cover.1574639349.git.akuster808@gmail.com>
Subject: [zeus 28/35] opkg: Add upstream fixes for empty packages
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
X-List-Received-Date: Sun, 24 Nov 2019 23:51:09 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

An ipk with a zero size data.tar file caused opkg to crash with a
double free abort. Add the upstream fixes for this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/opkg/opkg/open_inner.patch   | 46 ++++++++++++++++++
 meta/recipes-devtools/opkg/opkg/opkg_archive.patch | 54 ++++++++++++++++++++++
 meta/recipes-devtools/opkg/opkg_0.4.1.bb           |  2 +
 3 files changed, 102 insertions(+)
 create mode 100644 meta/recipes-devtools/opkg/opkg/open_inner.patch
 create mode 100644 meta/recipes-devtools/opkg/opkg/opkg_archive.patch

diff --git a/meta/recipes-devtools/opkg/opkg/open_inner.patch b/meta/recipes-devtools/opkg/opkg/open_inner.patch
new file mode 100644
index 0000000..278e099
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/open_inner.patch
@@ -0,0 +1,46 @@
+From alejandro.delcastillo@ni.com Wed Nov 20 22:35:02 2019
+From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
+To: <opkg-devel@googlegroups.com>, <richard.purdie@linuxfoundation.org>
+CC: Alejandro del Castillo <alejandro.delcastillo@ni.com>
+Subject: [opkg][PATCH 2/2] open_inner: add support for empty payloads
+Date: Wed, 20 Nov 2019 16:34:48 -0600
+Message-ID: <20191120223448.26522-3-alejandro.delcastillo@ni.com>
+X-Mailer: git-send-email 2.22.0
+In-Reply-To: <20191120223448.26522-1-alejandro.delcastillo@ni.com>
+References: <20191120223448.26522-1-alejandro.delcastillo@ni.com>
+MIME-Version: 1.0
+Content-Type: text/plain
+Content-Transfer-Encoding: 8bit
+
+Support for empty compressed payloads need to be explicitly enabled on
+libarchive.
+
+Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
+
+Upstream-Status: Backport
+---
+ libopkg/opkg_archive.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/libopkg/opkg_archive.c b/libopkg/opkg_archive.c
+index 0e9ccea..f19cece 100644
+--- a/libopkg/opkg_archive.c
++++ b/libopkg/opkg_archive.c
+@@ -618,6 +618,13 @@ static struct archive *open_inner(struct archive *outer)
+         goto err_cleanup;
+     }
+ 
++    r = archive_read_support_format_empty(inner);
++    if (r != ARCHIVE_OK) {
++        opkg_msg(ERROR, "Empty format not supported: %s\n",
++                 archive_error_string(inner));
++        goto err_cleanup;
++    }
++
+     r = archive_read_open(inner, data, NULL, inner_read, inner_close);
+     if (r != ARCHIVE_OK) {
+         opkg_msg(ERROR, "Failed to open inner archive: %s\n",
+-- 
+2.22.0
+
+
diff --git a/meta/recipes-devtools/opkg/opkg/opkg_archive.patch b/meta/recipes-devtools/opkg/opkg/opkg_archive.patch
new file mode 100644
index 0000000..3e1ebae
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/opkg_archive.patch
@@ -0,0 +1,54 @@
+From alejandro.delcastillo@ni.com Wed Nov 20 22:35:01 2019
+Return-Path: <richard.purdie+caf_=rpurdie=rpsys.net@linuxfoundation.org>
+From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
+To: <opkg-devel@googlegroups.com>, <richard.purdie@linuxfoundation.org>
+CC: Alejandro del Castillo <alejandro.delcastillo@ni.com>
+Subject: [opkg][PATCH 1/2] opkg_archive.c: avoid double free on uncompress
+ error
+Date: Wed, 20 Nov 2019 16:34:47 -0600
+Message-ID: <20191120223448.26522-2-alejandro.delcastillo@ni.com>
+X-Mailer: git-send-email 2.22.0
+In-Reply-To: <20191120223448.26522-1-alejandro.delcastillo@ni.com>
+References: <20191120223448.26522-1-alejandro.delcastillo@ni.com>
+MIME-Version: 1.0
+Content-Type: text/plain
+Content-Transfer-Encoding: 8bit
+
+The open-inner function calls archive_read_open. On error,
+archive_read_open calls inner_close, which also closes the outter
+archive. On error, return NULL directly to avoid double free.
+
+
+Upstream-Status: Backport
+
+Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
+---
+ libopkg/opkg_archive.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libopkg/opkg_archive.c b/libopkg/opkg_archive.c
+index 3d87db1..0e9ccea 100644
+--- a/libopkg/opkg_archive.c
++++ b/libopkg/opkg_archive.c
+@@ -622,7 +622,7 @@ static struct archive *open_inner(struct archive *outer)
+     if (r != ARCHIVE_OK) {
+         opkg_msg(ERROR, "Failed to open inner archive: %s\n",
+                  archive_error_string(inner));
+-        goto err_cleanup;
++        return NULL;
+     }
+ 
+     return inner;
+@@ -683,7 +683,7 @@ static struct archive *extract_outer(const char *filename, const char *arname)
+ 
+     inner = open_inner(outer);
+     if (!inner)
+-        goto err_cleanup;
++        return NULL;
+ 
+     return inner;
+ 
+-- 
+2.22.0
+
+
diff --git a/meta/recipes-devtools/opkg/opkg_0.4.1.bb b/meta/recipes-devtools/opkg/opkg_0.4.1.bb
index 104f07f..1cd7dca 100644
--- a/meta/recipes-devtools/opkg/opkg_0.4.1.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.4.1.bb
@@ -14,6 +14,8 @@ PE = "1"
 SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz \
            file://opkg.conf \
            file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch \
+           file://opkg_archive.patch \
+           file://open_inner.patch \
            file://run-ptest \
 "
 
-- 
2.7.4


