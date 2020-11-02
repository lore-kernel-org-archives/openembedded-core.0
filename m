Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web09.1207.1604335775846993948
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:49:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MZlDV5jA;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id e18so3870115edy.6
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3uwpCMiBm6E5HogzUgTIxXPiqa6OMFxJ0fs70U319VQ=;
        b=MZlDV5jAVA638D6/Nq7bqURjoTNjbD0Bam/UC5D6Vu4cjEb6NlJxdLS6A6MkG3z7ds
         QgkC+TSj/SIftF5GeCupLyavFqBnaeLqBYVnMAu9WuaJHFiKeV91NP3gOLTXg6T+VlFh
         QxxS1bPQc9qp+Ke0dol682mrllcJAnXtGDn2ffiTKbM88SBZmRtgsrHGoJWBEUNJZUtZ
         wbQqFVohgZBsGF6QQhB3DM7i+mXJWiYwpRqK06Q7pADrKW2SDvjwMAV7ihl9PL5sdcqy
         4DVXrQEG5vlnx9y3wektdWWxQkn1r7DFox1djuDdDi50rNEdOHGx/r++QmScNhAjYrvg
         fznw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3uwpCMiBm6E5HogzUgTIxXPiqa6OMFxJ0fs70U319VQ=;
        b=qbDqm/Ng4nV11nLbX/VqmysSW886M631UpNkHsbJahehsQAMnDvg9RyUtyF+OIRT0L
         yXtq0rlFo398tyIhPbHAGg/BPmi7fRNYj+qnatao9k1D++N4V63jpQQFhI23Yl+pdPMv
         Bkue3shOqLaanDzgN0SCSBLIX+R/HatM1XYdeJQyA1qHx8EoX4JpyClQcINW5ZWwLGVK
         JKGSK7bdPHKOsCjFUo4dhkIiO1ZhxF7f2gnb+BnLoUxvUXRlNOzJzW7byy/1c1/1AMTI
         86XwU6MhWLTGM7++/l6AjQVDg07bpkx0uozSnxTVX+WzsTKAEx1GHTb7jJmjPIBZ/7ca
         EGiQ==
X-Gm-Message-State: AOAM5326RV85/x5SWbzsvceBhSnFA6ikrTEW2pAAkR6B5hAuXJugJSMC
	C5kW1hXvXYEzQYyMtqtDd4cY0Yp59j6VLQ==
X-Google-Smtp-Source: ABdhPJzLp0LCdRzF8qmNfePYIzli2uhZeHw5p75rpUJY3sAZPmHsdHXFOpKGJ4LFRALSTT/K1KEqdQ==
X-Received: by 2002:aa7:c6d9:: with SMTP id b25mr16908602eds.27.1604335774262;
        Mon, 02 Nov 2020 08:49:34 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:49:33 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 19/80] dmidecode: upgrade 3.2 -> 3.3
Date: Mon,  2 Nov 2020 17:48:06 +0100
Message-Id: <20201102164907.27572-19-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../0001-Committing-changes-from-do_unpack_extra.patch   | 9 +++++----
 .../dmidecode/{dmidecode_3.2.bb => dmidecode_3.3.bb}     | 3 +--
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/dmidecode/{dmidecode_3.2.bb => dmidecode_3.3.bb} (82%)

diff --git a/meta/recipes-devtools/dmidecode/dmidecode/0001-Committing-changes-from-do_unpack_extra.patch b/meta/recipes-devtools/dmidecode/dmidecode/0001-Committing-changes-from-do_unpack_extra.patch
index ce9d423104..d082459ca9 100644
--- a/meta/recipes-devtools/dmidecode/dmidecode/0001-Committing-changes-from-do_unpack_extra.patch
+++ b/meta/recipes-devtools/dmidecode/dmidecode/0001-Committing-changes-from-do_unpack_extra.patch
@@ -1,20 +1,21 @@
-From 00a3ace35d66e7ae60046e254a4d00f0f9c1abe2 Mon Sep 17 00:00:00 2001
+From 2c0437f47eaaf565aaccf0c0d150d5fc0fc734f5 Mon Sep 17 00:00:00 2001
 From: OpenEmbedded <oe.patch@oe>
 Date: Thu, 22 Nov 2018 12:05:04 +0000
 Subject: [PATCH] Do not install to /usr/local
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile b/Makefile
-index 77c9310..fc378fd 100644
+index 7aa729d..e079b18 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -30,7 +30,7 @@ CFLAGS += -O2
- LDFLAGS =
+@@ -31,7 +31,7 @@ CFLAGS += -D_FILE_OFFSET_BITS=64
+ LDFLAGS ?=
  
  DESTDIR =
 -prefix  = /usr/local
diff --git a/meta/recipes-devtools/dmidecode/dmidecode_3.2.bb b/meta/recipes-devtools/dmidecode/dmidecode_3.3.bb
similarity index 82%
rename from meta/recipes-devtools/dmidecode/dmidecode_3.2.bb
rename to meta/recipes-devtools/dmidecode/dmidecode_3.3.bb
index 63f4061cb7..3fc2b20f22 100644
--- a/meta/recipes-devtools/dmidecode/dmidecode_3.2.bb
+++ b/meta/recipes-devtools/dmidecode/dmidecode_3.3.bb
@@ -19,6 +19,5 @@ do_install() {
 	oe_runmake DESTDIR="${D}" install
 }
 
-SRC_URI[md5sum] = "9cc2e27e74ade740a25b1aaf0412461b"
-SRC_URI[sha256sum] = "077006fa2da0d06d6383728112f2edef9684e9c8da56752e97cd45a11f838edd"
+SRC_URI[sha256sum] = "82c737a780614c38a783e8055340d295e332fb12c7f418b5d21a0797d3fb1455"
 
-- 
2.29.0

