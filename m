Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4EBEB7888C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 17:23:27 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id e14so13855649pgr.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 09:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=xzgqySKaUJuuJfLQC0vKXuASigI7xIPhnVUY3dK6zEA=;
	b=e0TqxHnmOcXK/8hWnvp4FHO8vDunB7Zfy8w9pOv1V9ZwLD44SYHl4jpzHbwLnrHFsb
	nKGR+B7yB1uCHH3jJngU6DUaCAlybwv1W7dN6ssKFkD+KxgMw/EYRXO1Bd0PoHNPjtJa
	lCiRjAyh6g8BAeCPdUTnnNOGgEEbZhCHc+woj+SmZo2/PEtL2oYjLvUO+XIgCTfSVe/e
	lv2y+c12hkSNoVMph3HKM1LSmANlds209XV4UDPUHzHFtMC+r420nHLAb5ufc0d2JHxE
	Et7fuyTsxllv5JeWi9GQQ8zvOB1sy/TJahzWRsVNymNAwl58aWF982PkGhgg72aX7LKz
	XXtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=xzgqySKaUJuuJfLQC0vKXuASigI7xIPhnVUY3dK6zEA=;
	b=sxTTMKkqZ7p8PTyxVT1dqR02xn0yzpkYkaVeXnfcy3CazhnfQ46xdRujBCWv4rNZD4
	a3Nqnt6jYRQbESvp/AmHN0ylyUnbWbZuym90xPE/HIwB9FS4Cu23IWRvZzj+QsSdBWt0
	x9RJIJnkxH4Z+INwX9N/09MJl9kWu1ti30w+UNhHTqXRQYe2OMfO65LaPLBo6KuFvEyG
	c9nAqzsJOHo2uVzWwkLum5Z64KTx/ekh3Eodfay1MqiHtCV0sTBLlOPx4BzjYYkC42+B
	ECH8gx18RTqWynajz5weJukpylxTydLaRL3f4O6qVks4XpBYiqrGphHAhuhiGq2A9RYg
	vHyw==
X-Gm-Message-State: AKGB3mIQdPg4PARZLiqHvXe5Cx9BxDHtbSgl3SEIV8vlyB+Iek0Ui9D5
	f3fmjhs6lQYi6XuaF8vFFCsE/w==
X-Google-Smtp-Source: ACJfBos0if51qwSg0vzZxIs4GLgi/mENxt7n1//moSrNQ02A0ka97cL8t3MJ3L/aTLb4HpDE5USDlQ==
X-Received: by 10.84.252.146 with SMTP id y18mr2945486pll.70.1513099408328;
	Tue, 12 Dec 2017 09:23:28 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c::c579])
	by smtp.gmail.com with ESMTPSA id
	k197sm18790329pga.42.2017.12.12.09.23.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Dec 2017 09:23:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Dec 2017 09:23:11 -0800
Message-Id: <20171212172317.601-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171212172317.601-1-raj.khem@gmail.com>
References: <20171212172317.601-1-raj.khem@gmail.com>
Subject: [PATCH 3/9] gdb: Upgrade to 8.0.1
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
X-List-Received-Date: Tue, 12 Dec 2017 17:23:27 -0000

Minor bugfix release, details are here
https://sourceware.org/ml/gdb-announce/2017/msg00004.html

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gdb/{gdb-8.0.inc => gdb-8.0.1.inc}              | 4 ++--
 .../gdb/{gdb-cross-canadian_8.0.bb => gdb-cross-canadian_8.0.1.bb}    | 0
 meta/recipes-devtools/gdb/{gdb-cross_8.0.bb => gdb-cross_8.0.1.bb}    | 0
 meta/recipes-devtools/gdb/{gdb_8.0.bb => gdb_8.0.1.bb}                | 0
 4 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/gdb/{gdb-8.0.inc => gdb-8.0.1.inc} (88%)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_8.0.bb => gdb-cross-canadian_8.0.1.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_8.0.bb => gdb-cross_8.0.1.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb_8.0.bb => gdb_8.0.1.bb} (100%)

diff --git a/meta/recipes-devtools/gdb/gdb-8.0.inc b/meta/recipes-devtools/gdb/gdb-8.0.1.inc
similarity index 88%
rename from meta/recipes-devtools/gdb/gdb-8.0.inc
rename to meta/recipes-devtools/gdb/gdb-8.0.1.inc
index fba32ce12c..04a1c809db 100644
--- a/meta/recipes-devtools/gdb/gdb-8.0.inc
+++ b/meta/recipes-devtools/gdb/gdb-8.0.1.inc
@@ -17,6 +17,6 @@ SRC_URI = "http://ftp.gnu.org/gnu/gdb/gdb-${PV}.tar.xz \
            file://0010-resolve-restrict-keyword-conflict.patch \
            file://package_devel_gdb_patches_120-sigprocmask-invalid-call.patch \
 "
-SRC_URI[md5sum] = "c3d35cd949084be53b92cc1e03485f88"
-SRC_URI[sha256sum] = "f6a24ffe4917e67014ef9273eb8b547cb96a13e5ca74895b06d683b391f3f4ee"
+SRC_URI[md5sum] = "48cac527e6f3018b865ece021e9723ac"
+SRC_URI[sha256sum] = "3dbd5f93e36ba2815ad0efab030dcd0c7b211d7b353a40a53f4c02d7d56295e3"
 
diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_8.0.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_8.0.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross-canadian_8.0.bb
rename to meta/recipes-devtools/gdb/gdb-cross-canadian_8.0.1.bb
diff --git a/meta/recipes-devtools/gdb/gdb-cross_8.0.bb b/meta/recipes-devtools/gdb/gdb-cross_8.0.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross_8.0.bb
rename to meta/recipes-devtools/gdb/gdb-cross_8.0.1.bb
diff --git a/meta/recipes-devtools/gdb/gdb_8.0.bb b/meta/recipes-devtools/gdb/gdb_8.0.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb_8.0.bb
rename to meta/recipes-devtools/gdb/gdb_8.0.1.bb
-- 
2.15.1


