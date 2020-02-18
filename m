Return-Path: <wallinux@gmail.com>
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
	[209.85.167.43])
	by mail.openembedded.org (Postfix) with ESMTP id 40C7F60C6C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 13:21:01 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id n25so14532751lfl.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 05:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=v01ntBED4eoFJYs6hTggnz4XyDY6c6IuU/Yt8LAZYNQ=;
	b=CLHkoNfZXaMF9qzOgSCqmhVIaGQOGUra8KqmHJht5Jeke1qSN0GFpGgZKaxSvSsM/O
	2SpbqTMGhzwTKKKccluS1OrXdkrwod1vLSthaZ9a1jdL3NSGDKkVx6/M3EOkcHRfWbMm
	P5+Lwa9jUN0snPw26EOn7PMjMFUd91kImgNavS5vqj87R8aR+M668RptGnpvAVQ6IBDW
	BOMB0nRVVKg0x0iW2IdBJfu7PKyVY1c/c7djmTNj4cXpf4d5UT/i0XJJI93hx3VdM8zl
	1UMRskCNMkOCWPlfjvuMR3RK3Ab63038y7jf0s4fOTW7/OTiS3g4saddNGAS8HxUfNYd
	xu+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=v01ntBED4eoFJYs6hTggnz4XyDY6c6IuU/Yt8LAZYNQ=;
	b=C47VKewC1K7FQieM4W6B9I/Ca1Nn3q/VgmqV2g8an1GOIJlg54/wF81xA6ofQRCLF2
	roaGSDnw7QPiaiwWGSO5i7+6PccC7fppC4K4RL8ho8EBBZitD1QkLbKKNAGQHIlbkDM4
	XKIR8wegS32PXMPNWwRbl4QxZ0WpZ1JHZaBugpY6WX60eqGP72JVWd3RheD2CnF1Z89W
	BSd+7AML0BvOtBsD+BC7TUO80zSYJ0DZr6Pe6kuTPqdNpCGxvNCbonppyL+shU59u464
	3lMulcPm/Yo+MQRSGcSEuvV6x5JZdqfR0sP4i616AykFtWpiWk9fG4mY1jzGlGn6wIvr
	RLxQ==
X-Gm-Message-State: APjAAAXPtnfNip2c6awHXWT2VBGs2TqWGlSXluvOnZSFxuW9D4Up+o8b
	M7+xXgj3CfxKKRFH0br5CGNmf21tsuk=
X-Google-Smtp-Source: APXvYqyycf4DOQorkBcbeN12f28qaWLKXUzgvQz3IMm6LTRZhBgYR79hn+BUgkQgHjh44vSLWfWKJQ==
X-Received: by 2002:a19:5014:: with SMTP id e20mr10315385lfb.3.1582032061358; 
	Tue, 18 Feb 2020 05:21:01 -0800 (PST)
Received: from arn-awallin-linux-l5.corp.ad.wrs.com
	(h-155-4-243-131.NA.cust.bahnhof.se. [155.4.243.131])
	by smtp.gmail.com with ESMTPSA id a9sm2318939lfk.23.2020.02.18.05.21.00
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 18 Feb 2020 05:21:00 -0800 (PST)
From: Anders Wallin <wallinux@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Feb 2020 14:20:54 +0100
Message-Id: <20200218132054.20341-1-wallinux@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH] babeltrace2: added 2.0.1
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
X-List-Received-Date: Tue, 18 Feb 2020 13:21:01 -0000
Content-Transfer-Encoding: 8bit

Babeltrace 1 vs. Babeltrace 2

The Babeltrace project exists since 2010. In 2020, Babeltrace 2 was released.
Babeltrace 2 is a complete rewrite of the library, Python bindings, and CLI. It
is plugin based and offers much more features and potential than Babeltrace 1.

Because Babeltrace 2 is still a young released project, some distributions still
provide packages for the Babeltrace 1 project. Both projects can coexist on the
same system as there are no common installed files.

Signed-off-by: Anders Wallin <wallinux@gmail.com>
---
 .../recipes-kernel/lttng/babeltrace2_2.0.1.bb | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/babeltrace2_2.0.1.bb

diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.0.1.bb b/meta/recipes-kernel/lttng/babeltrace2_2.0.1.bb
new file mode 100644
index 0000000000..d49a96faff
--- /dev/null
+++ b/meta/recipes-kernel/lttng/babeltrace2_2.0.1.bb
@@ -0,0 +1,26 @@
+SUMMARY = "Babeltrace2 - Trace Format Babel Tower"
+DESCRIPTION = "Babeltrace provides trace read and write libraries in host side, as well as a trace converter, which used to convert LTTng 2.0 traces into human-readable log."
+HOMEPAGE = "http://babeltrace.org/"
+BUGTRACKER = "https://bugs.lttng.org/projects/babeltrace"
+LICENSE = "MIT & GPLv2 & LGPLv2.1 & BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a6a458c13f18385b7bc5069a6d7b176e"
+
+DEPENDS = "glib-2.0 util-linux popt bison-native flex-native"
+
+SRC_URI = "git://git.linuxfoundation.org/diamon/babeltrace.git;branch=stable-2.0"
+SRCREV = "06df58f89ee51b1a2c6a2c187ec3f15691633910"
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)$"
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF = "--disable-debug-info"
+
+PACKAGECONFIG ??= "manpages"
+PACKAGECONFIG[manpages] = ", --disable-man-pages, asciidoc-native xmlto-native"
+
+FILES_${PN}-staticdev += "${libdir}/babeltrace2/plugins/*.a"
+FILES_${PN} += "${libdir}/babeltrace2/plugins/*.so"
+
+ASNEEDED = ""
-- 
2.25.0


