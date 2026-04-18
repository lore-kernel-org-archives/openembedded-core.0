Return-Path: <adam.blank.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B508F99C96
	for <webhook@archiver.kernel.org>; Sat, 18 Apr 2026 18:34:19 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71729.1776537249399097283
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Apr 2026 11:34:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MnOpLH54;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: adam.blank.g@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-38dd9f11a09so16307181fa.2
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Apr 2026 11:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776537247; x=1777142047; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UJdKza7FxcdgMNft0h/SBc53SwRLLy7qse4SdunsL3I=;
        b=MnOpLH54MkACgEdGGFpA/cRozEWkFeHj+GzkZX9Rx909lUJlpmSrGplYJor1H2Ri8o
         6PcTERyEt+k2USFvxRi/uEwKD5KLSi7J/xaoPoa9yNbkXaHFmR4crQLhmd3Hzzg8qack
         obtPbADUsKlWqfzQGUMIPHZOaqmOIUx8tH/CDW10jh4yOeJSN0HaCGguWuCyTwBvdWB3
         xHGhXy56r+6zK6/UoqorLlGMXh6vv+347P7lFAARSDAsgXH2ItrrdMAvXUdIRbH2mR3S
         mijuEbeFLN1oUx7wIE9RaksFFLb2QgDRapRx+ngs/dk3Qc/PsKKgOIbMRgMxxn6q01cX
         L84w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776537247; x=1777142047;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UJdKza7FxcdgMNft0h/SBc53SwRLLy7qse4SdunsL3I=;
        b=UyzL6dIxuKknWnJFngGAiqvk8Dwppi6I+OyK2xUxVMUxaSUCXmXGg+q6kVbyiE8QWN
         nraaOmvS5WIRLMpwZ756gAAccVHlU1MVnk5wvqFUNcGFRu7sahI9c7VgO2Kn8ays5b4V
         jEDpuAcaCnCTFC7KC3SyVqJSINVjuxLx0Uy5Q3+ZKSqU8DAqZfpdzP954owHsV6iimHl
         Y3qxthk+dHW9riE0i0Q6zz5cA0n+sFJaQwsXOE91NNGvw5jUnUv2OC3dNV6mqnbFnJo0
         JKvNxlxE7fDQB6P1tiDqeHPpQ6Pfqgm37d7qcbp8AMqmEpT7v8M+dODHzAehTQDc1xFp
         KUFQ==
X-Gm-Message-State: AOJu0YwoJr3uogCcK5BDVGajVBvFm6ArzkAmu/A70+eMuryMXaGB8uBG
	KxmxX8xZ7IoBC39RNCXNBLnFTDxXRzVs2WsII18SQW9MCDzkSuIxvZ+l
X-Gm-Gg: AeBDievwY5i3dxkVpUAqo5Ag6PR7Zubx6ffGxIsM8qVlZXiOfjKIsz9xfd7o1Xd7XtW
	WshGX583xblTNXvxfNb9a6Uc2ihE7Djd4p2jONtXeVW3XKvrIcKURIusTN2bHx+KiJeHQjd1kie
	E5N3t9BNYjGTPISsLxIdOVVBuMYT7hVWp8m2z2cdRtJ3Xvdi6xHnfhB0exGe/au65Wb+mh33GKF
	Wt6Et8kL30qPhTSusWecIVbuN+ge1vi7S5vlWbm8BpfM/B+OxzcMINHjqE0dY1s6U92j7SIPAo2
	b2btBPXCp5F2uXwfjMqM6MljAnvUpFbYTN8XepOom5mAZty3YRktV+o9mUTWEghy0NBTt0vxto6
	BaYFRpJz5RjjxTUleeBilx0rCxr26cRqqeZtMwJwDoV6OEOkH+btKP+3e3Wkor/5Pt+HOgG4t7c
	/YplsrshJn8jP8s8iXlel+Wz5vIrsgj46BdkJ6QcHT
X-Received: by 2002:a05:651c:b10:b0:38c:50ed:d7ff with SMTP id 38308e7fff4ca-38ec77f5116mr23241391fa.2.1776537247328;
        Sat, 18 Apr 2026 11:34:07 -0700 (PDT)
Received: from [127.0.1.1] ([2a02:a312:c8a8:7a00:8f12:8be3:442f:59fd])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb6f0bfdsm12965981fa.26.2026.04.18.11.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 11:34:06 -0700 (PDT)
From: Adam Blank <adam.blank.g@gmail.com>
Date: Sat, 18 Apr 2026 20:34:03 +0200
Subject: [PATCH 3/7] staging: add 'extend_recipe_sysroot' to
 'vardepsexclude'
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260418-extend_recipe_sysroot-v1-3-8aeb383ba743@gmail.com>
References: <20260418-extend_recipe_sysroot-v1-0-8aeb383ba743@gmail.com>
In-Reply-To: <20260418-extend_recipe_sysroot-v1-0-8aeb383ba743@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Blank <adam.blank.g@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776537242; l=1150;
 i=adam.blank.g@gmail.com; s=20251027; h=from:subject:message-id;
 bh=e9kqi57CyeMrqa47WW+/vPIWPrUF53pbQblh0x97zms=;
 b=1QdqEqIbrtMGMgYntJRDw2x7YJOjolxs5bd1DXakgIe3mKD0dWJaJa476lWyE91E2+6cXkkiO
 n+QCHcbQepnATm9ism7mr++6ZW+1LfTxiMSVHOQcaTn53RbNSeOo39q
X-Developer-Key: i=adam.blank.g@gmail.com; a=ed25519;
 pk=5t8u8IPKPL1CUykIX2JYa+1iHdXRdN5MqI7ik/fbvEM=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Apr 2026 18:34:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235517

'do_prepare_recipe_sysroot' did not declare this explicitly,
but made use of the fact, that 'extend_recipe_sysroot' is
ignored on the base hash level.

Signed-off-by: Adam Blank <adam.blank.g@gmail.com>
---
 meta/classes-global/staging.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-global/staging.bbclass b/meta/classes-global/staging.bbclass
index 259603dcbf..3684e76bd7 100644
--- a/meta/classes-global/staging.bbclass
+++ b/meta/classes-global/staging.bbclass
@@ -645,12 +645,13 @@ python extend_recipe_sysroot() {
 
     bb.utils.unlockfile(lock)
 }
-extend_recipe_sysroot[vardepsexclude] += "MACHINE_ARCH PACKAGE_EXTRA_ARCHS SDK_ARCH BUILD_ARCH SDK_OS BB_TASKDEPDATA"
+extend_recipe_sysroot[vardepsexclude] += "BB_TASKDEPDATA"
 
 do_prepare_recipe_sysroot[deptask] = "do_populate_sysroot"
 python do_prepare_recipe_sysroot () {
     bb.build.exec_func("extend_recipe_sysroot", d)
 }
+do_prepare_recipe_sysroot[vardepsexclude] += "extend_recipe_sysroot"
 addtask do_prepare_recipe_sysroot before do_configure after do_fetch
 
 python staging_taskhandler() {

-- 
2.43.0


