Return-Path: <jatedev@gmail.com>
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
	[209.85.219.174])
	by mail.openembedded.org (Postfix) with ESMTP id 136B87FDC2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jan 2020 03:22:51 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id w126so21142712yba.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Jan 2020 19:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Zb/JzRhGkgUHhxi2Q9SsJZBa4jtmBVRU8CzHYTRoBa4=;
	b=oO6YhO0/q1R1GxM6Cu5mVJ3XlX8QobVHBaAZP2sEZiFLYyqGxk5WPUksMkt0dsiMHr
	v4pbJ8G4z+CwnJhhZoWAd1GhL7NRY6KfkKFZYAG6ojM4uqdi30VEz5RhXNx3QBhCfMQO
	nh8X8UxvU2HWDH65Lq3+pzz3tm8YX7KY4vmc846Fe91Tqa1KD8eHY9ppMjA8b5WomdgV
	4bhFiQ5W5YWkAht1EaRWltPb8DtvkbhrS1q1cVcaf2Dn8/YNwRbmfOU5JdfF9QwSDYj3
	xspo/+dRPztvvwQbyysXHu4qm88XSIMgGU9PSHl0AU7uFhYtGfLuE898fK9R54yvXkxz
	m7bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Zb/JzRhGkgUHhxi2Q9SsJZBa4jtmBVRU8CzHYTRoBa4=;
	b=PnQIP4hzb6adHki9Wsv+c0eZgTBGAAHoGrhobsEv6QR4amEk6CawuPq4I8tf7Tra6x
	kuVnY23uj1AFjRdYqqBbtNW7HgZUx1PGtDgR0SlcfzdWolBQmKy67YoEXALUvyivVuwr
	EA4/r0SIlzFp8f07LQI9lBZMNSvehTbuPPh1w9ORayEfwK0VSfsdlSN1h+mFslz6hwPw
	6i6yrGv/GY970Tk7hESJddvPvsiO+xu0XiPh1Fz2KTJr3FhBuEy2GeJmHNJLqOl4Eb5d
	M6dX9CicWe414GRj3wgDJFqFZKAjU+s/AifkTmRrQ5P1tAagDocjdNpC/n8HNrdX/QNV
	oOxQ==
X-Gm-Message-State: APjAAAWMt5UDrSZMkoUEsZRS/niJF8ahdyibIHI+TcI1y1Oalq4nD0iy
	6iou6b5IttBtbsJ1jYwtrK2YGvLy
X-Google-Smtp-Source: APXvYqyGMXQwEP+L3RXRi8BEuDNraFu2yFEsC1LjkqpyDFudyAjoy0pVceJWbL/Ev9qRMLU2ivLHDQ==
X-Received: by 2002:a25:324e:: with SMTP id y75mr79950945yby.100.1578367372611;
	Mon, 06 Jan 2020 19:22:52 -0800 (PST)
Received: from Jates-MBP.hsd1.fl.comcast.net
	(c-69-254-209-160.hsd1.fl.comcast.net. [69.254.209.160])
	by smtp.gmail.com with ESMTPSA id
	j68sm28216728ywg.6.2020.01.06.19.22.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Jan 2020 19:22:51 -0800 (PST)
From: Jate Sujjavanich <jatedev@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jan 2020 22:22:49 -0500
Message-Id: <20200107032249.95875-1-jatedev@gmail.com>
X-Mailer: git-send-email 2.17.2 (Apple Git-113)
Subject: [PATCH v5] zip: Add patch fixing zipnote segfault
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
X-List-Received-Date: Tue, 07 Jan 2020 03:22:52 -0000

This patch has been applied in several Linux distributions

Signed-off-by: Jate Sujjavanich <jatedev@gmail.com>
---
 .../zipnote-crashes-with-segfault.patch       | 22 +++++++++++++++++++
 meta/recipes-extended/zip/zip_3.0.bb          |  1 +
 2 files changed, 23 insertions(+)
 create mode 100644 meta/recipes-extended/zip/zip-3.0/zipnote-crashes-with-segfault.patch

diff --git a/meta/recipes-extended/zip/zip-3.0/zipnote-crashes-with-segfault.patch b/meta/recipes-extended/zip/zip-3.0/zipnote-crashes-with-segfault.patch
new file mode 100644
index 0000000000..e4d52c7dc6
--- /dev/null
+++ b/meta/recipes-extended/zip/zip-3.0/zipnote-crashes-with-segfault.patch
@@ -0,0 +1,22 @@
+Close the correct file descriptor
+
+https://bugs.archlinux.org/task/47713
+
+Signed-off-by: Jate Sujjavanich <jatedev@gmail.com>
+
+Upstream-Status: No Project Upstream
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


