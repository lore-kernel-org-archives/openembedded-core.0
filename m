Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id B16A97C8D4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Mar 2019 15:36:53 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id n19so5007527wmi.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Mar 2019 07:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=giRMXPSMmt5nUfdJRMG1WF2znUVRtdXNWHWAy/eF2EQ=;
	b=kvvhII/ntybHfw3Xw4gKyvhxTSqtPTRK0dYa7ZNAbDA82WbpkCP/KEBiR26ABgDbIq
	d6wfrPCX9JQKOd4tzo8IuY4z//vbySoaecT2F7gKmy0O+Tm+ox2qm/PYQu9/AF4731AF
	EpkLG8Y7GpyhkXQ97iZGI3LYZH5I9aZoiTo8z4GLFT5QdvafE2t0ED872TWKe8weUOO8
	wpDnwiLfXp5ZQtaW+a5FlBMikxUDHqchYxHa2UH9OQFAcLk4CtF/yoFPFLBlPbyI+XDF
	ZnmL90u4vBVRfUsSaL8jRQUJCmKwUN+/PstZtQPk1bRapLRMIxI7YAr3dZH1N8wx5ldD
	qiQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=giRMXPSMmt5nUfdJRMG1WF2znUVRtdXNWHWAy/eF2EQ=;
	b=M59VSpoapETbwImInSa6tv+2m49HG9r74qL84f7C3pjuEfCRWCB5eWqZDUs4fYSPgH
	3BbDW1I3Sbbzb6GMk7wnCZ0X/6nMwHxGHO+KEOxXIg15JB8k6isFNxxLKkVqXvhaRwTy
	5EmBh/sg/3yMy552bzI6glSZbEl0ehp+4bZzFAEZO4EY6FpI+lskGB9TZ0JtYTtbtURC
	wZ3weL/OQlzOA4cjjmsXXEgev1ZYF0I52KnToxqe0RVEIa5iGNIpQlboZwLXvOrClttX
	2Ct5lrvddPSJUsH9EvKav1Znqgsd1vGiqufXlFH42EiqXGdHqiv8VEb9XkUcKg3dImhs
	p3/w==
X-Gm-Message-State: APjAAAV3EYxMGLAePqAlaQnq9bp7Z5Q5hdnxU7B7a/R427uBTOswyJdG
	y8fux56iAS32PsPOrFLLtL5m1HFS
X-Google-Smtp-Source: AHgI3Ian5msW1K6Ur/QRXDAkQL+0d/eAAndN8JO1m29z9su/w1AVYszmmQAp1NQFBkkwFNN4LdgVfA==
X-Received: by 2002:a1c:3842:: with SMTP id f63mr11653944wma.25.1551713814039; 
	Mon, 04 Mar 2019 07:36:54 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id s8sm5523414wrv.12.2019.03.04.07.36.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Mar 2019 07:36:53 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Mar 2019 16:36:43 +0100
Message-Id: <20190304153646.59135-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190304153646.59135-1-alex.kanavin@gmail.com>
References: <20190304153646.59135-1-alex.kanavin@gmail.com>
Subject: [PATCH 3/6] qemu: remove sdl option from PACKAGECONFIG default
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
X-List-Received-Date: Mon, 04 Mar 2019 15:36:54 -0000

This removes confusion over where qemu frontends are enabled for
native/nativesdk builds: currently they are also set in local.conf.sample
from poky distro, and with this change that becomes the only place.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/qemu/qemu_3.1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu_3.1.0.bb b/meta/recipes-devtools/qemu/qemu_3.1.0.bb
index 26a33b4d860..8457e2c2f87 100644
--- a/meta/recipes-devtools/qemu/qemu_3.1.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_3.1.0.bb
@@ -17,6 +17,6 @@ PACKAGECONFIG ??= " \
     fdt sdl gtk+ kvm \
     ${@bb.utils.filter('DISTRO_FEATURES', 'alsa xen', d)} \
 "
-PACKAGECONFIG_class-nativesdk ??= "fdt sdl kvm virglrenderer glx"
+PACKAGECONFIG_class-nativesdk ??= "fdt kvm virglrenderer glx"
 
 
-- 
2.17.1


