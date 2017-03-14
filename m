Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id ED1D0776DC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 23:35:49 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id g2so138552pge.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 16:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6lZ6UAUnO/EqcglwvP956NLCbcW8gN0J3Etrf/8FWfA=;
	b=gDVT2jTVp54GCIRSIIJOGAOFoAngQuppJR84h0zcbGeunKF2gTRrf55yqwVw9M6OGk
	yVZ5/lIt8Ol4bXBcKrC9z/7w9Ys8FZhP5QTfpFgPSov8cwB2FGXK+NyNCF+js2pjdVj4
	0moVtQKW40wC/Ci9BmZPqD9kkScXaoSYkN9uvgFDi0rITpSYuAUzNIchyqklpuDqg/Cj
	wDfORCO0rfo/exi0E1QUCkpNepyE6zj1EUr3K1XgLDeHp8+6KIPQ51BpL5y6TYIhgsBk
	eD+pU120a2XvA173HUlIVNdKbbiPg0eSyEL8OS0zr9MFmf5zsHYiUZQvFjk9ywq+XgCd
	WnSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6lZ6UAUnO/EqcglwvP956NLCbcW8gN0J3Etrf/8FWfA=;
	b=DqjlnWTw/J6Q7qd146K6K1fhJ6CTfj0mEJ7a8fq9bVwoBT5quiveY3o6p5F5OnvReR
	/p4gDmWRWfUOH1fJS3MUuaLFz9voFewts9K79FT1XpxVRj3/VEafoVDtXPwiye4/SBHE
	70qsb0mJtc4yL1yJZ53WGhwGld9EE73zeMDFbmwDllNgVujZzeVQDoAGZNdJu/C63Spz
	talgkzjpDaz2VV/ZC7VC9qeWyX2komJ2fq23CAR5ImuF49MtTSLe8ed8zMPtFMS/Z4yW
	l9o0+kbUcoasLnJG4w6MvBP7DbvKR5V9Aqp13WqRLCIp+gUY06obTdVGhL0gez5P0IDB
	IDlQ==
X-Gm-Message-State: AFeK/H2/2LMTZK6ti6w/GUYrcqyqpmzadjTW2Yc9+ISdPYonfD+t6qb/qmzBLsPk801Cdg==
X-Received: by 10.84.176.131 with SMTP id v3mr375927plb.7.1489534551199;
	Tue, 14 Mar 2017 16:35:51 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id 73sm124094pfh.56.2017.03.14.16.35.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Mar 2017 16:35:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Mar 2017 16:35:29 -0700
Message-Id: <0c8d691c28c8c49776e1f48d7178b3a0dcf4551b.1489534345.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1489534345.git.raj.khem@gmail.com>
References: <cover.1489534345.git.raj.khem@gmail.com>
Subject: [PATCH 2/6] mesa-gl: Drop MESA_CRYPTO from PACKAGECONFIG
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
X-List-Received-Date: Tue, 14 Mar 2017 23:35:51 -0000

with mesa 17 crypto packageconfig has been removed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/mesa/mesa-gl_17.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_17.0.1.bb b/meta/recipes-graphics/mesa/mesa-gl_17.0.1.bb
index 85cc396fe3..e3604f30bb 100644
--- a/meta/recipes-graphics/mesa/mesa-gl_17.0.1.bb
+++ b/meta/recipes-graphics/mesa/mesa-gl_17.0.1.bb
@@ -8,6 +8,6 @@ PROVIDES = "virtual/libgl virtual/mesa"
 
 S = "${WORKDIR}/mesa-${PV}"
 
-PACKAGECONFIG ??= "dri ${MESA_CRYPTO} ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
+PACKAGECONFIG ??= "dri ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
 
 EXCLUDE_FROM_WORLD = "1"
-- 
2.12.0


