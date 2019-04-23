Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 368ED7D2D6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 16:50:28 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id n25so911368wmk.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 09:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=AtEkCXdUFhCpFXzxbNQtzPkdlD1jMM3eQY7DoE5CHOE=;
	b=Tyivi1ZaJjL6sdYSY6yp8JTD01ZhT8NukkpxDjHHlnprIkE3sYmREqlQMOfw4iHlxP
	+n+znNsexmfBpei/pZLL+726xBuTGaYYLPF/HOwXHAgyg+mMZ5Lg9Lwsczc3z3lzjhpG
	vD+0dsxQbmBhWRz2LpgLTP+uIvx0U+vWA8pKFLxoBynPXF9no3+DcFmh+PIZP09GmQaf
	+phKgN8cnwjo5jcNDRmOzfl4Gr6+0WhAQBnnC9yR+ezx1HhcsJz2g74b6ADaKTMwC/dg
	4s6C9ohADkymSbbJ9biLUjYpVP1rHsdXxkvIWSYZTTno3D6gTBShMRUb4lrVsyn/KBUp
	3X0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=AtEkCXdUFhCpFXzxbNQtzPkdlD1jMM3eQY7DoE5CHOE=;
	b=Y2dnypKmfFyQdZ/idI+BfXS8tifu9OSpUBRn/CIqPGbuW8A54vpOY4ZyLzgBQEV8RL
	lbiKUUMYd9sg6KHZeSBOCdZAqMniClSDsNv8yRZubj4rtYJBA41r2cDxeDFEnMwOroRa
	1dl2tB+pdSHFgw/kpns061WOw5zAtAJAjq9pcwsSJvJvIgBr4BtIgyg+YJ8EugpO1cxZ
	owD+07V6M5U31Az725e0liCLsXqZIQMg6YR1WqSLAKkO7HJnWWCDzr0QGR9AkWf1heIi
	WnGc4LKXZ9iOTR3KeHSvmWsjm4dhaMu2uRAsib0k+Wq0SAlkUWieH4J/SJrYjtG3vfnM
	7IGg==
X-Gm-Message-State: APjAAAUAVwloUbiaav1aYS3oJ3vByY+V/IaGJxUbolRi9rTiKbgxhweB
	Ad3zT5WJCdRyBt5JaqTFXLLAK99a0BM=
X-Google-Smtp-Source: APXvYqxEv9OABIIsSvat+6I+ZMT+R04aJMRXnsoiWFqZAMLeEGsbljt/rReHd3B2/Kbidss8RNIXug==
X-Received: by 2002:a1c:cfcb:: with SMTP id f194mr3144807wmg.51.1556038228434; 
	Tue, 23 Apr 2019 09:50:28 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	s18sm15652308wmc.41.2019.04.23.09.50.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Apr 2019 09:50:27 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Apr 2019 18:50:18 +0200
Message-Id: <20190423165018.75703-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190423165018.75703-1-alex.kanavin@gmail.com>
References: <20190423165018.75703-1-alex.kanavin@gmail.com>
Subject: [PATCH 2/2] acpica: update to 20190405
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
X-List-Received-Date: Tue, 23 Apr 2019 16:50:28 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../acpica/{acpica_20190215.bb => acpica_20190405.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/acpica/{acpica_20190215.bb => acpica_20190405.bb} (91%)

diff --git a/meta/recipes-extended/acpica/acpica_20190215.bb b/meta/recipes-extended/acpica/acpica_20190405.bb
similarity index 91%
rename from meta/recipes-extended/acpica/acpica_20190215.bb
rename to meta/recipes-extended/acpica/acpica_20190405.bb
index d4789df9335..0cd88d4e301 100644
--- a/meta/recipes-extended/acpica/acpica_20190215.bb
+++ b/meta/recipes-extended/acpica/acpica_20190405.bb
@@ -17,8 +17,8 @@ COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 DEPENDS = "bison flex bison-native"
 
 SRC_URI = "https://acpica.org/sites/acpica/files/acpica-unix2-${PV}.tar.gz"
-SRC_URI[md5sum] = "0ea9047bf15dfdf3583f5266cc6da718"
-SRC_URI[sha256sum] = "8f939ad6130862e05853837496500b3fb93037530e5ea0ca0298458522ffc2c7"
+SRC_URI[md5sum] = "9ee30c8ff3012e213bc3b21a9d632215"
+SRC_URI[sha256sum] = "7e144fd011c23a0a10be0b0d7448c527a4c0f621f1f835a271636e448bc96643"
 UPSTREAM_CHECK_URI = "https://acpica.org/downloads"
 
 S = "${WORKDIR}/acpica-unix2-${PV}"
-- 
2.17.1


