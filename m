Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EECBEB597A
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 07:37:05 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14185.1770794651533699098
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 23:24:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=md/cEP5s;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: careers.myinfo@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-34be2be4b7cso1139050a91.3
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 23:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770794650; x=1771399450; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r/PwS98YxZ8bwQTw3xyA6jIzkifX/c6uS2Zelc1rjRw=;
        b=md/cEP5sNNnPf6Gkty9zhkeHrkz9tB1zo1w3epxIh+j5l1nyKHvMdmPbfQKOwJnNxG
         yyRAG2WVNGyCrIy5HfTUN18vVyFp7na4IPQ10dD6QKJcOPI/rEWQmH13IdG58V2EvmDN
         TwUB65AcH32d+ovWJh4dSSW05/nW2kbap9AjzRsrpX8uLTfICiPUVWS6C7xvSPl8WIr7
         BD4PC7HrvKk7ebJhJPsndkoy28TMcRezjhrURNqcOBdeQuZuBYNsXcUW43U3k+UrM6qR
         Secdeoj63/mEiuAwJAVz/4/Nr6rAHvSf/5EkzHXtR6im7vNYiMTJ8rP5BkJk7bFKiNnq
         EZHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770794650; x=1771399450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r/PwS98YxZ8bwQTw3xyA6jIzkifX/c6uS2Zelc1rjRw=;
        b=eN8gVgxQYJ3wazbuSEcQtmEH15rN2MDmqlR8MW+ngDoDf5cGyvhjwDIYSAJDN0LfbN
         5hBkdBVlv/20IfIB1GTSUzVng7cbt6N4ye/47tsH/o/D5PXRonevTI7PNksloQhx4JJJ
         0dx/htjjpZGx+WfvFJsCLUJtTbKaZo0OWIWxoPbyQ/Zqo4JzHYP5OOp9NbaPEjPVvZrR
         4Bss0D3sgTkMUI7WRV0N9Apc01kJ9wPh6f5rW1Vlhb+CNe7PSqGcLr+aPwJuZVi4rtvT
         GrdEU2PHUAjLE0vJz4uynn5igt1+3Rb6b2M9PXWPLGO97AKwi34rn/S+XJBbZyFGuGH1
         abBw==
X-Gm-Message-State: AOJu0YwxsLJWqgSI2ZhYsDde8BFQeYSxHeGCs+GZcTEssp4cwyHtgzN3
	pfLVvcxUp/Odka0DSknaRc7bsPKeIRRTpGSDmsr1AXYIffBlaOYtXADIgpCXdt20
X-Gm-Gg: AZuq6aLd72POfQDiW+wI0czftuMmw+cy6foCWUFdEPBQuMR6rkkXxNmV7h4Q6LlpQiX
	aVXCbVbjVL4kAt8M2Bm5Mb/d0LveeFG686AfMb/HdTtTYMAb1I24u3af3Y6MgJBEnHeXW27LULn
	ETWGNJP4fGpF0A6R07DiBm5TGkg/XJO00xeV14bcImHAHu0VI4huiDUk35U7mdlOGB8Wn2htxK9
	gGaI15XmafXbdOti+ViwIb50wUavzp35Sm3R7ESo2pVkJnR2Lag2wyrsoTU+zp6PJkOwxRMz+YT
	gY7bgd1B03ICKE+6nmBGWurVamLoUEtbHXyAOy5Qqw3HXzYp0c/i00MxBarD54WyxpnlfmTkg2s
	EJq9u11ByyILybuk6MFroXx/fAPkCRKBIUZjLO8/4qkM+UVkNoHUpqB8AkioeTiKPRMekZdbZvO
	ifWrl/EUE7zGwOGGDOPvCsWR+4nJzYVWPK4n0=
X-Received: by 2002:a17:90a:d40e:b0:340:bc27:97bd with SMTP id 98e67ed59e1d1-354b3c84050mr13403984a91.9.1770794650573;
        Tue, 10 Feb 2026 23:24:10 -0800 (PST)
Received: from L-15597L.kpit.com ([152.57.35.36])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35662f6b624sm5327833a91.11.2026.02.10.23.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 23:24:10 -0800 (PST)
From: Shaik Moin <careers.myinfo@gmail.com>
X-Google-Original-From: Shaik Moin <moins@kpit.com>
To: openembedded-core@lists.openembedded.org
Cc: careers.myinfo@gmail.com
Subject: [OE-core][scarthgap][PATCH 2/2] libpcre2: fix RunGrepTest Failure on Busybox systems
Date: Wed, 11 Feb 2026 12:53:22 +0530
Message-Id: <20260211072322.79206-2-moins@kpit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260211072322.79206-1-moins@kpit.com>
References: <20260211072322.79206-1-moins@kpit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 07:37:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230970

The PCRE2 RunGrepTest script uses the Gnu Coreutils form:
head -1

Busybox does not support this shorthand option and reports:
head: invalid option --'1'

which cause the grep tests fail when running ptest on yocto.
Replace head -1 with head -n 1 . This makes RunGrepTest work
correctly.

Signed-off-by: Shaik Moin <moins@kpit.com>
---
 .../libpcre/libpcre2/0001-test-Fix-head-1-Busybox.patch    | 7 +++----
 meta/recipes-support/libpcre/libpcre2_10.43.bb             | 1 +
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-support/libpcre/libpcre2/0001-test-Fix-head-1-Busybox.patch b/meta/recipes-support/libpcre/libpcre2/0001-test-Fix-head-1-Busybox.patch
index 68eaf037a9..e361418d94 100644
--- a/meta/recipes-support/libpcre/libpcre2/0001-test-Fix-head-1-Busybox.patch
+++ b/meta/recipes-support/libpcre/libpcre2/0001-test-Fix-head-1-Busybox.patch
@@ -9,10 +9,10 @@ BusyBox does not accept the GNU coreutils shorthand forms:
 It requires:
   head -n 1
  
-This causes RunGrepTest test data to fail on
+This causes RunGrepTest and the grepoutput test data to fail on
 Yocto-based systems that use BusyBox.
  
-Replace all occurrences of `head -1` Ã¢â€ â€™ `head -n 1`
+Replace all occurrences of `head -1` to `head -n 1`
  
 This aligns the scripts with POSIX syntax and fixes failing
 grep tests in RunGrepTest (including testtrygrep).
@@ -34,5 +34,4 @@ index 1c7bbd2..ab4f310 100755
  echo "RC=$?" >>testtrygrep
 
  echo "---------------------------- Test 133 -----------------------------" >>testtrygrep
--- 
-2.34.1
+
diff --git a/meta/recipes-support/libpcre/libpcre2_10.43.bb b/meta/recipes-support/libpcre/libpcre2_10.43.bb
index 781b5f15ba..ec8676d166 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.43.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.43.bb
@@ -12,6 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=321a5eb46acae6b6c1ff2c7a866d836a"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/pcre2-${PV}/pcre2-${PV}.tar.bz2 \
            file://run-ptest \
+           file://0001-test-Fix-head-1-Busybox.patch \
 "
 
 GITHUB_BASE_URI = "https://github.com/PCRE2Project/pcre2/releases"
-- 
2.34.1


