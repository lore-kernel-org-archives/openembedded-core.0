Return-Path: <adam.blank.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37A76C44524
	for <webhook@archiver.kernel.org>; Sat, 18 Jul 2026 13:25:31 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6024.1784381120693247884
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Jul 2026 06:25:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qv4CCIkN;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: adam.blank.g@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso20315e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 06:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784381119; x=1784985919; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3kGcQQazIKn1yQig9+6bK21EIAumNonQhZ1IBHSrt2o=;
        b=qv4CCIkNSn7G5mQaCfGC3wzE+KIVHn3EjvqpZD9DiP5CeTmjtQY9ZYjGDdR1XMPQ65
         51JVwN80nTWMpw02ucSFjymC9pLTAJesItukOodX5K5aXGQ/dvTTPoBm6uU8+kp0Q0yI
         oiNML8IHIOJnFD+HmsDtDUEBWdxYF9EN1JZytOl0BBgaXrtuAKjkCTPi95WgJRFivCQr
         r1xKyugHML6djYaEFFkzXv/XieTru9x43xArAnhY3D61atdJrvS7oro46EVCXW1ObuU1
         gTto2jbFwOe4zynBIuLZPAr0kjReHw3pIWja8dgT24R2oLUKy93oQWpVNxCdSct+w+eM
         RQyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784381119; x=1784985919;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3kGcQQazIKn1yQig9+6bK21EIAumNonQhZ1IBHSrt2o=;
        b=sgndJQzhlT35ppvK6NkMS5wuVw07niZtzwiIASj7PLrf1wDSF4mGOMCYT9MpJEeTcm
         azbbxsmt+Fcs9EwQwkmn1XdBuNTHFq4CKiFy4eTv1kd23f3SpUFfvL+IVKUQxOZZR6B6
         bahFVtZUHtA+7Cdkd8J8teV9cdZ/2uboesORWlxAiPynTMwOQXXxE66bYYvyIWO1saL0
         IHPR1KFIcfHKhtMinIYBZX1znwo/fkpbv44X0r63ORUivD0bTilYiEtDZirSECRq+RG9
         clzWWRTD6rsVNTdVVlMpmAu1l31uKvnPLjscngikYJpmD3hHyWaWGRXuaWZBjekyS0Tn
         n/fQ==
X-Gm-Message-State: AOJu0YxRLGrUFoTt82c/nuC4r9S+/BeFyZoHSwpYonhrVDFhmhhaM7KF
	1+v5WdV1OCC+HeyMOfcqoWLoOjerw1A+meX/2eOoH0pGriM5CxRzlqqIFSRh1A==
X-Gm-Gg: AfdE7cnU9F+0UIzWQ9O1WtVA4ednXOyuzxXF05o/sz+N6vzsQIiZ79bBD8jptl8ypbB
	WiirR3F7XZjgEQF1yGrD6UBd2MwktCgm0MkeveDhIPe00V7lIRx2rX0x521CaG2Kh2saP8lOCvq
	ZkutiAKOVp40dxYDAx87+m1BOObFvlWXM8e5ZHTdxEFDR2dSyHj+/2vBTE+VN+3EC25AT97eV0L
	3yIopmsvZAbhLgQWAjATb3jQvIZmyw6i6drJwwuoR3+TtVSQstV30/cujNK5bzH00gAeolTL+7S
	51+GChOuNgBQMxYTCVUuGAUupRtoU5eteEXRQFb2KGHp1mfwe2Wm5O1ID1zVFiR0cn6J9U74/HE
	wpDOCpremFat9c8kizf8ohT5TYqvedxkCjttxSFL+nIA0S7XJNN7A4pyTGuwr1efr4tLyFxB+WD
	1Sll/1PwGJ
X-Received: by 2002:a05:600c:524c:b0:495:4e17:cad5 with SMTP id 5b1f17b1804b1-4954e17caeemr49602125e9.26.1784381118491;
        Sat, 18 Jul 2026 06:25:18 -0700 (PDT)
Received: from [127.0.1.1] ([2a02:a312:c8a8:7a00:689d:c0a3:3de0:7033])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2a2504sm136563175e9.2.2026.07.18.06.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 06:25:18 -0700 (PDT)
From: Adam Blank <adam.blank.g@gmail.com>
Date: Sat, 18 Jul 2026 15:25:07 +0200
Subject: [PATCH v2 1/6] staging: add 'extend_recipe_sysroot' to
 'vardepsexclude'
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-extend_recipe_sysroot-v2-1-b7cbf35d00ec@gmail.com>
References: <20260718-extend_recipe_sysroot-v2-0-b7cbf35d00ec@gmail.com>
In-Reply-To: <20260718-extend_recipe_sysroot-v2-0-b7cbf35d00ec@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Blank <adam.blank.g@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784381116; l=1657;
 i=adam.blank.g@gmail.com; s=20251027; h=from:subject:message-id;
 bh=oym+MW6zDwcusujzmpm6KfS5x6uiKYnZz2Zq9GCTmJE=;
 b=DzelwnKxmRVEl2ITJ8L5dRXXvGjyme4EE/r1KNjMzF+YNKSfa22c8TAWHHwN3CV3Rt1ow3Vpk
 Z85uGbdvfcOD1vep1JLxJ/TumS4z3/Cw0lYzW/NW73OkIRDlVk/ojB+
X-Developer-Key: i=adam.blank.g@gmail.com; a=ed25519;
 pk=5t8u8IPKPL1CUykIX2JYa+1iHdXRdN5MqI7ik/fbvEM=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 13:25:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241259

'do_prepare_recipe_sysroot' did not declare this explicitly,
but made use of the fact, that 'extend_recipe_sysroot' is
ignored on the base hash level.
Also for cached tasks, when prepending them with
'extend_recipe_sysroot', exclude it from their signatures.

Signed-off-by: Adam Blank <adam.blank.g@gmail.com>
---
 meta/classes-global/staging.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-global/staging.bbclass b/meta/classes-global/staging.bbclass
index f0b3c6eedc..5833abebc8 100644
--- a/meta/classes-global/staging.bbclass
+++ b/meta/classes-global/staging.bbclass
@@ -650,6 +650,7 @@ do_prepare_recipe_sysroot[deptask] = "do_populate_sysroot"
 python do_prepare_recipe_sysroot () {
     bb.build.exec_func("extend_recipe_sysroot", d)
 }
+do_prepare_recipe_sysroot[vardepsexclude] += "extend_recipe_sysroot"
 addtask do_prepare_recipe_sysroot before do_configure after do_fetch
 
 python staging_taskhandler() {
@@ -665,6 +666,7 @@ python staging_taskhandler() {
         deps = d.getVarFlag(task, "depends")
         if task == "do_configure" or (deps and "populate_sysroot" in deps):
             d.prependVarFlag(task, "prefuncs", "extend_recipe_sysroot ")
+            d.appendVarFlag(task, "vardepsexclude", " extend_recipe_sysroot")
 }
 staging_taskhandler[eventmask] = "bb.event.RecipeTaskPreProcess"
 addhandler staging_taskhandler
@@ -700,4 +702,3 @@ python target_add_sysroot_deps () {
     d.setVar("HASHEQUIV_EXTRA_SIGDATA", "\n".join("%s: %s" % (k, deps[k]) for k in sorted(deps.keys())))
 }
 SSTATECREATEFUNCS += "target_add_sysroot_deps"
-

-- 
2.43.0


