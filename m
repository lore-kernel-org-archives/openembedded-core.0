Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6BBE478513
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 03:09:33 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id v41so31300989qtv.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 19:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=sZgx9F4izPDHOtTZe9K9LbQdsnlwJV3FmhNcVlppKE0=;
	b=CdWQXTVrvk7l2sr6SDiTI6K07p+VMSPHXxNrdVHR2fbZ4Tg1GZSKTxuUUO0lpmrGYg
	rGUv287enY3/DjV8EVj4pN+z6mdHtLWV0eilr9FIjXB0FYuEwfsQxxfeEjwpAHuPSAWQ
	uLqGvDMtd6aZlR+n4k5JYnCEl/T+K2adYLzDSSvTEZUplXxTKkDwsrF1KGsEH+JWC+pI
	zZ9SaPlctaDIoePVDlQxLq4reXHOSmH8kyykiVY7Hfde59q+F+1wnugWG3fb8zkNMWGu
	/Ji7wvMxgubravQfiNGokhgeBW+fnD+FiRZwQ22OXwOIP7PLg3ejMUfV1IGlDaYyA0eS
	4B4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=sZgx9F4izPDHOtTZe9K9LbQdsnlwJV3FmhNcVlppKE0=;
	b=SQG+DYvS1IUUT9D3BUqqpgaC9/MvIyhzF2GxI9mOf28TaPJd0PEDFeG9n/kq6J7p6m
	VCoyPp5T4ZnI6jDT4dylb4NRBeMFTVXgoKXp2sYeFj3tmHPGX3ne/u3+MSpAuY9dM+CK
	t6x4iHeLprN3A30oYSa8G0SA9cLXvhMUQxIPN4SxG38FqjsZ58nb+gscD1NomPnRc8KS
	m/qga+8MLIoJ/AvYOSwYFW7VC/+abOhSZYQda7mSFvf/zkPpgQKu023tjDmpcp5G/5fK
	Wm5H74izPj9yJztChpcFlzfoZf/y0obk1N9imhnEslL+PD/E3pEDQTRuPh5P5TPAJF/D
	PcOA==
X-Gm-Message-State: AJaThX69RK40giNAuGL87OSKLsocbWW+OmwzFXBHuvKMhNOX4aR+b9vQ
	CD2BQ5McUJER2pXm0Bk++D/4dQ==
X-Google-Smtp-Source: AGs4zMa2yByQcI0ujz/nu2mySU8j8b1+4DoqMmWpfmK02cCjpYUs55H+gpWMbTRS3iaWMQsf3DweoQ==
X-Received: by 10.55.204.131 with SMTP id n3mr22037105qkl.234.1510715374446;
	Tue, 14 Nov 2017 19:09:34 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8882:b8c::a4a])
	by smtp.gmail.com with ESMTPSA id
	r21sm7319968qkh.89.2017.11.14.19.09.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Nov 2017 19:09:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Nov 2017 19:09:15 -0800
Message-Id: <bbb2b97f66c8c7ab5f32ea229d81e1d81e980d3b.1510715185.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <cover.1510715185.git.raj.khem@gmail.com>
References: <cover.1510715185.git.raj.khem@gmail.com>
Subject: [PATCH 4/8] gdb: Upgrade to 8.0.1
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
X-List-Received-Date: Wed, 15 Nov 2017 03:09:33 -0000

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
2.15.0


