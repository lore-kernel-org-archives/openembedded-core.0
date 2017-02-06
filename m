Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3D7C671ABF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Feb 2017 20:46:31 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id y143so7607227pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Feb 2017 12:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=DAgK84jsPnelfDOAU/wGOc3OzhW2XydiEYJHaQ6L2Jo=;
	b=q+zEneswicqmy3va3M7MZtOkpIp3VT/2EzSuEGZtdlKq0woX9f/5ej7rlcYpMWlOWE
	yLlQjRzoT7QoNCY876Vz+NZpmDmoWrhWjRlYE+uUlAsfre7i7c3wbBQZOPkwJTmZAq+9
	ec7qy0thaidgLFEw0ZNDV3lNyfjS1nutRaRcEhXuPq88iAveo+oJTrGloND9l+1WeYjf
	mvrj94qE6GuC6/kEcj0Hwq8b/BWKCtqnWt8e4NQ1geca9IKru6JfyRIukgxASZQV2XUK
	sGYOJaf8G3UDoC/RzlFIf6Y17Tqvr79xrAx8YNEAxpQXBKv7apcC+w9JXbhmv2DNQifZ
	TaSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=DAgK84jsPnelfDOAU/wGOc3OzhW2XydiEYJHaQ6L2Jo=;
	b=DzixDTZpm67Ms667MEpC1ofvEnxOa9q447H5qtio1EdIpbJfoNZiD9elitIP8dJnho
	ZQXf2zGJKnVSxTVHFQwQDY92hJ+t689SyH5TZ9Q0rtNh4r7sD4OS/LY+j0iV4IHL4+i/
	tPEt7uTcw5ZZ+8oZ9YIPdoionpXUQy3rjh+5U/ISqqeI1wm6qVIxCIHHU5SX9v3//XYx
	bC2M3kag3KOPIdyUDqM7E9KkSrBn67aZw4Mg9zCUupjuqCyhXyqvDQeFYahLVexNKRS9
	IDS96kLXjQmbu2W/y3kjSu53CUsXZ99tJhMWIoymB7C9lpgwCksICpdc+Xw+EGL2x2cK
	V43w==
X-Gm-Message-State: AIkVDXKANrIHUUWZGTvicYyJ1hJ4yo5DMGLUPCiO5wMJKYhzkJjnzkbYaFqId8lwxpwBQg==
X-Received: by 10.99.8.133 with SMTP id 127mr15863717pgi.42.1486413991793;
	Mon, 06 Feb 2017 12:46:31 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	l12sm4868386pfj.37.2017.02.06.12.46.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Feb 2017 12:46:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Feb 2017 12:46:16 -0800
Message-Id: <20170206204616.26245-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.11.1
In-Reply-To: <20170206204616.26245-1-raj.khem@gmail.com>
References: <20170206204616.26245-1-raj.khem@gmail.com>
Subject: [PATCH 5/5] pong-clock: Inherit pkgconfig
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
X-List-Received-Date: Mon, 06 Feb 2017 20:46:31 -0000

Fixes

| /mnt/oe/openembedded-core/build/tmp-glibc/work/core2-64-oe-linux/pong-clock/1.0-r0/temp/run.do_compile.13350: 1: /mnt/oe/openembedded-core/build/tmp-glibc/work/core2-64-oe-linux/pong-clock/1.0-r0/temp/run.do_compile.13350: pkg-config: not found
| /tmp/ccanXWsA.o: In function `draw_rect':
| /usr/src/debug/pong-clock/1.0-r0/pong-clock-no-flicker.c:93: undefined reference to `XFillRectangle'
| /tmp/ccanXWsA.o: In function `draw_digit':

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/pong-clock/pong-clock_1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/pong-clock/pong-clock_1.0.bb b/meta/recipes-graphics/pong-clock/pong-clock_1.0.bb
index 6c3bcd831c..cdfe38a221 100644
--- a/meta/recipes-graphics/pong-clock/pong-clock_1.0.bb
+++ b/meta/recipes-graphics/pong-clock/pong-clock_1.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "A clock combined with a game of pong"
 LICENSE = "GPLv2+"
 DEPENDS = "virtual/libx11 xdmcp xau"
 
-inherit distro_features_check
+inherit distro_features_check pkgconfig
 # depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-- 
2.11.1


