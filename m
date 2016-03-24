Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 1B50160249
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 03:19:19 +0000 (UTC)
Received: by mail-ig0-f178.google.com with SMTP id l20so4868696igf.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 20:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=hegLrflG89OolScrWXCDdq/jG2ZzjZnWILr+9aI2vf4=;
	b=sBwAZr84zg6GLVeV9E1N0NlMeIsztHUTM5+Tftub3jtXmAWHFdo7jev3TxA7hpINi/
	yKqcmkwLl5inJoN0isJQCI1Nf3ENAKgsoIChvH9pcziMD6kzhyRbXlIzyvcE1mff4Lj/
	nUkLAOScbvHh8Fb1rbPs0sGqKczCEVUHFOoqoXOvoOeipqrtbZtyb6uh1TTcwqM1/98f
	KZ2aRnPx2aEAwNRWHESHflaAfEFmHLJ4pkyyyqPppMFmYFqve065noN/pPw6F6HBuMSe
	wQxjTT+urBz/Dxzaouh8n1e6jBncJ7ooO8aHzIekZG/+YOJOFhQtQwKsIT7d8LA2cpNX
	auSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=hegLrflG89OolScrWXCDdq/jG2ZzjZnWILr+9aI2vf4=;
	b=VGaTY65igcS0ppTIziVy2TWJQlGmjy020xJM9l4HJBGM8abYTUgCZyh43atasiOw18
	e4mDVppRd2jlVh4wjznt/ki4dpkXfjZC3Q6tqOpg55HHRi4Rtn1pmCU3LHYfXvd6i6Ly
	XFWRCTp+9tpTQnmNsEsKSM4lTGLotO6VIKRZZ8cHIIzXw+/y1vouKj9W2K+mOMQwIbOe
	2/D6jqWKHd+k8WpUvexI5Jmj5fpfx3T7j+HyC+w7wluEGlKkLrdTYtICrhrNslwtJKIJ
	ebxCh4dikzGtI40jyIs32fR2YPgIdvBOajkLp9G52x3UGkDAVvEqOrW1BnratsCVEZXM
	Hk0w==
X-Gm-Message-State: AD7BkJIner8USaJp+geCg6aa9V/Si4vP5tryYQNk8aBWz+tMZTO7oghyQepTXl2j7BUVxQ==
X-Received: by 10.50.12.8 with SMTP id u8mr26637828igb.33.1458789560351;
	Wed, 23 Mar 2016 20:19:20 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	o201sm2394156ioe.15.2016.03.23.20.19.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 23 Mar 2016 20:19:19 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Mar 2016 20:19:13 -0700
Message-Id: <1458789553-3629-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] gcc-configure-common.inc: duplicate armv7a over-ride for armv8a
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
X-List-Received-Date: Thu, 24 Mar 2016 03:19:20 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-configure-common.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index f4f76bd..a7b8d63 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -65,6 +65,7 @@ EXTRA_OECONF_append_mips64eln32 = " --with-abi=64 --with-arch-64=mips64 --with-t
 EXTRA_OECONF_append_armv6 = " --with-arch=armv6"
 EXTRA_OECONF_append_armv7a = " --with-arch=armv7-a"
 EXTRA_OECONF_append_armv7ve = " --with-arch=armv7-a"
+EXTRA_OECONF_append_armv8a = " --with-arch=armv7-a"
 
 EXTRA_OECONF_GCC_FLOAT ??= ""
 CPPFLAGS = ""
-- 
1.9.1


