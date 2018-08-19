Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 89AC37922F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Aug 2018 17:23:55 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id f14-v6so5643416pgv.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Aug 2018 10:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+drmlVReINFpgVT8zC+g2o+eL0AzCILaEOH/FuMmHHg=;
	b=XR6wOV4fe9hdpLJim3m/aMwAHqtuncSGacCdk9FMpXgAvKkHXI1pr0SrA87UVTSltn
	myJ4Ek5p0gzlOqv/PaZSlDEACEJHTP+13Rv5Swjl/9F7bihQ988Q+IMrU9KwY93SMtmt
	Xm1Q2murc3k9hduv5s1LlYaoN0Ov85Pq0ptV6p9rH9+9QU0Oga9lDRZA4yeto9tCui1m
	aZQQ8JYe425tlgJaqSdtegGFXCHGm5iQqgAS0nHXaD4+2POmLcZtxtQ5FE1C7B1w5cJX
	lH4sLPbNZFyfuw18sWeZXHsSfMNHTL7Ei4yEwZUiU17tNDCwgrFjj3nDxu3F8gwdoZ6f
	4rPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+drmlVReINFpgVT8zC+g2o+eL0AzCILaEOH/FuMmHHg=;
	b=H/EKXw7hF8woFeBB1NtM5kZBmwU+bMvH+KdbbVjrs0x9jLPS2JiHk9QthC/CXW/fwX
	xOKyrw8Kzy7qJXLuo/Mq5B6kbZZsUfpEGmOhUk0KMrOQh24QTluyq9gzKsUUZQxB8EDh
	EdjnBCSkTS8GzO6nuQp4IyBRmR7+J0NZ2duJyTs9DRDEAN75FqaHPufUFK4FmHjwToJI
	XdaizJUB3xiDQpIQHL2Q7C2I+9xbiBI+21+6qADUWeP5an66xmlncU/sl4VjeL5nAAI7
	b/YMXMayhOP8wdsSG4y44wrCnMyyn9pnDgUGdXrjLeR2NOvaYZlvssrdwGYSaFyAi9RZ
	gwiw==
X-Gm-Message-State: AOUpUlFABi+hGPpMAWZrw8EnI4FYjn6HB0+vrtpLcgJjnhrvQxIa03eZ
	6AHVtaL79dBqrtd2EYCm19vWzlj6
X-Google-Smtp-Source: AA+uWPwXo4p9F26g6REbxRwQBcztYiIWSilkMXfaK7nUbIQ25y4wx5myJEway4OPLXbVVI+CwjM9YQ==
X-Received: by 2002:aa7:860b:: with SMTP id
	p11-v6mr44452938pfn.247.1534699436256; 
	Sun, 19 Aug 2018 10:23:56 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::4add])
	by smtp.gmail.com with ESMTPSA id
	x1-v6sm8293466pgr.59.2018.08.19.10.23.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 19 Aug 2018 10:23:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 19 Aug 2018 10:23:40 -0700
Message-Id: <74b92c8785cfa4377a1738f28e3991d6adee321f.1534699224.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1534699224.git.raj.khem@gmail.com>
References: <cover.1534699224.git.raj.khem@gmail.com>
Subject: [PATCH 8/9] gdb: Upgrade to 8.1.1
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
X-List-Received-Date: Sun, 19 Aug 2018 17:23:55 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gdb/{gdb-8.1.inc => gdb-8.1.1.inc}      | 4 ++--
 ...{gdb-cross-canadian_8.1.bb => gdb-cross-canadian_8.1.1.bb} | 0
 .../gdb/{gdb-cross_8.1.bb => gdb-cross_8.1.1.bb}              | 0
 meta/recipes-devtools/gdb/{gdb_8.1.bb => gdb_8.1.1.bb}        | 0
 4 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/gdb/{gdb-8.1.inc => gdb-8.1.1.inc} (89%)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_8.1.bb => gdb-cross-canadian_8.1.1.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_8.1.bb => gdb-cross_8.1.1.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb_8.1.bb => gdb_8.1.1.bb} (100%)

diff --git a/meta/recipes-devtools/gdb/gdb-8.1.inc b/meta/recipes-devtools/gdb/gdb-8.1.1.inc
similarity index 89%
rename from meta/recipes-devtools/gdb/gdb-8.1.inc
rename to meta/recipes-devtools/gdb/gdb-8.1.1.inc
index 4d9faa2d4b..ad80dd3e4d 100644
--- a/meta/recipes-devtools/gdb/gdb-8.1.inc
+++ b/meta/recipes-devtools/gdb/gdb-8.1.1.inc
@@ -18,6 +18,6 @@ SRC_URI = "http://ftp.gnu.org/gnu/gdb/gdb-${PV}.tar.xz \
            file://package_devel_gdb_patches_120-sigprocmask-invalid-call.patch \
            file://gdb-Fix-ia64-defining-TRAP_HWBKPT-before-including-g.patch \
 "
-SRC_URI[md5sum] = "f46487561f9a16916a8102316f7fd105"
-SRC_URI[sha256sum] = "af61a0263858e69c5dce51eab26662ff3d2ad9aa68da9583e8143b5426be4b34"
+SRC_URI[md5sum] = "372fa63a53adeee1bfbfd581d8da9e34"
+SRC_URI[sha256sum] = "97dcc3169bd430270fc29adb65145846a58c1b55cdbb73382a4a89307bdad03c"
 
diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_8.1.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_8.1.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross-canadian_8.1.bb
rename to meta/recipes-devtools/gdb/gdb-cross-canadian_8.1.1.bb
diff --git a/meta/recipes-devtools/gdb/gdb-cross_8.1.bb b/meta/recipes-devtools/gdb/gdb-cross_8.1.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross_8.1.bb
rename to meta/recipes-devtools/gdb/gdb-cross_8.1.1.bb
diff --git a/meta/recipes-devtools/gdb/gdb_8.1.bb b/meta/recipes-devtools/gdb/gdb_8.1.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb_8.1.bb
rename to meta/recipes-devtools/gdb/gdb_8.1.1.bb
-- 
2.18.0


