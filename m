Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88FD9C77B76
	for <webhook@archiver.kernel.org>; Fri, 14 Apr 2023 23:43:09 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.2745.1681515782916175794
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Apr 2023 16:43:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=jqbMPBuX;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2467729fbc4so1538189a91.1
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Apr 2023 16:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681515782; x=1684107782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uMYwygJA8TwZ5wP0NjFSibLMOYG5mBYSK3GoVWXDS50=;
        b=jqbMPBuXohGIK//wjTcs9yXFN2z8e0jGe3b5AK3OZBmVY8dEUumFZRSZZ3soqMyl4J
         l2GNzUvPm4eesNtivfntFJ+LLX2AXS0f2kmiqEi2ZUhRzLuDfB233YkEIamVFtcec8hM
         miDW43mibVnYW9gTwIUm+JwSd6yhsbejZ6lHyiI369zjeTimReoK3MOoDiV26aE0f1+i
         x6w2rlCya+1ZCOTHB6AMVmQsqFEk5knTw+veQ11ef6Tkd0LJEMaIaZCWjfD4/ujvUrSY
         wR/h+e7NM+QQVk5KXm41eVretRrt28VUcDU/U9elrLvriq/HdWzVOaLPBNFBtwJQILKH
         7OiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681515782; x=1684107782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uMYwygJA8TwZ5wP0NjFSibLMOYG5mBYSK3GoVWXDS50=;
        b=TYoMaCLjC2JusHAesNOfE9oXfOmJHlRcP7VwxwfgPOb7yujFHYQIR4fL4xnzZ2I2WK
         yc1fpbKwVow8CBcDjYUO0SGy4U52STSxs1aDOA1WMMOvTBRwiVOufaGwsFA/wMp/Xfgn
         uoTjO9MTfyLNpOGatHSh30HBQUY0xftDOCEf/NOHZEcyw1WC/hn9+CMeTfF7szlnzdoF
         Uc2vdDTdvhWu7U/XYUHn0ff+mdAqdsTnptpkwhhcMbQe/lRqKh+AdM4GCrg754GphFFh
         oRQFXqzJY4UtkckXvlqKysaXx8SZUtLkkx0L+FvLhJRVAG6fTwMvnKMBTfBV9bIcyZlv
         /Mmg==
X-Gm-Message-State: AAQBX9er7awcndIVSNJwduXcH94Hb2I59A0LyTkRaXQq7dY6PQfSgeXP
	E0vmwgfO6EO3J76orU3VRpKVJ3M50F8=
X-Google-Smtp-Source: AKy350bI5YVn3vQlWkJ50iDyqok7YwoszdBz1rWVcjDdGbmMU1fAveYu0w6pcIz0+pASzmT+G55gwQ==
X-Received: by 2002:a05:6a00:2d90:b0:63b:7804:be90 with SMTP id fb16-20020a056a002d9000b0063b7804be90mr2269881pfb.0.1681515781976;
        Fri, 14 Apr 2023 16:43:01 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::ebd0])
        by smtp.gmail.com with ESMTPSA id x24-20020a62fb18000000b0062de9ef6915sm3476564pfm.216.2023.04.14.16.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 16:43:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [PATCH v3 2/3] gawk: Remove redundant patch
Date: Fri, 14 Apr 2023 16:42:57 -0700
Message-Id: <20230414234258.157267-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230414234258.157267-1-raj.khem@gmail.com>
References: <20230414234258.157267-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Apr 2023 23:43:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180007

This patch is doing the same things thats already being done in the
do_install_ptest where the problematic tests are being deleted from
final package. run-ptest script runs a find for available tests and runs
each test target found during run therefore its enough to remove
them from final install.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>
---
v2: New
v3: No change

 .../gawk/gawk/remove-sensitive-tests.patch    | 43 -------------------
 meta/recipes-extended/gawk/gawk_5.2.1.bb      |  1 -
 2 files changed, 44 deletions(-)
 delete mode 100644 meta/recipes-extended/gawk/gawk/remove-sensitive-tests.patch

diff --git a/meta/recipes-extended/gawk/gawk/remove-sensitive-tests.patch b/meta/recipes-extended/gawk/gawk/remove-sensitive-tests.patch
deleted file mode 100644
index ffae55058b..0000000000
--- a/meta/recipes-extended/gawk/gawk/remove-sensitive-tests.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 354d24baf7c51977d22ff61ad42e6a2cbd4dc8ac Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Tue, 21 Dec 2021 17:09:12 +0000
-Subject: [PATCH] gawk: remove load-sensitive tests
-
-These tests require an unloaded host as otherwise timing sensitive tests can fail
-https://bugzilla.yoctoproject.org/show_bug.cgi?id=14371
-
-Upstream-Status: Inappropriate
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
----
- test/Maketests | 10 ----------
- 1 file changed, 10 deletions(-)
-
-diff --git a/test/Maketests b/test/Maketests
-index 3a667af..f117697 100644
---- a/test/Maketests
-+++ b/test/Maketests
-@@ -2137,11 +2137,6 @@ symtab12:
- 	@-AWKPATH="$(srcdir)" $(AWK) -f $@.awk  >_$@ 2>&1 || echo EXIT CODE: $$? >>_$@
- 	@-$(CMP) "$(srcdir)"/$@.ok _$@ && rm -f _$@
- 
--timeout:
--	@echo $@ $(ZOS_FAIL)
--	@-AWKPATH="$(srcdir)" $(AWK) -f $@.awk  >_$@ 2>&1 || echo EXIT CODE: $$? >>_$@
--	@-$(CMP) "$(srcdir)"/$@.ok _$@ && rm -f _$@
--
- typedregex1:
- 	@echo $@
- 	@-AWKPATH="$(srcdir)" $(AWK) -f $@.awk  >_$@ 2>&1 || echo EXIT CODE: $$? >>_$@
-@@ -2371,11 +2366,6 @@ rwarray:
- 	@-AWKPATH="$(srcdir)" $(AWK) -f $@.awk  < "$(srcdir)"/$@.in >_$@ 2>&1 || echo EXIT CODE: $$? >>_$@
- 	@-$(CMP) "$(srcdir)"/$@.ok _$@ && rm -f _$@
- 
--time:
--	@echo $@
--	@-AWKPATH="$(srcdir)" $(AWK) -f $@.awk  >_$@ 2>&1 || echo EXIT CODE: $$? >>_$@
--	@-$(CMP) "$(srcdir)"/$@.ok _$@ && rm -f _$@
--
- mpfrbigint:
- 	@echo $@
- 	@-AWKPATH="$(srcdir)" $(AWK) -f $@.awk  -M >_$@ 2>&1 || echo EXIT CODE: $$? >>_$@
diff --git a/meta/recipes-extended/gawk/gawk_5.2.1.bb b/meta/recipes-extended/gawk/gawk_5.2.1.bb
index bbb26231a1..c914326563 100644
--- a/meta/recipes-extended/gawk/gawk_5.2.1.bb
+++ b/meta/recipes-extended/gawk/gawk_5.2.1.bb
@@ -16,7 +16,6 @@ PACKAGECONFIG[readline] = "--with-readline,--without-readline,readline"
 PACKAGECONFIG[mpfr] = "--with-mpfr,--without-mpfr, mpfr"
 
 SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
-           file://remove-sensitive-tests.patch \
            file://run-ptest \
            "
 
-- 
2.40.0


