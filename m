Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 862FF786C1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 14:31:17 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id a11so4221095pff.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 07:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=CgG6ej1bcIgdXUtEMUoxMYRW/JbbRZUh7m051sp2yX8=;
	b=TMlubd3Ne//smsUHbDN8QGYg9ok/LLo/tWASJuCtLG/v9+LlYlIKtaPILYtnfP8kLh
	GXFsmmH0MpqtTzgdguNXqmymrkFTDB3MVJadTFo3qMBNbdoebwt9/9aqjgG/XeilXrhS
	60cL6SItUCXAF12MwrdZ1BgL253CB7sYOFsy6kWwoZbWePpI0xP10LiFNywOAKPnDbm9
	sejoT9+6MdGZm394nEBrYfu96V87vB2tjpN+wyjTCHi8CUbUMo/PXhRvLhB8KNE2xGp2
	5aeQrIsx6AQqbUsISd2zFWB2GCD0uzt4ESsyaihvX+Xt7tHCCZy+EDjiQan9AIAe21px
	CCmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=CgG6ej1bcIgdXUtEMUoxMYRW/JbbRZUh7m051sp2yX8=;
	b=QDL0+cD2JzrZ1mA0tlTaeMxo+ar6MESdwIoPqM5uWqw7rRrd4biwghzmLYmy29NWjx
	KpwYueJr4jyF65bsHsz7I//cPJt7bz5MjDLNd/aTFFbYpqsXQ0cgSEYe/Zu8Enu8x4Qx
	E+Opw2Y4V/zSLXkzDaJYbUKBiyqeBXHxWwkAG1PnMu6eGfWk8av9CbFOrfhATXruxe/e
	oKHHWISDYN7IxxhtchkQ8VQyhSwsz/KnNDqmYUbimcRkbO/VJKHuAGw3ZiZ2hxEZw6Qb
	wX8HUJsi6/vAcC6/N3oNw4L/P4QXzW64SogCEcYE7MsMldeGSK33FNwis67SdQgSM5Tf
	O/dA==
X-Gm-Message-State: AElRT7ExgJoSstWMTE89tEirZ3xTQ7nj1yk7HSz5F1d1ZCuU3PiQarpn
	wKiAaSGoWR2DWVs6ZRXUZiQ=
X-Google-Smtp-Source: AG47ELs9njGl+yLlcbiEOxTGghjXGYu6Y076ddQ/tDht9wJxUL9bYzaNgxCzULssDe+N0R2oqDdV7g==
X-Received: by 10.98.237.12 with SMTP id u12mr33091833pfh.72.1522074679209;
	Mon, 26 Mar 2018 07:31:19 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:203c:a04e:87e9:791b])
	by smtp.gmail.com with ESMTPSA id
	j11sm29932492pff.94.2018.03.26.07.31.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 26 Mar 2018 07:31:18 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Mon, 26 Mar 2018 07:30:07 -0700
Message-Id: <11cedbcd818d495672d7ffdd8445a90791103f90.1521989435.git.akuster@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1521989435.git.akuster@mvista.com>
References: <cover.1521989435.git.akuster@mvista.com>
Subject: [PATCH 04/21] xkeypboard-config: update to 2.23.1
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
X-List-Received-Date: Mon, 26 Mar 2018 14:31:17 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../xorg-lib/{xkeyboard-config_2.22.bb => xkeyboard-config_2.23.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.22.bb => xkeyboard-config_2.23.1.bb} (87%)

diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.22.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.23.1.bb
similarity index 87%
rename from meta/recipes-graphics/xorg-lib/xkeyboard-config_2.22.bb
rename to meta/recipes-graphics/xorg-lib/xkeyboard-config_2.23.1.bb
index 4fd894fd..fb9f5d1 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.22.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.23.1.bb
@@ -14,8 +14,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0e7f21ca7db975c63467d2e7624a12f9"
 
 SRC_URI = "${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "eb61fb3fd419e817df572b0c8d94a883"
-SRC_URI[sha256sum] = "deaec9989fbc443358b43864437b7b6d39caff07890a4a8055105ce9fcaa59bd"
+SRC_URI[md5sum] = "875cbd09ab8394277fd16070326abbae"
+SRC_URI[sha256sum] = "2a4bbc05fea22151b7a7c8ac2655d549aa9b0486bedc7f5a68c72716343b02f3"
 
 SECTION = "x11/libs"
 DEPENDS = "intltool-native util-macros libxslt-native"
-- 
2.7.4


