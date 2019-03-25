Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id C1D2C7D109
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2019 23:50:12 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id r15so7169838pfn.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2019 16:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=i4P9te0Nt/ne2O9Z8yBl+FWqQKeM6tZ9W5q5+x1qNPU=;
	b=vErh5WQnsColIEE1VC2Ct3Dho6ou67qXagKmk5Y8jMhBLQ0RY+6lzQJYMY/bGucgU0
	0CUw2ihw9Ss7hG87gVkhXLuyeJ4Z9Ld54GUkZHXt3aDs9vPlxcWVqDvfs1a4/Er2ZWGG
	6aARo5snEwoJEiVHaOdlQ0MyTAFsOUtKR6MwQ8mpqF2uqUX9n3to81acjuEumKO5t+hK
	HCfvqzP0W3ZrhU4BX4QcdAbbs7ANboWkerg8LtnFrO/fFVIZrVZriow9tij8LfKJ+7Lo
	2YcIrbRIfPSQY4wkrYIaKF57phWu39k2fUI0TBrROEvlyrDi0y+Xu0vSFX3KYF9yzkrZ
	p+Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=i4P9te0Nt/ne2O9Z8yBl+FWqQKeM6tZ9W5q5+x1qNPU=;
	b=OUZAtNTKFHfM1dTHwEHhbmbjIOEwTv26pqPlR7qAJB8zPB0PWUBBhITzNWoTSfYQ62
	czjLHJJh/K/BcZeMak1Y2ky6JmO8Ert3haWgTp2zEacvNEWQB0YhPe3osXXGJRnwsbYF
	aOKEjpyq6KMylug3d4FuR6FopdzKWm1k8LSMyXkPJ2w18WTGPynaTm7eOTkUr5xClhyM
	fNpk9w6HyeuhxNMThy7qYdFHehXtAfsXlUGMy5hZCTLumBf50lyv308rvzNGZltETxY2
	ZpalP3Z8TVd9xkT4KoAyPt6bjUc0StjBFdPQ9+u2os8SwcDnS5UF/Wq9DZ6hfD76lRB2
	UIvQ==
X-Gm-Message-State: APjAAAWAMvT9fahoH2xJ38aM4ZNjZXkwOnOInWqQ2m+pHGCZlibPxY37
	spYZeE1/mZxCPdzv2wJOxIxTosPr
X-Google-Smtp-Source: APXvYqzU80leEzCTz8YkCeQi2wHsil2shfru+ET4YLUlzhtD86/Ehj04hGlIcX6Gvyja8BGKouMe2w==
X-Received: by 2002:a63:ad4b:: with SMTP id y11mr12216771pgo.405.1553557813692;
	Mon, 25 Mar 2019 16:50:13 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:3dea:ddac:f0ad:db91])
	by smtp.gmail.com with ESMTPSA id
	j71sm35206203pfc.6.2019.03.25.16.50.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Mar 2019 16:50:13 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Mar 2019 16:50:11 -0700
Message-Id: <1553557811-5488-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [sumo][PATCH] yocto-uninative: Update to 2.4
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
X-List-Received-Date: Mon, 25 Mar 2019 23:50:12 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This supports glibc 2.29 which is appearing in distros like Ubuntu 19.04

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
[Fixed up for Sumo context; no aarch64]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/conf/distro/include/yocto-uninative.inc | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index c5b0556..64e71d9 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -6,9 +6,8 @@
 # to the distro running on the build machine.
 #
 
-UNINATIVE_MAXGLIBCVERSION = "2.28"
-
-UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.3/"
-UNINATIVE_CHECKSUM[i686] ?= "44253cddbf629082568cea4fff59419106871a0cf81b4845b5d34e7014887b20"
-UNINATIVE_CHECKSUM[x86_64] ?= "c6954563dad3c95608117c6fc328099036c832bbd924ebf5fdccb622fc0a8684"
+UNINATIVE_MAXGLIBCVERSION = "2.29"
 
+UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.4/"
+UNINATIVE_CHECKSUM[i686] ?= "fafacfc537a6ce2bd122bd16c146881ab5ac69bd575abf6cb68a0dd33fa70ea2"
+UNINATIVE_CHECKSUM[x86_64] ?= "06f91685b782f2ccfedf3070b3ba0fe4a5ba2f0766dad5c9d1642dccf95accd0"
-- 
2.7.4


