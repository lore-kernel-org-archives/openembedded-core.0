Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web08.1163.1604335796650919103
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:49:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TeREBGc4;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id dk16so19220314ejb.12
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rtuTtJJRofy1RojJxEDdJKjPtjEkkpeacAIwBPiq+jE=;
        b=TeREBGc4jr18vcfNAGR/T9yiFQQSv7wYjyGWiAH3EDRBg1VGs7The58v8TIlGfRwSU
         ODOcpFHK9MzZB5SjteORSdn5m2xZ+vUp28wU1QaxEvpsvk32XQm8rXc8BYVAvvBSfzag
         sLKzZAAqJ5xwiRouuV/zJTiCInT8nhhLE0XXZFOzZSGfc2bgI8iOh/omPJWbJUrXYzz+
         UWDa0MizL+ufyeLu44IjVYq5VuaG/yayzLgk7BbDdkzFToQFuQNSRQNyTdISOML2fCps
         nNLHuk120ZNuJuiY1Gwvrm9lagWxTpWKpp7DzQyZhDMXs14dtmT+McGdYemdVJHhQoNb
         ruzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rtuTtJJRofy1RojJxEDdJKjPtjEkkpeacAIwBPiq+jE=;
        b=D9GnCP5RUU2qnvmnwQLfrU7zkJqJydPjn0dtpOGFWWkDq8ZlBMkObfIQ1LWoM3TEfH
         zWQXqho0N1UaZ6gB3IK3o6HlxsSFCQVtTtoaHgNkz+Z4mdOkMrqEVmb0KKkNggCgik9u
         WTV2QHrepfzO2cjhweQDiGqey3c1jHMxtCpzPqAG36q0uVFDxE/3uE6od4VZfm1Xt2at
         x34ldhf9f9nngcvJg4S/U1zjMCeojJLJzBfhViYBL47bjBaVhlUmuik49dkEvKs2m+yc
         Ah63pn4C/DrLXtiwl/ttODWA4s53tCloKjdK+nqpi09HwHUrLqRL+fj2DNsBx4mkguxu
         mdRQ==
X-Gm-Message-State: AOAM53166coLERUlol7F+9pQYRT7MX+Ii+A+A80PJjiBHvgBMbD/ZAJw
	FJUy7ubMDcu1GgeSibTTRFhBbo0sUdSDjw==
X-Google-Smtp-Source: ABdhPJz4yXHaZ5QaYlfLlvqv4AV6Sx72e9JagfSbhOcVp3kS66rAa+8ykn+JUyuqCOeTmyiqZqd/3w==
X-Received: by 2002:a17:906:c18c:: with SMTP id g12mr2351053ejz.334.1604335795044;
        Mon, 02 Nov 2020 08:49:55 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:49:54 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 42/80] sudo: upgrade 1.9.3 -> 1.9.3p1
Date: Mon,  2 Nov 2020 17:48:29 +0100
Message-Id: <20201102164907.27572-42-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-extended/sudo/{sudo_1.9.3.bb => sudo_1.9.3p1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sudo/{sudo_1.9.3.bb => sudo_1.9.3p1.bb} (95%)

diff --git a/meta/recipes-extended/sudo/sudo_1.9.3.bb b/meta/recipes-extended/sudo/sudo_1.9.3p1.bb
similarity index 95%
rename from meta/recipes-extended/sudo/sudo_1.9.3.bb
rename to meta/recipes-extended/sudo/sudo_1.9.3p1.bb
index 270625ebe8..08a0fa03a3 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.3.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.3p1.bb
@@ -6,7 +6,7 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[sha256sum] = "1d9889cc3b3b15ed8c2c7c3de3aa392a3a726838d020815067c080525c3f5837"
+SRC_URI[sha256sum] = "dcb9de53e45e1c39042074b847f5e0d8ae1890725dd6a9d9101a81569e6eb49e"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.29.0

