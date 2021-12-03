Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCDD9C433F5
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 18:21:42 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web09.15191.1638555702386028803
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 10:21:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ujIo0av2;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id gt5so2959658pjb.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 10:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=pYSL6foOLxoS0cmi2AWAcg//B1P1HXbuxQVd/RE5L/U=;
        b=ujIo0av24mbpnSI3FhcczA94T5RS+5r/2GsNkucPJZWHcKRhg28Jf8AmoImqHXSGLF
         9zMkBEP/sGf87ok46ojKTtFXLq4lfNYdq13Bhudd1WXex2bXesFvMVutkFwsrkn+nlie
         UPQBtt61Zu3QAORmGm9QHtnOkMoOvu2c75JpPz/cLc+hcAuRJq5kWLZWBWdlAGXAPRrE
         4FMT/mDC7Zf0uqX/Z2j16CqLAeG5rP25+g1TrSvJlGAUYiqrKge3lzU8EbGZETpYvaF9
         WO5MeOSZovwGUAx9D6eAEtciR5rwtn+5YWtoI34rsI3EsYmGnnOa2WzZymP34HdlWRue
         zpDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pYSL6foOLxoS0cmi2AWAcg//B1P1HXbuxQVd/RE5L/U=;
        b=SuZqd7mzrovnmkUp3+Vx/+EPbt9pSarMVAyJG10QOPy4T9XtYNzZpdqZeOP686UC9S
         5g3dSWcLAFRXjtDJbVI6KR87QuYUFW5auqEsBDeGnNgiJcTbiXFOK1qxT6/mLMl4jo+A
         1IKvD5JfEwxA0y2Wo7tD/MPHHKdtcxDkNYpe74IDXx+li3XD3/66mRXb/NKVwpA0UZxV
         Kcph/BmJYCWtCfS53sI15A0GrKCqE3HjOvvsBkq3GAp0J7tARIrkl9fXMYU6orrcOSLk
         LWjhFsyt4kpKE03C8xeszHwZCTTlx7zs1zU2YOIFvZWPeV9Jbsn8kGYlZg4gl6MpopnH
         1EXw==
X-Gm-Message-State: AOAM530OuqdbwwRKQQ5VSjHkK01sDYRGcUA8dVpTfDyeYePIjze20pxH
	bdpl+uM8/e/1hJdQnyJIIYvxYD3nUpc3T4Xbg8E=
X-Google-Smtp-Source: 
 ABdhPJxSaW4MLWSK6v91yaRwLm7ueBeMfamU1jgXxlPqnAUJj0+ZPn7sACYL2UQPJffo08F3XNhszw==
X-Received: by 2002:a17:90a:c297:: with SMTP id
 f23mr15993523pjt.138.1638555700672;
        Fri, 03 Dec 2021 10:21:40 -0800 (PST)
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 130sm3959753pfu.13.2021.12.03.10.21.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 10:21:40 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/18] libsolv: update tag for missing CVEs
Date: Fri,  3 Dec 2021 08:18:54 -1000
Message-Id: 
 <c021f2d03e0dbe1fdf82446d42dbb3095999cde3.1638555254.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638555254.git.steve@sakoman.com>
References: <cover.1638555254.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Dec 2021 18:21:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159134

From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>

It seems like CVE-2021-33928, CVE-2021-33929, CVE-2021-33930 and
CVE-2021-33938 are pointing to same patch as CVE-2021-3200

So add CVE tag inside the patch file which is the remedy for
CVE-2021-33928, CVE-2021-33929, CVE-2021-33930 and CVE-2021-33938

Link:
https://ubuntu.com/security/CVE-2021-3200
https://ubuntu.com/security/CVE-2021-33928
https://ubuntu.com/security/CVE-2021-33929
https://ubuntu.com/security/CVE-2021-33930
https://ubuntu.com/security/CVE-2021-33938

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/libsolv/files/CVE-2021-3200.patch | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/libsolv/files/CVE-2021-3200.patch b/meta/recipes-extended/libsolv/files/CVE-2021-3200.patch
index 74164ab495..cc8f53cefd 100644
--- a/meta/recipes-extended/libsolv/files/CVE-2021-3200.patch
+++ b/meta/recipes-extended/libsolv/files/CVE-2021-3200.patch
@@ -11,9 +11,14 @@ been added.
 (Jobs may point inside the whatproviedes array, so we must not invalidate this
 area.)
 
-Upstream-Status: Backport 
-https://github.com/openSUSE/libsolv/commit/0077ef29eb46d2e1df2f230fc95a1d9748d49dec
+Upstream-Status: Backport [https://github.com/openSUSE/libsolv/commit/0077ef29eb46d2e1df2f230fc95a1d9748d49dec]
 CVE: CVE-2021-3200
+CVE: CVE-2021-33928
+CVE: CVE-2021-33929
+CVE: CVE-2021-33930
+CVE: CVE-2021-33938
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+
 Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
 ---
  ext/testcase.c | 21 +++++++++++++++++++++
-- 
2.25.1


