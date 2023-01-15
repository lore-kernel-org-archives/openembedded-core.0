Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9960AC63797
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 18:44:12 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.146873.1673808244835989574
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jan 2023 10:44:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=H4J9v0b6;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id h192so18247903pgc.7
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 10:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8WB0rK0TmgyxjD+E2eifP7DpopaBYWzdlhNha/ifz+s=;
        b=H4J9v0b6CQoa67Yy7mslEwkKqiBvhjTQMTXi7eHy49YxYusw8ddPsR8nS+k898OX+9
         BQLFM1HwVbZBGJKW06gb7xiiFoTSQXGANEfaRzjSR81muGu+AqGp6XfvYHbfrNRF3Qr7
         JX1FFTaKvxiQyr69s75xXf57vw+Xp2V89qzt9vjqxdKSf2G/aEh6PRbrR9sQfrIlCSkU
         hQ2STAGBk9cnp6ESLbps3IKHkL6MRxL5wWwB1xPM2oYd2CYIZ7Fo+4JgxXBorzpY142u
         yJeXW5A3wdFQFGltCDo2V60K4PVzYzLTRnmEK3h3zmCuim+926fpBprCai+QK2CFCbtq
         Mxew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8WB0rK0TmgyxjD+E2eifP7DpopaBYWzdlhNha/ifz+s=;
        b=IMYAFIFakgMyV7Jt5iv7pe+2Zbzdy3qHjvg/3nswJ3/CIqeNO5aWjRKU++zx+xuhFE
         SukWZou4nxSfufoN03vTcr4xf/YbXMjgtCtCR6Wuq8h+4KtE/Pie9u3kRNQ6BHYTdGCn
         lGRBDD63U2XvhqvP7Iq43EV00TINn8HA6q8S4qusQd9+EJ/Sh39O/9pWU3/yr+MxdBdM
         4WgdjYPad78PWEgh1X7tYg1niz2WspSoWmXs5exIY7QdtI+SRo0MxyO7eU5E3cs4s1VW
         vyQ0tbxj4CUlXg8K4YUMkrk5/QjJQq3gvD/1z5J8p0Z1aRI95T76D5+J1dFUeZorxwl6
         ATDA==
X-Gm-Message-State: AFqh2kpJdiH14SFiOB4FOlDsZEklix6FVlgcQR425VZNiuLBSEf+tV7P
	H9pt4gFvWbjrVQveLj+X/i/JOjz84BaD+A==
X-Google-Smtp-Source: AMrXdXvnTg5DvcaVPjNvZ//8J7feUaPuW3wBwtLy8RXPw5EFQEDdo5Pe+gp1gJml8Iar8O5ZJYbvZQ==
X-Received: by 2002:aa7:9614:0:b0:58b:b9cc:5724 with SMTP id q20-20020aa79614000000b0058bb9cc5724mr10526460pfg.15.1673808244061;
        Sun, 15 Jan 2023 10:44:04 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::b940])
        by smtp.gmail.com with ESMTPSA id x27-20020aa79a5b000000b0058bc7453285sm2665436pfj.217.2023.01.15.10.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jan 2023 10:44:03 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/3] binutils: Delete gdb and supporting sources
Date: Sun, 15 Jan 2023 10:43:57 -0800
Message-Id: <20230115184358.2276696-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230115184358.2276696-1-raj.khem@gmail.com>
References: <20230115184358.2276696-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 18:44:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175949

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/binutils/binutils.inc | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index 98acf0a222..2b38aeb62d 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -140,6 +140,16 @@ export CC_FOR_BUILD = "LD_LIBRARY_PATH= ${BUILD_CC}"
 
 MULTIARCH := "${@bb.utils.contains("DISTRO_FEATURES", "multiarch", "yes", "no", d)}"
 do_configure[vardeps] += "MULTIARCH"
+
+addtask do_prepare_sources after do_patch before do_configure
+
+# Remove gdb and supporting source directories, they are detected by
+# configure otherwise and demands additional gdb deps e.g. gmp, mpc, mpfr
+do_prepare_sources () {
+	rm -rf ${S}/gdb ${S}/gdbserver ${S}/gdbsupport ${S}/gnulib \
+	${S}/libbacktrace ${S}/libdecnumber ${S}/readline ${S}/sim
+}
+
 do_configure () {
 	(cd ${S} && gnu-configize)
 
-- 
2.39.0


