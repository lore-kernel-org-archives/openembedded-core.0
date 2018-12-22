Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7D8606025E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Dec 2018 18:25:23 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id w4so3963320plz.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Dec 2018 10:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=SKZDLWX/zIn/kKSMe372e9IS0WFdHm28pVDmw2Iqrzw=;
	b=EhI9IneyQ6fTnZY4UbLIqim6KwNCUlFZgZ3GborG+wdt93WgqMCGI/8+ZOj0/UgUdh
	cJRaJCtabJ44WB96/Rb8vWiLA5DnwxM4Fy/Gm6k84zMoVEdsztclF976aeBBQk0kgiQB
	udVf9v+MOYWweEyA6x8vPLUP1PSg+bGwCxFutUXMD4GeNHqWvRFnBfk85fNdcZxmIvqq
	bWa0qv+42D6WotNVU3w6UEEg1qAMnVE1whYE5SjAVx/V86RS39uQfhETHzDzMmy7M2wy
	yCkvnLegnI5KPNlNKe1QTbJ91kp5n23TFcWpAk/g2d53Eo8Ey6DuydKb0o4HnCDhfLId
	U6Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=SKZDLWX/zIn/kKSMe372e9IS0WFdHm28pVDmw2Iqrzw=;
	b=mEQJjGHyjKhZfoK7IZ6Lw+1KZMpV1so1U4aTuHX3BfqMeQD+rxpekBsxz6Gee7YQXI
	XiL5AGBaSCdEb+afRE1lKmIQclHSjkAicxCh36w2iuPWPALIkQg/jJpq9NHTP+iBy1Z1
	WADfSe7wg0Grr1K7BWUBOit4mYTr1Ss92UmKrbGXlVsVLwY5VDK0w2VwgPLFykchorZO
	IgJGiAe/Kim0sKPXX9V1w5QnoWTJjW9x+w76289YuwoTtyngOVN4wbQcgHoVJj5/fssJ
	/ax+mDjcqyQeLqhKUub9scEjVVBOfMehjKvlExAU9THCgS2rq/lcLugvFS6Cc9P7o2Ow
	CUWg==
X-Gm-Message-State: AJcUukecPUUohTC0PrrVhBxOXPScrgNnOC0KVeOnUluvZPetr0r4Tq/C
	CpRjt6NKjWIVfrn1OLe9R9hrM3p8LTk=
X-Google-Smtp-Source: ALg8bN4BhAjlqswGhVlgOXmK8aAmzu/IGmAhaNmA9uK19CYNpHv33DRsXCR5azMQBVs0cSJzsfEqlQ==
X-Received: by 2002:a17:902:a5ca:: with SMTP id
	t10mr7296550plq.139.1545503124267; 
	Sat, 22 Dec 2018 10:25:24 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:877f:9499::19ec])
	by smtp.gmail.com with ESMTPSA id
	y5sm34794375pge.49.2018.12.22.10.25.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 22 Dec 2018 10:25:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 22 Dec 2018 10:25:12 -0800
Message-Id: <20181222182512.6831-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] musl: Update to latest master
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
X-List-Received-Date: Sat, 22 Dec 2018 18:25:24 -0000
Content-Transfer-Encoding: 8bit

* sync APIs from  kernel v4.18
* Misc bug fixes

Full logs
https://git.musl-libc.org/cgit/musl/log/?qt=range&q=39ef612aa193cc6e954ac5a01574300ccd4b7ef9..21a172dd36cae7a08492fd3a7500d7bf0daee13e

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 046a08aec2..33d6e69130 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,7 +4,7 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "39ef612aa193cc6e954ac5a01574300ccd4b7ef9"
+SRCREV = "21a172dd36cae7a08492fd3a7500d7bf0daee13e"
 
 PV = "1.1.20+git${SRCPV}"
 
-- 
2.20.1


