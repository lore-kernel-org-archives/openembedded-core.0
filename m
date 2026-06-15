Return-Path: <colinmca242@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB531CD98CE
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 22:12:34 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.141161.1781561550893865851
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2026 15:12:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YDgbk4OK;
 spf=pass (domain: gmail.com, ip: 209.85.167.171, mailfrom: colinmca242@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-487135fd4f9so1570477b6e.0
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 15:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781561550; x=1782166350; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VeOL+0CL+yNUKChmII1yuzE11sJ9b40PI4YEmsNcPWc=;
        b=YDgbk4OKD6E0B1O6UKdldR9VRcMOssg8rmuXNGh8mrYF5xGt4yDd9j3FdBLWrWH30M
         ET8HcbG7X5eHSjr6ZmYvNtGjNtu/8KX5Yd6W0nuBEHgnAt/WZYUnJ0nqXVQxaAQVq9Lp
         ocew7a1mF49c0gqiNF7uW+NqJdUui9O5corvYRFQFeFVSrneDGYwhYR8l1OTjXUKGbdY
         8dSCPKaq+i8hPetqdQKU8q6IztYhayjZ82DNiFiHCvvzq0/3modORT6AIwfiplRYi58k
         aMXAVBlcwX4D4zP33bGY1cZagy6kPnhfeYMRvQjFzgKWNPZot7d9QBjCkIDMvxoejPEY
         ewng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781561550; x=1782166350;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VeOL+0CL+yNUKChmII1yuzE11sJ9b40PI4YEmsNcPWc=;
        b=gD6+Ys/OErMvCImhLhbWDU9MRbky8iETiv3d4sO+xoiPaEK4tNESuqAvoeSIVdRLs9
         SqXdlTTrMXLr1bCcsVlGAzSCRl/aaTgYXwvw0uoutUszH9XOP8TiUChAb3+TQ5/Kvcvv
         xQDNs/nj5YwFU557qTB3lm6GcNoa1qXMwj+M3Ro/DGf5AcGbHowrAeifucr7MmrexBdd
         OZZqCNSrdEVjq8Ddqgm0AYsHbvx8h5Uw4M60m0rtN7YLwnpBPxYnCMOfQ+degO11NxyE
         081wkSls87R0edhSGo7R/EV0ZQbrww7v/hmMZMmqZDT3/GpPt1p1ib1n+ejyxD6jUGdP
         8BhA==
X-Gm-Message-State: AOJu0YzQATOIdSWpg1AG+t2LV6102rkuMv6obmevRna+e06g1f/xt3Rq
	Q3dGbRyP3fRpIXccJC+Gpr4Tn6RDV3depUROUe4+xH2Wht/tiKihAt4VFu+afu4Dv4w=
X-Gm-Gg: Acq92OGPKk1/BRdPvgm5gdXh1+0KvVotbZX7ee6HoYs2B7WO99zHYYSqbIAuaYutSQs
	2NRhYVT/vqcr9EWlh4jzuDTfg5ipjbb9184qk0QVQy1/OEc3TKevc8P9hQkUFaMtp2b+yd8R9rS
	IXieo6Vc0WBtOmZxRaPCB89vls015hFVCy+e623/cGlX2UGcqXGdOy2DH6aUhbjW1RUc2L6/Avx
	4Qx5CKllHNcSWXt28J3wIIFBrpJO4GOCQXLwkBQaTA0UDVI7/SajUUf3Q8ZclqWgU0bjZDebaxz
	In6vJ7x+miHF1ny4DMrZP49hfNdVk93JvMFgoqp6eOjUciUzI4nzo+LeK/vtjsAyc/Zhs1LYfQ5
	8sgjKqNNWJEwz67z9oJsz3PixxDZPoi5EDEB7OZfNv6ocG0vPb47xjd1rtEfu4MgInoDux84wV3
	xV7CUWMvfJAKrZv4y8rpc=
X-Received: by 2002:a05:6808:3095:b0:47b:bd7b:10d0 with SMTP id 5614622812f47-48741989031mr7851228b6e.13.1781561550046;
        Mon, 15 Jun 2026 15:12:30 -0700 (PDT)
Received: from fedora ([136.37.200.217])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4875dda5eb8sm3435757b6e.4.2026.06.15.15.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 15:12:29 -0700 (PDT)
From: Colin Pinnell McAllister <colinmca242@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Colin Pinnell McAllister <colinmca242@gmail.com>
Subject: [PATCH] gstreamer1.0-plugins-good: remove dangling libsoup2 ref
Date: Mon, 15 Jun 2026 17:12:12 -0500
Message-ID: <20260615221212.721364-1-colinmca242@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 22:12:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238861

The removed soup2 packageconfig option is still included in a condition
to either add libsoup-2.4 or libsoup as a RDEPEND for ${PN}-soup. Since
soup3 is now the only packageconfig option, libsoup can be
unconditionally used.

Signed-off-by: Colin Pinnell McAllister <colinmca242@gmail.com>
---
 .../gstreamer/gstreamer1.0-plugins-good_1.28.2.bb               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.2.bb
index 366eb8189c..68029aaa23 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.2.bb
@@ -17,7 +17,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
 DEPENDS += "gstreamer1.0-plugins-base libcap zlib"
 RPROVIDES:${PN}-pulseaudio += "${PN}-pulse"
 RPROVIDES:${PN}-soup += "${PN}-souphttpsrc"
-RDEPENDS:${PN}-soup += "${MLPREFIX}${@bb.utils.contains('PACKAGECONFIG', 'soup2', 'libsoup-2.4', 'libsoup', d)}"
+RDEPENDS:${PN}-soup += "${MLPREFIX}libsoup"
 
 PACKAGECONFIG ??= " \
     ${GSTREAMER_ORC} \
-- 
2.54.0


