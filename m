Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id B058A7D27B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2020 17:48:04 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id d139so11722296wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2020 09:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=UyaHdZm8cLlY3W4K2R+ppjjf1qQH+DsXaYZ0ff8ct30=;
	b=A52XrFmlw96nqcdDMeC2VCKqlGuV2vFXr93uOz4jV3rLoEYseN7Lvi+7OHRPfVU/Oe
	ZotbJi8geajiLAe+ndZJr08BTWTyUumuxbKvIurgVFkoBZy521KZPYWqlgxMc9kH1Zvb
	C1f/7tYYpoOSxK9V30zrqwW6fp1g6cNE3D8ps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=UyaHdZm8cLlY3W4K2R+ppjjf1qQH+DsXaYZ0ff8ct30=;
	b=oUykHNMpxOYicc3XL5Xqzqe0NzMaDOYYZVoK2aOaajwyqfKgNy5UbuJ1UI1qLXJTAs
	mbDy93l2PkrqvdTP9+PhRdXNBFkxPlaDQlMofYw4ov/rQXaW3g+DTmIFRURt7M4Bn7sy
	dyRjVxq5pmviK3ArKRXuY7gqFr7osSG3iDoISZu3Y0cnQYzOCoUyQcKt4iUv4qNloWhn
	9BNd9CUkksPfq9zBEriAk8GaiLBdrOBZtNhyYSaT9hI+aC5HhKROMsbC7sslBIXb2JN9
	YZhPBkHcc38jvJoF1iNLANOEzo66lm4oIBQ/ZIEG1vyiFua9WzI4cGj2f1UYC0gnQTGZ
	8FCg==
X-Gm-Message-State: APjAAAU2av6NJ2RjfUuYjx/AHVLVhoZKzqn0W+xAG7pThUgO438pJF36
	jvG1I5G415YpzL1587l8OgX1sWnFJ64=
X-Google-Smtp-Source: APXvYqzsG3Cv3JeAfn3DIklY2nuZSS+gFspx1Qg2M0fU6cFsyDIt7Cb9WNjAVEkxmKaXUxv7JRER4w==
X-Received: by 2002:a7b:c1d8:: with SMTP id a24mr10725033wmj.130.1579369685316;
	Sat, 18 Jan 2020 09:48:05 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	t131sm15992132wmb.13.2020.01.18.09.48.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 18 Jan 2020 09:48:04 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Jan 2020 17:48:03 +0000
Message-Id: <20200118174803.28619-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] libfm: Add mime and mime-xdg classes
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
X-List-Received-Date: Sat, 18 Jan 2020 17:48:05 -0000
Content-Transfer-Encoding: 8bit

libfm installs mime types we want in our mime-database and it also uses desktop files
containing MimeType.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/libfm/libfm_1.3.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libfm/libfm_1.3.1.bb b/meta/recipes-support/libfm/libfm_1.3.1.bb
index 918fe3ece70..63ae7874b95 100644
--- a/meta/recipes-support/libfm/libfm_1.3.1.bb
+++ b/meta/recipes-support/libfm/libfm_1.3.1.bb
@@ -19,7 +19,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/libfm-${PV}.tar.xz \
 SRC_URI[md5sum] = "c15ecd2c9317e2c385cd3f046d0b61ba"
 SRC_URI[sha256sum] = "96b1244bde41ca0eef0332cfb5c67bb16725dfd102128f3e6f74fadc13a1cfe4"
 
-inherit autotools pkgconfig gtk-doc gettext features_check
+inherit autotools pkgconfig gtk-doc gettext features_check mime mime-xdg
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
 EXTRA_OECONF = "--with-gtk=3"
-- 
2.20.1


