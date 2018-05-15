Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8921775085
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2018 06:11:18 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id f6-v6so17222309wmc.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 May 2018 23:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=77ZYk0ykB2Evj6NAHBR04QVS3H/09ADbF9wyG7CNj2M=;
	b=i6TlF5GqPPM5A7n5ppdWz8I/6VgRhWIINIKQFFDw+o6R3ZF1hLziBNPZjEjbnnbMFu
	lvkURbOCD/eF9HQmwpFlspUYJqeRTXVt1+CD2TQTAmHIrXFcperE04NKUSUrRLY+LMPn
	SwK78jq8ezKAAohP94ioftr+hHivZhMfas2/1c2HDuvkfG+BtUrzRUyCalIiBcDBp2vn
	Y22AZxkw5yumZ996xFK37ONslv3t7raBb6GKYhBa71jvo5AWnHr68jiqMNYoG/r6FbVY
	8EzgF0RWzv2bgt/D+jTxabLKKX4KhPQBVlDthwNKP60H6iruTTgU32es4HS27uUyirMw
	vI0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=77ZYk0ykB2Evj6NAHBR04QVS3H/09ADbF9wyG7CNj2M=;
	b=fCQ+N+b2LtLffR68dI5U1mfEhlNfWpnSs0QwIjm6L+wjfKl9OQNdhXxwFZzs03Eo5v
	3C91oHS/9djMUY/5XFK5A9Gk8WN2i6BlQBH2w0a6+nG69PnPMj94qmuLP+RtnKCsNjKy
	JqBvGb6TP9mqHIqsKmmllJx7x9IHFUGlIivMQriQTMJuCN7Sp1KxLcxKj9oyvCu89drR
	s7NakPRupUFDx72m0NKMtuRnoRvZjLtrnQ1CwecGJ+fu9V7AQfYMBeog4zzqhaZmVV/W
	VXkNcdaBQGIra5/Hw5YsCvrKpiWfQQqKZax8VKhaSXmduZ0gk3OmMuGg/ZbxdNMu+I2F
	1twQ==
X-Gm-Message-State: ALKqPwfcjdedhcYKSsCqN1ogWVLMuctHC074hkyBCA/vzbJ5YJO3U/iG
	HKQqZuPTeOG2+zznKt2XT/4yrQ==
X-Google-Smtp-Source: AB8JxZpqDTmUH+7gtPLOjZjpFPLaImj+ttLdXBzZpUvVogpxDKIGnrfkbkapbnWQcsdOmQgr5vxybQ==
X-Received: by 2002:a1c:a01a:: with SMTP id
	j26-v6mr6284671wme.74.1526364678803; 
	Mon, 14 May 2018 23:11:18 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([176.32.49.4]) by smtp.gmail.com with ESMTPSA id
	131-v6sm18086723wms.34.2018.05.14.23.11.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 May 2018 23:11:18 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 May 2018 08:11:08 +0200
Message-Id: <1526364671-29451-2-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1526364671-29451-1-git-send-email-liu.ming50@gmail.com>
References: <1526364671-29451-1-git-send-email-liu.ming50@gmail.com>
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH 1/4] kernel-uimage.bbclass: use boolean to check KEEPUIMAGE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 May 2018 06:11:18 -0000

From: Ming Liu <liu.ming50@gmail.com>

It now accepts yes/on/true/1 as positive values.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/classes/kernel-uimage.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/kernel-uimage.bbclass b/meta/classes/kernel-uimage.bbclass
index 1d8656e..d3d9d77 100644
--- a/meta/classes/kernel-uimage.bbclass
+++ b/meta/classes/kernel-uimage.bbclass
@@ -9,9 +9,9 @@ python __anonymous () {
         # Override KERNEL_IMAGETYPE_FOR_MAKE variable, which is internal
         # to kernel.bbclass . We override the variable here, since we need
         # to build uImage using the kernel build system if and only if
-        # KEEPUIMAGE == yes. Otherwise, we pack compressed vmlinux into
-        # the uImage .
-        if d.getVar("KEEPUIMAGE") != 'yes':
+        # KEEPUIMAGE == yes|1|true|on. Otherwise, we pack compressed vmlinux
+        # into the uImage .
+        if not oe.types.boolean(d.getVar("KEEPUIMAGE")):
             typeformake = d.getVar("KERNEL_IMAGETYPE_FOR_MAKE") or ""
             if "uImage" in typeformake.split():
                 d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', typeformake.replace('uImage', 'vmlinux'))
-- 
2.7.4


