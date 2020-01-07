Return-Path: <jatedev@gmail.com>
Received: from mail-yw1-f50.google.com (mail-yw1-f50.google.com
	[209.85.161.50])
	by mail.openembedded.org (Postfix) with ESMTP id EEC567FDB0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jan 2020 03:36:12 +0000 (UTC)
Received: by mail-yw1-f50.google.com with SMTP id 192so22883245ywy.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Jan 2020 19:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Kq4jv7/DuN7SdYjRQBb+5Ox9oNhAgSrl+lBSIq/yd9E=;
	b=jdv8ARvcNQAEj85ncLq4Y5m3hdvmo9P4stdHvwpPQJ/fLRbUqyLfa5M1uRYBoUH8Rz
	mm6ALZbJnPcCv9G9IBUvN8K2gUtTdb8cUawv+1Aii9ptwOuAK3GxLi7kctfgn4vEbodl
	agVMfoUkwFKkvkBAktaeyTQB9Os14usrYWssz98i39WnxhEfv9olOTIdbowa5A4j9kgW
	+TwMeOUptUHOwbEAL/eU/dLEXQ6O5yG7xnqYprjwirnsH0uCaRcKFo6Os6RGbHi+rbAj
	MRtFG6IGnL7Xr+NJJiF06zNkTFcxjkbFRer3XFzsyu4tPLssDbqeRGFlEfEdGZsm1xSV
	D+xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Kq4jv7/DuN7SdYjRQBb+5Ox9oNhAgSrl+lBSIq/yd9E=;
	b=Atvg4VNdpbbvcxtwritq83zI+pGeJ46sshUk4pXfI4w0rRYXH3Z+EfeVv9O6TJy4XJ
	V3+QD44mE5rqruUraNJl5mRqtvrDj2tIQVoDstqIy7RQvHlt+xRvR1rb6neE+WpPR4nz
	hrH3dwNTfFgAtAsecmzqKUgrjFRKN7wb4ma6IxKKKrT5oz7/z3/HE68u44hXDBKej71S
	AmX1d/0dXsIv8/M5Tcc84R1zhUT4gKS4Nh8k6FvCDb/BBMpXtk6Dh44obXFsLzzzHhQn
	xUgF2pj4APCwjSyuGnK/vH6z0sLSui1YFz7zzv0M7IkkoMdUr85lIvtvPH8ZaoUJo9uf
	X/Kw==
X-Gm-Message-State: APjAAAWYDbHBPo1D9mBGagB86SPs7xbuM5KF/HiZGVGX5b9uV6wc1MFR
	UH1IL5hL3rg7v6TFqfunrPiX4kAr
X-Google-Smtp-Source: APXvYqw3S0ZIJEeMuvyeQdHwjQNi24nyI3BCFEuX4gDqszSj9oWlhqG4ioMdOhgj9FiQMa0Fd+Zydg==
X-Received: by 2002:a0d:d693:: with SMTP id
	y141mr74973184ywd.169.1578368173224; 
	Mon, 06 Jan 2020 19:36:13 -0800 (PST)
Received: from Jates-MBP.hsd1.fl.comcast.net
	(c-69-254-209-160.hsd1.fl.comcast.net. [69.254.209.160])
	by smtp.gmail.com with ESMTPSA id
	y206sm29945065ywa.102.2020.01.06.19.36.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Jan 2020 19:36:12 -0800 (PST)
From: Jate Sujjavanich <jatedev@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jan 2020 22:36:10 -0500
Message-Id: <20200107033610.95939-1-jatedev@gmail.com>
X-Mailer: git-send-email 2.17.2 (Apple Git-113)
Subject: [PATCH v6] zip: Add patch fixing zipnote segfault
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
X-List-Received-Date: Tue, 07 Jan 2020 03:36:13 -0000

This patch has been applied in several Linux distributions

Signed-off-by: Jate Sujjavanich <jatedev@gmail.com>
---
 .../zipnote-crashes-with-segfault.patch       | 22 +++++++++++++++++++
 meta/recipes-extended/zip/zip_3.0.bb          |  1 +
 2 files changed, 23 insertions(+)
 create mode 100644 meta/recipes-extended/zip/zip-3.0/zipnote-crashes-with-segfault.patch

diff --git a/meta/recipes-extended/zip/zip-3.0/zipnote-crashes-with-segfault.patch b/meta/recipes-extended/zip/zip-3.0/zipnote-crashes-with-segfault.patch
new file mode 100644
index 0000000000..ce6caff83e
--- /dev/null
+++ b/meta/recipes-extended/zip/zip-3.0/zipnote-crashes-with-segfault.patch
@@ -0,0 +1,22 @@
+Close the correct file descriptor
+
+https://bugs.archlinux.org/task/47713
+
+Signed-off-by: Jate Sujjavanich <jatedev@gmail.com>
+
+Upstream-Status: Inappropriate [no upstream]
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


