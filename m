Return-Path: <jpuhlman@gmail.com>
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
	[209.85.216.41])
	by mail.openembedded.org (Postfix) with ESMTP id 642B260AFC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 22:22:54 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id mj6so1517668pjb.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 15:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=C1lFo1QYUsnpjOT2cl2qJvj7zp90cm1noAB9F4zPhwo=;
	b=qHmO8STkmq+Y6P6d7BxGI9+rCZ6KDDQZc3yYEDZ1ov9yGcReimjQstgek4xOobvmMl
	XroUdZlCFawseW7Z12PgtiJR4CSBFkQHHnUlpzA83hPJA/XXV+TivjpE9Mu0ESVfwlzn
	ZkIApJkVuQg4nzHhCjs/49hJqwexeDO2nwx1xKeoubToqoWpOlx0I2NZ4dUoogBbkHtc
	MQy3+/PDFzvWpFs806I3r0rB3nhgq9fLYTgeK/c5p9iZs1dwndel0VuuCv/Fveekvakx
	tAjRj2Sa7KiPUNPgbCQTDZYoLIiG6q4pT9j1Crrk8zf69Ijh9uPpLr0ksMvz1e4wLXmt
	IUnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=C1lFo1QYUsnpjOT2cl2qJvj7zp90cm1noAB9F4zPhwo=;
	b=QwNgqfEnLrH75tN+oU503IiJAL3hVC+JlRYWRtceN8ObzSU9DJM+WYPOfXUYbGIaFK
	kK5zNY47VWSxzwwam2vmuDO3UK9KmO+0QyU5G3nnzxrXDFJaB0uNCj9tRk+nChlaCxQP
	ak/tXTq63KkPO4jwO4jIT7uiPl+/to3083yq7NRTJHcQVSVA6WBgpb72SBqyUw1bNca1
	5iZQnuX/gAAumfDcDe4Dub3VQZJxxTUrPikRyPS6Ywnk2tas4tIwVz8Hf/sEauKgUTXy
	y0AWhMo5/wlZlVbRk3pNSmmQ50x6EejjgySO1TRd7niGYmHtaKQxD9Q4m9ksOoIqfdjs
	+beg==
X-Gm-Message-State: ANhLgQ28UJxojpFmq62h+LsZ/N42nXP74r5x+riaXkbo7SxZaHIkWZ2d
	aS8tYI8IgfNjtKTFOy8kwzaH2uBQeAg=
X-Google-Smtp-Source: ADFU+vtcJBCiWV+2GuRe4o1FMBvkoAtEeM+C44ZAupJYe76Oe6eFHLw8MHsITWrqfcyncMIOR8pAkQ==
X-Received: by 2002:a17:902:bccb:: with SMTP id
	o11mr5169409pls.281.1583965375103; 
	Wed, 11 Mar 2020 15:22:55 -0700 (PDT)
Received: from workhorse.localdomain
	([2600:1700:4c90:60a0:56be:f7ff:fe12:d0bd])
	by smtp.gmail.com with ESMTPSA id
	k1sm29928526pgg.56.2020.03.11.15.22.54
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Mar 2020 15:22:54 -0700 (PDT)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id E183F2A05B0; Wed, 11 Mar 2020 15:22:52 -0700 (PDT)
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Mar 2020 15:22:48 -0700
Message-Id: <20200311222249.29880-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.13.3
Subject: [PATCH 1/2] babletrace2: make manpages multilib identical
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
X-List-Received-Date: Wed, 11 Mar 2020 22:22:54 -0000

From: Jeremy Puhlman <jpuhlman@mvista.com>

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 .../0001-Make-manpages-multilib-identical.patch    | 28 ++++++++++++++++++++++
 meta/recipes-kernel/lttng/babeltrace2_2.0.1.bb     |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multilib-identical.patch

diff --git a/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multilib-identical.patch b/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multilib-identical.patch
new file mode 100644
index 0000000000..2401b176e6
--- /dev/null
+++ b/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-multilib-identical.patch
@@ -0,0 +1,28 @@
+From 56986190e4b0c10945ce6aaa7ca10d6bd8a26a39 Mon Sep 17 00:00:00 2001
+From: Jeremy Puhlman <jpuhlman@mvista.com>
+Date: Mon, 9 Mar 2020 21:10:35 +0000
+Subject: [PATCH] Make manpages multilib identical
+
+Upstream-Status: Pending
+Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
+---
+ doc/man/asciidoc-attrs.conf.in | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/doc/man/asciidoc-attrs.conf.in b/doc/man/asciidoc-attrs.conf.in
+index ad1183f1..e11c7031 100644
+--- a/doc/man/asciidoc-attrs.conf.in
++++ b/doc/man/asciidoc-attrs.conf.in
+@@ -1,7 +1,7 @@
+ [attributes]
+ # default values
+-system_plugin_path="@LIBDIR@/babeltrace2/plugins"
+-system_plugin_provider_path="@LIBDIR@/babeltrace2/plugin-providers"
++system_plugin_path="@prefix@/lib*/babeltrace2/plugins"
++system_plugin_provider_path="@prefix@/lib*/babeltrace2/plugin-providers"
+ babeltrace_version="@PACKAGE_VERSION@"
+ enable_debug_info="@ENABLE_DEBUG_INFO_VAL@"
+ defrdport=5344
+-- 
+2.24.1
+
diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.0.1.bb b/meta/recipes-kernel/lttng/babeltrace2_2.0.1.bb
index 16953d6807..61bc7f5e6b 100644
--- a/meta/recipes-kernel/lttng/babeltrace2_2.0.1.bb
+++ b/meta/recipes-kernel/lttng/babeltrace2_2.0.1.bb
@@ -10,6 +10,7 @@ DEPENDS = "glib-2.0 util-linux popt bison-native flex-native"
 SRC_URI = "git://git.linuxfoundation.org/diamon/babeltrace.git;branch=stable-2.0 \
 	   file://run-ptest \
 	   file://0001-tests-do-not-run-test-applications-from-.libs.patch \
+           file://0001-Make-manpages-multilib-identical.patch \
 	  "
 SRCREV = "06df58f89ee51b1a2c6a2c187ec3f15691633910"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>2(\.\d+)+)$"
-- 
2.13.3


