Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0789E719C8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Oct 2017 00:50:57 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id g65so15606923pfe.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Oct 2017 17:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=97CUiX6dyWEwJCP5feQTZMZ6UVEceGS7I0i+Pioj+JM=;
	b=CDgTHqvLnI5BBSTIriMJTE1ATzrGG+8Tj3aiPK+IWJv3eegRVSp2+uy90WbXUY0f45
	uLIyET85kSmarAm90fIqZBTKJ4uPULqQKdVfO2ByYFgj9d0rTUXhPlS+c5+Ox0w8+jrw
	eVvOLI1gaDF6RNWoQkt4LNLkVN6+RJ3hDcSxPkZdovdTnfCyakqJidL6aBizHJcy5AZn
	FLbHocq9f8+j1nYUGvd/zagPXLtbJ3U7ARHNno3a5zzUYl8FsKNgm8FJkvu9ZWQsxNuZ
	vDqXgB81EhKh+ilmLLtfJiRteZWdKpi0/WC4GckwjgOO+AUrP4j/Z7PdXjPSevD8NgBj
	Tw7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=97CUiX6dyWEwJCP5feQTZMZ6UVEceGS7I0i+Pioj+JM=;
	b=r1tc/RBlhPlqGjKJLKRdf89eCo8dPuRJMPmdcl4FBTegFZ2/RL05IYe+zgAW51DNGq
	io0YD2klI9hB8VlalVsuNOxhteA9a7mV3D3dnYmfIXD4/AahXmoK7z2ukEQ+iD8NZoKW
	62nr+A/G4Qwna/FBVBllmLsySLY3YfBgpBuxEdh8ZQLagP1/iid9yF+n/UVemE1jA2qm
	OTUNvk4Xn9O5zW0SaS4w3DayP24y2cAkEIu8PG0Bt8NnNcAy4Uq3qHD8MkgIxQ0dAr4N
	cpMqhHeOnp17cOfBmCKSbsaBWFK7s7srIhAGBOFGwx3skbU1R/GR7Rh8Z9W3ev0A61Ss
	+y+g==
X-Gm-Message-State: AMCzsaVjJppuvJLLxcs9AGXJH60AIJ+GZ4i9IGcGIViVOQ7zCiKVfEhW
	TyoT3MpDB/aHPlUv+8kROT3X9A==
X-Google-Smtp-Source: AOwi7QCOcTbaj7oWBtIiZ6HFplQQEAkB0mROTAGnwak2LDNB5g0rbC+BdHY4zHJEInWj9bJF5YBQkQ==
X-Received: by 10.84.217.210 with SMTP id d18mr412971plj.157.1507251059088;
	Thu, 05 Oct 2017 17:50:59 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::1f76])
	by smtp.gmail.com with ESMTPSA id o128sm259308pga.5.2017.10.05.17.50.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Oct 2017 17:50:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Oct 2017 17:50:42 -0700
Message-Id: <794e2c27270d2d908672bf4f6bab747e3ff47fd2.1507250774.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <cover.1507250774.git.raj.khem@gmail.com>
References: <cover.1507250774.git.raj.khem@gmail.com>
Subject: [PATCH 03/10] siteinfo: Define data for riscv32 and riscv64
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
X-List-Received-Date: Fri, 06 Oct 2017 00:50:58 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/siteinfo.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclass
index 1aada40695..29cd2aa82b 100644
--- a/meta/classes/siteinfo.bbclass
+++ b/meta/classes/siteinfo.bbclass
@@ -47,6 +47,8 @@ def siteinfo_data(d):
         "ppc": "endian-big bit-32 powerpc-common",
         "ppc64": "endian-big bit-64 powerpc-common",
         "ppc64le" : "endian-little bit-64 powerpc-common",
+        "riscv32": "endian-little bit-32 riscv-common",
+        "riscv64": "endian-little bit-64 riscv-common",
         "sh3": "endian-little bit-32 sh-common",
         "sh4": "endian-little bit-32 sh-common",
         "sparc": "endian-big bit-32",
@@ -95,6 +97,10 @@ def siteinfo_data(d):
         "powerpc64-linux-muslspe": "powerpc-linux powerpc64-linux",
         "powerpc64-linux": "powerpc-linux",
         "powerpc64-linux-musl": "powerpc-linux",
+        "riscv32-linux": "riscv32-linux",
+        "riscv32-linux-musl": "riscv32-linux",
+        "riscv64-linux": "riscv64-linux",
+        "riscv64-linux-musl": "riscv64-linux",
         "x86_64-cygwin": "bit-64",
         "x86_64-darwin": "bit-64",
         "x86_64-darwin9": "bit-64",
-- 
2.14.2


