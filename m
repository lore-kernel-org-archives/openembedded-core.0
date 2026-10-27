Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31666.1793141378093333518
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2026 15:49:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=zg9g+QSa;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-46556b9e02cso225649fac.1
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 15:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793141377; x=1793746177; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gIS2bnYzcbQkMxQgoekph5CH8vdF5nI/voXUkG5onsE=;
        b=zg9g+QSaCm8eT/I0NzoksbH+kaY4dna2CoDfm4I7IT8Cjf1xztFi88xq5v/5EvUEgn
         v3JyMLK3Ot3YjISL4kjPeCZNyA9162zOqQA24L88LutCjtUa6Mi0dAk5fMozLPxnueB7
         7NTh5v5txFrPy4QPeBGmpnJa46tbcJ6UAYPI4RJ3Ksnj41HeQSe3xhpEvaHIVqkAj0Ig
         bG2eFVtN4y06P44jlLri49KWUgOodAeNa/sMXq/+CjflQQKNguWPANXIODURN7EwrKDY
         R90KyT+7YQMkMb0NaGQ2AY2QvrWmUxot/kKV04FtJwOuwQ8WRJk7c7Deq0Kh1UPkZgGO
         R/kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793141377; x=1793746177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gIS2bnYzcbQkMxQgoekph5CH8vdF5nI/voXUkG5onsE=;
        b=IYFdcWIUTsHQHPedE7tdLoeKAOayKIPd5cPe1kQcANr0VcFg8cxAXZdpLXl13xtuBP
         iPGUCcwjUVehXYbTkmaOICMe/kaE4qsXGR/r14jge1hUHjgiAr/JujbIAFA3lqhSV0hx
         2yjnwk3vKGDoXaOO5lc3Oni02YpGzb8wJBfuuRoHK9+o/dLh7WmmJu6v6p9RceaiPlIH
         j38iGbpHO1uL8jRN18fG95+mlJc4r0kOveK6TlsQ0qGSoNPfpNkC1H5vRqwGJrXgw5Oq
         WBMkuCTTn4jI2oTHC0Xiv4zj9GOTThml+SDboNAWGGWLSbogb73Q3llk49rx75K8Z6Is
         /rig==
X-Gm-Message-State: AFq9FYLK7ZAC/s8doBpWtxWOZ0hgwiUG0RlZf/uVISgoLjbnOq4GEfPC
	DDzfFg5vXjV9zwG5yIy3uqJj6noq9cftjnneoaPet2rbWINBbIBWHBATBviUaw==
X-Gm-Gg: AYBFou1qeqo/c9h59Zz3Lx+kR1iugkcHitF5Fh7PM/2i7pkbf4hN3j9uTDseObeGfRs
	qWHMv6GS2+YNUnVk2AX1ciPilp7e4XFIwKl7EcxWB8+QBsZkTakKwy5mIsxRLCQvmbZrgpDyHZn
	+UO1r85s3lV3DrCbatSzFWjBHyn3dbS+OzlQS234ohWO2PE91+PtgM0KIaA/Y3MBsOmxZTAi/rl
	d082N748zgMSKL3kOa4fwO1NoTwVT+sucCpTkuoSBlD3TSWRWazTiqqR0kQiXf5+jsZHSP3f5mH
	FkwGBCN404/0nYyb2wPXo6Ul5xgJjnuZehfPcueC2hf6s22BX84vKLQZqZb19sUgbH9wON5bZYh
	oEEOpx7AIJYlUEAIlCR5UDKrsUNYFUnuxT1Ei5v9ECyd3CBrrBQjOkhLdsXxiaRmPaDLwURUQfu
	zqp5n1u3qpuB2lPGFhxN69hIO1mHPxzyg6OTU3sIAPicyTW3LoY18g86pU4MBnVKWW5USmn2bLH
	JoS6Lm7OhY2pmFi1TY9wkvX4QgH5Mc4Ol9N6ebpkDBwHQck8IYXJYHoFJmLKcdnh/0lo05CFVM=
X-Received: by 2002:a05:6871:5290:b0:4a8:15a:b062 with SMTP id 586e51a60fabf-4a8bb678929mr451579fac.25.1793141377182;
        Tue, 27 Oct 2026 15:49:37 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2601:283:4b01:ba50::1109])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a8b7979514sm1111037fac.17.2026.10.27.15.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 15:49:36 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v6 1/7] spdx: Skip dependencies that are not in the taskhash
Date: Tue, 27 Oct 2026 16:47:15 -0600
Message-ID: <20261027224931.385138-2-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027224931.385138-1-JPEWhacker@gmail.com>
References: <20261026214627.2388650-1-JPEWhacker@gmail.com>
 <20261027224931.385138-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 22:49:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248765
Content-Type: text/plain; charset="utf-8"

If a dependency is not in the taskhash, it cannot be included in the
SPDX data because the dependency may not trigger the recipe to rebuild
if it changes (although aliases help with this), but more importantly
bitbake may not restore the sstate object associated with the dependency
which causes errors when constructing the final SBoM

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/spdx30_tasks.py | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 1d11d8d1d2..3dd87c2a75 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -306,13 +306,14 @@ def collect_dep_objsets(d, direct_deps, subdir, fn_prefix, obj_type, **attr_filt
         dep_obj, dep_objset = oe.sbom30.find_root_obj_in_jsonld(
             d, subdir, fn_prefix + dep.pn, obj_type, **attr_filter
         )
-        # If the dependency is part of the taskhash, return it to be linked
-        # against. Otherwise, it cannot be linked against because this recipe
-        # will not rebuilt if dependency changes
-        if dep.in_taskhash:
-            dep_objsets.append(dep_objset)
+        # If the dependency is not part of the task hash, do not include it
+        # since the dependency may not be present in subsequent runs, and may
+        # not rebuild if it changes
+        if not dep.in_taskhash:
+            bb.debug(1, f"Skipping dependency {dep.pn} (not in taskhash)")
+            continue
 
-        # The object _can_ be linked against (by alias)
+        dep_objsets.append(dep_objset)
         dep_objs.add(dep_obj)
 
     return dep_objsets, dep_objs
-- 
2.56.0

