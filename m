Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id F3F347482D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 01:49:27 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id b6-v6so9785346pla.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Apr 2018 18:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=+/EyLfF7Yi+TiLwqhrGFpOf2qhXjA8e8OJ3DuAc49ME=;
	b=Ys2yqVgjxx490ovpjbR1GLrovwum1eE84JQrlF/89nUiWRAs2wXkeVZRRAGH/xPV8M
	E42vonIkg6KbF+KfX/E4cH9SEHh4WZ5P4woFJHFrl0p8eT4JeFFadv2CuTKA1vF38+ME
	bqmeQAhp8QmiFxNocxGESeMYAUeAXY8wgU6btIixY1FjadNLTIGXMHmWpShwzbyOfjR0
	2Fj4YFxUJozW6RLdxIWiacS0ILxAUjxeunHgqzNt+UGoPPxWQ2+WKLmjtEl64g2Eek8v
	Qc82PnX3jEiBj82N1yhlqlyzTizmDDu4/NG4YtkS1VkFVAMAqQUV/x42s5UTKIywLQWQ
	YOXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=+/EyLfF7Yi+TiLwqhrGFpOf2qhXjA8e8OJ3DuAc49ME=;
	b=Ys2+cO32qgpyAEsrQyJE09IuF44pDk3aF643zz9dFviw8owp/ElUm8Sp6PC2mokHzr
	X7BMdz6mzpIRCYD7Y2Dgek9+qncSxODAfT1xYfXkUEpuSgP+aEb5drezwYQ61fG7FY+N
	OXdiYodTXdHTLMPEf75eb9gkfO5zAA7BZ4Bh91+eHKxqx3RVnmX9oPk+wVMBh+qGPyYT
	N87EWE9kogZetJVvdbOzDblFhve6unlKgT9DuQvCFTChRxyIJH6X1dXsbBPxtdNjdTRk
	AUJ+rdaOBNgtoRczzRQczY63mw5AVRXEyKUQswaPL41eMfFQdE2r8Uwif1CEJvoX7f9e
	Rzpg==
X-Gm-Message-State: AElRT7HIzewc7c6MelczwbI7OQBc1j3/SuOUFOt/cLjFUnWU0y7lIcp6
	3TILeZpzXq7nwrqi2hMKtPEKFQ==
X-Google-Smtp-Source: AIpwx494+VCVuRQ7HnfNQZ5o6UHggiKUFELwK2nBBiJbsoTsR5/9wU3JDDe8EAGM4j03bsomRiMqXg==
X-Received: by 2002:a17:902:5902:: with SMTP id
	o2-v6mr15399345pli.81.1522806569247; 
	Tue, 03 Apr 2018 18:49:29 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:a4f3:7c10:9123:63ea])
	by smtp.gmail.com with ESMTPSA id
	d8sm7485877pfh.177.2018.04.03.18.49.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 03 Apr 2018 18:49:28 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Tue,  3 Apr 2018 18:49:04 -0700
Message-Id: <7456739bea36b64823f64ded501e731280906e84.1522806183.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1522806183.git.akuster808@gmail.com>
References: <cover.1522806183.git.akuster808@gmail.com>
Subject: [PATCH 05/21] xinit: update to 1.4.0
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
X-List-Received-Date: Wed, 04 Apr 2018 01:49:28 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-graphics/xorg-app/{xinit_1.3.4.bb => xinit_1.4.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xinit_1.3.4.bb => xinit_1.4.0.bb} (79%)

diff --git a/meta/recipes-graphics/xorg-app/xinit_1.3.4.bb b/meta/recipes-graphics/xorg-app/xinit_1.4.0.bb
similarity index 79%
rename from meta/recipes-graphics/xorg-app/xinit_1.3.4.bb
rename to meta/recipes-graphics/xorg-app/xinit_1.4.0.bb
index 9318518..dc2a06b 100644
--- a/meta/recipes-graphics/xorg-app/xinit_1.3.4.bb
+++ b/meta/recipes-graphics/xorg-app/xinit_1.4.0.bb
@@ -12,8 +12,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=18f01e7b39807bebe2b8df101a039b68"
 
 PE = "1"
 
-SRC_URI[md5sum] = "4e928452dfaf73851413a2d8b8c76388"
-SRC_URI[sha256sum] = "75d88d7397a07e01db253163b7c7a00b249b3d30e99489f2734cac9a0c7902b3"
+SRC_URI[md5sum] = "2da154b2f80ca9637b1a17b13af0880c"
+SRC_URI[sha256sum] = "230835eef2f5978a1e1344928168119373f6df1d0a32c09515e545721ee582ef"
 
 EXTRA_OECONF = "ac_cv_path_MCOOKIE=${bindir}/mcookie"
 
-- 
2.7.4


