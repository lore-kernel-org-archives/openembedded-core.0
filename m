Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id F41BE7CB12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 12:41:45 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id i12so29946665wrw.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 04:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=b95/dK37qsE83qw7zp6lBj/TFiqtET4wPUlYR4o4YsU=;
	b=McOuWZ8NUVCW7GFV+vubcaK9wV15qv/n7G/FARl2m+/HZ1UeZSeO+Y93PFEHtk9mm5
	UX+AP/Xn/wdsvRILzh+kQIx4prJTY/mMvq4LWukEga3UgkE26h/E1smMY0yYPOL9gzUh
	vpsC1SSFse5XW2jrmBw4KEYSo1dRIZ22W3fcw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=b95/dK37qsE83qw7zp6lBj/TFiqtET4wPUlYR4o4YsU=;
	b=ohEns9WGCIoL057kzhRSsqi2PH5FHS1aZGC+UE3ymJQMtMl8DBfTRfZqK6tviEEX1i
	5ikLtYmvoaDF2y73NWV+e3k9JEmFDTCt+m/dV3LiH7wEb3FN5PiJKZOiAPUhy5myhBni
	6pWzL9HERRidzuisWJcn3372KYdnxPP1dhN0/QdjIMT4WibBzcpbWjTfByGlpux7C5GL
	P4Jk186d8PvLQrKMLpmY0E7etrlUENW10yeFwhoEYbNn6D5V6jgZH2C8/Pl+xDPdWcrJ
	n0vreVWKJo85wRBwJRfP9YCh5XhaIKFkmdFUTlj1/5Otes10VcQMrYBUzLufhjWD1BMo
	xu/g==
X-Gm-Message-State: AHQUAuY3Wkv96fi92/jFlwOl2qsH5fobjRYre5eNADfdM/j1v1RLNkeX
	KqcA5R/H0e2nRBhRWz4LqWhGyQ1BaSc=
X-Google-Smtp-Source: AHgI3IZXt1cpalT8M5PEXmk/+Km4Coy2RUypWh95HZDUkfOZJYDFP1BFnwS7gYdUZOyW4Qj3fBQhmQ==
X-Received: by 2002:a1c:1a08:: with SMTP id a8mr9961747wma.37.1550752906482;
	Thu, 21 Feb 2019 04:41:46 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	d16sm20787379wru.52.2019.02.21.04.41.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Feb 2019 04:41:45 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Feb 2019 12:41:29 +0000
Message-Id: <20190221124130.25733-13-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190221124130.25733-1-richard.purdie@linuxfoundation.org>
References: <20190221124130.25733-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 13/14] xkeyboard-config: upgrade 2.25 -> 2.26
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
X-List-Received-Date: Thu, 21 Feb 2019 12:41:46 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{xkeyboard-config_2.25.bb => xkeyboard-config_2.26.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.25.bb => xkeyboard-config_2.26.bb} (87%)

diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.25.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.26.bb
similarity index 87%
rename from meta/recipes-graphics/xorg-lib/xkeyboard-config_2.25.bb
rename to meta/recipes-graphics/xorg-lib/xkeyboard-config_2.26.bb
index b67dfa566ba..5c232884561 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.25.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.26.bb
@@ -14,8 +14,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0e7f21ca7db975c63467d2e7624a12f9"
 
 SRC_URI = "${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "a0238f95118f39f5f685dd28fbd9d24f"
-SRC_URI[sha256sum] = "fec6c25a8d3931bd9afca49a1653b0fa222c85610502d7b77699bb61262934b2"
+SRC_URI[md5sum] = "e2e980629bfeb9f40a7d44488b18ba12"
+SRC_URI[sha256sum] = "393718c7460cd06c4e8cb819d943ca54812ea476f32714c4d8975c77031a038e"
 
 SECTION = "x11/libs"
 DEPENDS = "intltool-native util-macros libxslt-native"
-- 
2.20.1


