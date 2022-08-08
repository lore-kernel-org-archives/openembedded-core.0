Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B48CAC3F6B0
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 06:43:26 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.22607.1659940974449487098
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:43:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eaFgFxkt;
 spf=pass (domain: gmail.com, ip: 209.85.218.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a7so14840035ejp.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Rrh71xddDzyjatKHf5dkG+lPyULKTsTWObTh1cVqxzw=;
        b=eaFgFxktDGbm6D1X+stj6p76mR9LKOTwF1fm6mOl0LMgo7aBE6eXE/iI+kRDHrps3s
         Ui6/8yRZmuwQ7cba+RO3tqBXDP5dddZDmTvDJ6J75wiNUvjHbvGuEPoGoPi9K68tima5
         c4pUgc3e2oH1SLnYHVgRI+ta9IkTZGASzGIyo/oiDOiZe9sZg3e5lAetIZvpdtUU8nFP
         CqjLcGIdlbk9VAZKGjCkrRs0aaYJhbsB4KRR0Y6kQIkrWOCBjco7RZfFqAdEwR1uRnHl
         yzixVsv3zqmXtBtsphbitJqV4J0JnbSRJmnsL+ipi14hbseaVOqKDnWu9PJckwqXRjqc
         DR4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Rrh71xddDzyjatKHf5dkG+lPyULKTsTWObTh1cVqxzw=;
        b=bzWnIFyqLjcOR2QZK3LrCvjuJxzrMzDVZ5GowI6KASsTPIZpLfKKgoyOh+4yRYa7Xk
         uSk9wLTK9GTaVxw1bww1tVUDK55eXviISVLwBtjuKfCE+TlGDjp0jeajmr5YKhSVxdcV
         o9FmCNXmPcPofs9mc9WWmNdcHd9vkXqaaFdOmhoBZK2q0kKdCzRrd3aIeTLLMQO8OrA4
         7aol3z4G7PvAAFhH3mYrX3F3FwWTmEsSl/88hHPqlK7QV1oFiXPweAv38g9byYtOQgD+
         WFjS4mL07gKMePJisPSMMOsPYxI5xxsxWDD/yMOOxtx0jgiofzALYmamXpA4QvGKMX+7
         gYQA==
X-Gm-Message-State: ACgBeo2IGNSO3t4qTH0A4gD/uW663p1mZkiT/p0jNJCCrXzzb65S6q+8
	7ZLR6+sSKXX0PD2vu0KyaH+J125jMaY=
X-Google-Smtp-Source: 
 AA6agR69EDK/X+vyNHLC48dppRrdCYhobwqC6yLQN0E2XkOekwES6SeEDuZE4kT2l3Dk6Rb2tSgEZw==
X-Received: by 2002:a17:906:ef90:b0:730:9cd8:56d7 with SMTP id
 ze16-20020a170906ef9000b007309cd856d7mr12183893ejb.94.1659940999271;
        Sun, 07 Aug 2022 23:43:19 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 q19-20020aa7da93000000b0043bd2a79311sm4153477eds.37.2022.08.07.23.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 23:43:18 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 44/44] weston: upgrade 10.0.1 -> 10.0.2
Date: Mon,  8 Aug 2022 08:42:37 +0200
Message-Id: <20220808064237.3975347-44-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220808064237.3975347-1-alex@linutronix.de>
References: <20220808064237.3975347-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 06:43:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169068

Drop dont-use-plane-add-prop.patch as issue is fixed elsewhere
(see the link in the patch).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../weston/dont-use-plane-add-prop.patch      | 32 -------------------
 .../{weston_10.0.1.bb => weston_10.0.2.bb}    |  4 +--
 2 files changed, 1 insertion(+), 35 deletions(-)
 delete mode 100644 meta/recipes-graphics/wayland/weston/dont-use-plane-add-prop.patch
 rename meta/recipes-graphics/wayland/{weston_10.0.1.bb => weston_10.0.2.bb} (97%)

diff --git a/meta/recipes-graphics/wayland/weston/dont-use-plane-add-prop.patch b/meta/recipes-graphics/wayland/weston/dont-use-plane-add-prop.patch
deleted file mode 100644
index 1ac0695222..0000000000
--- a/meta/recipes-graphics/wayland/weston/dont-use-plane-add-prop.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From ece4c3d261aeec230869c0304ed1011ff6837c16 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 12 Sep 2020 14:04:04 -0700
-Subject: [PATCH] Fix atomic modesetting with musl
-
-atomic modesetting seems to fail with drm weston backend and this patch fixes
-it, below errors are seen before weston exits
-
-atomic: couldn't commit new state: Invalid argument
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/wayland/weston/-/issues/158]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- libweston/backend-drm/kms.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/libweston/backend-drm/kms.c b/libweston/backend-drm/kms.c
-index 780d007..9994da1 100644
---- a/libweston/backend-drm/kms.c
-+++ b/libweston/backend-drm/kms.c
-@@ -1142,8 +1142,8 @@ drm_pending_state_apply_atomic(struct drm_pending_state *pending_state,
- 		wl_list_for_each(plane, &b->plane_list, link) {
- 			drm_debug(b, "\t\t[atomic] starting with plane %lu disabled\n",
- 				  (unsigned long) plane->plane_id);
--			plane_add_prop(req, plane, WDRM_PLANE_CRTC_ID, 0);
--			plane_add_prop(req, plane, WDRM_PLANE_FB_ID, 0);
-+			//plane_add_prop(req, plane, WDRM_PLANE_CRTC_ID, 0);
-+			//plane_add_prop(req, plane, WDRM_PLANE_FB_ID, 0);
- 		}
- 
- 		flags |= DRM_MODE_ATOMIC_ALLOW_MODESET;
diff --git a/meta/recipes-graphics/wayland/weston_10.0.1.bb b/meta/recipes-graphics/wayland/weston_10.0.2.bb
similarity index 97%
rename from meta/recipes-graphics/wayland/weston_10.0.1.bb
rename to meta/recipes-graphics/wayland/weston_10.0.2.bb
index e27dac164e..f81a33fd1e 100644
--- a/meta/recipes-graphics/wayland/weston_10.0.1.bb
+++ b/meta/recipes-graphics/wayland/weston_10.0.2.bb
@@ -13,9 +13,7 @@ SRC_URI = "https://gitlab.freedesktop.org/wayland/weston/-/releases/${PV}/downlo
            file://systemd-notify.weston-start \
            "
 
-SRC_URI:append:libc-musl = " file://dont-use-plane-add-prop.patch "
-
-SRC_URI[sha256sum] = "8a9e52506a865a7410981b04f8341b89b84106db8531ab1f9fdd37b5dc034115"
+SRC_URI[sha256sum] = "89646ca0d9f8d413c2767e5c3828eaa3fa149c2a105b3729a6894fa7cf1549e7"
 
 UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
 
-- 
2.30.2


