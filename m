Return-Path: <eu@felipetonello.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 51D9A7318C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 11:25:43 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id p63so16046544wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 03:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=felipetonello-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=k9VX02K2HKAE3TTW6WAZTtm70XIo2eBdrOPbIPGDkgI=;
	b=tE+wAEU/b36r/kHf/SuWd7Y/yIgcbXLGWqZqrlRnQWtwlkgjEL+7CIgZ1q+U7x8o0d
	Y2kj2KivoTXRA83V7WhQa+sAnmsNgunJOwIDprdjcntLo6KqM3bc6KrmdsQ9UyvCbldE
	MHLrOZwiVuqUWkR94sRQGykiOwfdCRH8xegVG8L/qh6foN4FDNq5Z0UIqJW/Zru51mvX
	LpM+vkvIQvuIn9gsioi6tyxPF1y/N8gbFVJZBnvOQxWXxLQ+GRJ+DxgDIPGXsJVVTuOC
	dCI935TBKGuJJRY8UByttelQMCdWmRyIlsWolf2twrW2JyfHEv2txpyhnvKSN26pz0ks
	yWCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=k9VX02K2HKAE3TTW6WAZTtm70XIo2eBdrOPbIPGDkgI=;
	b=Q8btTuDGwfkOLzUUEqW5htkCJhitQHS6Rlenl9ZOmQrzEWGCk0ZYgGv5vnvn4XkfIY
	c8WLjYzhVRVb2AQa/FHrSHC2KiDnV2YujewaCNnCUozGT+e8ji7N6WPS0CES7QGwR55W
	9BxNjO6ZROoZtYubby2e7BPWOaX/BLsHqpFpUO3oD4VP5UhNf/hYOJ/s5vRF6Usln5u7
	128PrnLts+LlcnEG5NKA06DMFxIYNgzeEaCfx5znjgWFkSdhzJu3/FsiAt8BVluzck2z
	ihkQKNtzKBpGxpLyx/BaLrmNv5gHqdx70bTe5Wsi+zLYvFUBUV+CO9PbFORB6qH1Idg7
	A6tA==
X-Gm-Message-State: AG10YOTTI2ACvJCwhazUO+LR3WXccv9qBjINYMPFoGlD882MsQOFr/P4pFz44AasJZxfvg==
X-Received: by 10.194.216.2 with SMTP id om2mr1153526wjc.164.1455276344344;
	Fri, 12 Feb 2016 03:25:44 -0800 (PST)
Received: from felipe-arch.localdomain ([81.145.202.106])
	by smtp.gmail.com with ESMTPSA id
	di1sm11604870wjc.3.2016.02.12.03.25.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 12 Feb 2016 03:25:43 -0800 (PST)
From: "Felipe F. Tonello" <eu@felipetonello.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Feb 2016 11:26:58 +0000
Message-Id: <1455276418-4134-1-git-send-email-eu@felipetonello.com>
X-Mailer: git-send-email 2.7.1
Subject: [PATCH] packagegroup-core-tools-profile: Enable valgrind on ARM
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
X-List-Received-Date: Fri, 12 Feb 2016 11:25:44 -0000

fixes af1ddab5c('task-core-tools-profile: fix valgrind for arm and systemtap for')

Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>
---
 meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index 59d930bc7b72..52e17c59bcea 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -64,7 +64,6 @@ VALGRIND_libc-uclibc = ""
 VALGRIND_mips = ""
 VALGRIND_mips64 = ""
 VALGRIND_mips64n32 = ""
-VALGRIND_arm = ""
 VALGRIND_aarch64 = ""
 
 RDEPENDS_${PN} = "\
-- 
2.7.1


