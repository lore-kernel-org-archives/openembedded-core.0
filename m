Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
	[209.85.210.180])
	by mail.openembedded.org (Postfix) with ESMTP id 111EE6004D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2019 01:33:53 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id a2so11361525pfo.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2019 18:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=9eikOf+2Qe9CWR4wAroGFZqaTu4Gzd/PoYGvEqbYgW0=;
	b=trHzNQQHzjlUfEor9fjtBb/B9VVQmfTjQX5ISCM2w/svx8nAOqfOQUobpwMOgrUuc+
	40/T7akR6FThHO+384h2s4nltWUrarK9PvnUDK2FJp7jyrqx7gywpdgxaT9fbeOeLJnf
	QRqwxg/xrzqmYamHcODAootIJtvPZYoiKhAjv8AkFzR52bE6iyWPF3vXPpFnKCDGoRHz
	vdhuxGJzbXod9cMIYClTc2f2eMEhmlsdhZKTLexg1kMevM+x+N88O+Lg1VK0jZ4uAFEm
	d/ZT6o3lRDjSlxK5V5PcjBXucak1y2+lchleeWU6OlID/8G6u6dsPS0ks0S0IhpPMB2a
	ZRCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=9eikOf+2Qe9CWR4wAroGFZqaTu4Gzd/PoYGvEqbYgW0=;
	b=mBbUMfmvWW0LSXQJ9oHq4G2cLacDgbRvu6rWKARwFZdBOhmZZq8pbAc2OCs9korswe
	EbEMAHEIV0XmOuRTlSed5FueMNvOby+8whXEaRkuMXh1HH3Fthy+DHkZA9QHQz7PI1Z/
	G/aOynuey5oYkQB2YCEytv39lY5nuvvZQhmxYodeCRpwQ0EgdIHODw/WaafdItIXyAm2
	bbmY7tU/Dg/YRZf286Ye4dSV1Kiwj+LegCmYVhcJ+clyPDyp/nOFU3h++7UfxBmhk5VW
	T/b52+iXhzA26+4cwMukcKT4+IwO0PYoSlgMO/+NnE9I23H2ZEXnIVzRyPpTeNdAJyWa
	CGIg==
X-Gm-Message-State: APjAAAV6XFB5d2OyxJKRLGvEVQaY/Udm3EPwxopKgfAZz1DVMErdtG3N
	DZ7jD2PvimWu+uId8syTznDFFWuS
X-Google-Smtp-Source: APXvYqxXXHOauBcJgIYufARVgUqJLXFJwl64XcIJAYOHmH0dJsHt6xKZGiWovQNw0Ug3MKqdceyBJA==
X-Received: by 2002:a63:d26:: with SMTP id c38mr35135745pgl.84.1571103234966; 
	Mon, 14 Oct 2019 18:33:54 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:1c7e:9ce6:b4cb:b655])
	by smtp.gmail.com with ESMTPSA id
	b20sm22710629pff.158.2019.10.14.18.33.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 Oct 2019 18:33:54 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Oct 2019 18:33:43 -0700
Message-Id: <3b8db95973fc144b00d59c4797adb405a935cd7c.1571103112.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1571103112.git.akuster808@gmail.com>
References: <cover.1571103112.git.akuster808@gmail.com>
Subject: [thud 2/7] arch-arm64.inc: Lower the priority of aarch64 in MACHINEOVERRIDES
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
X-List-Received-Date: Tue, 15 Oct 2019 01:33:54 -0000

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

This makes sure, e.g., ${SOC_FAMILY} and ${MACHINE} have higher
priorities than aarch64.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/conf/machine/include/arm/arch-arm64.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/arm/arch-arm64.inc b/meta/conf/machine/include/arm/arch-arm64.inc
index 5f90763..53f4566 100644
--- a/meta/conf/machine/include/arm/arch-arm64.inc
+++ b/meta/conf/machine/include/arm/arch-arm64.inc
@@ -4,7 +4,7 @@ require conf/machine/include/arm/arch-armv7ve.inc
 
 TUNEVALID[aarch64] = "Enable instructions for aarch64"
 
-MACHINEOVERRIDES .= "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', ':aarch64', '' ,d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', 'aarch64:', '' ,d)}"
 
 # Little Endian base configs
 AVAILTUNES += "aarch64 aarch64_be"
-- 
2.7.4


