Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4331C28B26
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 15:59:04 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.16558.1741190343973321189
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Mar 2025 07:59:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=HCzr7eBm;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2233622fdffso11210485ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 07:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741190343; x=1741795143; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jjSRWo934dVTNPAKAXrzqIwYyPzxdZuHux0mN/GuTDQ=;
        b=HCzr7eBmVkJeF3n6prz15Fmdz/wcC6qu2nZNfJwSAxuz6hdGRuFoGm9NLszdE9RQaD
         BrEtZyff7Nowz4CaCU2FHksir6Vqdd3AH3ChlC3Yp9riFKTHdMgV/u+lNoqMQ39gaQ0E
         BmN0gTiaLDb2kfp8WDh7BooXh8A7AhOJ0WQViTrNIi7k4gpe0zHoz8wLETPWzO4tVX7Q
         XLM5yriALKXe5VErVckWknsIJjHcLNYx1dnf8Z13/VhropRz22eojVkYOp4KIYf2yrWk
         YjFbwWZ6X1TPMoqceUUrOT1DT9XOutMbo4whvlDKNra2Z3mlLYV6QUfywwYvIM0ydgMM
         kl1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741190343; x=1741795143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jjSRWo934dVTNPAKAXrzqIwYyPzxdZuHux0mN/GuTDQ=;
        b=S2GbXToNt8OIvwhJ7BmuutsARjdKYQMcsNY+KObOMMWMSzEXRT2D5ZlQ0Vlqxga5Fx
         GXdNutWIwqKup4Erkgo5c/dupwEevJJNbYb/bfi30qqphzPU+asjQSOwWZFekr8sJ8+Q
         edS7vuichbCenYgYchChV99m8Vw0KsVQNSYWFmk/eVkWsTKudjKb6UJV/B6/E1ND1Ujo
         pO0K7wtmfBYu2yclTCLgNSwcAzVbbNJzqEL5zCh2w3bTDEtM379zbDg2YM18BbNSZ//1
         xGym1yzcp8uZeNFQsUhQe5C9HSDdDcGVhdUbH8Ke43v6V7MVqgP4u7OzGcDym5oI6qdT
         9apQ==
X-Gm-Message-State: AOJu0Yxm7Oqsg1T4IKwd78AT/nstQnH7BMgf8AXAhVDO9Gx6lgua0dBA
	DHOfNzdpa3xyt59eQXWrOlgjnkalFgDnDrQ58YjXy4oqLEv0nwTbK0zsAiGCUpg2s1usqL1Audu
	Y
X-Gm-Gg: ASbGncvBhhC7KFyvcvZ54RUa2kt5OJ/dbLlpa3BuCm99E22sKzrNbnpYEOQ5ePKVs1y
	frazrKwq7GCbjuQ5vB1MZINbzJCP92zgKXLDqE8jUKXDBQ1cauVcKLpLpmiz6aSRxF6ci9fTwlt
	mHFKOONx2Azrz0vrfeQBcb0EE7YccM48esRT8tHkpP4JvuLFgnNI3ZZ0FL9gKfFxjuTYocvHEyB
	gGi4RynWTnR0jH6EQlpQ2eheotvlRL2OGjmMupvbFz4wSXB5gRdjv0aJTXtYZQ9JwYCD6uvViMk
	g7+QKwJn4b9lMs/7kudKQJIQ0cNLVoAUVik=
X-Google-Smtp-Source: AGHT+IHLa4O+q7EaZ45l7WV3X+rJJDdd6s5ax03z+5Skc5CpcZWR8mw2RKyGn2t5j+3fGgHWfDtVUQ==
X-Received: by 2002:a17:903:186:b0:21f:7082:1137 with SMTP id d9443c01a7336-223f1ca2630mr67355805ad.22.1741190343222;
        Wed, 05 Mar 2025 07:59:03 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:2308:d28:2350:a5eb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501f97bfsm115411025ad.85.2025.03.05.07.59.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 07:59:02 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/16] xwayland: Fix CVE-2024-31081
Date: Wed,  5 Mar 2025 07:58:34 -0800
Message-ID: <3575ad718c8ea7d808247842df19982f00725187.1741190221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741190221.git.steve@sakoman.com>
References: <cover.1741190221.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 15:59:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212327

From: Vijay Anusuri <vanusuri@mvista.com>

Patch copied from xserver-xorg recipe.
CVE reported for both and patch apply on both.

Upstream-Commit: https://gitlab.freedesktop.org/xorg/xserver/-/commit/3e77295f888c67fc7645db5d0c00926a29ffecee

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xwayland/xwayland/CVE-2024-31081.patch    | 47 +++++++++++++++++++
 .../xwayland/xwayland_22.1.8.bb               |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2024-31081.patch

diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2024-31081.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2024-31081.patch
new file mode 100644
index 0000000000..4380004700
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2024-31081.patch
@@ -0,0 +1,47 @@
+From 3e77295f888c67fc7645db5d0c00926a29ffecee Mon Sep 17 00:00:00 2001
+From: Alan Coopersmith <alan.coopersmith@oracle.com>
+Date: Fri, 22 Mar 2024 18:56:27 -0700
+Subject: [PATCH] Xi: ProcXIPassiveGrabDevice needs to use unswapped length to
+ send reply
+
+CVE-2024-31081
+
+Fixes: d220d6907 ("Xi: add GrabButton and GrabKeysym code.")
+Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/1463>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/3e77295f888c67fc7645db5d0c00926a29ffecee]
+CVE: CVE-2024-31081
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ Xi/xipassivegrab.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/Xi/xipassivegrab.c b/Xi/xipassivegrab.c
+index c9ac2f8553..896233bec2 100644
+--- a/Xi/xipassivegrab.c
++++ b/Xi/xipassivegrab.c
+@@ -93,6 +93,7 @@ ProcXIPassiveGrabDevice(ClientPtr client)
+     GrabParameters param;
+     void *tmp;
+     int mask_len;
++    uint32_t length;
+ 
+     REQUEST(xXIPassiveGrabDeviceReq);
+     REQUEST_FIXED_SIZE(xXIPassiveGrabDeviceReq,
+@@ -247,9 +248,11 @@ ProcXIPassiveGrabDevice(ClientPtr client)
+         }
+     }
+ 
++    /* save the value before SRepXIPassiveGrabDevice swaps it */
++    length = rep.length;
+     WriteReplyToClient(client, sizeof(rep), &rep);
+     if (rep.num_modifiers)
+-        WriteToClient(client, rep.length * 4, modifiers_failed);
++        WriteToClient(client, length * 4, modifiers_failed);
+ 
+  out:
+     free(modifiers_failed);
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
index 78e849b305..5fa2402234 100644
--- a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
@@ -25,6 +25,7 @@ SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
            file://CVE-2024-21886-1.patch \
            file://CVE-2024-21886-2.patch \
            file://CVE-2024-31080.patch \
+           file://CVE-2024-31081.patch \
 "
 SRC_URI[sha256sum] = "d11eeee73290b88ea8da42a7d9350dedfaba856ce4ae44e58c045ad9ecaa2f73"
 
-- 
2.43.0


