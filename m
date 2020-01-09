Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id 607817FDFC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2020 20:26:39 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id q9so4408207wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2020 12:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=109Edj2iz6iWnF7gDCQolbN8B+O2ourpOwYc6/tUYlY=;
	b=EHgCI6MjWxWt8dg6E+30KKi7GXB04Fg4sv6vJfPjXcWat40/NH0JGV0pOeVpXY5etu
	hoLZ5mN3ZORy9A3FDubkuwNlxafmgJcDOqWOgpo7Rf1wWb5w9ZBASV6kGeHWRegU9A9I
	XzH43WnjCpkI8xBwaii4cG5Ce+/LHcDFYBcAWNHkKroegVSRBnfFoHTVYYSdEChHT4Qy
	9et/NO/kpu6do73usOjhyVdy6VbTKXNNh+lZbQWu23FCIQ6t4+s3rx8ZRo0Msj+bKjZS
	a7qTcHcvVSyK7JZszj+95Dk4lOzQI2eTFbhDyxNpFs9nrLYJHFEUvR2WE9IZUHRN8mCA
	CjhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=109Edj2iz6iWnF7gDCQolbN8B+O2ourpOwYc6/tUYlY=;
	b=GSLqbOkdPupVih3ya54bc7QCq3KmKJ0fxM4mG42psxr8DwxOO+9xgbntJYqsS8XBDW
	RTfhLmxvjuKAHOcq8+j+zDlL3bVqLAInUrYCbpAYFC65YyrYDdnUqsIwu5lfOpUB6soU
	xO5n307hdWyNnZLSKLWLbu+VbxlOELaaAYrshZ4Uy7/XIsrXd7AmWDfjkJsNvcAyFcGA
	J6yUM18pm38TFVFMMKDMCVoKAa6miLtbUBp7N2m942r/d3VEiYfhAZspEbuE6Xi3kISj
	6u8Q/U4RWM+t6YprDzc4btu0NbrBn6oKcfxHOAKemQnbkSsdhGFPziUZs/wx9fNnBemW
	1bzg==
X-Gm-Message-State: APjAAAU7meSjZFB+GBATFugHk00wX0bvlc0HfWv/zgspfqWjrbtyJwXB
	J8wMaWD3eUq3rSNEHVE/xYKAi3/mgcY=
X-Google-Smtp-Source: APXvYqyCpvtUnCGXy/EmU0yZcB3GfgHDuOkM7N2BxJHzNYSL2wKj+5divp+x8KTkIakuBR5BHPKbIA==
X-Received: by 2002:a05:600c:2207:: with SMTP id
	z7mr6549179wml.138.1578601599884; 
	Thu, 09 Jan 2020 12:26:39 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0446528B12EBEBA10192C2.dip0.t-ipconnect.de.
	[2003:f0:7f04:4652:8b12:ebeb:a101:92c2])
	by smtp.gmail.com with ESMTPSA id z6sm9149986wrw.36.2020.01.09.12.26.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 09 Jan 2020 12:26:39 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jan 2020 21:26:19 +0100
Message-Id: <20200109202623.28936-8-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200109202623.28936-1-schnitzeltony@gmail.com>
References: <20200109202623.28936-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 07/11] shared-mime-info: add mime to inherit
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
X-List-Received-Date: Thu, 09 Jan 2020 20:26:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

shared-mime-info-data: is the base for mime database

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta/recipes-support/shared-mime-info/shared-mime-info_1.15.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info_1.15.bb b/meta/recipes-support/shared-mime-info/shared-mime-info_1.15.bb
index 163e74f362..633722125a 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info_1.15.bb
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info_1.15.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gitlab.freedesktop.org/xdg/shared-mime-info/uploads/b27eb88e4
 SRC_URI[md5sum] = "5215f3d679a817de97eb8b0b911e9393"
 SRC_URI[sha256sum] = "f482b027437c99e53b81037a9843fccd549243fd52145d016e9c7174a4f5db90"
 
-inherit autotools pkgconfig gettext python3native
+inherit autotools pkgconfig gettext python3native mime
 
 EXTRA_OECONF = "--disable-update-mimedb"
 
-- 
2.21.0


