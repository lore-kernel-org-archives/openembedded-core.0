Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ED86CD37AA
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 07:13:01 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8185.1778224371835939737
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 00:12:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=AJLRYvPU;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso18700745e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 00:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778224370; x=1778829170; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YD1Cdt1AWG1xGklrjSwxo+9KAwKDqSSnk/0GYzG0bvQ=;
        b=AJLRYvPU3JVKAviotinONwl7DlVck46cnz02ShYjiWJQGHQoOuJXg6N2kVkrmBbzbk
         Kxow6ITYlEp7inFDr0P0Vjh75mM1sLPpVwhD1q7K57JjaC3g57qWQfV7lWoJgWgXHiAH
         oQh1HRQubZKPXpTLxhzjzlqe/sXzHahcs1jQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778224370; x=1778829170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YD1Cdt1AWG1xGklrjSwxo+9KAwKDqSSnk/0GYzG0bvQ=;
        b=SqrZGk6RS4XWMPhpFZE2XcrCj7Mg+UbQktyfx4RFil57+O8b37XbI0f1KAdRi9tGQy
         RxZpIJ+6NByL3ONSZD1fGTiyQtuQ/qyEgzFcg/7C2VWA/0ufDO7vARJHZ5EUWo3H5K0n
         Lrc3CYQ+i6TFCO4hGw8NKQyMx4LCfP+GlDLo8GOnbzDsbPeU09SrBFhdKL6BpEisMoon
         vjGyWO2JXQzSvfGkV+1/824igeg0HeIOUovbdUHpB1zhJnzaAEpAtpsqOEYJm9GRDkbd
         g7n9ErTO+CqFyp4jkRpHI9mUWmJH4eCDWH9QKqgLtn4OSlQnEDgm7xAmHH0VNW45TWRN
         u+OA==
X-Gm-Message-State: AOJu0YyepE5TGeq2rK8Tx1MsaFeBObR2rtlZq/ipumGnmGaVLEYYhSTw
	A0SilN+zPicDbtgCHvzwFAW3CLDxCJsQ29RRmKZqbv+0V/h0DRrLLBNlxUTShn8WIXn2AyWYCKO
	kfIc2zKI=
X-Gm-Gg: AeBDieuatvBNz+Aq8h0R1+uGVtz6I1JgJmgz6OzlJ6lDCerIgYLoRpsQuWtKaqCdpFb
	xCjF68svg4IoONDkMs5CKiz6HNzPkGqgJIflnSJaFA8/xjU0YYPbAC+MUuC2JPr2oF5tZ42x6vg
	g77zslOXXee4sEqVvUxEYeo/JvAIq29FV9wgsoEceJpRVNYStB43hNzEffl0WpsS4nTutK5RgcP
	GVG6+O4bZG/OTZT6eQfRCwU5vkB+cMN5kpqjB/T2GaNzl1+67k71Y9kqClh1UrPB6FiLIcrlUPW
	Qs/u5qIuMYEy3tqXKd8j63vpKbOSjcfWB+EEvtALNFmbEfijt7WEM4qCRwpPy4jmli5On/BFcrv
	MjVC4RA+3GMg4AIL5KxqzDsQ56pK9sa6ImJb+Eiqdbp1OjxgL8sYp+OEWJ2zyB2KNZbsLlyYo6G
	adwbSmgFs6Y/rpsKwMp2HoeCdSNtksVZ+bTk1eIP02H8VpSfFohV/be4nknylVWFs40gwMJTvpp
	YHZj5gNRYipXZdeiwTAHJSVJrBT80jSKHZgeQ==
X-Received: by 2002:a05:600c:c0c1:b0:48a:56de:d62a with SMTP id 5b1f17b1804b1-48e51e1ddb2mr131827455e9.11.1778224369760;
        Fri, 08 May 2026 00:12:49 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6be40sm2415545f8f.12.2026.05.08.00.12.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:12:49 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 52/52] glibc: Fix recipe bug that disabled stack protector
Date: Fri,  8 May 2026 09:11:45 +0200
Message-ID: <833809129ca29ea168f68c98468a2c70182a4d66.1778198557.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778198557.git.yoann.congal@smile.fr>
References: <cover.1778198557.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 07:13:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236694

From: Ivan Nestlerode <ivan.nestlerode@sonos.com>

Fixes [YOCTO #16265]

The glibc recipe is supposed to be building with
--enable-stack-protector=strong, but some CACHED_CONFIGVARS values are
actually breaking this, causing glibc to be built with no stack
protector at all.

Remove these CACHED_CONFIGVARS values so that stack protector support is
detected properly in do_configure and then enabled properly during
do_compile.

Full details are here:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=16265

Signed-off-by: Ivan Nestlerode <ivan.nestlerode@sonos.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 43f0602ede37428f3c35cf665bba934b84355240)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/glibc/glibc.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
index 30d93bca77a..dae087d53f6 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -21,9 +21,6 @@ CACHED_CONFIGUREVARS += " \
   libc_cv_slibdir=${base_libdir} \
   libc_cv_rootsbindir=${base_sbindir} \
   libc_cv_localedir=${localedir} \
-  libc_cv_ssp_strong=no \
-  libc_cv_ssp_all=no \
-  libc_cv_ssp=no \
   libc_cv_include_x86_isa_level=no \
 "
 

