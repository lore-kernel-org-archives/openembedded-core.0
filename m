Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
	[209.85.210.182])
	by mail.openembedded.org (Postfix) with ESMTP id E16FA78A81
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Aug 2018 22:57:38 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id k21-v6so7538565pff.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Aug 2018 15:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7wmB5kpUKAitlijzkpxrSVXBSrvAqx3kK3/tCiAZDOk=;
	b=bJ817hfquJKCuuA12WlZAQCeojmAuJPtoBngtPk9+oi9OVjtJpryzux8iY9lk1/6J5
	E4JEfUHqQYJCbBEiysa9qpqizXnzSkZcR2uvXkL1DugigtKiTO7bYtNd9KjxBW1IfKsH
	0mNvp+KEP28VxuFlAGwojwW6/0IAxuBV45Cj09XFh/YK2QLVuKUWAaCw6rFjqJcHaRGM
	A9xPYc2sFMOhxAPGLDWS1c844wWUaOu0RbtkxVULAFoTtuynr/F/GSSmWn3FSs2T1G8Q
	SIZhkHdQur/6CtPZWNaOM+hhdHP/2PbZKG0caRfpFGVAHpvjuxALKxYJ/I9lTJDoiq6Q
	1Jxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7wmB5kpUKAitlijzkpxrSVXBSrvAqx3kK3/tCiAZDOk=;
	b=ZpYbsV27ImxY6Q4Xs/HIJyppg3+uy5Bj/u3QV/l4BDvXBY9tgJN5WoQKdbZLnVnV1H
	wKQgHWaksquxwHKM/Ju0fFy/+LClj3gAVmbx9bggKr/ai+/vMZxLQIeG9FuNOHUNdWWa
	lTcLKgwi0a7TrqDf1XLTNBpxfBsXSWUyRtodSegLnu8Jd089PqbnwVN3IMAKeXPX3uvC
	n258AJaNoXAAUyILrqPdCryqgJXg4eew6/AUnR4ICXVlj3JGmuR9kfMLSNStYOEj4HB9
	SdnRWjBgoa3unExJ887Y+ouxd/Pwd79K3v28T34gI0JRm/PuZbY4M0iFF08GXWUUDHI/
	2oVQ==
X-Gm-Message-State: AOUpUlHbNYGA1Z7dxryQ0apJWejXvzpfle8DgTVm78ReVwNajc4osaMv
	WtnKsYwnfx6o/FMdhrR1Q/HP5O48
X-Google-Smtp-Source: AAOMgpfoBNmU53hfKzOvE6rcDZEFxYknsfEiWXXoOG2PvwIp8uxne288aIufCfaAxo4/VUNrTN/Yqg==
X-Received: by 2002:a62:20f:: with SMTP id
	15-v6mr19247834pfc.100.1533596259678; 
	Mon, 06 Aug 2018 15:57:39 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::1d00])
	by smtp.gmail.com with ESMTPSA id
	x1-v6sm11993137pgr.59.2018.08.06.15.57.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Aug 2018 15:57:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Aug 2018 15:57:09 -0700
Message-Id: <563af53c1631ecf74494d2e28941874c05a39cb7.1533595822.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1533595822.git.raj.khem@gmail.com>
References: <cover.1533595822.git.raj.khem@gmail.com>
Subject: [PATCH 12/18] file: Update to 5.34
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
X-List-Received-Date: Mon, 06 Aug 2018 22:57:39 -0000

Distros which have glibc 2.28 on them otherwsise fail
to build due to some syscall mismatches

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../file/file/CVE-2018-10360.patch            | 32 -------------------
 .../file/file/fix-bogus-magic.patch           | 32 -------------------
 .../file/{file_5.33.bb => file_5.34.bb}       |  4 +--
 3 files changed, 1 insertion(+), 67 deletions(-)
 delete mode 100644 meta/recipes-devtools/file/file/CVE-2018-10360.patch
 delete mode 100644 meta/recipes-devtools/file/file/fix-bogus-magic.patch
 rename meta/recipes-devtools/file/{file_5.33.bb => file_5.34.bb} (91%)

