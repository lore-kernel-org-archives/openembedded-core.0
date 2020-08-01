Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.4585.1596317031459656825
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Aug 2020 14:23:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tLsHS5YS;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id o18so10271631eds.10
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2020 14:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E64UzZErYas+K3gtyJzkLEuPg89bqfr2A9moUxGF9RE=;
        b=tLsHS5YSHQZgMdE34LSWJ1bZphlHcQ3zHWgQon7XJkYbKLCApgLoaYSqv/F5313aYU
         A24j8LG+SV74N+wAdX38/OZTZEv143oFJO8X+b6o1jNjDE+zK2Mvz9x/UeyhLDv/Rrpu
         AoIneEV1uoN+c5ydRlrq1OhbgiNeKa8sOkTrqUNIK1sAjXaPw0qNBnfN6RIWjxoK+4sA
         8x8j0nbZRcgux7FwV5qRIuiwDxighJfBePieeK6h+M6sz7HWJf8xVdqB+As54EzQL+Xf
         tqlMNHwD+H2JeGb+hy1Eyo65R5w7zE5O3k9bHXVQc1coOn8gbkQ0NpyQEnoQ2ko+7Tk4
         r5AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E64UzZErYas+K3gtyJzkLEuPg89bqfr2A9moUxGF9RE=;
        b=T7+jWMiuk2NOwFc6M+sH2HWKDpidjYMyowvmpqYFuVYhAz8wwt2QrH77c0sFWEuofk
         vSh+6QrTGUlf0PfFtatAvn7nIFilSw+/Ah80Ls/YUgXHQJaZncXJBwsFzWGcvm1qr2Lb
         rQfvMwwQfaqiagPguej7wWAi32880IDz5hL2lRzBFz4QTOWslf6WM50k3ul549A2oIkj
         c/qHAWkPZcE4kntVhM5pzVXMz1NP1nLXKPwi94xRMynEGkqxkA8COrSVywPmr6/NDJue
         efgfa5J5Y9OjfUUdv3dnpjzEH7ax9H5ucMRxnp/E3ZuOKall+vDIl6yXYBJIrX5HAMM3
         MZxQ==
X-Gm-Message-State: AOAM533Y8PT8izY8LlSi2AJ9jTm8w7PgxDediN15tADVBoJVWyFdCFKu
	fH+XY3kTrzxanHtz7l4dFcrpRwt2h/Q=
X-Google-Smtp-Source: ABdhPJxq0+jXMptZIznPieKd29kjsEHvKPD6NG6jAPzqo9JImWWZBoo1Y31l9GCsHlWpTvweyioiVw==
X-Received: by 2002:aa7:dd49:: with SMTP id o9mr9743745edw.92.1596317029854;
        Sat, 01 Aug 2020 14:23:49 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box (cable-95-168-130-13.cust.telecolumbus.net. [95.168.130.13])
        by smtp.gmail.com with ESMTPSA id cm22sm12168803edb.44.2020.08.01.14.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2020 14:23:49 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 08/13] rsync: update 3.2.1 -> 3.2.2
Date: Sat,  1 Aug 2020 23:23:30 +0200
Message-Id: <20200801212335.14922-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200801212335.14922-1-alex.kanavin@gmail.com>
References: <20200801212335.14922-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../rsync/files/makefile-no-rebuild.patch          | 14 +++++++++-----
 .../rsync/{rsync_3.2.1.bb => rsync_3.2.2.bb}       |  2 +-
 2 files changed, 10 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/rsync/{rsync_3.2.1.bb => rsync_3.2.2.bb} (95%)

diff --git a/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch b/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
index 038a672095..4ba7665280 100644
--- a/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
+++ b/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
@@ -1,4 +1,4 @@
-From 5ae38baadd40a996da3d19a147f37e7f1f3355bf Mon Sep 17 00:00:00 2001
+From 1f29584e57f5fda09970c66f3b94f4720e09c1bb Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 12 Apr 2016 15:51:54 +0100
 Subject: [PATCH] rsync: remove upstream's rebuild logic
@@ -10,14 +10,14 @@ Upstream-Status: Inappropriate
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
 ---
- Makefile.in | 50 --------------------------------------------------
- 1 file changed, 50 deletions(-)
+ Makefile.in | 54 -----------------------------------------------------
+ 1 file changed, 54 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index 31ddc43..41c9a93 100644
+index 672fcc4..c12d8d4 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -167,56 +167,6 @@ gen: conf proto.h man
+@@ -168,60 +168,6 @@ gen: conf proto.h man
  gensend: gen
  	rsync -aic $(GENFILES) $${SAMBA_HOST-samba.org}:/home/ftp/pub/rsync/generated-files/
  
@@ -56,6 +56,10 @@ index 31ddc43..41c9a93 100644
 -	./config.status --recheck
 -	./config.status
 -
+-.PHONY: restatus
+-restatus:
+-	./config.status
+-
 -Makefile: Makefile.in config.status configure.sh config.h.in
 -	@if test -f Makefile; then cp -p Makefile Makefile.old; else touch Makefile.old; fi
 -	@./config.status
diff --git a/meta/recipes-devtools/rsync/rsync_3.2.1.bb b/meta/recipes-devtools/rsync/rsync_3.2.2.bb
similarity index 95%
rename from meta/recipes-devtools/rsync/rsync_3.2.1.bb
rename to meta/recipes-devtools/rsync/rsync_3.2.2.bb
index ea6b1ce38f..182628f4b4 100644
--- a/meta/recipes-devtools/rsync/rsync_3.2.1.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.2.2.bb
@@ -14,7 +14,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://makefile-no-rebuild.patch \
            "
 
-SRC_URI[sha256sum] = "95f2dd62979b500a99b34c1a6453a0787ada0330e4bec7fcffad37b9062d58d3"
+SRC_URI[sha256sum] = "644bd3841779507665211fd7db8359c8a10670c57e305b4aab61b4e40037afa8"
 
 # -16548 required for v3.1.3pre1. Already in v3.1.3.
 CVE_CHECK_WHITELIST += " CVE-2017-16548 "
-- 
2.27.0

