Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id F03B27CB38
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 12:41:33 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id i16so21627558wrs.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 04:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=kqMzC/DJXqbuKCon8YhBokrd3EPFtyI4jgn/8ChsJME=;
	b=fcDWGJlP3xso9NFlyRXPZHrW4ktjT85sRO4DU/cfhO2wBxnv5HA1NPiSHfp+46OTLA
	XfGQj7BHyHrF64/ep7FfdBMi/sFcH9xVOO+vRI0XFvVrVWobBj91XaELMi8p1irPiSpP
	PcVqmzsKUSWexkH42E/7xfUdzR/ceIdpstzjQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=kqMzC/DJXqbuKCon8YhBokrd3EPFtyI4jgn/8ChsJME=;
	b=AfZZd+taE0yJnUjwba93EaTpEhfM1pgG0cNikqNXJXtuWqlN7cxU2ts1LE8A52Q2uH
	TXNbpF6T+tTsqLu7rpzpnjHfA02yIfmwyeAklHjXDiM5eDMdY2DFkSyWgXpi/HN7D4Jn
	ntJbVCzHfXVG8XDmDImRbICnTqymVr0bPhSvdF6MfPesnJFFrZ8KjGYNfK56BE79GXcN
	O4nNIsTkNbdafh5wYW4bF9SbPr/6H/7WObknXRt9CFdwBlq+UhkID2UYFVWPb6JYJxbN
	Fbctp6Fb8BR6VsscT/7K8hLqPOUUdbSqT/4M413rrLaQtpP+wHHtdKYR15a8jT1kotC3
	Qc/A==
X-Gm-Message-State: AHQUAuaXSl/lXHHtyRXU0yv6y54tWAuX127R0dSzGM7PmuDxj0kHaoA1
	sU/vaSSZIv/QkXerHZIw1AbJrxToBF0=
X-Google-Smtp-Source: AHgI3Iakni+ZSi/hOum0VwBcd+5Jkl+JANs2SjwBqxGga5/O7ZQeD2FPao3iZ6XjdAeJLS9UScXnUQ==
X-Received: by 2002:a7b:cc93:: with SMTP id p19mr10464089wma.113.1550752894409;
	Thu, 21 Feb 2019 04:41:34 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	d16sm20787379wru.52.2019.02.21.04.41.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Feb 2019 04:41:33 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Feb 2019 12:41:19 +0000
Message-Id: <20190221124130.25733-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190221124130.25733-1-richard.purdie@linuxfoundation.org>
References: <20190221124130.25733-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 03/14] gnupg: upgrade 2.2.12 -> 2.2.13
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
X-List-Received-Date: Thu, 21 Feb 2019 12:41:34 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...configure.ac-use-a-custom-value-for-the-location-of-.patch | 2 +-
 meta/recipes-support/gnupg/gnupg/relocate.patch               | 2 +-
 .../gnupg/{gnupg_2.2.12.bb => gnupg_2.2.13.bb}                | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.2.12.bb => gnupg_2.2.13.bb} (93%)

diff --git a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
index c43ecdf8616..2c204e02452 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
@@ -1,4 +1,4 @@
-From c69c3a49f3295179c247db5ceb3ef8952928a724 Mon Sep 17 00:00:00 2001
+From e7ad11cf54475e455fdb84d118e4782961698567 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 22 Jan 2018 18:00:21 +0200
 Subject: [PATCH] configure.ac: use a custom value for the location of
diff --git a/meta/recipes-support/gnupg/gnupg/relocate.patch b/meta/recipes-support/gnupg/gnupg/relocate.patch
index 1a5ea4aa2b7..e5a82aa76d5 100644
--- a/meta/recipes-support/gnupg/gnupg/relocate.patch
+++ b/meta/recipes-support/gnupg/gnupg/relocate.patch
@@ -1,4 +1,4 @@
-From 6d31b04d7a75f1d73c3518bf043b5b0a2dc40cb1 Mon Sep 17 00:00:00 2001
+From 59c077f32e81190955910cae02599c7a3edfa7fb Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Wed, 19 Sep 2018 14:44:40 +0100
 Subject: [PATCH] Allow the environment to override where gnupg looks for its
diff --git a/meta/recipes-support/gnupg/gnupg_2.2.12.bb b/meta/recipes-support/gnupg/gnupg_2.2.13.bb
similarity index 93%
rename from meta/recipes-support/gnupg/gnupg_2.2.12.bb
rename to meta/recipes-support/gnupg/gnupg_2.2.13.bb
index a02c66a0c87..3ce2a38c0eb 100644
--- a/meta/recipes-support/gnupg/gnupg_2.2.12.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.2.13.bb
@@ -20,8 +20,8 @@ SRC_URI_append_class-native = " file://0001-configure.ac-use-a-custom-value-for-
                                 file://relocate.patch"
 
 
-SRC_URI[md5sum] = "421b17028878b253c5acfef056bc6141"
-SRC_URI[sha256sum] = "db030f8b4c98640e91300d36d516f1f4f8fe09514a94ea9fc7411ee1a34082cb"
+SRC_URI[md5sum] = "563b959d0c3856e34526e9ca51c80d7b"
+SRC_URI[sha256sum] = "76c787a955f9e6e0ead47c9be700bfb9d454f955a7b7c7e697aa719bac7b11d8"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.20.1


