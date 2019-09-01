Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id 81B4B7F43E
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Sep 2019 15:24:30 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id h7so10166938wrt.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Sep 2019 08:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=hDy6AYI/b9EoXIaHCAzxnHn0rvVvEnlNVoxcn4IMrR4=;
	b=KyusyX+Wg+/lbaByq/bhVK0ZWs3kP/jgpAWBeUMwho0F51xlu75OkXSUp+Odjvmpcv
	h0xJcI4YRtX68BOCzAgpUubeMjYpCKwb3SGmh1+8OGa9DpwAHnTTWmGMF52AUfehz0fM
	zniYk7sl6UlKyI/9R5AZEHY8OgXm7ZKuqXq158JySH9aGar3v+y9kOj6WwkUk7GXHNm/
	SLxj8xERn+SFUgjmGPkcFUE7cVkdhmM+xRW4KnBtSKhkOG96VOXsDZ5gH4o3zoXZkZKa
	1clz0p4QgSXmXDucNEnJzhJHBQWENTF+IVqlFmpMO0BcY7zJmoD9lNN5CC8NBfGr2lZj
	IjaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=hDy6AYI/b9EoXIaHCAzxnHn0rvVvEnlNVoxcn4IMrR4=;
	b=ZfUslkxfwaHucAECtpMrEPST3A67Q7OK5haKqJtEAPRp4jGx/saZzRYciHkfUeyFS2
	3oxaJQWQzSq81BRnw8g7zeUzcrZloH0PHwmBGcdkVMmnGkGaOJO89/hjVnsnVHTcMV9a
	0Qjmjk0lFvrtfOaYao+OuMPmi1UUnlhjH19lbfn3TfwnKRjWqEfSoORPW/PgrUOsHxB+
	yilapkl3uJtx8/8JJVdsb7od8+mFmkPAQBetpwiI00u5KT2fnSo3RamLGEI+8KCSr4vn
	LjbWPb7Pw6DbXQrLH/etD/LLxY5mZdPZLxHYj8ZcJFYlbEVe26NE5r5U6q/winpRAPUP
	YdnA==
X-Gm-Message-State: APjAAAUPpdZ7VcEQ+DK8EcNibk1MmOgg4OMWq3FLWDEmKIm8Y5kFxQUb
	gPm0zridlqVD59P2nmahx8Q6L8w1
X-Google-Smtp-Source: APXvYqwj7G/T9nAJookE2d08UFiLppxv9/nz1Qdxi1V5oH2E3D9/pHpnM8EhomxonPAahTYzrucLJA==
X-Received: by 2002:a5d:5642:: with SMTP id j2mr6371080wrw.345.1567351471117; 
	Sun, 01 Sep 2019 08:24:31 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id c9sm9403598wrv.40.2019.09.01.08.24.30
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 01 Sep 2019 08:24:30 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  1 Sep 2019 17:24:25 +0200
Message-Id: <20190901152425.100061-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190901152425.100061-1-alex.kanavin@gmail.com>
References: <20190901152425.100061-1-alex.kanavin@gmail.com>
Subject: [PATCH 2/2] libepoxy: enable x11 PACKAGECONFIG for native/nativesdk
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
X-List-Received-Date: Sun, 01 Sep 2019 15:24:30 -0000

This is needed to enable virgl support in qemu with SDL frontend

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/libepoxy/libepoxy_1.5.3.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/libepoxy/libepoxy_1.5.3.bb b/meta/recipes-graphics/libepoxy/libepoxy_1.5.3.bb
index dd706a96063..c8d1650c637 100644
--- a/meta/recipes-graphics/libepoxy/libepoxy_1.5.3.bb
+++ b/meta/recipes-graphics/libepoxy/libepoxy_1.5.3.bb
@@ -23,8 +23,8 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} egl"
 
 EXTRA_OEMESON += "-Dtests=false"
 
-PACKAGECONFIG_class-native = "egl"
-PACKAGECONFIG_class-nativesdk = "egl"
+PACKAGECONFIG_class-native = "egl x11"
+PACKAGECONFIG_class-nativesdk = "egl x11"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.17.1


