Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
	[209.85.208.41])
	by mail.openembedded.org (Postfix) with ESMTP id 58FBB6080B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 14:29:39 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id r21so4060648edq.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 06:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=PGewnU++Sx4mSKBBGM0A4kXS2oeTuB6RT3MVogxeKfo=;
	b=KXLMnjtxiDkDnqdxHCsNkrS3/vfyhgVuQfN64He9vcQRAmw51Q1ACrzDJMj/MeTajI
	cRtjChUyL6q+ojdEao4ZoN7fy2g13AxggDZiBnwQiCZSOHof/f4lBiYYUx213/p/JtHw
	oswGAbk0z/XGQUvUrBtu5jH5bFny7r/k/XcDwdyvsvtLHfp1RaQEniIxrGpRVl9/rCQu
	bOnV7+hf8ZFppYXBmLCwPp4D7W6js7pgeCON5QhXf2QqWULX0iAcY0+Szto4IW6JDHKt
	DEdP/aIYe6UsMGtCYng0ky2UTsoOalGmkROvI0m9ASi33CAKKJnsxbG0dCz/bsP9Czmr
	Zaxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=PGewnU++Sx4mSKBBGM0A4kXS2oeTuB6RT3MVogxeKfo=;
	b=tuJK5i52jiGD685r3JM1u0rP8dyrQeZAOaL4PW+U3orL3PRsNwXVjQ0/YQ/ka7gd69
	Tn4KRBnDQ5BEDv1nBDkSkWH+XIoCeYouVVHrYYLki8FaEotD5EJZ1rk/MdCD8nI/12Tb
	EHxiIglxZQ7fsFXsvy2d3UgdOax9E3DQdJl6KdGqTp+zLEGtRgYUeJnYyT8zANGVqUrW
	gSljp2MtBhu+5EXVXXqkIu0+DOVmazKtg1jGPvmWRRGOJzbYb7PDs54jwtYSidu/0gfP
	16riCO9tUXXdx5IgjNv5kp2jBi71oT7vQarh6hFWkb5MBoDUFY9UYrRRVbYnFPe6Ei6V
	NW4w==
X-Gm-Message-State: APjAAAXgFTPti10o+dYOZdHLjhC+/VXxQPZlWurztUdqMeZWh7DoLjrw
	tM3+IrWK7aqL8SPJk7FQ5T/8iNx0
X-Google-Smtp-Source: APXvYqyhPXtkpMyV+CUGyJVtb7aMAYQI+CEErmENCL742OiZSRFaRiiE9LHtsiJ25YsjfXK28AQK+Q==
X-Received: by 2002:adf:ebc6:: with SMTP id v6mr33459996wrn.75.1580288904197; 
	Wed, 29 Jan 2020 01:08:24 -0800 (PST)
Received: from linux-f9zs.box (cable-95-168-152-69.cust.telecolumbus.net.
	[95.168.152.69]) by smtp.gmail.com with ESMTPSA id
	a62sm1550224wmh.33.2020.01.29.01.08.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 29 Jan 2020 01:08:23 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jan 2020 10:07:36 +0100
Message-Id: <20200129090738.1398-22-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200129090738.1398-1-alex.kanavin@gmail.com>
References: <20200129090738.1398-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 22/24] xserver-xorg: upgrade 1.20.6 -> 1.20.7
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
X-List-Received-Date: Fri, 31 Jan 2020 09:28:14 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{xserver-xorg_1.20.6.bb => xserver-xorg_1.20.7.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.20.6.bb => xserver-xorg_1.20.7.bb} (88%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.6.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.7.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.6.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.7.bb
index a1cd490394f..2bd10adf078 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.6.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.7.bb
@@ -5,8 +5,8 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
             file://0001-test-xtest-Initialize-array-with-braces.patch \
             file://sdksyms-no-build-path.patch \
             "
-SRC_URI[md5sum] = "a98170084f2c8fed480d2ff601f8a14b"
-SRC_URI[sha256sum] = "6316146304e6e8a36d5904987ae2917b5d5b195dc9fc63d67f7aca137e5a51d1"
+SRC_URI[md5sum] = "d2e96355ad47244c675bce38db2b48a9"
+SRC_URI[sha256sum] = "bd5986f010f34f5b3d6bc99fe395ecb1e0dead15a26807e0c832701809a06ea1"
 
 CFLAGS += "-fcommon"
 
-- 
2.25.0


