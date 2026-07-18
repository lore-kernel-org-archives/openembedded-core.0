Return-Path: <adam.blank.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3B8AC44520
	for <webhook@archiver.kernel.org>; Sat, 18 Jul 2026 13:25:30 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6026.1784381122147116617
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Jul 2026 06:25:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FGNri/9U;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: adam.blank.g@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso20395e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 06:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784381120; x=1784985920; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8mMfZb2sm2Xo1fDzvQBF1qFSVSpXEucvbUylb2U0oRE=;
        b=FGNri/9UFp40KYLqHMiP5GWPbnSqcHFZqgEXw+/yMtXj5gTsIXAb6MDkgMV1IF+2NW
         eusbpTbxUNm7fn6Sw0bNGtqifRvwWTd0Cw6i/RYXGYBS+ZkpJeit21Am44gWDtVy0oiG
         cFbJvQB5rtVlcKZwXKj2KrGVIBvFdC9QQdoLkzO0uI1/OagJH0czyyGrCBKbXcTrEtHS
         fr9DB2iU8f/3RHUNJfnwJsvB9JLw55dbBpvQkMRAcCuiRBBm7uTLUXy2zPJE0LaqC1Dg
         XZbm0n2+o/luOu2TgcgF7kX5v2BW22HkWfZpJtTIPGRmD+z1QJc30NsL7MyUcDH/vwmu
         m2FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784381120; x=1784985920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8mMfZb2sm2Xo1fDzvQBF1qFSVSpXEucvbUylb2U0oRE=;
        b=YbJyUr/W/rQ+X/V+M0sPJAkuRF3BIZrSBzkRR5wpRwEE8cak3TlRvic4TgabdBdpv7
         wX7PUNCSc5LYPYNdefftGYpKf6g5gYR5/XcW3dGH8p8xsD8aesgKt/jNEJvZ4Xr9A9zn
         IJKiEAt8MCyXS2v0KfxJRCwCCYGWP73l+X5wzvETxofoAN5VPEI+I6kd1g2kh0kOneL/
         cwrFo2nq+lW1ykxS4oOQwJHT4zePPLF7I78uyEyytigcW5ueA81ircDNaLlKk6auju+2
         XhpvT87vsxn/RxwxSGR5HlK0uWO3vMe5O0IeIS+qf8TQ72oCpirGO0by+CIWefOJZpxw
         eEhg==
X-Gm-Message-State: AOJu0YzXWbjl7jto+SNskdrHtrO/NbYU9tsYSW6uX+BELleDoxL4vukQ
	2INKzpf52cPejN0lazSUTdH6pfdc75nG3lra8jvZqMn3dl/bfzhJON4tJMWMTg==
X-Gm-Gg: AfdE7clgLHGQ/A+KdqISK7hPO+kdYVhorrWx2g5VxqvajCf7MNkfJdV3UfMxQFhkek6
	TLZ7n3ahKhtTgYewgunbuC8bIw2SxQ5KZzuwOnO5lz547F6uzl9QxrflQfUp0XR799nF4fRczF6
	KTz6POOQl2GHPz2MTEetku91XXArjG1YdKWMndGt1kedDM1ucZdYJC6yHI4FO7LKXH0HTPb9bR4
	CKw1G6H+tqutJMSljEkS4ptT9upki7glT3OzMjrPD2NjuprLZBa6VMZj4QJAH/3EgBfo7j2tg50
	prCyBSA/cChq+aMsv4vAgG/27LEccFQD/ijRnhaNK0hzrF4+AKQe5d1NVEiImqozlSC/huQ3xf5
	b/jvMNlwX2Tk5X0XEVe7U5EVEckbxizpDVRHAy7Cd5ha9CwUXhLghsot/df/eaDIfUI+o6pI5qT
	EiLL6Iaw+6bEyVTcM8nKg=
X-Received: by 2002:a05:600c:5887:b0:493:b56b:c45c with SMTP id 5b1f17b1804b1-4954a40d424mr55293975e9.30.1784381120204;
        Sat, 18 Jul 2026 06:25:20 -0700 (PDT)
Received: from [127.0.1.1] ([2a02:a312:c8a8:7a00:689d:c0a3:3de0:7033])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2a2504sm136563175e9.2.2026.07.18.06.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 06:25:19 -0700 (PDT)
From: Adam Blank <adam.blank.g@gmail.com>
Date: Sat, 18 Jul 2026 15:25:09 +0200
Subject: [PATCH v2 3/6] native: add 'extend_recipe_sysroot' to
 'vardepsexclude'
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-extend_recipe_sysroot-v2-3-b7cbf35d00ec@gmail.com>
References: <20260718-extend_recipe_sysroot-v2-0-b7cbf35d00ec@gmail.com>
In-Reply-To: <20260718-extend_recipe_sysroot-v2-0-b7cbf35d00ec@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Blank <adam.blank.g@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784381116; l=784;
 i=adam.blank.g@gmail.com; s=20251027; h=from:subject:message-id;
 bh=CFgLXWS3t26nZp0YQerCbVCqGvDyqEpvfcRWlylkULM=;
 b=uTj+djt3V5Er6vs/QqY0tKf0SFg7GCq15wRU6gYqE9dD8/8GTZULtpLg+xPVnPvCO09lQn0mB
 rA/45KYzXYCA0/BHg6MDouCJ26dQ7xbuaINqTq2O4ULeXRlOAt+4pKo
X-Developer-Key: i=adam.blank.g@gmail.com; a=ed25519;
 pk=5t8u8IPKPL1CUykIX2JYa+1iHdXRdN5MqI7ik/fbvEM=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 13:25:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241261

'do_addto_recipe_sysroot' did not declare this explicitly,
but made use of the fact, that 'extend_recipe_sysroot' is
ignored on the base hash level.

Signed-off-by: Adam Blank <adam.blank.g@gmail.com>
---
 meta/classes-recipe/native.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/native.bbclass b/meta/classes-recipe/native.bbclass
index 8aa86f9cb6..b357b2da7b 100644
--- a/meta/classes-recipe/native.bbclass
+++ b/meta/classes-recipe/native.bbclass
@@ -170,6 +170,7 @@ python do_addto_recipe_sysroot () {
 }
 addtask addto_recipe_sysroot after do_populate_sysroot
 do_addto_recipe_sysroot[deptask] = "do_populate_sysroot"
+do_addto_recipe_sysroot[vardepsexclude] += "extend_recipe_sysroot"
 
 inherit nopackages
 

-- 
2.43.0


