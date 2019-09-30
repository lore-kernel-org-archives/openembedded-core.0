Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id 1907871BEE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2019 04:48:21 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id i30so6694172pgl.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2019 21:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=BzB7vH//eWVq19WOL2q6aONVCwV2L6YjvlLpjrkKxS8=;
	b=gXH10RZTRAK2OpGqNgDmaiMAYucB8Qjzqq7yM0GN5DQFDGI9fq4sFx6a7/a5mD8tAm
	HGmaFGOhKCRiurX3p8EooqGPLxIMcnFRPdGeNO8cYp8T+h5jRdrGBYQi8E2Th44XI3EQ
	V9XrtNLKUGXTCYWNZ/cKLU3NjbOwEn/py4MTpg+Ir1b4bwA1+Cb2yGIMMbAJ3Tw0lRV7
	TfDDjCtbIM/0yEqzBLmNXXHOr6GbrTADVD6Bq5PqgUKqvht5moUX68uVHtcR5M4jhY9N
	FNo0pjvinA0AaebA6VjElY8CnZqfxYUiZnBpm8PpiacqjbVHZ/Ds2PASigPJ2BNPVcli
	NLrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=BzB7vH//eWVq19WOL2q6aONVCwV2L6YjvlLpjrkKxS8=;
	b=qcNfOYGmTZafVO9hQX4hbT7Wz2hH4PXe+ZMK3Fy/qU0U2CGBiMcFxDdsLhe0ThVcda
	zn0RJyuXXqeq7oYnF+UhN1BSD0Sv6k3vAlj41N3eJxtQkx5K/ax4LPhUc28lZigD8Nbd
	aDA20EOKVF1z7FKRGnrlxPYlz6fawgCptD3wvkvi8DdfaITRMkyNc6Nlt9AnfJ2dpz/N
	/LPmnNSR5o7/8VirhpLVmhZIvkblDtSNqH6NPQYewjdd6UeKivvg+A1LB8HE7Pji7Sab
	CXNy9jUfGhcWL51hiT4sMtyLcHy4v/CZRtVvAD6pF1jbhLKQ6krfzPKXovTkqPWRueA8
	cFlA==
X-Gm-Message-State: APjAAAXMnBZWwyMgaUTGj3xXezGBJ0255OCrtuFHxpeJopxeDJvn6nXV
	eJ1KaJqn3AgxH3rLUJRbVHObSbwwDg0=
X-Google-Smtp-Source: APXvYqzxD4IvhJos9x86B+BJT5+mg+IKvp2hbyDyl2UleT4iCrkv2RKGSRHE95O9ax7NPxlY8Ll4pQ==
X-Received: by 2002:a63:66c4:: with SMTP id a187mr22352873pgc.85.1569818902244;
	Sun, 29 Sep 2019 21:48:22 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:edf9:811d:ad92:85c2])
	by smtp.gmail.com with ESMTPSA id
	h15sm18888493pgn.76.2019.09.29.21.48.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 29 Sep 2019 21:48:21 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Sep 2019 21:47:23 -0700
Message-Id: <51fb10275cd9013e3c5fcb94f88e3529e2b8f069.1569818533.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569818533.git.akuster808@gmail.com>
References: <cover.1569818533.git.akuster808@gmail.com>
Subject: [warrior-next 28/54] dpkg: Use less as pager
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
X-List-Received-Date: Mon, 30 Sep 2019 04:48:22 -0000

From: Ricardo Ribalda Delgado <ricardo@ribalda.com>

Debian traditionaly uses /usr/bin/pager as the system pager, which is a
link to the user preferred pager. This is a Debianism.

Without this patch:

root@qt5122:~# dpkg -l
sh: pager: command not found
dpkg-query: error: showing package list on pager subprocess returned error exit status 127

Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/dpkg/dpkg/pager.patch | 21 +++++++++++++++++++++
 meta/recipes-devtools/dpkg/dpkg_1.19.4.bb   |  1 +
 2 files changed, 22 insertions(+)
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/pager.patch

diff --git a/meta/recipes-devtools/dpkg/dpkg/pager.patch b/meta/recipes-devtools/dpkg/dpkg/pager.patch
new file mode 100644
index 0000000..e56b9d2
--- /dev/null
+++ b/meta/recipes-devtools/dpkg/dpkg/pager.patch
@@ -0,0 +1,21 @@
+pager: Use less instead of pager
+
+pager is a Debianism. Istead use directly pager.
+
+Upstream-Status: Inappropriate [OE-Core integration specific]
+
+Suggested-by: Burton, Ross <ross.burton@intel.com>
+Signed-off-by: Ricardo Ribalda <ricardo@ribalda.com>
+diff --git a/lib/dpkg/dpkg.h b/lib/dpkg/dpkg.h
+index 2bb067a..6cbce80 100644
+--- a/lib/dpkg/dpkg.h
++++ b/lib/dpkg/dpkg.h
+@@ -95,7 +95,7 @@ DPKG_BEGIN_DECLS
+ #define MAXUPDATES         250
+ 
+ #define DEFAULTSHELL        "sh"
+-#define DEFAULTPAGER        "pager"
++#define DEFAULTPAGER        "less"
+ 
+ #define MD5HASHLEN           32
+ #define MAXTRIGDIRECTIVE     256
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.19.4.bb b/meta/recipes-devtools/dpkg/dpkg_1.19.4.bb
index c3dbda7..e6083e2 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.19.4.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.19.4.bb
@@ -13,6 +13,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/d/${BPN}/${BPN}_${PV}.tar.xz \
            file://0006-add-musleabi-to-known-target-tripets.patch \
            file://0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch \
            file://0001-dpkg-Support-muslx32-build.patch \
+           file://pager.patch \
            "
 SRC_URI_append_class-native = " file://glibc2.5-sync_file_range.patch \
                                 file://tweak-options-require-tar-1.27.patch \
-- 
2.7.4


