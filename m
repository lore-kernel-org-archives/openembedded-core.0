Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.25164.1591602512791286533
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2020 00:48:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EaGgUGMm;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id k8so12576642edq.4
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2020 00:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wiEuD3k1uNTbF62Bl0E7SsVQv9XfopZQaOqoSxp0hdU=;
        b=EaGgUGMmnyzjmm7H+f2qdGWsepseTHY+hVfz5Yi7DAfCVXW1uX62MLrS92kpYSC8nc
         Qrj7Zq4D4uMZY3FcA/ji+/jivCsMqcw9YCo8AWkxZ5oaNZAOFssfraogIciSIXyHi86T
         XTHH6FvOOhK0kpn7R6MHYgcNG4SlR7jvVADkV7SX39+20e+A/7B/uozExF6Dg9XNLCOY
         ZqE5L1QnUm9tjeSMm/M5/KnsZJKnVAa9yxgLkhNU+C2i+M75E5dqL7SaVtknmn1VYqR1
         +DbRc3FEJPJdcImbaFxMTCeGpE/Rhix5V6vxORcyGM6ZSIE0C7SPH6vXsCkEBlgATgd2
         VQUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wiEuD3k1uNTbF62Bl0E7SsVQv9XfopZQaOqoSxp0hdU=;
        b=ee8ENzV44wCKuKchr7s6nTWjV9cySZlzRtFX/gqfVqLTUQ5bWeVjrBrJKJlV9CSUc1
         dHotY8A3KQ/U1o4f/P8V3ugUTq5U+7fwvhG3OIJgtzRR7sc9ETupMPVZCvIbML4zYaZ5
         OpnXHrOR46jKnCLY9DlqMTBYvAqsUNF3w5646e7RPQ/ofuLdp3cHgYxPqKDh22nd8PsF
         5RDK98OoNZ0ed20gpfK4mxjcaNFB0EpC/22OWlcsbmusBx8q8e7/2+hzVL7acfArSi5I
         VX9Ecct30bTEeSjwENTadEThkxwjVIbZNKwEhLO0IP2ItUQMkDhLahqSAOrr0wV6n2aw
         0vTA==
X-Gm-Message-State: AOAM532eAn85idXcFCdjed9tsomAJSk1GC087PxcGT1kgR+ko4HeHGDd
	gM+5YBjAFXuO6wUNP4y4/rXFA0z8DQM=
X-Google-Smtp-Source: ABdhPJwhrGPwZVFhh6cHLoiAcoKfVGCXZSBHzVkRog493HbLFp6XgiQqjXzKfxLO9Ped0Ll6tQL63g==
X-Received: by 2002:a50:98e3:: with SMTP id j90mr19632299edb.373.1591602511033;
        Mon, 08 Jun 2020 00:48:31 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.66.228])
        by smtp.gmail.com with ESMTPSA id g22sm12473466edj.63.2020.06.08.00.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 00:48:30 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 20/42] babeltrace2: upgrade 2.0.2 -> 2.0.3
Date: Mon,  8 Jun 2020 09:46:37 +0200
Message-Id: <20200608074659.7051-20-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200608074659.7051-1-alex.kanavin@gmail.com>
References: <20200608074659.7051-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../0001-fs.c-initialize-other_entry.patch    | 33 -------------------
 ...eltrace2_2.0.2.bb => babeltrace2_2.0.3.bb} |  9 +++--
 2 files changed, 4 insertions(+), 38 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/babeltrace2/0001-fs.c-initialize-other_entry.patch
 rename meta/recipes-kernel/lttng/{babeltrace2_2.0.2.bb => babeltrace2_2.0.3.bb} (94%)

diff --git a/meta/recipes-kernel/lttng/babeltrace2/0001-fs.c-initialize-other_entry.patch b/meta/recipes-kernel/lttng/babeltrace2/0001-fs.c-initialize-other_entry.patch
deleted file mode 100644
index b56b3bd6e0..0000000000
--- a/meta/recipes-kernel/lttng/babeltrace2/0001-fs.c-initialize-other_entry.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 42dae692b9057d03ce9a0651f061472e9dd90130 Mon Sep 17 00:00:00 2001
-From: Mingli Yu <mingli.yu@windriver.com>
-Date: Wed, 11 Mar 2020 08:44:42 +0000
-Subject: [PATCH] fs.c: initialize the other_entry variable
-
-Initialize the pointer other_entry to fix the below error:
-| ../../../../../git/src/plugins/ctf/fs-src/fs.c: In function 'ds_index_insert_ds_index_entry_sorted':
-| ../../../../../git/src/plugins/ctf/fs-src/fs.c:702:5: error: 'other_entry' may be used uninitialized in this function [-Werror=maybe-uninitialized]
-|   702 |    !ds_index_entries_equal(entry, other_entry)) {
-
-Upstream-Status: Submitted [https://lists.lttng.org/pipermail/lttng-dev/2020-March/029549.html]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- src/plugins/ctf/fs-src/fs.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/plugins/ctf/fs-src/fs.c b/src/plugins/ctf/fs-src/fs.c
-index e87523a3..a6b5315f 100644
---- a/src/plugins/ctf/fs-src/fs.c
-+++ b/src/plugins/ctf/fs-src/fs.c
-@@ -680,7 +680,7 @@ void ds_index_insert_ds_index_entry_sorted(
- 	struct ctf_fs_ds_index_entry *entry)
- {
- 	guint i;
--	struct ctf_fs_ds_index_entry *other_entry;
-+	struct ctf_fs_ds_index_entry *other_entry = NULL;
- 
- 	/* Find the spot where to insert this index entry. */
- 	for (i = 0; i < index->entries->len; i++) {
--- 
-2.24.1
-
diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.0.2.bb b/meta/recipes-kernel/lttng/babeltrace2_2.0.3.bb
similarity index 94%
rename from meta/recipes-kernel/lttng/babeltrace2_2.0.2.bb
rename to meta/recipes-kernel/lttng/babeltrace2_2.0.3.bb
index 7777f9b39b..c65882581d 100644
--- a/meta/recipes-kernel/lttng/babeltrace2_2.0.2.bb
+++ b/meta/recipes-kernel/lttng/babeltrace2_2.0.3.bb
@@ -8,12 +8,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a6a458c13f18385b7bc5069a6d7b176e"
 DEPENDS = "glib-2.0 util-linux popt bison-native flex-native"
 
 SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-2.0 \
-	   file://run-ptest \
-	   file://0001-tests-do-not-run-test-applications-from-.libs.patch \
+           file://run-ptest \
+           file://0001-tests-do-not-run-test-applications-from-.libs.patch \
            file://0001-Make-manpages-multilib-identical.patch \
-           file://0001-fs.c-initialize-other_entry.patch \
-	  "
-SRCREV = "33003c352ed56aa49e0b3df272bbab6fac36cae8"
+           "
+SRCREV = "91d154476e66735d705adda9ca5cbf5b5eea5940"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>2(\.\d+)+)$"
 
 S = "${WORKDIR}/git"
-- 
2.26.2

