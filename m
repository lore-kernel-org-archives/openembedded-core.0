Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id D2F617E03A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2019 15:04:16 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id w8so3796009wrl.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2019 08:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=tKQtZZ/vdqJaxu3nYv2wxOykGgF+rZ8hdfjK0jIyINA=;
	b=XEX8cbynLYqasnK4Fwt9zb/Gcp7q2KDWSSJhcYsGjP04pDMRbGPtT12/vSKDi+9GSM
	bt4IuR8/gIckOQaoP5A3tKFbXjZ62aIJRJkyHB0UICEU09FUqz+qe7MkAgUc+7TDk5PK
	t4RPhdgQGp8JsX2ElG3YTIKuyWWVM/bZYrYsqJXPz4FRZF9NmMhPyU8Y7z1cBAllGH9C
	puv8iuOJouImAy9hL4BufAoKwm/fkr3k37OCRZOJI9NuSrw7zuvWy36VgdQVW0bxW+Tj
	6r2zr8XT2PfiaIvCrwUPMuO9J/8F1MkRfVByrWPPKkB/W2BoeQunzKXDIvHmrmK2HqY9
	wYfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=tKQtZZ/vdqJaxu3nYv2wxOykGgF+rZ8hdfjK0jIyINA=;
	b=EudZUe2K5/Ezaf1c1J52dm1Vea85c/92DiKK8NVl2T6SYYycQEVWY5SjqrhbfuEl9f
	DFjWd7fwzaNzQYMRBiX2fgckRFrs2FVgSh69i/anDMW2Sdsyumg0TLxCGmYijwtP0EmJ
	sTGRb/6ytr7yRssRl0zxZ1K8rOhC+Nx6okNQZUEKxjth2cjspOlNUG987c/3TNlrAxya
	5RThrdyykQvSKPKhg5rr4I0EKhQ7c//LzH4YTXdaQ3nvrNbIEuVcXUsSWG0wY4HmrLGy
	jKb0YZrtIJ8tt3ESaA4p00/JD/2kSOZ171iKLbLNCzr2Ct9vY0xA7OEF2+oiFzRuhicR
	e3bA==
X-Gm-Message-State: APjAAAUS/hZNqJIoSgTOzUcMUkxrMHp2+SOCoKmfyhs2aXLuiwLi9DtV
	NiOBVFJmuKopTFxkV1gYVeMHSbbP
X-Google-Smtp-Source: APXvYqygKm7h4ID4j5jeZKF4uHn3MwqQ4Uog1eDVr0rPb0Wzst2cBnYymW3BqZ1aHkYOovVqAyhG/g==
X-Received: by 2002:a5d:5547:: with SMTP id g7mr2792700wrw.22.1558019057395;
	Thu, 16 May 2019 08:04:17 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id a4sm7318053wmf.45.2019.05.16.08.04.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 May 2019 08:04:16 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 May 2019 17:04:05 +0200
Message-Id: <20190516150405.124743-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190516150405.124743-1-alex.kanavin@gmail.com>
References: <20190516150405.124743-1-alex.kanavin@gmail.com>
Subject: [PATCH 3/3] mesa: fix imx gallium driver PACKAGECONFIG option
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
X-List-Received-Date: Thu, 16 May 2019 15:04:17 -0000

From: Marco Felsch <m.felsch@pengutronix.de>

Since commit [1] the imx-drm driver is covered by the generic kmsro
driver.

[1] https://gitlab.freedesktop.org/mesa/mesa/commit/ \
	41a0acd6a149ec9f47ea527ad08a2b29bf1ee6b2

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index c52adbbb214..cd3ddfd8223 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -89,11 +89,11 @@ PACKAGECONFIG[gles] = "-Dgles1=true -Dgles2=true, -Dgles1=false -Dgles2=false"
 PACKAGECONFIG[egl] = "-Degl=true, -Degl=false"
 
 PACKAGECONFIG[etnaviv] = ""
-PACKAGECONFIG[imx] = ""
+PACKAGECONFIG[kmsro] = ""
 
 GALLIUMDRIVERS = "swrast"
 GALLIUMDRIVERS_append ="${@bb.utils.contains('PACKAGECONFIG', 'etnaviv', ',etnaviv', '', d)}"
-GALLIUMDRIVERS_append ="${@bb.utils.contains('PACKAGECONFIG', 'imx', ',imx', '', d)}"
+GALLIUMDRIVERS_append ="${@bb.utils.contains('PACKAGECONFIG', 'kmsro', ',kmsro', '', d)}"
 
 # radeonsi requires LLVM
 GALLIUMDRIVERS_LLVM33 = "${@bb.utils.contains('PACKAGECONFIG', 'r600', ',radeonsi', '', d)}"
-- 
2.17.1


