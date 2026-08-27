Return-Path: <dpmin7@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 294E8C5DF97
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 00:57:50 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26768.1787792262036072083
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 17:57:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qUCLL9RK;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: dpmin7@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ceaf8a1265so2633095ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 17:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787792261; x=1788397061; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ns2Drx5vAiuUmnZxfarqACfV60evAqrFR/FOeihBlQo=;
        b=qUCLL9RKgwymqLrIYShpIKaju7zaETDQJcbh7ZZmiuP+kZa3iIxrNtcqAlwTHe/Q9C
         G0jRHnBFpsqQ5EyBhjl22+WWrhgMkwSapQPeBHuJC6V0wYXSJZGTsGb0RlwjrjNwFnb5
         Atxyvcd1yDSEHwSt7HP13BSQoWiBmLF2jnYxKUoq7D4WSjrAStkvgaoaTzkG3DHUUo+S
         IoxT9NpNaBP9J86WhD0xK+LRmkKSCvRZXegmMGMrQLU+9zpl38rMS7lWdPsHb16l9q+0
         FJeeaBDqtsp2AVU+ICJCbieFdNduKr0ksfLlMDxyiqpqtAjFo35Fwz6Qdu8YEW/Lj0di
         zo+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787792261; x=1788397061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ns2Drx5vAiuUmnZxfarqACfV60evAqrFR/FOeihBlQo=;
        b=OhbYYc54/Ec1COW2e8zxIcJ4w3r/N19EVbIeipYDEfn90okk/G+lPS/uxH+KRokHbe
         MSM5psxJzxPc7BN90z2U3H2FKMdLGI/jp/hWEWgNq1/tGicyXzSXjYKljCIW+N3cPk9R
         /QAAE9DoTs9YNyx6AEumYu8HcqVWhrylKTIF6O3ZAXx9bbxBSvzZe+iAGm/hRMz9GSqM
         im6C1ECsxDi7adBQVdg3ZFzaHM+aMLKzqFTnAgVy1p3pQ5mUx+bZA2RVORDv74+5dKGx
         QRJuAxYAZWq+SL5PUjlGm8+6Su94CL/UnNMh04sY8yzprqQuai1BZyk1Zpzgr8tJ5sNt
         KoTw==
X-Gm-Message-State: AFuF++m2T5lwcPi+orWdXAIueK5jS2udWszlmaM5ipiNa7MGl+rVy0p4
	fvIVOw7gYm5lhbPW4rg/oN3e0idt6ASTuU6OqYs4YEZ9roEAXGQnB1x70c4Eqw==
X-Gm-Gg: AR+sD101x/0OS5fs/es7uvSeB7dvKTMAgkrdMJmO2fwo2KiltuQ4gWlK/N6EZuvJpoe
	VETflsaBfQUE7qPMp6rApf7mz4OGqfgF8DbWmxTA/8hnl6RGOZYWn5igQPGKeTXTsD0TgTrxolj
	y/RgYzno4IGZVPSZ4eMVQftDrEK3Ju7nyh85rdwWjvJAfA87GYT9hxDXvEwXTqoAX6nyHL4teBl
	Ys758BBZZLzFwh+tJBluLddJpN9O4nZBwaihs0mHAZWMIooO2DYwShL0a7/H90JfmQvmJLWu4Xq
	sMWfhTCFlCsklW+64BbS+IqqRU2wJhjfLSUbvNy8cuDQBe6pu/wLliHxiPBiJXrcBZUxr10L2ue
	bDv9VRz3pLD66a6sBK/8ce1+BtyxcrtSuNCIka34e/daKR2Ue9tK5REzoop1OnXB2ggQFj46jv6
	rL6GRN1N/RsGL3x7z9g8dfHDBJgrQoZpG+LNgJMQqQVaTJdAa1rQ==
X-Received: by 2002:a17:903:40c6:b0:2c9:b396:1a55 with SMTP id d9443c01a7336-2d707b9ad9amr187572795ad.12.1787792261300;
        Wed, 26 Aug 2026 17:57:41 -0700 (PDT)
Received: from dpmin-PC.. ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d72a3b0564sm2450535ad.7.2026.08.26.17.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 17:57:40 -0700 (PDT)
From: Kyungjik Min <dpmin7@gmail.com>
X-Google-Original-From: Kyungjik Min <dp.min@lge.com>
To: openembedded-core@lists.openembedded.org
Cc: Kyungjik Min <dp.min@lge.com>
Subject: [OE-core][wrynose][PATCH] rootfs.py: fix run-postinsts removal on multilib images
Date: Thu, 27 Aug 2026 09:57:33 +0900
Message-ID: <20260827005733.2083812-1-dp.min@lge.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 00:57:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244443

ROOTFS_BOOTSTRAP_INSTALL in image.bbclass unconditionally stages
run-postinsts into every image. When no delayed postinsts remain,
_uninstall_unneeded() is supposed to remove it again, but the removal
call used the bare "run-postinsts" package name without applying
MLPREFIX.

On a multilib image (e.g. lib32-core-image-minimal), the package that
is actually installed is lib32-run-postinsts, so the unprefixed
removal silently matches nothing and run-postinsts leaks into the
final image manifest, along with its now-pointless init script /
systemd unit.

Expand MLPREFIX before removing the package, matching the pattern
already used elsewhere in oe-core (e.g. oe/package.py) for
package-name lookups that need to work across multilib variants.

Signed-off-by: Kyungjik Min <dp.min@lge.com>
---
 meta/lib/oe/rootfs.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 7ef7e71f9e..3504762b7e 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -267,7 +267,8 @@ class Rootfs(object, metaclass=ABCMeta):
         delayed_postinsts = self._get_delayed_postinsts()
         if delayed_postinsts is None:
             if os.path.exists(self.d.expand("${IMAGE_ROOTFS}${sysconfdir}/init.d/run-postinsts")) or os.path.exists(self.d.expand("${IMAGE_ROOTFS}${systemd_system_unitdir}/run-postinsts.service")):
-                self.pm.remove(["run-postinsts"])
+                mlprefix = self.d.getVar('MLPREFIX') or ""
+                self.pm.remove([mlprefix + "run-postinsts"])
 
         image_rorfs = bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs",
                                         True, False, self.d) and \

