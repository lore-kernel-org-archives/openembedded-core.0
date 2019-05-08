Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 67C907DDA8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 10:13:34 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id v11so6289833wru.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 May 2019 03:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=y8N0+ZtVtx0phZaZ4qvHH9+mZPy/JMxGlfZz+q+tMFE=;
	b=GbMcjOBqLplEWe6sc3LM6JqmF8afx7HO+2zas2DhZDdfwfvN58SwiIHixPxbzvdK93
	3aXvbjvjk5Ey7vic7r/09jV6Zue+bIZka5EnnDyhSCrkAbEsub3DAK5LY6g3YOc95vXF
	KUOdXh1lQitfxzqXDGcIIzrvtRyq8EWH0AQDPQQKdr6rwA5doX+jmo3l0LE/5032rY4X
	dydog+MF8USyGVAs0eFdzykhxRpUvWuGUPd7mm6Ylr/aqFuzS1HaSMG8x8QgNWQEwh5V
	lVTOhePtD7JoiGeU+g9ZX5Go/RVlXUkFn5BPjh4h9+HfENPVKKTj2UotkQM+j7fyS5+J
	Atcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=y8N0+ZtVtx0phZaZ4qvHH9+mZPy/JMxGlfZz+q+tMFE=;
	b=UBbyZTaO2g28ceZPk5U0JI7yDfVzy/9rxDh59tqXCTju5zLkAhNOQ/OxuHdoQnfBsf
	srELJICdZz2uGHqpn7bvir5cN9irrcUvlOyN5UsHnilIP4F6LRNrteQa0KOnCNQDqQ0C
	uDvdLeO13GXUj02Ir1VqDgxiVNnCgfoFR2ukb50IXHi4zW1J166PpJEPrgpK9gj/4pO/
	ouh4x41uotr8U3Eao4hp96joXJWPI4BFNc8M8xA8RToQTs55TB6m1rJB/NXx9TKnbvN8
	U/RaLNXd++mVGznFw5E8MGZSHvmpRuyW/7Aj9hM8WmdhTte0qAch733wKxF/VF+iAAfk
	pYFQ==
X-Gm-Message-State: APjAAAVjg6YYOdIDi4aUjxXUrcEtgl5BqThAmW8LN/raJijDabrpo4LW
	yttickC4GEUypsJKIBPU/DRAIrQD
X-Google-Smtp-Source: APXvYqxRuTq/fwnKjcwUwwRCPEkRlLXvpOWWZ5ywh1W/YRV47VlepIdYow7cWVpmFPcC9iWM45CNFg==
X-Received: by 2002:adf:b641:: with SMTP id i1mr301936wre.288.1557310414954;
	Wed, 08 May 2019 03:13:34 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	c20sm19088365wre.28.2019.05.08.03.13.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 May 2019 03:13:34 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 May 2019 12:13:24 +0200
Message-Id: <20190508101325.51102-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190508101325.51102-1-alex.kanavin@gmail.com>
References: <20190508101325.51102-1-alex.kanavin@gmail.com>
Subject: [PATCH 4/5] qemu: remove sdl option from PACKAGECONFIG default
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
X-List-Received-Date: Wed, 08 May 2019 10:13:34 -0000

This removes confusion over where qemu frontends are enabled for
native/nativesdk builds: currently they are also set in local.conf.sample
from poky distro, and with this change that becomes the only place.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/qemu/qemu_4.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu_4.0.0.bb b/meta/recipes-devtools/qemu/qemu_4.0.0.bb
index 72fdcccbdcc..e101d5f8da5 100644
--- a/meta/recipes-devtools/qemu/qemu_4.0.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_4.0.0.bb
@@ -18,6 +18,6 @@ PACKAGECONFIG ??= " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'alsa xen', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virglrenderer glx', '' ,d)} \
 "
-PACKAGECONFIG_class-nativesdk ??= "fdt sdl kvm \
+PACKAGECONFIG_class-nativesdk ??= "fdt kvm \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virglrenderer glx', '' ,d)} \
 "
-- 
2.17.1


