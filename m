Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E680C25B0D
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 06:42:56 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.22607.1659940974449487098
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:42:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ec7DMdQa;
 spf=pass (domain: gmail.com, ip: 209.85.218.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a7so14838552ejp.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QjMVRczQqplo/Ruttu07Cgi85KeY9hhU8ZBZPECt37k=;
        b=Ec7DMdQa0t8tGEHt4LrWfUhGeI0G7uSPmaNzXdn3QiNQUuO4IjUJQzkHLwofiQLbcJ
         XZOl4Wr6DKRJViib/Dxz/LG8aESqnkvtk7XvFM2hZvb34EZ5eGlCNB3ikrQcoDDzZutF
         6dCEOxQzpZrGxD1y5VrFETE610THyjJbC65wNfjt0csl0fafXcCA44No3OPnL9oT8sCK
         il8Tm/j/eNf8zlgjH9mjsrrmtEa0894tVTrmDYjl8Rh6x/N6bp7i5s0+R7R/O79IBi5+
         H3ILeU2UO0IlyNp7hZabzKUfr2T0x3siPmJuNoBvBWUC1cXZgybT2skZVTonnwuasVf+
         0nPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QjMVRczQqplo/Ruttu07Cgi85KeY9hhU8ZBZPECt37k=;
        b=TD7YeH+uci/liD1CuFHwvJm2WX12zThnxux14yDzyQK4/G0uAptY852W5CsX0S5kSX
         nQTtI2mRy077pX8dSQwsJqQOl5wiM0kjeLjlEtAOpMOp0Z8aeggtKWIAvXnovzQhXQNa
         ea/FI7bCMBj+Io6yYjGtNsa4z6AW9J5mGL0ItRbFL6b3KpeLuoyn6RDamTbnE4mxJQR8
         TbfARTpsJTPcJAGU1/JaFs5pkM7Cc8/Tt9aHVK81IZ5KCNjo7jlfzAXrNGA7DqyU3IY/
         WcGM0J5TESsn85gdSFr/pccc7Abzc7oq3d5Ep0eL33FhZFuTO9FF8wuzfEKi9pLaxfNF
         cqcA==
X-Gm-Message-State: ACgBeo0gsJodJSQ90QqqxSsDwg0ggt2UZSzV31wWQbPKkK1Afa5VYq4N
	nPUno4FI8gXgfH6fvmHVz5nLNMiAAEA=
X-Google-Smtp-Source: 
 AA6agR6Bb8gTT3UKbiLoask9LH9EMXrJRo/e6nhpJ05LtLb3X2T5ITEnxnGCt4JQfc7siyVcwFI64g==
X-Received: by 2002:a17:906:a402:b0:72b:8e6e:64ea with SMTP id
 l2-20020a170906a40200b0072b8e6e64eamr13151823ejz.469.1659940972931;
        Sun, 07 Aug 2022 23:42:52 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 q19-20020aa7da93000000b0043bd2a79311sm4153477eds.37.2022.08.07.23.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 23:42:52 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 13/44] harfbuzz: upgrade 4.4.1 -> 5.1.0
Date: Mon,  8 Aug 2022 08:42:06 +0200
Message-Id: <20220808064237.3975347-13-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220808064237.3975347-1-alex@linutronix.de>
References: <20220808064237.3975347-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 06:42:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169037

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...0001-fix-signedness-of-char-in-tests.patch | 27 +++++++++++++++++++
 .../{harfbuzz_4.4.1.bb => harfbuzz_5.1.0.bb}  |  6 +++--
 2 files changed, 31 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/harfbuzz/harfbuzz/0001-fix-signedness-of-char-in-tests.patch
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_4.4.1.bb => harfbuzz_5.1.0.bb} (90%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz/0001-fix-signedness-of-char-in-tests.patch b/meta/recipes-graphics/harfbuzz/harfbuzz/0001-fix-signedness-of-char-in-tests.patch
new file mode 100644
index 0000000000..029ca2bfff
--- /dev/null
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz/0001-fix-signedness-of-char-in-tests.patch
@@ -0,0 +1,27 @@
+From 1bd3884bc0544ffbb6545ed2391f0932bb8d7d91 Mon Sep 17 00:00:00 2001
+From: psykose <alice@ayaya.dev>
+Date: Mon, 1 Aug 2022 07:45:25 +0000
+Subject: [PATCH] fix signedness of char in tests
+
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ src/test-repacker.cc | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/test-repacker.cc b/src/test-repacker.cc
+index 053c0c6..1b7e1f0 100644
+--- a/src/test-repacker.cc
++++ b/src/test-repacker.cc
+@@ -112,9 +112,9 @@ static void start_lookup (int8_t type,
+                           hb_serialize_context_t* c)
+ {
+   char lookup[] = {
+-    0, type, // type
++    0, (char)type, // type
+     0, 0, // flag
+-    0, num_subtables, // num subtables
++    0, (char)num_subtables, // num subtables
+   };
+ 
+   start_object (lookup, 6, c);
diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_4.4.1.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_5.1.0.bb
similarity index 90%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_4.4.1.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_5.1.0.bb
index c2867d2a9f..4c2d774803 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_4.4.1.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_5.1.0.bb
@@ -11,8 +11,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6ee0f16281694fb6aa689cca1e0fb3da \
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "harfbuzz-(?P<pver>\d+(\.\d+)+).tar"
 
-SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "c5bc33ac099b2e52f01d27cde21cee4281b9d5bfec7684135e268512478bc9ee"
+SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.xz \
+           file://0001-fix-signedness-of-char-in-tests.patch \
+           "
+SRC_URI[sha256sum] = "2edb95db668781aaa8d60959d21be2ff80085f31b12053cdd660d9a50ce84f05"
 
 inherit meson pkgconfig lib_package gtk-doc gobject-introspection
 
-- 
2.30.2


