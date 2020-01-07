Return-Path: <jatedev@gmail.com>
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
	[209.85.219.172])
	by mail.openembedded.org (Postfix) with ESMTP id 320677FDC8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jan 2020 02:35:25 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id k5so3507652ybf.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Jan 2020 18:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=m8n/qgzjjDrjVHiCaoWGqmzuq1ZlEZb4N5K5rv9mA2Q=;
	b=tS5VrXS84x4SH3Gdsonw/pMZGT2kD+fs0lyTnU8seQyKUYY6iTEQ2Wc0stEz58PIhd
	M+eBkF61Nj1URUQ/X/ubqh61SjGBWtvq3KXYvIZaHghnKbtAppftitGGeeNz3b3O9Yc7
	EdPT2sKf4qUqIoaZA78wZGspAZLmwgMkPPqob8Rf0XyzIlh90Mj+bLiEGmnxt3ymzst9
	VamaBXWEh8S3TK/3G3XbF0Cby+iVG8ATQB/VPcAau6UFZPZy7rBUURV28c5eih5ITXLU
	ciY6MGri0yHwdGXSD1OJvzRMPQ3seTZrjSAl7uCVFvWWcHfTQ4djdYqIe09oayqGHCNb
	cEag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=m8n/qgzjjDrjVHiCaoWGqmzuq1ZlEZb4N5K5rv9mA2Q=;
	b=bJ8SJsMhglzyrlKxj+6LuUYOHLmR8TUHjiGjB1HYh2tvbaLELQiP+OyZs+Y93zgk1/
	+iu/LbWcPtEbbp2Bfjnbec73lCCyqrY20hlEa/s4sMsvlMKT6nXGtmA1bawiwXiycJOD
	BhrM5PWvtixB8NdHugOya73sCTEsNXnBxd4tqSWPgtd2gKgAj08rfpQINERYdbpriHHR
	7CJl6HL5NXkTg9BfWwYVjv/OEfRVYqSa1HDQmpX985GOLHZDoC+Yv6XXoZnBhewUfyxO
	Q0lkx7KCoQ7kYHsXBhtKW908ySF9rPE2qum92hoy9/tTyfLkRPMwhGDNXjEEnyHcFLCC
	QFoQ==
X-Gm-Message-State: APjAAAXtPUT90e0Czs4SNzzLhCgDbsDWo87fcjJ3oauV6C2N+Vp9LMar
	dMbScFOl8JljsTqNXs82QVkCugcm
X-Google-Smtp-Source: APXvYqxtQ2t1oUHHDdT6nqaT5AHIQaJDH/CSWLQEg3yXZ/5lKHDj5PBxSIhNvi/4CuXtVbvRu0Gc1w==
X-Received: by 2002:a25:dc8d:: with SMTP id
	y135mr64667051ybe.491.1578364525698; 
	Mon, 06 Jan 2020 18:35:25 -0800 (PST)
Received: from Jates-MBP.hsd1.fl.comcast.net
	(c-69-254-209-160.hsd1.fl.comcast.net. [69.254.209.160])
	by smtp.gmail.com with ESMTPSA id
	p62sm28395615ywc.44.2020.01.06.18.35.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Jan 2020 18:35:25 -0800 (PST)
From: Jate Sujjavanich <jatedev@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jan 2020 21:34:00 -0500
Message-Id: <20200107023400.95781-1-jatedev@gmail.com>
X-Mailer: git-send-email 2.17.2 (Apple Git-113)
Subject: [PATCH v4] zip: Add patch fixing zipnote segfault
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
X-List-Received-Date: Tue, 07 Jan 2020 02:35:25 -0000

This patch has been applied in several Linux distributions

Signed-off-by: Jate Sujjavanich <jatedev@gmail.com>
---
 .../zipnote-crashes-with-segfault.patch       | 20 +++++++++++++++++++
 meta/recipes-extended/zip/zip_3.0.bb          |  1 +
 2 files changed, 21 insertions(+)
 create mode 100644 meta/recipes-extended/zip/zip-3.0/zipnote-crashes-with-segfault.patch

diff --git a/meta/recipes-extended/zip/zip-3.0/zipnote-crashes-with-segfault.patch b/meta/recipes-extended/zip/zip-3.0/zipnote-crashes-with-segfault.patch
new file mode 100644
index 0000000000..aa10addb9e
--- /dev/null
+++ b/meta/recipes-extended/zip/zip-3.0/zipnote-crashes-with-segfault.patch
@@ -0,0 +1,20 @@
+Close the correct file descriptor
+
+https://bugs.archlinux.org/task/47713
+
+Upstream-Status: Pending
+
+diff --git a/zipnote.c b/zipnote.c
+index 5e02cb6..996f012 100644
+--- a/zipnote.c
++++ b/zipnote.c
+@@ -661,7 +661,7 @@ char **argv;            /* command line tokens */
+     if ((r = zipcopy(z)) != ZE_OK)
+       ziperr(r, "was copying an entry");
+   }
+-  fclose(x);
++  fclose(in_file);
+ 
+   /* Write central directory and end of central directory with new comments */
+   if ((c = zftello(y)) == (zoff_t)-1)    /* get start of central */
+   
diff --git a/meta/recipes-extended/zip/zip_3.0.bb b/meta/recipes-extended/zip/zip_3.0.bb
index a2cd7717ca..c00a932763 100644
--- a/meta/recipes-extended/zip/zip_3.0.bb
+++ b/meta/recipes-extended/zip/zip_3.0.bb
@@ -12,6 +12,7 @@ S = "${WORKDIR}/zip30"
 SRC_URI = "${SOURCEFORGE_MIRROR}/infozip/Zip%203.x%20%28latest%29/3.0/zip30.tar.gz \
            file://fix-security-format.patch \
            file://10-remove-build-date.patch \
+           file://zipnote-crashes-with-segfault.patch \
            "
 UPSTREAM_VERSION_UNKNOWN = "1"
 
-- 
2.17.2 (Apple Git-113)


