Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id 7B8786C0F4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2019 11:48:09 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id b24so9903557wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2019 04:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=FQLsdF7koOL7LxZq6rloEo6UXU8TJPfG1bfGIlxDnYs=;
	b=MTBxQtINA2OTmzrKH/U5tGC6FOGhmnMawFQo8/+R76kDKmwqZLDX/2zGD6UQ/kORjV
	FrHevrm0AyL+12fZoTXZ0aiT+JTr6IW0x3NGV+TjdmXqC5OxK2JnntjNfiGmzOQ+Cssq
	OKNuGDiO3L0IlpXGZod1ygVWdxYYc1da5iYykSNM8A+oL8jdyXwGfNRY8nsAaZFfc32R
	b79h3LhJRppU5GK+PU9ZPum07pRRLyynM94wXxangpFvMmxIVbA7hDKVeg9rbbUpUBkj
	hH8aErrLVB+51a2YXf4BYt61RGpSA6n7Mgv9T51EePfi8jQylDMW6EpxLCNgftkggMbH
	ihCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=FQLsdF7koOL7LxZq6rloEo6UXU8TJPfG1bfGIlxDnYs=;
	b=E0dK3ZPAs32ck8y60wSc8m8zq9tfqVSwWxYKq02w66ZzDebzBgsbfuRqBDx6rjli9C
	6O/JCfbdxtSTIoxGKCfUhCoy8pFkwRjjT8udrzn0Hs/s7f0X6+BHZicrlyJgEfN31DTe
	5gNe+vceG5K2KkZI3iT4bQm9IdQH2gCKuPKMTX+LTO2EZGuUvrpwMQqdOUMSvPS5x1u7
	tTrtUXIRXxqhGRULMLTheuQUEucx8Xy3jXjeync7GNrEvgZGI6l4p2vsvg3Fib6RtLHa
	OUXEfULrMzAJ+q4AOGPib2PtBTQROCJ+4UGGdPpAfI2OgG0kLmaasFsVMm8DY4TlxKcv
	/1FQ==
X-Gm-Message-State: APjAAAWMfEAUOCzChzNBh6uH5VcxkQF+dqnrdXoeCkrnVYZVOtBdCM4Y
	FEiM2i1TvcdAZ7MResR1+MLneRtd
X-Google-Smtp-Source: APXvYqyBZTrQPjXtvBgjf85rMtPiHSuoDZ6RBzi5A6qmFDeDx1BHGhie3NrqEuEUQByq4JmDdlVhCA==
X-Received: by 2002:a1c:8189:: with SMTP id c131mr2918033wmd.151.1570794490121;
	Fri, 11 Oct 2019 04:48:10 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id b5sm6964357wmj.18.2019.10.11.04.48.09
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 11 Oct 2019 04:48:09 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Oct 2019 13:47:46 +0200
Message-Id: <20191011114754.91740-11-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011114754.91740-1-alex.kanavin@gmail.com>
References: <20191011114754.91740-1-alex.kanavin@gmail.com>
Subject: [PATCH 11/19] libdazzle: upgrade 3.32.3 -> 3.34.1
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
X-List-Received-Date: Fri, 11 Oct 2019 11:48:09 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libdazzle/{libdazzle_3.32.3.bb => libdazzle_3.34.1.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/libdazzle/{libdazzle_3.32.3.bb => libdazzle_3.34.1.bb} (73%)

diff --git a/meta/recipes-gnome/libdazzle/libdazzle_3.32.3.bb b/meta/recipes-gnome/libdazzle/libdazzle_3.34.1.bb
similarity index 73%
rename from meta/recipes-gnome/libdazzle/libdazzle_3.32.3.bb
rename to meta/recipes-gnome/libdazzle/libdazzle_3.34.1.bb
index e1a11830070..cf61ed5016f 100644
--- a/meta/recipes-gnome/libdazzle/libdazzle_3.32.3.bb
+++ b/meta/recipes-gnome/libdazzle/libdazzle_3.34.1.bb
@@ -7,8 +7,8 @@ inherit gnomebase upstream-version-is-even vala distro_features_check gobject-in
 
 DEPENDS = "glib-2.0-native glib-2.0 gtk+3"
 
-SRC_URI[archive.md5sum] = "b6da085649dcda2795e6980a84667950"
-SRC_URI[archive.sha256sum] = "6c8d9b1514b5f6422107596f4145b89b8f2a99abef6383e086dfcd28c28667e8"
+SRC_URI[archive.md5sum] = "e796a92dd3f529616ed388c15208359b"
+SRC_URI[archive.sha256sum] = "3d981cbb9d9bb87bfaff7bfd44d9847223b3ef81e69225e4d1f6ac725a669505"
 
 GIR_MESON_OPTION = 'with_introspection'
 
-- 
2.17.1


