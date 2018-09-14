Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 36F6771C42
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Sep 2018 19:02:42 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id y4-v6so4808126pgp.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Sep 2018 12:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=7/CXRSnOJbZs6tooGtufpQg6wZwOt2S3R19MMDmDgGk=;
	b=c3/aJowVjiYVg6tWWhuIpXXeu/D0XzFpIc8PiSIEA/IIhy0tzV3rpb/H/6cw9SZPJD
	D5l1/LMLfXhPqJOi2hDpjJgbzug/uaIr58pzwUDF/YCnToClDRMDs4KQM18aJWk2nemK
	diOTRdkwXCwVqvq/Ty8/JD2E95yXihqvgluvqbUsrYy0jRgBMRA7yGw1r67HcHDPrLyf
	bYkhey/czqRe42fMU0kDQH3B3eWoQvQ6WhLwVoSD5elV90/hNn3JfI6k/3RHqQ41SLDg
	+GMdd9x9GsZww3znn+p4Xfqd0O3/XegtxviPxfcVM34pZnLChZljisxVk4WiYVoIpxJt
	/6Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7/CXRSnOJbZs6tooGtufpQg6wZwOt2S3R19MMDmDgGk=;
	b=GtL29L2F3BDsF01nzOee2RfkQnMg/bAx7NYWvfYmVGtgjvCO1lea7MixIXJQtJqFzi
	FC25IB03aoKfdF9TUjeb8qmWR1ZcAGJg49049wtvSsoj2jZZR++iwkV7E9ZvH51byAny
	djvriF1tRIEUoUZauElN+T7M306gSbm4+FihxfzcajJor1yJQE4iWMjJThjuZGavbYmp
	UB8S/hDFY4IM+50hHXQlqLdR6ug4+JF5YqtFO5IHapjH/UV2C7sWTZlZSu9Nr5kCy+vm
	kcM8IJNTg6hKFkvPE76I9rr2iAaUaOAqHSL5x0e0B8daAyUppa/Jf7oIirY4hR7qGV7Z
	e6vQ==
X-Gm-Message-State: APzg51Dc3KJtXVGPkNsr/TdzCivGjEFQHcLKr1VUgOEutX0Bhaw7QvSs
	kskme2pTZG24uqE3kJnDYXk=
X-Google-Smtp-Source: ANB0VdbEXx89INH+3YO7kUWH6pNFC7YWNu4jo/UrYxpZau4qMjvwJgXIG6wLpA4su2lsR4gTtvIsuw==
X-Received: by 2002:a63:1a5a:: with SMTP id
	a26-v6mr13179770pgm.9.1536951764161; 
	Fri, 14 Sep 2018 12:02:44 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:6807:cebe:ef5d:c52e])
	by smtp.gmail.com with ESMTPSA id
	l84-v6sm13771924pfg.3.2018.09.14.12.02.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 14 Sep 2018 12:02:43 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Fri, 14 Sep 2018 12:02:42 -0700
Message-Id: <1536951762-5712-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [V2][PATCH] xserver-xf86-config: 1.20 qemumips fix
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
X-List-Received-Date: Fri, 14 Sep 2018 19:02:43 -0000

When updating to xorg-xserver 1.20+, mips64 would not work correctly and
cause the xorg test to fail.

Changing the DefaultDepth fixed that.

[Yocto # 12845]

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../xorg-xserver/xserver-xf86-config/qemumips64/xorg.conf                | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemumips64/xorg.conf b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemumips64/xorg.conf
index f4cd139..03b94dc 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemumips64/xorg.conf
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemumips64/xorg.conf
@@ -26,6 +26,7 @@ Section "Screen"
     Identifier    "Default Screen"
     Device        "Graphics Controller"
     Monitor        "Generic Monitor"
+    DefaultDepth    16
     SubSection "Display"
         Modes     "640x480"
     EndSubSection
-- 
2.7.4


