Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id BA7E271AE6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jan 2017 19:46:46 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id 3so51662544oih.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jan 2017 11:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=JSDQKLzHTgH7LTzG3NLroPVVLcqBdYDvKQKnYTWu7mI=;
	b=RTuwaW+EIOu9f8BtNCfmeHBGzrFFpTQuaGWny3D2QM5X+wvJ+QqjemTPYv06xwqHOi
	8vRB6hFiRVw+pBOsE2cLBoDPX4iAsXFZYpyXMybcIGcVZpwO+nEUoJV3ZubheADS7szH
	ih2uzLT/PVUTajAzqr2fd39ojNY83kIJxPEPN7T3xANv4nXTnUJoA71vjckydHzgFWdq
	AEYIWy/ZZtXYfTwXxmqvgGTHcwVy9lLKttyHDvGZ4tWE51pHEOh5eDZHMxsUm/cFKUF7
	IzF/P7D/fK+nSrF7it8MCBs3r7gx5DsXLi0txmC1rA8dirwd1euKtXeoKHdAuFp+eizQ
	nqvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=JSDQKLzHTgH7LTzG3NLroPVVLcqBdYDvKQKnYTWu7mI=;
	b=sYr5FDdxcs54QdF3N5JOR3zCcJ3kN6Jj/fsZNIFqDoT11PuwYT4D02B5grF3eVaUdZ
	uZGpfeoRimfzVFBfXxp0rW7ZPcDICG9L6vDxVRqvgEXCPTTo18XiHVgF6k7oyq0ClKDi
	S0+rr8RYDzYCdfkxeWrjXH59D1DoZoq8HUejjHIiJopFueRxofm/7cKfP6d8QC2uhQAo
	t/fzovtcbRjvs70lf6rTGgexhId/c+Fip9yaz9YtRGmqLG01AIqgkUoSf11/igVzBGkS
	LdR1Z5zCZjXmo1uDGJsrODvZesafE/hCJVds4VgzU7RMYWrSz0GulQD+nwigXssciu1T
	0HOg==
X-Gm-Message-State: AIkVDXK1IQj/LnaTtkV+1m+ygP1WqRPm9AoBEdgIOPfC3ZLQ7MiMn2yICs+NqiPNOT2YIA==
X-Received: by 10.202.220.139 with SMTP id t133mr32419213oig.176.1483645607395;
	Thu, 05 Jan 2017 11:46:47 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id d10sm153783otb.4.2017.01.05.11.46.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Jan 2017 11:46:46 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jan 2017 12:46:23 -0700
Message-Id: <0830e40e27702cf8a6bdf9ff8b80780324471019.1483645446.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1483645446.git.chris_larson@mentor.com>
References: <cover.1483645446.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 11/16] ffmpeg: disable asm for x32
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
X-List-Received-Date: Thu, 05 Jan 2017 19:46:47 -0000

From: Christopher Larson <chris_larson@mentor.com>

This is the usual way this is handled in desktop distros (see debian, gentoo).
I wasn't able to track down a patch to add proper x32 support to ffmpeg. There
was, however, a libav patch series which may be worth investigating.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.2.bb
index 4fac46b..66718c4 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.2.bb
@@ -92,6 +92,8 @@ EXTRA_OECONF = " \
     ${@bb.utils.contains('AVAILTUNES', 'mips32r2', '', '--disable-mipsdsp --disable-mipsdspr2', d)} \
 "
 
+EXTRA_OECONF_append_linux-gnux32 = " --disable-asm"
+
 do_configure() {
     ${S}/configure ${EXTRA_OECONF}
 }
-- 
2.8.0


