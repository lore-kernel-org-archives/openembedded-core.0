Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
	[209.85.210.180])
	by mail.openembedded.org (Postfix) with ESMTP id 6D996799D4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Sep 2018 16:04:09 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id l9-v6so4501279pff.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Sep 2018 09:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=dI74CcvVkYu/4jgZojnGzjL9ypdatpym+hz72E8SF9I=;
	b=MmdZXKLPCpJekzwuwCSg70LANk5iGJi88Bjn+k+d0U7zLDkfix1DH5/H2RFAQxJ1r8
	kLgi03SK1uLFuLh8YP6sxpfOIWtQ09ZrcGElNgomO/sQctH3aISIc0BnFQJ/DiOecuL+
	hzHMzv9492U+BFnOWtIZWisOYYcTxrdECDCDwJ2+PGTo6gLBipVekOXUrdi8uoXCcED5
	mtwi/Dou2wVaREhQK7UAGPZb9iY9KZbEeg9swTfxkSnuanQBH+E/P1DTkOZJ1lg60H+c
	xh6M+BuKm7UyUbKzS3T9slJICDBHMRDhh11g+ykT6nLZEaHyS0PDaSD2QOfg/6+ipqf2
	tFJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=dI74CcvVkYu/4jgZojnGzjL9ypdatpym+hz72E8SF9I=;
	b=MHycJrlE2i4coza5pz/cO7ofgCatSdlFnrAbr8Y4/2Q7Bp7pQ21EOnKUZWLVj0kDLN
	RjS1vGHse9kZasy3hyMKQV3uwWkteVkNCTnWUFmXrUrkpzDWoykPlKy8xlUg3Lroft9y
	sHCZzZrH60QdZWoHnPfSQ2SdZ41dku0D2hs3ZkIsiLEP0rMuHfSQVtbpp9/buJWgv6Rn
	oMlBQe1SnWkElU0AygeODcM1WeYxdrhhzDwXTCTQTq4jGHdYI6kP8eTXMQh2VwkzN+zM
	q512aYNhPra3q7kUA3xm1v6WjO+GGuDXmBH7tZ2V35u9s34cmQk9Nu79semE/aVips0T
	TGhg==
X-Gm-Message-State: APzg51Ci7jIpgeea9LAGyf08JOy/5mq/X70Na95bBof0OEInT4/fx+0F
	1t8FokYuxXZkBfsKwfzgNKM=
X-Google-Smtp-Source: ANB0VdbpAm0jp3ikrkF8RlCTpBdr5xpeW00u9pJpx5IeDdKbVY9CpPw0bsuGeFcluA8jGZ6QKYub9A==
X-Received: by 2002:a62:6104:: with SMTP id
	v4-v6mr13453263pfb.122.1536941050415; 
	Fri, 14 Sep 2018 09:04:10 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:6807:cebe:ef5d:c52e])
	by smtp.gmail.com with ESMTPSA id
	70-v6sm10519620pfz.27.2018.09.14.09.04.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 14 Sep 2018 09:04:09 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Fri, 14 Sep 2018 09:04:05 -0700
Message-Id: <1536941045-3581-3-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1536941045-3581-1-git-send-email-akuster808@gmail.com>
References: <1536941045-3581-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 3/3] xorg-xserver 1.20 qemumips fix
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
X-List-Received-Date: Fri, 14 Sep 2018 16:04:09 -0000

When updating to xorg-xserve 1.20+, mips64 would not work correctly and
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


