Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 88EE07F59E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2019 11:48:10 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id a6so10086571wma.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2019 04:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rFIWnWMB4r0iNq+lrRAtofQVtu2iJIJljTpmJ2CqoIg=;
	b=YXTyCuL9q3gjzmBd/13cLJij8skWzkz/3U/+F0sdf3qjdkjVdfoKlW0e+zvwSJmL6Q
	AYCt7zCwU1YfBycyxU9rcPkJoQsS5SelzeCwSVupcpXeUEAJMPUypcnTi72mest6MtXo
	oH2bFGQsjBJHmnPlO8fUC25MfDxk+4xfv4W6whm3ErEGgfcO+ADd317zlUYOlYx3VK3r
	3f5K5UKe4UgEicGPWSCCJz9uPrSiiDz5rzkUlGovJ+Uo8MNiqcMsi1Oc/RAB4qJaKOf6
	o8NdA6V0uXCRo+JUJ8p2u6uc0e9ENj3MtV7uFwXqwgnBDesTEp0jFAvMlh8TVD/ad81K
	zswA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=rFIWnWMB4r0iNq+lrRAtofQVtu2iJIJljTpmJ2CqoIg=;
	b=c8hEJOJ1NK6vD5VXXO0j/h4fBl8uIQuvjwsMlt86yUfVNcAlUoWP5FG8FJehRjkPHM
	dyorFbQ9HoUauZMtS7iGjI8R1d9uqdz2AaLpRKPWA0Kp7DTO2UMhZlrG0tyhZWAh7Gyt
	sb5sigZW72/0/BVHX4NtXYUHvdSu5e80tjs9NkauV7Z2wQacL3SnRgXbKR2vJgF4wDb7
	ENnWce9LlNX8Czbq9SXuq1DkBrN4BaW1D0HX7UoVvmkIZN0y9zDSYx8PjDNTnFjjinsd
	lKNrEMXe1FK8kpGta0FRtzKe9sglIFkv0XlLirDBy13uhE7cbyX1qyW+LO77whw2CUp6
	BYJQ==
X-Gm-Message-State: APjAAAWZ6XmzLZSQzHgZ1/MARNsDrP7p8ei5PXvUwCIeAyErBB+bqDa2
	Jm71n+KFMVp3XhzJzQnbEEvSfb4q
X-Google-Smtp-Source: APXvYqzqg+2bM7ngIlhSFLfTSxMl44VLVCDQ2QPiLZfj8NhQEiwxM3oxwRk0EcglgdaGogxZRAXpUw==
X-Received: by 2002:a05:600c:22d7:: with SMTP id
	23mr2846893wmg.31.1570794491007; 
	Fri, 11 Oct 2019 04:48:11 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id b5sm6964357wmj.18.2019.10.11.04.48.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 11 Oct 2019 04:48:10 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Oct 2019 13:47:47 +0200
Message-Id: <20191011114754.91740-12-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011114754.91740-1-alex.kanavin@gmail.com>
References: <20191011114754.91740-1-alex.kanavin@gmail.com>
Subject: [PATCH 12/19] libsecret: upgrade 0.19.0 -> 0.19.1
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
X-List-Received-Date: Fri, 11 Oct 2019 11:48:10 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libsecret/{libsecret_0.19.0.bb => libsecret_0.19.1.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/libsecret/{libsecret_0.19.0.bb => libsecret_0.19.1.bb} (81%)

diff --git a/meta/recipes-gnome/libsecret/libsecret_0.19.0.bb b/meta/recipes-gnome/libsecret/libsecret_0.19.1.bb
similarity index 81%
rename from meta/recipes-gnome/libsecret/libsecret_0.19.0.bb
rename to meta/recipes-gnome/libsecret/libsecret_0.19.1.bb
index 7da8e90084d..0d76075239f 100644
--- a/meta/recipes-gnome/libsecret/libsecret_0.19.0.bb
+++ b/meta/recipes-gnome/libsecret/libsecret_0.19.1.bb
@@ -8,8 +8,8 @@ DEPENDS += "glib-2.0 libgcrypt gettext-native"
 
 PACKAGECONFIG[manpages] = "--enable-manpages, --disable-manpages, libxslt-native xmlto-native"
 
-SRC_URI[archive.md5sum] = "483d293e73e7257c6d9fc18579b0e1ea"
-SRC_URI[archive.sha256sum] = "8049b09a4e737911aa647e50aee3d06b5db7aa902608ca43a0dd10d83e1d67f9"
+SRC_URI[archive.md5sum] = "ea673119c00570d6434f8fd3636f1eb8"
+SRC_URI[archive.sha256sum] = "8583e10179456ae2c83075d95455f156dc08db6278b32bf4bd61819335a30e3a"
 
 # http://errors.yoctoproject.org/Errors/Details/20228/
 ARM_INSTRUCTION_SET_armv4 = "arm"
-- 
2.17.1


