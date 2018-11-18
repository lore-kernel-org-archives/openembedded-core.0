Return-Path: <rehsack@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7A3806C100
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Nov 2018 18:36:39 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id p4so20534578wrt.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Nov 2018 10:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=h0BHSqUWPmmZMyikaDynvTVAIjZ4qkVKbHT0O/VzfDA=;
	b=YBRUoJDcBmMMVPLfTYDNewu/bxgenBz/0kPAlJHFx2xX8iolSjGRiC40vuWSn807Kv
	awWIgKlB7jzmanP7isaPNVhc95xFLMtroqSF9ra6Izi0RMFmIKCNdxrhQ+5sjxed80zT
	YXR8BZ8Av4xKb0FjO/7AbR2oSrJoMe3JuGYWNuSGTJeELyRe1bqQLca5dggn5eWsWEHg
	rZpr8cepTMZMb+MxNPjkmjs0S1SJW9sjuF779lJmR7yy4ys4G+YBH2ayvVvikXlQ3nSX
	4Ym8Yg+8WaMNW8LW/b1TBsA80EF6lZDl/jcTkPRY5Sc9plZyumgiGhr6lF2u3lOwdO/G
	JF9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=h0BHSqUWPmmZMyikaDynvTVAIjZ4qkVKbHT0O/VzfDA=;
	b=nP/dS9zlG5QYkwXm32rcPPFfv7SAW9k0uvU2xHmxWBVzo264n11Fj3o/BZGU+9t/iw
	3mb9cwPw87CrXDYypHeHzzR5lt0xHGf0zlrcPUPCYXZBUYYddixfF3GzSFoEczuXdus/
	3hBgTVWkyzLIu3m+DuawN1fmwOAjaEfctx/nJ5htz3L0DCJ0KvNcHyj7nVKhBVjTKDR+
	pLR/aN1mjdjTueacaQWDONponlFkKde27cHJIKHUU5v6Szrw2Ueauefqlw1Y1gAdbhQ7
	0bspgLY8wDEXWu/j7pI9gY6ROjlxZKUA+fvOrG/JOda47j972a8U+InGPBboJJk39h42
	Wq1Q==
X-Gm-Message-State: AA+aEWaqJ1ItdbHbC2ZISnpUR4WkYmYtRMhFo6D/wZv9FHVVBah18Vtd
	ofLqKIYNHXBWjltJ04UbepB4rbG3
X-Google-Smtp-Source: AFSGD/Uh8FmuWmuiCHKGx9MjAVwbca85bFTmpPy9a+vNR24tUtCbdyYJje2KPYCNAIy9ZzGWXbs0BQ==
X-Received: by 2002:adf:e707:: with SMTP id c7mr1763467wrm.196.1542566199976; 
	Sun, 18 Nov 2018 10:36:39 -0800 (PST)
Received: from beaker.muppets.liwing.de (b2b-78-94-80-58.unitymedia.biz.
	[78.94.80.58]) by smtp.gmail.com with ESMTPSA id
	d18-v6sm22555811wre.25.2018.11.18.10.36.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 18 Nov 2018 10:36:39 -0800 (PST)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 18 Nov 2018 19:36:31 +0100
Message-Id: <20181118183631.28137-1-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1
Cc: Jens Rehsack <sno@netbsd.org>
Subject: [PATCH] sqlite3: Update 3.25.2 -> 3.25.3
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
X-List-Received-Date: Sun, 18 Nov 2018 18:36:39 -0000

Update SQLite3 from 3.25.2 to 3.25.3 to fix following issues:

* Disallow the use of window functions in the recursive part of a CTE.
* Fix the behavior of typeof() and length() on virtual tables.
* Strengthen defenses against deliberately corrupted database files.
* Fix a problem in the query planner that results when a row-value
  expression is used with a PRIMARY KEY with redundant columns.
