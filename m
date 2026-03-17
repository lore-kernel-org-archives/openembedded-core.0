Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 668F7FB5E8F
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 00:03:43 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.65251.1773705821995276441
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 17:03:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fWTcRZmq;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: michalwsieron@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6644a3029b3so5740534a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 17:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773705820; x=1774310620; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HpL3PvOqNge6/0QBSs6ccdGqgW0U61BJq9ErIVqcoGk=;
        b=fWTcRZmqP72p3JPae6T42xpBLwWX3xFyc7j/J1w1xh4oK6j+HfpuhP8bTKrG/rpYmU
         e3lg6RXX1vDRkoXj9I/+iZFf5oKGDhX+GfjssksI6ngaS1gbcVnR0zibO9neKiqY6Wuj
         DpSxqgJiY0M6jUt2R5X745EQudpY4XAuohL8r3laI95GUbWIQr6+BTrkkg4pH2OSS7ht
         1EU9YBHPpwGB/8ohXR/FuzX4dQ10TnD9EukR9gZit/3Kts4hJ1XBsKI4bp4NrYC/FYRq
         h6CcKoUxPa34JoL8hGg/21VfUKXJ2owIvDBpVmxMTEc8FAfrLuW5w7FBIbZKJ74n9PLm
         l9Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773705820; x=1774310620;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HpL3PvOqNge6/0QBSs6ccdGqgW0U61BJq9ErIVqcoGk=;
        b=j2M/6jqFinIDaFnSIL5GAOlhJvPCU5gSzfPavug5CTpGzmGnXA8JxkDukEWCH30/WL
         uR+A2SAjJXQov7qEuSwalat1ws8OIbd95uHovhgu5+X7tiMMQeIGjGdaGeaSYLpYJG9W
         F5ArLngocUuxJZ8ozqB5tfUScd1G6honj8LUgv/eyVQACaeirRd+SDNlw/HYIZeOafFP
         h2FQlY+GW+DZctvNVH02klBoCJoIDr8VF9Sq1rg7R1vb/Z06OJAwoXqSxyehrWfYBYaD
         uyd2DXMKm0avKIhnG0rDMTzzsFKEytU5dq1IjQJt5VKxAo18hpP9M8hL/tyiAAVmutws
         vw3g==
X-Gm-Message-State: AOJu0YzNnM1soyjQJiSSAUdIS+TP3vz3FkhMNVwz45z36kJG4X1uJx7I
	5VDVEZgmf7YSSQoKxx2QTu2qUphNbdz/XikqSq35lngDg6uV6Vag61cw
X-Gm-Gg: ATEYQzwCzRgQ0jhmdBcL7ZlZaC5E0yJCjJj7bQlB4MFwGyvRXU9xIvKO0vsoortylAQ
	O6aH0tZnUDUzpRlgBwKqoqEQOTKxliFsSwS1F8Zkl37DZspg1mgZmKD7DV6boBV93vc7Pdc4INs
	49mqixkhOY/vFquZoQgKef/Mm7suBH8SAoaXJxyR9KRDfxJupuSUqOAbXigg9mcRjFxKKW0bVr/
	MJ66d1ALUD6AFGmKVV6+E+6pbeJN+jL/fCmUeHQqyDudk07u1JJR02WT/SitaY+JZ7cNq/8M7CF
	K2FAys/RYbtFph6cRTpUcKP0Tm8tG1gi39nFwXbDZNmKjUgVN6EVXauSAQal881dGSR7nA4iJ9V
	jFDi1ffeBeyVUc4B98YYtLIwtvH7snM7EzvHPPuNkKvU3mcx8jfErLVKaRfqjj2SzFyl/dWrAwG
	Geq9a5LbyWgRUAJUl3nm7X+xVavcgHwm6+Nphf6jkZw7frIXx1GlHSBImn4HZ6cls+CA==
X-Received: by 2002:a17:907:e90:b0:b97:76dc:ebb with SMTP id a640c23a62f3a-b9776dc12bemr841111866b.40.1773705820180;
        Mon, 16 Mar 2026 17:03:40 -0700 (PDT)
Received: from [127.0.1.1] (93-159-20-97.cgnat.inetia.pl. [93.159.20.97])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cf49fa6sm654584766b.58.2026.03.16.17.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 17:03:39 -0700 (PDT)
From: Michal Sieron <michalwsieron@gmail.com>
Date: Tue, 17 Mar 2026 01:03:15 +0100
Subject: [PATCH v2 11/12] qemu: Convert confusing append to override syntax
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-fix-invalid-appends-v2-11-5c65ae5787d9@gmail.com>
References: <20260317-fix-invalid-appends-v2-0-5c65ae5787d9@gmail.com>
In-Reply-To: <20260317-fix-invalid-appends-v2-0-5c65ae5787d9@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Michal Sieron <michalwsieron@gmail.com>
X-Mailer: b4 0.14.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 00:03:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233284

While in this case `RDEPENDS:${PN}-common:class-target +=` wouldn't
result in any unwanted override, there is no guarantee there won't be a
change, which would be hidden by this override. To avoid any surprises
in the future let's use `:append:class-target =` syntax here.

Signed-off-by: Michal Sieron <michalwsieron@gmail.com>
---
 meta/recipes-devtools/qemu/qemu_10.2.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu_10.2.0.bb b/meta/recipes-devtools/qemu/qemu_10.2.0.bb
index 5d544d8d13..1abc035a47 100644
--- a/meta/recipes-devtools/qemu/qemu_10.2.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_10.2.0.bb
@@ -9,7 +9,7 @@ DEPENDS:append:libc-musl = " libucontext"
 CFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', '-DEGL_NO_X11=1', d)}"
 LDFLAGS:append:toolchain-clang:x86 = " -latomic"
 
-RDEPENDS:${PN}-common:class-target += "bash"
+RDEPENDS:${PN}-common:append:class-target = " bash"
 
 EXTRA_OECONF:append:class-target = " --target-list=${@get_qemu_target_list(d)}"
 EXTRA_OECONF:append:class-target:mipsarcho32 = "${@bb.utils.contains('BBEXTENDCURR', 'multilib', ' --disable-capstone', '', d)}"

-- 
2.53.0


