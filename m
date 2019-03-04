Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id A2C6E7C88C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Mar 2019 15:36:52 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id t18so6050898wrx.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Mar 2019 07:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=dZitQoOUJa9QElE2mLiDOnzu/4Iugz8nf0PREOmFuhw=;
	b=a5S2odu8wAicgbmd8KFcnqrkb/GHi1RIl8rvKfS4A7tjfLxGOuUKQiOEImRdAJXUYQ
	w9OsIfrGPQ9JpWed+IHy4LEGLJSCTqOp4xodvk1oKMpwo9Xf2zAqhyRYdUP9UWeGnfRw
	PldjK/34lYvxwu3Rl5nvj1CpnHNS8hGoqnwWwvoZVbBYqln9qEHHoKVyAimDxyZ7J2/s
	Xp+g3+DS0qdFx272LcSW08ga4wa45wVPGY/oGUgt440jjGYiSd/naiAJS1hCeRifhIeL
	YJ3ZYqqncD9tlvLE3GzBgkaBUof6wxYbg9U9BZpoNhnb3Td7NsHW92Ql+5YMrjKroHj0
	949g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=dZitQoOUJa9QElE2mLiDOnzu/4Iugz8nf0PREOmFuhw=;
	b=nARUrRhq8t5jrzlg/Dpxggp/77IOwfSFA26UNlRQlz5FYS/ctyXNstH0FMEQ90aWOQ
	9nuSri6lZj4S+Dz21ZagyGb4dS8eujDQ6z9CG3KO1BCBMIER/t5jTOZkS6vBZyVSHQ6d
	XRKlU8nyw63R6b6OHKbOIcE71v5ed5TSXGi9LnjZNdq4Qonab2QoRSxkSPDKweo/UZwZ
	KU3X51vrD/LvDjKvB2gzBFwBcvGGtZ1Iag1LzXCRdGs0NQ7y1WDHCIF6IoDYR5PEOwCm
	WOt+qcIrwgcol9pNGKky7kfgToHif3uwCwcCl5bSgel6XTysWB2BqwmndBUF85/hjvyM
	yCWg==
X-Gm-Message-State: APjAAAU5HugSihtojT+4ox/aWl2viDwKq4RJZjdDVmswWjfvwK0nzzkz
	zUoo4yV/4Oai+ezePxojaAjzMEr2
X-Google-Smtp-Source: APXvYqyznZzJuqkprCpPRbUewyDc4mx2GXfqPwzPBUQyvVRKWYFIyAeollUvPSsCsYz9mBGkrTrLGA==
X-Received: by 2002:a5d:4903:: with SMTP id x3mr13417209wrq.151.1551713813181; 
	Mon, 04 Mar 2019 07:36:53 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id s8sm5523414wrv.12.2019.03.04.07.36.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Mar 2019 07:36:52 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Mar 2019 16:36:42 +0100
Message-Id: <20190304153646.59135-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190304153646.59135-1-alex.kanavin@gmail.com>
References: <20190304153646.59135-1-alex.kanavin@gmail.com>
Subject: [PATCH 2/6] qemu: add a gtk+ frontend to target builds
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
X-List-Received-Date: Mon, 04 Mar 2019 15:36:52 -0000

sdl frontend remains enabled and available.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/qemu/qemu_3.1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu_3.1.0.bb b/meta/recipes-devtools/qemu/qemu_3.1.0.bb
index 3c404d408d0..26a33b4d860 100644
--- a/meta/recipes-devtools/qemu/qemu_3.1.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_3.1.0.bb
@@ -14,7 +14,7 @@ do_install_append_class-nativesdk() {
 }
 
 PACKAGECONFIG ??= " \
-    fdt sdl kvm \
+    fdt sdl gtk+ kvm \
     ${@bb.utils.filter('DISTRO_FEATURES', 'alsa xen', d)} \
 "
 PACKAGECONFIG_class-nativesdk ??= "fdt sdl kvm virglrenderer glx"
-- 
2.17.1


