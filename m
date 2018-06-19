Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f41.google.com (mail-pg0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id DBA4E7526F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 04:10:12 +0000 (UTC)
Received: by mail-pg0-f41.google.com with SMTP id w12-v6so8524732pgc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2018 21:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=vJDHBw5Gr4h71PpsTKcFPZC4y28kqImf6ukOsJIxbjQ=;
	b=BKjd5lJgR4FbBPKkvG3N0Rrx6clh2SiujXJhHnBC2nc1Zfu1gF9qLByrakhAFODjxO
	UQSEt+4t3pFPC4kWtoXhqzH8JYIeNtx3XxsXNJT9KxkW3Vwpzbh/CwoarOjEZMRWgpIB
	+xp/ocfShxs+ZuvHRF11KK+A/qcNjzs6ne7OzafidbYre7juRWARB7rkDS5SaJLW2YxD
	tIcD6o/WGSIAYe8y7p5wduW/vJm/Siu47C2LfxlRAyloEhMxCpuEZ9HBwfSosYRew6GA
	UcS4PNVMOyrCXadHmjXKJfxV9l2VO0wjJD7S5FvpacICbTbmzVAnnYxBeM6MM19yxKco
	aHEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=vJDHBw5Gr4h71PpsTKcFPZC4y28kqImf6ukOsJIxbjQ=;
	b=PdUgZ6jXcAgTIsCCSielim2aLxGnDeX/5270fwBsEt2fnGkRehNNYgnxpgYnglfMUv
	HokGHdr8edom29h+R8txxelwCg+1SuiTb0dD1U13hlPlOZ1GVrdndmUuxc4Txj8oRGZv
	GpjdP9e9Ubfa5U25n+JFimMoosO4yEFfN4XcnRA5SPYzDuuNRmE09C0zx1S1pgg1q3II
	JpHgIhQDks94dbjgfTxAMAvOMNITFS3PbFYu6C1bfF5YQaA6Px5IgWOhjaJV/xd5GBKJ
	9SAUTal5pauqylV+myhs6UCU72GAq2UKCEZT4FpBAT8xt4S49j7Jpnf+fD7Zuy4f+Gyo
	Kiyg==
X-Gm-Message-State: APt69E2LYngFjO498e0LcOaGnQLdCvBGLAJ0uH19qV7VWAemD0VHdaXD
	B5vcRDFa+giVe2RBK+J4SPX02g==
X-Google-Smtp-Source: ADUXVKLfTjAQAI/+jshkW0lRafGN73KFCg7XiO1DL6EHtwGMVQ12GsGZ5fKn8IteMYvUJcqK02+ldA==
X-Received: by 2002:a62:1013:: with SMTP id
	y19-v6mr16127016pfi.166.1529381414099; 
	Mon, 18 Jun 2018 21:10:14 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:59dc:e6d2:872c:4e7f])
	by smtp.gmail.com with ESMTPSA id
	f3-v6sm23326731pfn.149.2018.06.18.21.10.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 Jun 2018 21:10:13 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Mon, 18 Jun 2018 21:10:07 -0700
Message-Id: <1529381411-5045-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1529381411-5045-1-git-send-email-akuster808@gmail.com>
References: <1529381411-5045-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 2/6] xf86-video-fbdev: update to 0.5.0
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
X-List-Received-Date: Tue, 19 Jun 2018 04:10:13 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{xf86-video-fbdev_0.4.4.bb => xf86-video-fbdev_0.5.0.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-video-fbdev_0.4.4.bb => xf86-video-fbdev_0.5.0.bb} (64%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-fbdev_0.4.4.bb b/meta/recipes-graphics/xorg-driver/xf86-video-fbdev_0.5.0.bb
similarity index 64%
rename from meta/recipes-graphics/xorg-driver/xf86-video-fbdev_0.4.4.bb
rename to meta/recipes-graphics/xorg-driver/xf86-video-fbdev_0.5.0.bb
index 52e9bd1..7b4ac88 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-fbdev_0.4.4.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-fbdev_0.5.0.bb
@@ -5,5 +5,5 @@ DESCRIPTION = "fbdev is an Xorg driver for framebuffer devices. This is a non-ac
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d8cbd99fff773f92e844948f74ef0df8"
 
-SRC_URI[md5sum] = "3931c0e19d441cc576dc088f9eb9fd73"
-SRC_URI[sha256sum] = "9dd4b326498223abbfdf786089a46ea3db4fa6bbd341308eb48a9e00bc3fd51b"
+SRC_URI[md5sum] = "f07475655376be5a124d8187aacd87b6"
+SRC_URI[sha256sum] = "dcc3d85f378022180e437a9ec00a59b6cb7680ff79c40394d695060af2374699"
-- 
2.7.4


