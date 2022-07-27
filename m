Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEE0CC3F6B0
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 00:41:46 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web09.14405.1658882503188295579
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 17:41:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=wxKuxcr+;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id z3so14813706plb.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 17:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=lmLeydW/LoQlnNyWhOAtE/Aoy11s0mrEvy2HosCOsdI=;
        b=wxKuxcr+n5CUcjd6hFycfD23hInp2sK7Dmu/UVhZPDF9TbwIeJmxWmlwIykjcwHgyf
         pEbQzTnNmVOHJuaMt/KKIYaXQ/Vdu7VQlWu9DpayF0hOMcebYXNlhOvsdGvxwDXatmMc
         T31ACTWltdbIAye21JvOg3ueVtdirrQdfIT5yLUMn42Jm+KLiZXw5q7T6W7IaZmDVbu5
         Vkd+haYqmff7F+nKLXoLvyDIEtavVvuXlRchX+31fI3KqnhACfE4BRMTZKMYK6JjUTpJ
         QwiOZmcCg4bLdakGboBnNIWiy3TqxG67Fxw3k/ZsrKvYkXpSLE+ZOgXr1YHjxZxViB/2
         Fiwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lmLeydW/LoQlnNyWhOAtE/Aoy11s0mrEvy2HosCOsdI=;
        b=l9wGM9o+XjkHTAcNLox2PiLqfWVP8T4Y+JyepheDuHcPKIWg6ytli3Rn3i/ZvYsWjr
         jCyXvFWSe147h51hcZ900oxFQbae4/gJS+ZiflwDjas775IlkTtnLBtZPlUiNCyTkjxe
         jVBV80vZZEUC/lDjBh4NcZFiEzq7MI041EmpX29EaKseySpUNkn7CrTtk13ko4itE/FM
         1P9mTH3zuSO2GD+4LrQji0Fude7qAcTDhq5ZW57bJmP/odu5+J9B2pU26UTTIeB9qyka
         YfBTGEvChpCjISwcWOUtnoxYgLgrggZ4UlQn8D2Ux/o82eHAjEF/qNZOE+By0tLL9VEx
         5D3A==
X-Gm-Message-State: AJIora+1LXSNPgUsV2PzKGIE0QvaYCUrXCFRRFY4DHkDZ7oYFV2Z/oaS
	AsPQo3N/hDx/WGqDm5s/uDzYyfAOm+qaQhCS
X-Google-Smtp-Source: 
 AGRyM1v8Dki7J4yNXVXu685jXgArGex8W4Akse+XCZ+XkGu/M9BLfkkGcFZruG4BPzd9u/LKkRC+cQ==
X-Received: by 2002:a17:902:7c83:b0:16d:3db9:fdc5 with SMTP id
 y3-20020a1709027c8300b0016d3db9fdc5mr18376505pll.153.1658882502154;
        Tue, 26 Jul 2022 17:41:42 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 u16-20020a170902e5d000b0015e8d4eb219sm12356278plf.99.2022.07.26.17.41.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 17:41:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/15] sstatesig: Include all dependencies in
 SPDX task signatures
Date: Tue, 26 Jul 2022 14:40:42 -1000
Message-Id: 
 <7549429fc93218dee33b216010b2c36a9f814091.1658882276.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658882276.git.steve@sakoman.com>
References: <cover.1658882276.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Jul 2022 00:41:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168534

From: Joshua Watt <JPEWhacker@gmail.com>

SDPX generation involves looking through BB_TASKDEPDATA for
dependencies, then linking to the generated documents for those
dependencies. These document links use a checksum to validate the
document, which means that if a upstream document changes, all
downstream documents must be regenerated to get the new checksum,
otherwise the compendium of documents produced by the build will have
broken links; therefore all dependent task should be included in the
signature (even from "ABI safe" recipes).

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 5fe543b9ceec971cf0297ff0ae3b0ccc4703cece)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/sstatesig.py | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 7150bd0929..de65244932 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -24,10 +24,19 @@ def sstate_rundepfilter(siggen, fn, recipename, task, dep, depname, dataCaches):
         return "/allarch.bbclass" in inherits
     def isImage(mc, fn):
         return "/image.bbclass" in " ".join(dataCaches[mc].inherits[fn])
+    def isSPDXTask(task):
+        return task in ("do_create_spdx", "do_create_runtime_spdx")
 
     depmc, _, deptaskname, depmcfn = bb.runqueue.split_tid_mcfn(dep)
     mc, _ = bb.runqueue.split_mc(fn)
 
+    # Keep all dependencies between SPDX tasks in the signature. SPDX documents
+    # are linked together by hashes, which means if a dependent document changes,
+    # all downstream documents must be re-written (even if they are "safe"
+    # dependencies).
+    if isSPDXTask(task) and isSPDXTask(deptaskname):
+        return True
+
     # (Almost) always include our own inter-task dependencies (unless it comes
     # from a mcdepends). The exception is the special
     # do_kernel_configme->do_unpack_and_patch dependency from archiver.bbclass.
-- 
2.25.1


