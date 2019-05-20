Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id E1C4D7DEA7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 14:11:33 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id j187so13221823wmj.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 07:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6gIxFNxnyonxuOCQiF2D7NeACZiBm3vfujnRqjAN42o=;
	b=oH+7OB03ViLiJwji2OquYih3xQtM44CYRHrEynXapnjKXuP6bWf52jOd052gOOdRYg
	v7KvbqddaMKchbJjJz2FZTAddQ3K/Q/ncaeY6HY9tYQv3QUsGxYWafRfsmrsOqQerfSq
	KjavouwKTtyRdOWxX6VQXtZsxcPkrR2Q51XZKk9Z9UmXAF/eNYAL1IKOO+kpFkadr3Ca
	gHBTaGcTFNiasfA2jmmdzyO9zuKJgDIxL0NDFzqrIN56gizmZrnrYnLIgJT7rwdHaQTt
	XVawTyE+7gQYwTWM0X02/InrG4t8ittoAU1J0nVZdAZNUvmz5Hq4Z3bEMGJb1RfK5eus
	l4TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6gIxFNxnyonxuOCQiF2D7NeACZiBm3vfujnRqjAN42o=;
	b=jEKejGugqbQFWE3419TMb1VgMHOzXpCNyUIHjilE3G6BinIIMtkf3IWRxbjQyPGe8M
	0GD/B6h9ZMb/jv7UjXdJaSLo2eMsa/NgtutqvWGukhdzNBSZmBfduTfM+alnvUM/yvpM
	zgp50VaDBlV16O0xI0y2EJ48CsFPrLkHlOgA5GlQRr+qyzYKPWerWAJZpGSDywgkL1I3
	EdW06OMJ86VgVbeMhDku1NnZcWZ6C14uwOMKVNszvRnV6lghhGkuz81LaVRtueELiXsb
	+ZsJ1N4hXkGVgB/pcQh+1Cb1AOOWd945JCjiehG4hhPQwDxLv+r9vV4R5r6Mzuj2lEOE
	sgRQ==
X-Gm-Message-State: APjAAAWMqck9ysjeh8lw1oAZmwdQ0sZ2y11O8ORILImbK1YltqapbaSN
	xR5dlhZY7DvXH4zak0ixW3PiLf0h
X-Google-Smtp-Source: APXvYqyPgPUH1fKzcfR3r7QuFjXNykewSWdUAhxXIMTIkluimbB5Rr8Xn4lAkDbidQ8rWDO0aHdSiw==
X-Received: by 2002:a1c:cb0e:: with SMTP id b14mr27334544wmg.61.1558361494200; 
	Mon, 20 May 2019 07:11:34 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	v5sm36242015wra.83.2019.05.20.07.11.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 07:11:33 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2019 16:10:45 +0200
Message-Id: <20190520141125.10805-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190520141125.10805-1-alex.kanavin@gmail.com>
References: <20190520141125.10805-1-alex.kanavin@gmail.com>
Subject: [PATCH 02/42] librepo: upgrade 1.9.6 -> 1.10.2
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
X-List-Received-Date: Mon, 20 May 2019 14:11:34 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../librepo/{librepo_1.9.6.bb => librepo_1.10.2.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/librepo/{librepo_1.9.6.bb => librepo_1.10.2.bb} (93%)

diff --git a/meta/recipes-devtools/librepo/librepo_1.9.6.bb b/meta/recipes-devtools/librepo/librepo_1.10.2.bb
similarity index 93%
rename from meta/recipes-devtools/librepo/librepo_1.9.6.bb
rename to meta/recipes-devtools/librepo/librepo_1.10.2.bb
index fecedc981f6..43c1967c2ba 100644
--- a/meta/recipes-devtools/librepo/librepo_1.9.6.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.10.2.bb
@@ -7,7 +7,7 @@ SRC_URI = "git://github.com/rpm-software-management/librepo.git \
            file://0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch \
            "
 
-SRCREV = "7d8acd45eb09809a5ab729c312744da4b2fe92bb"
+SRCREV = "91ebe846b0320751a264116c36a665a8facf9e0e"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


