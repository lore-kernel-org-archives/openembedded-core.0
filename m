Return-Path: <adam.blank.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F96BF99C94
	for <webhook@archiver.kernel.org>; Sat, 18 Apr 2026 18:34:19 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.72006.1776537251306559215
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Apr 2026 11:34:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=g2iMYt8f;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: adam.blank.g@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-38e7b8e3f38so13896481fa.3
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Apr 2026 11:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776537249; x=1777142049; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/T6GiYAjchL09AVrcE0l8FsvmtUl2THbzg0fs6+klk8=;
        b=g2iMYt8fgINiPFrdcjNTHY70wwclFLph2FaQrWvvh93MUUv+qHV5rMU08F1oJfcMJR
         R/5uN1GTxER/Hx+t0KaLOF/6lsXiqdyZazFaG6/Miq5H57s/yAmEaLBBvkH8j1Zhxjw3
         ayAJlzV2/oz34eWyGzftJTiPPr8iiynMEsdz9wnnglfT2jzmsdM+KlcNSO/xQvRM8i0N
         cm9SaAwCvGBxwzzxE66W/ppnYkdmDRAk/gCjwL9Qg8+GwrxdYQ50XmL2CvtGJ+UjxUyX
         7plWWE19cLszQKQMjO0SCaPaalrQf+X8JJpuGsSbOC0qYE4adNeNHUV5jmbwtsfVEdTz
         Di7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776537249; x=1777142049;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/T6GiYAjchL09AVrcE0l8FsvmtUl2THbzg0fs6+klk8=;
        b=mburh/2PCP+lIYH8wo2C3y0eFfyHUungGs77O8DmBBbi/mfgDUGuV7jEAgV1HI6dJB
         GL6G8nrZPUuY0ul+AUICjXngJ5l9Rk62jf7tcAQQAQ2DA6r7KGuPncE3JX8ZeT2e6/vR
         ZFgoIuARNtCpHPKFZrGg2EPqOHdMSy827FQiQAMfHpswn6hey/HmvSlwIex7/zbqwj9H
         BtOEcl92mFyanUJezZrb0qBq0MatjEF73uCpX/esHeFKOCJwiPqr88Oi1Uy/o2Nox/lq
         NA7PNPZ5Hb9GviZoaE53X98RDp913+eE9MSnTK5Iwqn57GgCbaymzZwlCjZDfCNW5Bo0
         0SnQ==
X-Gm-Message-State: AOJu0Yzi8vjJGD5EKtfZsDp4l3ff7W6ARKYHWIFDrfu8aj0o68ydgkk0
	upR/UZ3oBmsPs3xslOiO7cGD+N66CHVJcuhTufYv5wfTP7/XdHb1g+mnpUn6Uw==
X-Gm-Gg: AeBDieuC2iFOXso3dWQ/QotDNdSWW3ElrIoT8e6p20djMDxWckh6PoWG4BF0LvX2vfD
	o0pDIedp7QVgKpFw+XKZ3DmjpSUu2P1CI+wyVwH+5Qml5uamPuTYhELiD/5sUhXmgdibPCd/cn7
	sUpJ4SMscr3iPaiN1j/wJbZ58cU4hE0/9mHHlA0pQCYcuj2gHVAGLm9W920p3JBtk/kdx9s92p8
	NS1ttYxcKlKOGhQbm+EsTWNz47HyTKvuWQBQyBuFUbn8MVjHYHpG0Rru5V8khezIapa7yJjBet1
	olPCedrgih7Xtbj07r4Fvpn0ofTifnBc2bdG6vqOgCoB+eC4afcM0D9rBKnRPqt3Q58BlPjuYV8
	xEJXzQJ+U7f8Xj3kEd6NtEOJenYKQJNPrG8GRkPr238bpXWRRdUYiWy70mSkcoOdT2H9pbF15uQ
	Ofg/lzSOYqeHkVBw34mjqyj4x/5iw8n4bAXrFaBvu3
X-Received: by 2002:a05:651c:19a1:b0:38e:15d9:d606 with SMTP id 38308e7fff4ca-38ec7829155mr24009531fa.10.1776537249225;
        Sat, 18 Apr 2026 11:34:09 -0700 (PDT)
Received: from [127.0.1.1] ([2a02:a312:c8a8:7a00:8f12:8be3:442f:59fd])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb6f0bfdsm12965981fa.26.2026.04.18.11.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 11:34:07 -0700 (PDT)
From: Adam Blank <adam.blank.g@gmail.com>
Date: Sat, 18 Apr 2026 20:34:04 +0200
Subject: [PATCH 4/7] cross: add 'extend_recipe_sysroot' to 'vardepsexclude'
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260418-extend_recipe_sysroot-v1-4-8aeb383ba743@gmail.com>
References: <20260418-extend_recipe_sysroot-v1-0-8aeb383ba743@gmail.com>
In-Reply-To: <20260418-extend_recipe_sysroot-v1-0-8aeb383ba743@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Blank <adam.blank.g@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776537242; l=812;
 i=adam.blank.g@gmail.com; s=20251027; h=from:subject:message-id;
 bh=bpQb3JfGSpwIKrfaXdK4Styo3jq8H0fbkgrK1KhhSwU=;
 b=vbJqdWXWlDGJMoik04eedcyxhEfdlbCloTkihZyk4u62uAihbmQicFufLg4XuFkORu5iuMRLh
 rOmht/KFqk1BxtTGsVNeP1/CJ9DDq4iEe5SRi5HY9dERwRFowtBcm9+
X-Developer-Key: i=adam.blank.g@gmail.com; a=ed25519;
 pk=5t8u8IPKPL1CUykIX2JYa+1iHdXRdN5MqI7ik/fbvEM=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Apr 2026 18:34:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235518

'do_addto_recipe_sysroot' did not declare this explicitly,
but made use of the fact, that 'extend_recipe_sysroot' is
ignored on the base hash level.

Signed-off-by: Adam Blank <adam.blank.g@gmail.com>
---
 meta/classes-recipe/cross.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/cross.bbclass b/meta/classes-recipe/cross.bbclass
index 82a49dc8f5..bceee5d6e6 100644
--- a/meta/classes-recipe/cross.bbclass
+++ b/meta/classes-recipe/cross.bbclass
@@ -98,6 +98,7 @@ python do_addto_recipe_sysroot () {
 }
 addtask addto_recipe_sysroot after do_populate_sysroot
 do_addto_recipe_sysroot[deptask] = "do_populate_sysroot"
+do_addto_recipe_sysroot[vardepsexclude] += "extend_recipe_sysroot"
 
 PATH:prepend = "${COREBASE}/scripts/cross-intercept:"
 

-- 
2.43.0


