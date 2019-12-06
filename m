Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id 25D817FAAE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Dec 2019 18:10:00 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id p17so8256310wma.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Dec 2019 10:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Z/T7WwVIUv2Kr9KuHbJ21768hgXJ2q5OAYGMsbiIPoM=;
	b=PBKsNCuLdmWW1EvdoV1DaC+IH8Y2vWM+ITCI3zOK9dRaWk9k4pMp9KHv+QRdYysIS7
	RoH0MpIVpzbk54YptLa1Fpf581mXBlwR0eVYoOmK36n7MC0VTpgCy/vNDin1gvff57Uh
	9oB7d/5ckEjFcihnPFRx6jmV3NjuB8XYSrqR/x4NxkDF9HqBzPWSGa5+0W8bkoTJ0eDd
	kuhXfPF+akNkVBNyl9EIupUCMZgSP0TnK067+DfRPRcqupc3GmhcOYNBZzxrSKM+FmW+
	aVwd/lKTsXLFdLI4NtcLiVpqeH5YXmFrsCSfBGSFFzIk7OQBReu8WPleGFjVbdTRWoEk
	Vt1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Z/T7WwVIUv2Kr9KuHbJ21768hgXJ2q5OAYGMsbiIPoM=;
	b=LbGz4LbTwb5hoJW1/q+8F6vnWgTIZx8tFvGQG6L3BynhW1/4p0TFftpunYMPspxQoT
	lHXGXz3+uexOnp+StapeuNJxhGGElafX71Yf+mouzh0kDLngZQ3MYgDO74CE4k1TCH61
	B2yvBR4t1cT88Yt/TAn6CalwOjBiYOsTPrKHtO1HROTQNF1q5W0IpeEK3+h20PRUCI91
	NqV1j7e/DrN1zI9i5KbANXBdt7/v/UA1hbmGoIgIo2y5iSjUbxRawjt1trwJZPnamEfR
	yj2ndOew2HCSotR/oscr2FjjVJURN1JaKwYPGnEQW0BrciRYDRyCQhn1kjLyvOzldgN0
	ffRA==
X-Gm-Message-State: APjAAAXBWYKVZFXEImDdUaXYf/qNKZ3Bl/P7BvtzOQJBkyOEXaXM3EGs
	voiTsDpj/sR2JuNbqi0lOPOUuFZF
X-Google-Smtp-Source: APXvYqwrxQDSpw07c1cqkIxsLCxsr0V5UpnZzREUBrSeNP9zD0BNmP7BYDgpHU7rNxVILqBHKpbVxw==
X-Received: by 2002:a1c:2155:: with SMTP id h82mr12175007wmh.21.1575655801583; 
	Fri, 06 Dec 2019 10:10:01 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	v14sm17011347wrm.28.2019.12.06.10.10.00
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Dec 2019 10:10:01 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Dec 2019 19:09:45 +0100
Message-Id: <20191206180949.59953-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191206180949.59953-1-alex.kanavin@gmail.com>
References: <20191206180949.59953-1-alex.kanavin@gmail.com>
Subject: [PATCH 06/10] libxcrypt: update to 4.4.10
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
X-List-Received-Date: Fri, 06 Dec 2019 18:10:01 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{libxcrypt-compat_4.4.8.bb => libxcrypt-compat_4.4.10.bb}   | 0
 meta/recipes-core/libxcrypt/libxcrypt.inc                       | 2 +-
 .../libxcrypt/{libxcrypt_4.4.8.bb => libxcrypt_4.4.10.bb}       | 1 +
 3 files changed, 2 insertions(+), 1 deletion(-)
 rename meta/recipes-core/libxcrypt/{libxcrypt-compat_4.4.8.bb => libxcrypt-compat_4.4.10.bb} (100%)
 rename meta/recipes-core/libxcrypt/{libxcrypt_4.4.8.bb => libxcrypt_4.4.10.bb} (95%)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.8.bb b/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.10.bb
similarity index 100%
rename from meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.8.bb
rename to meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.10.bb
diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index 1787f6921e4..6d6990c3d5b 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM ?= "file://LICENSING;md5=3bb6614cf5880cbf1b9dbd9e3d145e2c \
 inherit autotools pkgconfig
 
 SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH}"
-SRCREV = "acd84997a5a8b2badd28b70a642abee11272fad2"
+SRCREV = "dcf7d7509a26a2fe83f115f5ee731c59749ae17e"
 SRCBRANCH ?= "develop"
 
 PROVIDES = "virtual/crypt"
diff --git a/meta/recipes-core/libxcrypt/libxcrypt_4.4.8.bb b/meta/recipes-core/libxcrypt/libxcrypt_4.4.10.bb
similarity index 95%
rename from meta/recipes-core/libxcrypt/libxcrypt_4.4.8.bb
rename to meta/recipes-core/libxcrypt/libxcrypt_4.4.10.bb
index aba9b1ef0cb..79dba2f6dc4 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt_4.4.8.bb
+++ b/meta/recipes-core/libxcrypt/libxcrypt_4.4.10.bb
@@ -1 +1,2 @@
 require libxcrypt.inc
+
-- 
2.17.1


