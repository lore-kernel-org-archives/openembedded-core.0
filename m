Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id 6B2C4797C8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Sep 2018 13:13:48 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id v90-v6so14982855wrc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Sep 2018 06:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=rbxe4n7zHyCyBe2yQWq9BRjbmJ3u2B5EPX7P8QsTuLU=;
	b=DHEbaGGrtkPVxiAa8o6CyAt1mPe3Yx4MhjU1K5IEwT8cGRRRDFJ7Rw3Jkcy2R7ji8k
	sEWQ2V+ob7FyAvb+fhPh5TTYrdVMRlkmpMolLrZ+NbcU2w8drgO9tmVDNBms0TtH00e1
	Ox4OpiVvHCoKZCmFdWs8Sm+NKCERlATmisMLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=rbxe4n7zHyCyBe2yQWq9BRjbmJ3u2B5EPX7P8QsTuLU=;
	b=ERJPMTV7yEyyUA8wjoivRXMPkE7rGvjFWAsS4AISIaE9JiBr1P9rpQddxU2bjZvJDD
	/WlR0Ytih/J+aMnet3sEEifncpYPN5h8GWEX3GugdqHMu5DH4LpsJYYj24F9/xX0KA7K
	fISG50OOt0uNfEJeJqZVDI+DQFGedjNAOWiA8u8oZQzkYXcZgBYYQDOXgtU52xinkL2J
	2ozzX5sdEEEUPRUuCDzaRoP4al+HabvCvCHK+oiNls2qgpVJ1AsfJOuucSr2ggZ+X7MR
	tyjP/IjLJbI+y0JmSR7F6UfWlZ34Grohz56lbJiOgkg0b0/X5bQkpHAf0Ol6vdIYJkhg
	nIVA==
X-Gm-Message-State: APzg51AJfW0LB94LeI3Dlv7/JjXE6/B7YzsznpW4iZRbqcYYI3vkgnR5
	rECgvUpERmK7aMj3rCqpL163hCONEy8=
X-Google-Smtp-Source: ANB0Vda5jw56aY69ByOyftxL5v5ymQyntySNrDcKXJf1l5AEteWc03vH0HmUJD0Zx9pFc3svjZTjmQ==
X-Received: by 2002:adf:e14f:: with SMTP id
	f15-v6mr6183141wri.42.1536326028902; 
	Fri, 07 Sep 2018 06:13:48 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	g2-v6sm12930301wrd.71.2018.09.07.06.13.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Sep 2018 06:13:48 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Sep 2018 14:13:46 +0100
Message-Id: <20180907131347.19537-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/2] libpciaccess: Extend to native/nativesdk
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
X-List-Received-Date: Fri, 07 Sep 2018 13:13:48 -0000

Avoids warnings from libdrm which has nativesdk/native variants and depends upon this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-graphics/xorg-lib/libpciaccess_0.14.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/xorg-lib/libpciaccess_0.14.bb b/meta/recipes-graphics/xorg-lib/libpciaccess_0.14.bb
index a44a5c89279..d030c31bd0f 100644
--- a/meta/recipes-graphics/xorg-lib/libpciaccess_0.14.bb
+++ b/meta/recipes-graphics/xorg-lib/libpciaccess_0.14.bb
@@ -16,3 +16,5 @@ LICENSE = "MIT & MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=277aada5222b9a22fbf3471ff3687068"
 
 REQUIRED_DISTRO_FEATURES = ""
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