diff --git a/meta/recipes-devtools/file/file/CVE-2018-10360.patch b/meta/recipes-devtools/file/file/CVE-2018-10360.patch
deleted file mode 100644
index 7f5671b834..0000000000
--- a/meta/recipes-devtools/file/file/CVE-2018-10360.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From df494f4ca494b5e1044052d96a6092a16ef1f6b3 Mon Sep 17 00:00:00 2001
-From: Christos Zoulas <christos@zoulas.com>
-Date: Sat, 9 Jun 2018 16:00:06 +0000
-Subject: [PATCH] Avoid reading past the end of buffer (Rui Reis)
-
-Upstream-Status: Backport
-[https://github.com/file/file/commit/a642587a9c9e2dd7feacdf513c3643ce26ad3c22]
-
-CVE: CVE-2018-10360
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- src/readelf.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/src/readelf.c b/src/readelf.c
-index 3df0836..d96a538 100644
---- a/src/readelf.c
-+++ b/src/readelf.c
-@@ -825,7 +825,8 @@ do_core_note(struct magic_set *ms, unsigned char *nbuf, uint32_t type,
- 
- 				cname = (unsigned char *)
- 				    &nbuf[doff + prpsoffsets(i)];
--				for (cp = cname; *cp && isprint(*cp); cp++)
-+				for (cp = cname; cp < nbuf + size && *cp
-+				    && isprint(*cp); cp++)
- 					continue;
- 				/*
- 				 * Linux apparently appends a space at the end
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/file/file/fix-bogus-magic.patch b/meta/recipes-devtools/file/file/fix-bogus-magic.patch
deleted file mode 100644
index 9a33ea7a0d..0000000000
--- a/meta/recipes-devtools/file/file/fix-bogus-magic.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From c637aaad6f0db5ad45a5296c837cb1f5253d3e3a Mon Sep 17 00:00:00 2001
-From: Christos Zoulas <christos@zoulas.com>
-Date: Thu, 24 May 2018 18:54:40 +0000
-Subject: [PATCH] fix bogus magic
-
-Upstream-Status: Backport
-[https://github.com/file/file/commit/4fb6a59df80d4974f8230bfce36e38e6de7d574f]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- magic/Magdir/dbpf | 6 ++----
- 1 file changed, 2 insertions(+), 4 deletions(-)
-
-diff --git a/magic/Magdir/dbpf b/magic/Magdir/dbpf
-index 65cab61e..e81c5538 100644
---- a/magic/Magdir/dbpf
-+++ b/magic/Magdir/dbpf
-@@ -9,9 +9,7 @@
- >4	ulelong	x	\b, version: %u.
- >>8	ulelong	x	\b%u
- >>>36	ulelong	x       \b, files: %u
-+>>24	ledate	!0	\b, created: %s
-+>>28	ledate	!0	\b, modified: %s
- !:ext	dbpf/package/dat/sc4
- !:mime	application/x-maxis-dbpf
--4	ulelong	1
-->8	ulelong	!1
-->>24	ledate	!0	\b, created: %s
-->>>28	ledate	!0	\b, modified: %s
--- 
-2.13.3
-
diff --git a/meta/recipes-devtools/file/file_5.33.bb b/meta/recipes-devtools/file/file_5.34.bb
similarity index 91%
rename from meta/recipes-devtools/file/file_5.33.bb
rename to meta/recipes-devtools/file/file_5.34.bb
index a29402a0ab..6612b71000 100644
--- a/meta/recipes-devtools/file/file_5.33.bb
+++ b/meta/recipes-devtools/file/file_5.34.bb
@@ -16,11 +16,9 @@ UPSTREAM_CHECK_GITTAGREGEX = "FILE(?P<pver>(?!6_23).+)"
 
 SRC_URI = "git://github.com/file/file.git \
         file://debian-742262.patch \
-        file://CVE-2018-10360.patch \
-        file://fix-bogus-magic.patch \
         "
 
-SRCREV = "219846094c7593e27453e62855e61181089c48cf"
+SRCREV = "315cef2f699da3c31a54bd3c6c6070680fbaf1f5"
 S = "${WORKDIR}/git"
 
 inherit autotools
-- 
2.18.0


