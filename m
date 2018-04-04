Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7D7CF7461D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 01:49:24 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id k6-v6so6656780pls.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Apr 2018 18:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=kbCDVraM7v+zrX5nNK/xy+6XWeuJEyTuZ/zBSMqJnjw=;
	b=oWuHRg5wvJ+xihMZzthPSQk/gD0yelvwFpcZhhC8Sbw9Jm5V06EX4Mp6mS8ZTfUlB2
	bQ1nmtX16Y6JFDiBw/P5QITLbZ0g6003kAX/2XDfYT3il7+AJAkMOmU0r92Kb3Mbm5Us
	CYsBoOs++vrXHQQHZ17RWgdHvROvfbdzqzTKygBcYS+ntSSytywyjFATRff13oTdY9Ff
	CyR25w85VpnttVAGzlMNJiu+8sbIL1xM9m/epKuD6ayELmxqZsn2Bwui5QTSxZ0pwzX8
	9N0jXmA81pidt80jbIVoJv6WebatRAdjwDC6e4ikWDfJhJHW0sfchaQoox92MSoB08th
	IOvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=kbCDVraM7v+zrX5nNK/xy+6XWeuJEyTuZ/zBSMqJnjw=;
	b=WYGOERsRsDLbR52AFkaN/ZM67pBy18YKyCWN/857eiFeUS7dbxzFSpP50nwPYa8h/O
	1GOQV7W0qzmlxTc4f97mvkUlNF4wxZO5LyNxTT7tKTEJYCsPFxwD4Dzw8/t1yYvWFVao
	/vSXZD4m6xzyUH+/OPXIOAZZLkXp4FG6+wEv1TsWCPSDh2l6TTDSuBRfxpNj064+uS1c
	WWTBSZBBVYvo0I6DEGOzCUcSegSbJALpjNkGnmJ0ODGv3FwXDjdSMKIJmOTYAGVCL5S6
	TyY0cKI4lM0kV9SHOmeTohMxJYJdAdaRW3bHThCp7wEIiH0nkLhVOPoPF1TMMt9Vq6VL
	/Ufw==
X-Gm-Message-State: AElRT7EDAygIgdgIeQ+7uVrd1XNlMxKRXM0dBiWZ95ba8bffHVhOr2uJ
	fJrWOk+a4MzoeOx+kYPwJ0X+gg==
X-Google-Smtp-Source: AIpwx4/zMLVGm0cTAVjoFSYd5aSKybEk9UYvif3+8rIGlZUAO71D94eDWDaszil1xHSXn33HVanKng==
X-Received: by 2002:a17:902:8f8b:: with SMTP id
	z11-v6mr16884196plo.316.1522806565524; 
	Tue, 03 Apr 2018 18:49:25 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:a4f3:7c10:9123:63ea])
	by smtp.gmail.com with ESMTPSA id
	d8sm7485877pfh.177.2018.04.03.18.49.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 03 Apr 2018 18:49:24 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Tue,  3 Apr 2018 18:49:01 -0700
Message-Id: <5377b1e33804044679fcc676357ab70742da13f2.1522806183.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1522806183.git.akuster808@gmail.com>
References: <cover.1522806183.git.akuster808@gmail.com>
Subject: [PATCH 02/21] xprop: update to 1.2.3
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
X-List-Received-Date: Wed, 04 Apr 2018 01:49:25 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-graphics/xorg-app/{xprop_1.2.2.bb => xprop_1.2.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xprop_1.2.2.bb => xprop_1.2.3.bb} (78%)

diff --git a/meta/recipes-graphics/xorg-app/xprop_1.2.2.bb b/meta/recipes-graphics/xorg-app/xprop_1.2.3.bb
similarity index 78%
rename from meta/recipes-graphics/xorg-app/xprop_1.2.2.bb
rename to meta/recipes-graphics/xorg-app/xprop_1.2.3.bb
index d78bf04..ca58d47 100644
--- a/meta/recipes-graphics/xorg-app/xprop_1.2.2.bb
+++ b/meta/recipes-graphics/xorg-app/xprop_1.2.3.bb
@@ -14,5 +14,5 @@ DEPENDS += "libxmu"
 
 PE = "1"
 
-SRC_URI[md5sum] = "fae3d2fda07684027a643ca783d595cc"
-SRC_URI[sha256sum] = "9bee88b1025865ad121f72d32576dd3027af1446774aa8300cce3c261d869bc6"
+SRC_URI[md5sum] = "4becb3ddc4674d741487189e4ce3d0b6"
+SRC_URI[sha256sum] = "d22afb28c86d85fff10a50156a7d0fa930c80ae865d70b26d805fd28a17a521b"
-- 
2.7.4


