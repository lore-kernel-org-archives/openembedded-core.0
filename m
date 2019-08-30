Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id B18966B073
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 12:50:05 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id c3so6856576wrd.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 05:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=dLz9sAaeFdq2poJyE0ircmVylyOoKrmmHdFKHdaFNDE=;
	b=BX1hOmvI9qafPi6bHsOXacnJaMdCE+bo7AAVsZaV43csaWGkbm02zBJysLZ3cqobAu
	QyqxpOxFuAKNdh2GKsc79Kh5YmsGyw1WTXOcosxpEWR2q+a+KR9LoscJYpw4bk4f38SA
	AtLEatZoRHARr4R5a0Fka/L4N8mPXhZ3D8h+39RZDeW4y3+Oc4HoxwZmxs1U/rFxwzEH
	colOWJBDCDWDjLDxGcGgGwgn77+N135Sv/rEOKuq9LrpHh6F1D41pTVqK4x+IeJTPNmy
	31VZtsm6S9wh0YJhAeeoCcNyr2Ugb35voFEAQXbsH42a3BhA4M+DOnLKYqyvmgYUlNes
	FH9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=dLz9sAaeFdq2poJyE0ircmVylyOoKrmmHdFKHdaFNDE=;
	b=hEGUCkNd1N60fW2PK4DMiLOsNCtCE3/u8LqkMknTptbSfzO5GoGzZ6QglNNhGyu7R8
	7Xj8+6J46hBWkXO3OHAjff/DrufFNeBIJuD/wTbTSeQSqDk0xpw92bFlqmzxxs0eqo6y
	pIV8r4Wxbsv38IFg6xuBskAsJt/swQ6mZo1xadMcB6/trhVUFHdcLhdQQsatxQEBxuf9
	sxn7ObqjBXI8bSbjQ8pE9DnQurs5cfAZdny9jo5JOPOf111ow+G3pOIcOgHYrB2ZKAVp
	g/HxtK+tHcTeMYkMhccDbLJurcucGUKUT6Cq/NHU+rFrmhDej7t407ovajUuBsXNKp7r
	I7GQ==
X-Gm-Message-State: APjAAAUyaJiY3ECP++m4uHIQFv0DVUljKLYu8BAb822WsUcsY3zp3xA2
	rWqhxIX/nkcx30tf6zK9K8qvNSks
X-Google-Smtp-Source: APXvYqwtVrTrOPdrdx/EvQPBxjwz+7fn3gkrXjJGSeMYAkIKfifZybFw1Oq6W1NO5ogLkNTHUiAOow==
X-Received: by 2002:adf:f1cc:: with SMTP id z12mr18207139wro.125.1567169406173;
	Fri, 30 Aug 2019 05:50:06 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id d1sm6307481wrs.71.2019.08.30.05.50.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 30 Aug 2019 05:50:05 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Aug 2019 14:49:46 +0200
Message-Id: <70f874509a28f773bb8f959ff42e0a0b70f051b5.1567169002.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1567169002.git.alex.kanavin@gmail.com>
References: <cover.1567169002.git.alex.kanavin@gmail.com>
Subject: [PATCH 01/13] rpm: resolve a host contamination issue for mono packaging
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
X-List-Received-Date: Fri, 30 Aug 2019 12:50:05 -0000

This is perhaps not the most elegant patch but it be dropped
once rpm is updated to the soon-to-be-released version 4.15
where upstream has removed mono dependency resolution altogether.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...es-requires-do-not-use-monodis-from-.patch | 58 +++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_4.14.2.1.bb     |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/files/0001-mono-find-provides-requires-do-not-use-monodis-from-.patch

diff --git a/meta/recipes-devtools/rpm/files/0001-mono-find-provides-requires-do-not-use-monodis-from-.patch b/meta/recipes-devtools/rpm/files/0001-mono-find-provides-requires-do-not-use-monodis-from-.patch
new file mode 100644
index 00000000000..24aa4c7ffff
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0001-mono-find-provides-requires-do-not-use-monodis-from-.patch
@@ -0,0 +1,58 @@
+From 43fbc3f53302a395463e8450ac81c53f623eec3f Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 27 Aug 2019 17:42:34 +0200
+Subject: [PATCH] mono-find-provides/requires: do not use monodis from the host
+
+There was a host contamination issue here: if monodis was installed
+on the host, do_package would use that to resolve dependencies
+of mono libraries (and often fail in that). Without monodis,
+no dependencies are resolved, which is seemingly how things
+are supposed to work.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ scripts/mono-find-provides | 8 ++++----
+ scripts/mono-find-requires | 8 ++++----
+ 2 files changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/scripts/mono-find-provides b/scripts/mono-find-provides
+index 9348457d3..b28872ffb 100644
+--- a/scripts/mono-find-provides
++++ b/scripts/mono-find-provides
+@@ -18,11 +18,11 @@ monolist=($(printf "%s\n" "${filelist[@]}" | grep -E "\\.(exe|dll)\$"))
+ build_bindir="$2/usr/bin"
+ build_libdir="$2$3"
+ 
+-if [ -x $build_bindir/monodis ]; then
+-    monodis="$build_bindir/monodis"
++if [ -x $build_bindir/monodis.bogus ]; then
++    monodis="$build_bindir/monodis.bogus"
+     export LD_LIBRARY_PATH=$build_libdir${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}
+-elif [ -x /usr/bin/monodis ]; then
+-    monodis="/usr/bin/monodis"
++elif [ -x /usr/bin/monodis.bogus ]; then
++    monodis="/usr/bin/monodis.bogus"
+ else
+     exit 0;
+ fi
+diff --git a/scripts/mono-find-requires b/scripts/mono-find-requires
+index ea58cae48..d270169e1 100644
+--- a/scripts/mono-find-requires
++++ b/scripts/mono-find-requires
+@@ -18,11 +18,11 @@ monolist=($(printf "%s\n" "${filelist[@]}" | grep -E "\\.(exe|dll)\$"))
+ build_bindir="$2/usr/bin"
+ build_libdir="$2$3"
+ 
+-if [ -x $build_bindir/monodis ]; then
+-    monodis="$build_bindir/monodis"
++if [ -x $build_bindir/monodis.bogus ]; then
++    monodis="$build_bindir/monodis.bogus"
+     export LD_LIBRARY_PATH=$build_libdir${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}
+-elif [ -x /usr/bin/monodis ]; then
+-    monodis="/usr/bin/monodis"
++elif [ -x /usr/bin/monodis.bogus ]; then
++    monodis="/usr/bin/monodis.bogus"
+ else
+     exit 0;
+ fi
diff --git a/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb b/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
index 063f4269a57..c37330eb4c6 100644
--- a/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
@@ -41,6 +41,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.14.x \
            file://0001-perl-disable-auto-reqs.patch \
            file://0001-rpm-rpmio.c-restrict-virtual-memory-usage-if-limit-s.patch \
            file://0016-rpmscript.c-change-logging-level-around-scriptlets-t.patch \
+           file://0001-mono-find-provides-requires-do-not-use-monodis-from-.patch \
            "
 
 PE = "1"
-- 
2.17.1


