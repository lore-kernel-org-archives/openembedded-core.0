Return-Path: <jed.openxt@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id BC4927BF12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 18:06:56 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id a1so7828893qkc.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 10:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=TFYUyFlFZT6rRvKRZRDLODm3Rr3kUEktagcC6T4nF68=;
	b=Jc3Sb0qZ/QBcwQWliFflUUDRAufOowZJMEA4ZNhERJv/X5/UKeq96WLiZU/3oStstg
	jUwyjXg2nQmCiqioD1F2b/svKd/VDc/5uXX3YaBMxNLGXB/lTVF0yI3vQeC+JaFg5GEf
	xhUmcRA5eB0CF7MYIxJCWRlIZ2EdfvntYcEwj6kKv6YSvRDO82yLFPpB5AfCyZxExYRJ
	JJv4wBPZubuxnAN2BsE/g6gNHPystMRzqU685H6EQO2JG0PqbG/18plSDrIQRVXWeUsH
	CxUiNdrqiStcGIrJs4kd/mJnVLT+QF7+z6JS0NVaG0nNjv/MeJn5cXmRKFE2LY/xR+eW
	0u0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=TFYUyFlFZT6rRvKRZRDLODm3Rr3kUEktagcC6T4nF68=;
	b=C2vv1C3PtDbr8lZQkIwDyhg+eEO0H8+y5Le7sZ5LzUzxV6dr7DsIsz6ribquVfnibp
	sCRAXi7PyYVKISKBie3pk7b9Jr9OEeXKjA710kPs/AJRThQZIVR5vmAsOls97aJk+0Z7
	iEqivlN9rbOU2AlPhPrQ6AeJyQM0Hvx6Hbz0i/Dkrt9O3MB74qu622w1dfFxGA24eC0v
	B5F/yh5yH9oj+sXH80C5rLqZQG9JBRc4yVE8Xu9McDQupp/x9wr6vw7pfgkj/IL6XygX
	O7K6bFHnkwYYMktEtqgvzxqRXWAENZL7dDWIX5VkAtFR+yyM6eMYffWVOrh+jo8jTe9a
	e8hw==
X-Gm-Message-State: AA+aEWY05OjkbTzezCObYl6VzZL+MlP54pV2gJn3Kyo/fWxEaweOQU3T
	eHzer9hhUAMuxaDaJkEYuTyA72Sw
X-Google-Smtp-Source: AFSGD/W1z6XbMt3xVFoa4Yc15v4RfqcwXf/ew7h1Uh0wA7FMm//ulvxaYw56YGrfMv0IODe1pmDieQ==
X-Received: by 2002:a37:6f85:: with SMTP id
	k127mr13079599qkc.240.1545070017509; 
	Mon, 17 Dec 2018 10:06:57 -0800 (PST)
Received: from jed.securext.net (50-205-235-218-static.hfc.comcastbusiness.net.
	[50.205.235.218]) by smtp.gmail.com with ESMTPSA id
	o49sm9079600qtf.60.2018.12.17.10.06.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Dec 2018 10:06:56 -0800 (PST)
From: Jed <jed.openxt@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Dec 2018 13:06:51 -0500
Message-Id: <20181217180651.16040-1-jed.openxt@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] gtk3: enable wayland banckend
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
X-List-Received-Date: Mon, 17 Dec 2018 18:06:56 -0000

It is disabled by default, and required for things like mutter to
be able to run under Wayland.

Signed-off-by: Jed <jed.openxt@gmail.com>
---
 meta/recipes-gnome/gtk+/gtk+3.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gtk+3.inc
index 6331a4323c..83967ccb7e 100644
--- a/meta/recipes-gnome/gtk+/gtk+3.inc
+++ b/meta/recipes-gnome/gtk+/gtk+3.inc
@@ -35,6 +35,7 @@ EXTRA_OECONF += " \
                  --enable-modules \
                  --disable-cups \
                  --disable-colord \
+                 --enable-wayland-backend \
                  ${@bb.utils.contains("DISTRO_FEATURES", "x11", "", "--disable-gtk-doc", d)} \
                  "
 
-- 
2.11.0


