Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
	[209.85.216.47])
	by mail.openembedded.org (Postfix) with ESMTP id D2CB57F8A9
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Jan 2020 16:26:32 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id n59so5950700pjb.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 Jan 2020 08:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=YeCuKOQqqGt2K/1E47d/Xmh0Oob/TEOsR3gP6DeBWyU=;
	b=Rwx0cH0/1Ib4qrnPorga4VVn18mcX7ZIorfVPNhObroNKE74Z9ReDHfCyoUlmLUUCn
	wSGagAovb6h17Q4aRnaFOgcVsMLGAexne9qUJx92Z2T2PdbYsEi9lIELtDiSPbgBKX+R
	gYzBkSuTCv5eSoglg98SPBilNKA2ySCXcibMp2UY54acH5ihx+WFXYK8HxJV0x7W5i21
	juzWo6ws3tG+RL1jwR5doC/fkJ1ncfMG/2Xhrma5nPm6gY0CDdesJEF2WDevVrizPNZx
	YTG6XZ4jNBQmV+hrZkugLWbGcs5cPqSEejcBXU7Ter7VuRTnYw8oxA17YFNG2d4kiUx2
	+kKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=YeCuKOQqqGt2K/1E47d/Xmh0Oob/TEOsR3gP6DeBWyU=;
	b=BWNj1kJ5OVQ2cYVdu1gZowesZq5nfn2hkiMM/GJihWJxX9aMlEyFBmEilyguqI2XeG
	OP3evdETt651X+18bZ7S2Zr0ZLgc4p3xJa1wJ+1QZvC6JEUXZDcOi/xZVeKoitUetYVU
	+Ci0IdNgAcYjJZTZxvcuTm4BrQOen62R7kubrmUJ5o2r0mdcK08+JaoaeI+ToV5lWXn9
	BLNWl70EbdeXLz7xn/qkoP7SjrDHYOuQwyYc/0y19qdzUg2JPlMUT3sV17QpwB3dHxuO
	yxNZPq1dvZ2zC88xKzqCRCdbPe9zk4lnuJ4xeDkMe4xlKoCyj6y6FEk9RgWvEAqNmfuC
	Qdpw==
X-Gm-Message-State: APjAAAUE/vMDtPz9XAuYnruNpNss0x+nWArMsS+li0hOytPdWxBILB16
	gAi2xmka7qibDu0pc2bmYplzFkM867M=
X-Google-Smtp-Source: APXvYqxCp+f4XUQlsFp+OiNrO4CfnOlnE8DmrsEg9sKdldv3xCR5+mmzh26644vJrqMGLn3mzrr3Bg==
X-Received: by 2002:a17:902:264:: with SMTP id
	91mr44399664plc.271.1578155193697; 
	Sat, 04 Jan 2020 08:26:33 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e812:6764:3882:fa62])
	by smtp.gmail.com with ESMTPSA id
	u23sm71589976pfm.29.2020.01.04.08.26.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 04 Jan 2020 08:26:33 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 Jan 2020 08:26:03 -0800
Message-Id: <c7f552dcf378016f81d98c911bf68bae80922fe7.1578155074.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578155074.git.akuster808@gmail.com>
References: <cover.1578155074.git.akuster808@gmail.com>
Subject: [zeus 22/29] systemd: Upgrade 243 -> 243.2
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
X-List-Received-Date: Sat, 04 Jan 2020 16:26:32 -0000

From: Adrian Bunk <bunk@stusta.de>

Bugfix-only changes on the 243 stable branch.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../systemd/{systemd-boot_243.bb => systemd-boot_243.2.bb}    | 0
 .../systemd/{systemd-conf_243.bb => systemd-conf_243.2.bb}    | 0
 meta/recipes-core/systemd/systemd.inc                         | 4 +---
 .../recipes-core/systemd/{systemd_243.bb => systemd_243.2.bb} | 0
 4 files changed, 1 insertion(+), 3 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot_243.bb => systemd-boot_243.2.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-conf_243.bb => systemd-conf_243.2.bb} (100%)
 rename meta/recipes-core/systemd/{systemd_243.bb => systemd_243.2.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot_243.bb b/meta/recipes-core/systemd/systemd-boot_243.2.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_243.bb
rename to meta/recipes-core/systemd/systemd-boot_243.2.bb
diff --git a/meta/recipes-core/systemd/systemd-conf_243.bb b/meta/recipes-core/systemd/systemd-conf_243.2.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-conf_243.bb
rename to meta/recipes-core/systemd/systemd-conf_243.2.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 7f3a59c208..18f17d28ac 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,10 +14,8 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "efb536d0cbe2e58f80e501d19999928c75e08f6a"
+SRCREV = "fab6f010ac6c3bc93a10868de722d7c8c3622eb9"
 SRCBRANCH = "v243-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=git;branch=${SRCBRANCH}"
 
 S = "${WORKDIR}/git"
-
-PV_append = "+${SRCPV}"
diff --git a/meta/recipes-core/systemd/systemd_243.bb b/meta/recipes-core/systemd/systemd_243.2.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd_243.bb
rename to meta/recipes-core/systemd/systemd_243.2.bb
-- 
2.17.1


