Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15455C77B71
	for <webhook@archiver.kernel.org>; Fri, 14 Apr 2023 15:55:22 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.14069.1681487716375942140
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Apr 2023 08:55:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=KLz6bovM;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id fw22-20020a17090b129600b00247255b2f40so4915877pjb.1
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Apr 2023 08:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681487715; x=1684079715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h+REbhRopdeiI9Kg7kC+AxbVNnA62Btianr2YQdg6YY=;
        b=KLz6bovMZ6ponM0oEplRRjoHWbpfpeRKuIWUqttm5aGBZe88cnAGJ/1jzOC83KRiIW
         ZSG3xPDtvNrx4Y6ojFMmxjXLrTNVKnOdDN0kHVitYfT4oHPDOjUWmm6ppe56nyCvCPAK
         k/pJWOFvgX1Zl9kgtibajyg+M679SBttr6H8/M9wy6Nn29MYTW8Wa9OhW1FUaPsjInE4
         mbQK6QnPP3WwpO8n7C/qFMxZfkqx3oMKMieA9v/MJeGUqe6FgHL4PMvuQ5YbdBdwyow8
         oatWDxE3WumC9jy+uJywLwLynK/HplKA7SB7hFDXrOFVPvo6f0SvN5XwaWcms+6QFfSA
         s9UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681487716; x=1684079716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h+REbhRopdeiI9Kg7kC+AxbVNnA62Btianr2YQdg6YY=;
        b=J+99RKqtR6ANtcJIK7bOlp3x7BgxV0DbOjn2l3DTdHhCuTo7I3SNyA8mF69+G0w+eG
         JMYQizgDiMGjXnEawRM4L1+qkil2aUu+LBKhYzqiDXvW36CroBBPdlImc0KEPyXZtQLB
         o+A8+XWQKRc5x7Xgdt61aNcr0oH/Vf5uxa7AAmXtDSmj2hGY2+yfcQ1QFPOm8UUVorJm
         WENtaFRLm+9UWMNnNB+hqy0Lmmw+OV4apbeZ/G03fz3KdmsnUgAFiERby0w1aOyzLHnH
         oBW6ZMQb7fMIWUnRqU+tHPJw4NuBPQE7Mty6Q+sjTl8wFs71PVBoYpx2UEZlkNMYN/7a
         7tHg==
X-Gm-Message-State: AAQBX9fXtMVxvVxdAPcgQ2qsbGFmwiokfW9LF0U/cIqkK7j4afm9VB+E
	lQx9p/Vl5r12rH5TPL0IRLiteWZXLHs=
X-Google-Smtp-Source: AKy350YvGWQJY0kPIVSbO23cWX3j8TpYlplREjMZ7b42CDca0XA84Od183ogJ8PeKgNNQ2h+sK2vHQ==
X-Received: by 2002:a17:902:e886:b0:1a1:cef2:acd4 with SMTP id w6-20020a170902e88600b001a1cef2acd4mr3229223plg.21.1681487715508;
        Fri, 14 Apr 2023 08:55:15 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::ebd0])
        by smtp.gmail.com with ESMTPSA id u3-20020a17090282c300b001a1c721f7f8sm3218900plz.267.2023.04.14.08.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 08:55:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [PATCH v2 2/2] gawk: Remove redundant patch
Date: Fri, 14 Apr 2023 08:55:11 -0700
Message-Id: <20230414155511.91980-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230414155511.91980-1-raj.khem@gmail.com>
References: <20230414155511.91980-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Apr 2023 15:55:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180002

This patch is doing the same things thats already being done in the
do_install_ptest where the problematic tests are being deleted from
final package. run-ptest script runs a find for available tests and runs
each test target found during run therefore its enough to remove
them from final install.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>
---
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


