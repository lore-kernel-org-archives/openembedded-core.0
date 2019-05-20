Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id E80917E024
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 14:11:56 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id 7so13231022wmo.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 07:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=19idcsPXYnh8r9SRcl+/c2BvwxrFiPUGgcYY56SuD80=;
	b=SicCUEYKYG6/xkuTMCnoQVl750XiZc5JcYhYVN1fCo8/Fxlsz992ouakoUrTLmfDIL
	YUOFyhS7PB4NjvPcXMAvKQIZqzn3F8pmS2++jiL2PBbXvJPKhrifR3MJyYcqCmQOscev
	zPu8TaswFLw8Aab4PXJuJFvFNYjFHBLLaNom/MZH4hXphh8zFzMOdSvg4ySteZx3L1ir
	IPDCAzJhwT0bAA32JeG4VQsowjkRY3gLqh+PeM+gc0rVPwGMm8M0sCbo5XTexqEY208+
	bYEzql6r39hbM2oKUqnrRoH/2J6mZBsK2CTLqLrWW6olrMNXquOUawApUwlT9JqoQBU7
	CS7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=19idcsPXYnh8r9SRcl+/c2BvwxrFiPUGgcYY56SuD80=;
	b=NILJBZbrmY6FnAqppxglqRTMFG2L4s+B33IbIp3Xbnpwdm02cxgkgLQn1srXDp9qJz
	/640bqpo7iEB3dgpRwyAo23GnMOwPjk/KCqVBrLoOXnx2FsOyezoGlFanbYnxVVocXaU
	3sBT3QBxIfu5oKhc3OO5bz3dosyBlNDGfv9JAmms2IuOKA+VuP/6J2wxiVBV8ypfmHyG
	u3AC2EJKbNO6hHg5q1pFfVCj16bCSNGguyhkSrMzuqUp3LTkNkARbPcXzGW4XWQ8doYh
	KC0aR0Rm+M5+caxcdXxT+ytvuQfSd/3u4In/I+fG+aUbrV60D59KmBrT29MxpHkB5+wX
	cSwg==
X-Gm-Message-State: APjAAAVDtw/eHutHlkX4XC/iEG/u/2P6O9mi8CnAEpDWXkDy7rkcj1bw
	WqWn9SFtPtdw647HIXEzA0RPKEwK
X-Google-Smtp-Source: APXvYqwyufGu6t8d7cTZ9rTqFHIYgrMBS+VneGff7EkMdvjqRrOiGhbJJI7TWKUwAtENGT+vlp3o/w==
X-Received: by 2002:a1c:f60d:: with SMTP id w13mr4797484wmc.40.1558361517641; 
	Mon, 20 May 2019 07:11:57 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	v5sm36242015wra.83.2019.05.20.07.11.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 07:11:57 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2019 16:11:08 +0200
Message-Id: <20190520141125.10805-25-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190520141125.10805-1-alex.kanavin@gmail.com>
References: <20190520141125.10805-1-alex.kanavin@gmail.com>
Subject: [PATCH 25/42] at-spi2-atk: upgrade 2.30.0 -> 2.32.0
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
X-List-Received-Date: Mon, 20 May 2019 14:11:57 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../atk/{at-spi2-atk_2.30.0.bb => at-spi2-atk_2.32.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/atk/{at-spi2-atk_2.30.0.bb => at-spi2-atk_2.32.0.bb} (80%)

diff --git a/meta/recipes-support/atk/at-spi2-atk_2.30.0.bb b/meta/recipes-support/atk/at-spi2-atk_2.32.0.bb
similarity index 80%
rename from meta/recipes-support/atk/at-spi2-atk_2.30.0.bb
rename to meta/recipes-support/atk/at-spi2-atk_2.32.0.bb
index 2244797071f..8812d33d9a0 100644
--- a/meta/recipes-support/atk/at-spi2-atk_2.30.0.bb
+++ b/meta/recipes-support/atk/at-spi2-atk_2.32.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://wiki.linuxfoundation.org/accessibility/d-bus"
 LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e9f288ba982d60518f375b5898283886"
 
-SRC_URI[archive.md5sum] = "1ad754b90bcb14244b73ca4d0c14d274"
-SRC_URI[archive.sha256sum] = "e2e1571004ea7b105c969473ce455a95be4038fb2541471714aeb33a26da8a9a"
+SRC_URI[archive.md5sum] = "6a4b27bace3b9352721ed462b95f6291"
+SRC_URI[archive.sha256sum] = "0b51e6d339fa2bcca3a3e3159ccea574c67b107f1ac8b00047fa60e34ce7a45c"
 
 DEPENDS = "dbus glib-2.0 glib-2.0-native atk at-spi2-core libxml2"
 
-- 
2.17.1