* Fix the query planner so that it works correctly for IS NOT NULL
  operators in the ON clause of a LEFT JOIN with the
  SQLITE_ENABLE_STAT4 compile-time option.

Also introduce PACKAGECONFIG tunables to enable/disable e.g. index
and search functions to allow shrinking the library for very small
targets.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta/recipes-support/sqlite/sqlite3.inc       | 12 ++++++++++--
 meta/recipes-support/sqlite/sqlite3_3.25.2.bb | 10 ----------
 meta/recipes-support/sqlite/sqlite3_3.25.3.bb | 10 ++++++++++
 3 files changed, 20 insertions(+), 12 deletions(-)
 delete mode 100644 meta/recipes-support/sqlite/sqlite3_3.25.2.bb
 create mode 100644 meta/recipes-support/sqlite/sqlite3_3.25.3.bb

diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support/sqlite/sqlite3.inc
index 1834867d10..daf3db5e9f 100644
--- a/meta/recipes-support/sqlite/sqlite3.inc
+++ b/meta/recipes-support/sqlite/sqlite3.inc
@@ -21,11 +21,19 @@ CVE_PRODUCT = "sqlite"
 
 inherit autotools pkgconfig
 
-PACKAGECONFIG ?= ""
-PACKAGECONFIG_class-native = ""
+# enable those which are enabled by default in configure
+PACKAGECONFIG ?= "fts4 fts5 json1 rtree dyn_ext"
+PACKAGECONFIG_class-native ?= "fts4 fts5 json1 rtree dyn_ext"
 
 PACKAGECONFIG[editline] = "--enable-editline,--disable-editline,libedit"
 PACKAGECONFIG[readline] = "--enable-readline,--disable-readline,readline ncurses"
+PACKAGECONFIG[fts3] = "--enable-fts3,--disable-fts3"
+PACKAGECONFIG[fts4] = "--enable-fts4,--disable-fts4"
+PACKAGECONFIG[fts5] = "--enable-fts5,--disable-fts5"
+PACKAGECONFIG[json1] = "--enable-json1,--disable-json1"
+PACKAGECONFIG[rtree] = "--enable-rtree,--disable-rtree"
+PACKAGECONFIG[session] = "--enable-session,--disable-session"
+PACKAGECONFIG[dyn_ext] = "--enable-dynamic-extensions,--disable-dynamic-extensions"
 
 EXTRA_OECONF = " \
     --enable-shared \
diff --git a/meta/recipes-support/sqlite/sqlite3_3.25.2.bb b/meta/recipes-support/sqlite/sqlite3_3.25.2.bb
deleted file mode 100644
index 31c9a6f2d2..0000000000
--- a/meta/recipes-support/sqlite/sqlite3_3.25.2.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require sqlite3.inc
-
-LICENSE = "PD"
-LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
-
-SRC_URI = "\
-  http://www.sqlite.org/2018/sqlite-autoconf-${SQLITE_PV}.tar.gz \
-  "
-SRC_URI[md5sum] = "bfade31d59f58badc51aeaa6ae26a5de"
-SRC_URI[sha256sum] = "da9a1484423d524d3ac793af518cdf870c8255d209e369bd6a193e9f9d0e3181"
diff --git a/meta/recipes-support/sqlite/sqlite3_3.25.3.bb b/meta/recipes-support/sqlite/sqlite3_3.25.3.bb
new file mode 100644
index 0000000000..a7cf6d1b81
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3_3.25.3.bb
@@ -0,0 +1,10 @@
+require sqlite3.inc
+
+LICENSE = "PD"
+LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
+
+SRC_URI = "\
+  http://www.sqlite.org/2018/sqlite-autoconf-${SQLITE_PV}.tar.gz \
+  "
+SRC_URI[md5sum] = "06db8206bc8febf07141b78ad58595ea"
+SRC_URI[sha256sum] = "00ebf97be13928941940cc71de3d67e9f852698233cd98ce2d178fd08092f3dd"
-- 
2.17.1


