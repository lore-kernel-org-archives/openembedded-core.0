Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2431.1795462099406484745
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2026 11:28:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@9elements.com header.s=google header.b=MgrrWEUD;
 spf=pass (domain: 9elements.com, ip: 209.85.208.49, mailfrom: tan.siewert@9elements.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6ba12b00c76so3822342a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 11:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1795462097; x=1796066897; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oZF2A4QUYZwOT0EhKIst7I1/2TSfqyypakCY4VsRYmY=;
        b=MgrrWEUDtXuADQi76qswMeNzYWF3kuCcP2t642QFT22P3ppWvpc4QKwdzKSiZH4ir4
         evHpY/GIY9Dt5RhkJhdNCv7OsVDRkveM+7Wlkbg/9AbdlfEOke19JropUdsPNNpa6X6N
         EiBvjgH0e1PN9s823ggzsEiRpofWzuUP4bG7cqFBi/Y0ByACitCVAil88ou9bSS+T7Z4
         r/ZTB1/4Itig7UvLJKrsIw7N01gbX4WsbtcaK2Q7uD922TryERoAMk7Cy/Bnp0MRkjc/
         pGnH4zoEiSBuhL+3dZDRrrESXidmVP5rMe4ybizTlN+4LafdZeoMq5XzBWqafL0YoQ3u
         9qJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462097; x=1796066897;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oZF2A4QUYZwOT0EhKIst7I1/2TSfqyypakCY4VsRYmY=;
        b=L7nKgp+9aLSHmd1cgp+7L76Y1aQfyij9thzZdm5ynyqch7hx47tXU24G4egSsm+Jxa
         PaW9UHt9qYtuv9Vt6uTiCWdkJhmTFmCs897j6DQ2fUWQzA8sIgZxmuLlB6JlTkdCZScQ
         8PnBGV//O+FZUi0Z6Rfy9Zl/IB7oWWPUst10wmM3KP+y+UQkw1RD2jCiaJIrTcRcRhvZ
         DXyyElW2Gs3xhA+EaqOKL6YZzQRx+erB+HC8uDmlTW1WNDjwLXSFvKUYMv4W0HkwThqR
         MhriTFTZ65eFmCEddGCVtBOFvJtXaDC4zYPMx9fIGsP/ajNPGV+WbS6Fq2QArBoKIxIl
         fSjw==
X-Gm-Message-State: APuU4Z8raCA42PAscqEMNX/czvEBmDgPQn3s4+VdnycSq8DixpfjO5JA
	npcZvA//ojS36G2kZurZNovkYlqVI5zgHJz0pzt/w3yO34sV1+uV2PzSqUnrPAoBgQz9HUZmvBx
	ZzHHxNtpKdQ==
X-Gm-Gg: AZFdTZdGHZZEdc14NBQc2GoJuzbtMFb6L1z1JFqiNMeaLX5TGFbX/c9jc20OZlJDqlt
	HAmFVQ1KFKLjQFt0hi28lmhKehqj10/Hz6YR6baI7gs1GacmeW9zku/P0n8a6ye/qguTq51QsJS
	nRxQMglyagfv7e6numqC7CFuxIaHuywsWjCLPVO4DOuBF3fDaBrVAPb+nRcNkPUXWc49aToqKBb
	Z/OeQsq4qYj9GRsdIpouAQveDEZucvAPOYqClkzoLHVLuAS4RcSen51NxaFe36JDfF1+r8Y8wKv
	qBwPtgn2J/vDOShAdw30GPH7iGJ4Kr71Vn9teBmLoLDQxlDE8EC56WzoUnLNnS6dYTFjhYudDrg
	ha3KGoPnTF+PbcVv9g0Zm83dAIDTmsUvfWYGdOouX4gbIzxe7E1MSI2O/gSg5xaT0mfVN/WVwS4
	xJ9nTUAGuTbOQdBw8ilLHgdXF+0L5pfip3zj2nso/1lkp7goQuo1dLc6RLWx5Cf9n2AMfSzth8I
	1qFELaG94gz6rSXkjXf1uyIwVpafrnSem+JurNhESFqiSkuA7X5DEP6Z4bJ9N72tRi4btiy5Git
	3QyuwTMlutG6K7BdbrCT34i+jKdkLC6WDGnkKk5Y12jlSZHI/wEyI6sFCsH1n6S58PRsvwSOXBu
	Ih57Fvov6OnFsQBEEiGEOyPiyIUeRkCrr
X-Received: by 2002:a05:600c:4e0b:b0:49f:e772:6ddf with SMTP id 5b1f17b1804b1-4bb8881ae90mr269038645e9.32.1795461778705;
        Mon, 23 Nov 2026 11:22:58 -0800 (PST)
Return-Path: <tan.siewert@9elements.com>
Received: from white-mocha.local (p200300e66714e500bfe47b00fa11e276.dip0.t-ipconnect.de. [2003:e6:6714:e500:bfe4:7b00:fa11:e276])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm299291305e9.2.2026.11.23.11.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:22:58 -0800 (PST)
From: Tan Siewert <tan.siewert@9elements.com>
Date: Mon, 23 Nov 2026 20:22:43 +0100
Subject: [PATCH v2 3/4] systemd: add hwdb packageconfig
MIME-Version: 1.0
Message-Id: <20261123-systemd-optimisations-v2-3-0ecd5965985c@9elements.com>
References: <20261123-systemd-optimisations-v2-0-0ecd5965985c@9elements.com>
In-Reply-To: <20261123-systemd-optimisations-v2-0-0ecd5965985c@9elements.com>
To: openembedded-core@lists.openembedded.org
Cc: Sai Sireesha T <saisireesha.t@windriver.com>, 
 Tan Siewert <tan.siewert@9elements.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795461768; l=1823;
 i=tan.siewert@9elements.com; s=20260527; h=from:subject:message-id;
 bh=e5dxgp961F868z/JWBcaaldHp09K+vpyDzo2f8X/AtE=;
 b=0fRkWnDNjJu/T7DrMKSvIdTpGPyBD3Pzo7T4mULXVVXVOCWVA90U1f1y7CxWp98nQxdRmD0xr
 OiivPNvDjudBsY+ZM9lu0l/jU3Fk2XxXjBdt0FSLuOqaPlhoSiLKAzb
X-Developer-Key: i=tan.siewert@9elements.com; a=ed25519;
 pk=ORQd/zQf+LsAvJGXP1CjQwVO6t6iEOGq/eGUsmRVTG4=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 20:15:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250933

The hwdb is not that useful on embedded devices which may never see HID
or PCI devices, and it uses a fair amount of storage.

Add a packageconfig option which is enabled by default and only
recommends udev-hwdb when it is enabled. usbutils and similar only
RRECOMMEND it, so disabling it does not break them.

Signed-off-by: Tan Siewert <tan.siewert@9elements.com>
---
 meta/recipes-core/systemd/systemd_262.2.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_262.2.bb b/meta/recipes-core/systemd/systemd_262.2.bb
index 899df09fa2..5841ee3322 100644
--- a/meta/recipes-core/systemd/systemd_262.2.bb
+++ b/meta/recipes-core/systemd/systemd_262.2.bb
@@ -59,6 +59,7 @@ PACKAGECONFIG ??= " \
     gshadow \
     hibernate \
     hostnamed \
+    hwdb \
     idn \
     ima \
     kmod \
@@ -137,6 +138,7 @@ PACKAGECONFIG[homed] = "-Dhomed=enabled,-Dhomed=disabled"
 PACKAGECONFIG[gshadow] = "-Dgshadow=true,-Dgshadow=false"
 PACKAGECONFIG[hibernate] = "-Dhibernate=true,-Dhibernate=false"
 PACKAGECONFIG[hostnamed] = "-Dhostnamed=true,-Dhostnamed=false"
+PACKAGECONFIG[hwdb] = "-Dhwdb=true,-Dhwdb=false"
 PACKAGECONFIG[idn] = "-Didn=true,-Didn=false"
 PACKAGECONFIG[ima] = "-Dima=true,-Dima=false"
 # importd requires journal-upload/xz/zlib/bzip2/gcrypt
@@ -759,7 +761,7 @@ RDEPENDS:${PN} += "systemd-serialgetty"
 RDEPENDS:${PN} += "volatile-binds"
 
 RRECOMMENDS:${PN} += "${PN}-extra-utils \
-                      udev-hwdb \
+                      ${@bb.utils.contains('PACKAGECONFIG', 'hwdb', 'udev-hwdb', '', d)} \
                       e2fsprogs-e2fsck \
                       kernel-module-autofs4 kernel-module-unix kernel-module-ipv6 kernel-module-sch-fq-codel \
                       os-release \

-- 
2.56.0

