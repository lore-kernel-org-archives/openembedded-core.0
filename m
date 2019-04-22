Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id 32A586011C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 22:13:48 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id h18so10070333lfj.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 15:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=fnBMq7WgMPnbLP4n03tVCUSuOHU7In60aWOtKAEqMv0=;
	b=WmW1T3AMP/5WlleOs2yMx7fHbIu0A49LbGghJIsFgPRWSiKRh04DD30ThyjhImOUjz
	JymQEcagY7g1S8pFdltR2Wbe7pcJ6s6ze+anG6p0q60yzdLbYSJ4ALZB+oFvZJhAMTwj
	FxMO/jRR4F7/dVwFo+zN3GX645hX44zKNBwWImeH+8H4hU8G9+gP+x4HIybdabRDv8H4
	uo116L2TScD3ckHFzDUMjB22KqMOiboug7N/55b6ZV8HkRoBI2jIYJl0K5Wvh0zDnKAN
	MfdtFVAI8wJfxoKYL/14NvnHeUYsYjmLuII4pFuxWw0ZRLKOu4eyYZqZJhHosZxEHxM/
	sWTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=fnBMq7WgMPnbLP4n03tVCUSuOHU7In60aWOtKAEqMv0=;
	b=abMWvzDLMky2E8RfKmcrz35hAQPbdRckJKmSMVQflwY8/pzaf6gY1GkAnJhfoB0w+b
	+jCoB9dRn1RyiJIg4+ZHDJ3vLdNAhwETnkM/Adr2X/L5cObaj6zrLc9u0uxuXzMQAzcO
	1l3Wj22hQk41zD3WLaWZeIwZClwsQqB8gOahqxAtbxRFbZisLY8qU3oeuiSN1lRnBLLn
	DYvGSpVviEaji0Ejenj+9DBk9PpZSo65uoq+GHUUEXeLKCfyspB4ufJzl3iwrnfEv+EQ
	oMfhi9VoDXc5m9SBjNyGagFP/2j/vBbpUns1hGQr/k3UUOxAeDwkTuNGNp3AcU2EE82k
	GIUQ==
X-Gm-Message-State: APjAAAXhdbJagPX78qQ7zbfZzJeZ8ywLNZl+Au0muVBuubVIENfPewKU
	KRBJB+CUb20ndTEpPR/eEhlxdzA7+mE=
X-Google-Smtp-Source: APXvYqxKiZ+namljE79rsB2y2czPzxMr6OxvGYCRAqtOp3UeivAvHILMrrjFVCor3mXPzckyrp+rcQ==
X-Received: by 2002:ac2:592b:: with SMTP id v11mr11734873lfi.85.1555971229459; 
	Mon, 22 Apr 2019 15:13:49 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	a11sm2969874ljf.68.2019.04.22.15.13.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Apr 2019 15:13:48 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Apr 2019 00:13:46 +0200
Message-Id: <20190422221346.8852-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] libinput: update to 1.13.1
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
X-List-Received-Date: Mon, 22 Apr 2019 22:13:50 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../wayland/{libinput_1.13.0.bb => libinput_1.13.1.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{libinput_1.13.0.bb => libinput_1.13.1.bb} (86%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.13.0.bb b/meta/recipes-graphics/wayland/libinput_1.13.1.bb
similarity index 86%
rename from meta/recipes-graphics/wayland/libinput_1.13.0.bb
rename to meta/recipes-graphics/wayland/libinput_1.13.1.bb
index 77792b9bb1..5a6dd9aecb 100644
--- a/meta/recipes-graphics/wayland/libinput_1.13.0.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.13.1.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1f2ea9ebff3a2c6d458faf58492efb63"
 DEPENDS = "libevdev udev mtdev"
 
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz"
-SRC_URI[md5sum] = "ea0834452b03457f8a33359db3eabfbf"
-SRC_URI[sha256sum] = "eb27c95d35c8fc9c7b96b9f0b2de5a043c47eb5f4b2868f353ab1bd0be0b616d"
+SRC_URI[md5sum] = "869a7e68c4290d99868500a369645def"
+SRC_URI[sha256sum] = "e1d487d478ee2bb118890a64211c2b7f2348aaed7363b214bed4d642274841ab"
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
-- 
2.17.1


