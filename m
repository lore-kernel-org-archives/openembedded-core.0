Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id 299D279074
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 18:59:59 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id y4-v6so7223390pgp.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 12:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+drmlVReINFpgVT8zC+g2o+eL0AzCILaEOH/FuMmHHg=;
	b=hfSg/apCJyJHpRz9qCkkvHtVzgUSAHwGFGMJFo/63yt1QrxT9Ze+5xwcFALpzZjPWf
	WnQLMKWMcFse8DTeKWQ+wHrOGs2UlkXDc9fJYZZ/Wag+5rqDhQmJieqDjE9D4TnJtwuV
	Jm9Mps0YT7sxdi7t2oTIilutyWy0tL6trdpOvUeKtSpexilXfkCm2OVEVMKIx7RtIxOK
	A7uPa8TejKnl33MVrSF0cbOECA9xqmEuNXbVZfQTUX/YQZo2wnXbSykCeYeZO0fnWhJu
	7hmhVurVZD7I76gCSf714NlOx4h7SZ3oeZ/6X6NayqLeA0K69uCBw/mOAgMfNYvrGLsz
	fbAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+drmlVReINFpgVT8zC+g2o+eL0AzCILaEOH/FuMmHHg=;
	b=UllzO9ahdUoRIO6F5BcW3A7ByXioNwLefY3dLixdiKqYfQy6QUjspR6ydyknK1c26y
	yq6J5LIzVIIFKTFEH9lH7P/mzhzSGUbtYMTvVWXTPvXHx7M0rHUbUY1UyWdFrVHr8vRY
	8kPXyuDEKhU9+ZvTYUAOAcHDOdJXCaCbOQpFjLQ8N0t7pPT9u9f0OboatFfCAEatC8Aq
	4V/hZ5axzLiD6lq5BrUlIYtoq2HNRk7jrH/ncP9OSdVgplHp90vcj4ih7CoCkhPwa4mu
	5zHzZkWfcCbY3jj9C9wmWYhVn52MiQBpnUa77h0wj6tGDPC9UYgm7VyOxczMu7j2VaTL
	0MoA==
X-Gm-Message-State: AOUpUlHkjV4Cms5Yv+a0REWv8DqM9avfQ5RBWYGdHi9qVbbQx7EdiWMV
	qtsjV+ZGnMHDoE65CLUal9sBnN5G
X-Google-Smtp-Source: AA+uWPxH3I9o09sgFbtwSQBX+V3+Eh7q4pn5XElWnexXZ5EtqqjvmMb9oqlwURK6ICHCdfjFshvapg==
X-Received: by 2002:a62:b0c:: with SMTP id
	t12-v6mr49237392pfi.36.1534791599956; 
	Mon, 20 Aug 2018 11:59:59 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::4add])
	by smtp.gmail.com with ESMTPSA id
	j27-v6sm18773223pfj.91.2018.08.20.11.59.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Aug 2018 11:59:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Aug 2018 11:59:48 -0700
Message-Id: <53064c2e82573d4b78ac1cb71dbd0d7e4b191ba2.1534791421.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1534791421.git.raj.khem@gmail.com>
References: <cover.1534791421.git.raj.khem@gmail.com>
Subject: [PATCH 2/5] gdb: Upgrade to 8.1.1
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
X-List-Received-Date: Mon, 20 Aug 2018 18:59:59 -0000

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


