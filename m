Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id F108C78882
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 17:23:23 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id o2so13851908pgc.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 09:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=GIrf01GXBNeBTYc4uAgfFmzi9sgcyuGV5hTl7MOxUeg=;
	b=X9vLJctUu7PQzgidGe5496PodF/x6fDSog3NyjQyn+mahybZNEkf5FxMME0r/g4GcC
	AuCOgZdLlJhXRr28OWkhCsH6fiD59GbjUq/vzePLbI5Yt+I6uB3hLALti60cYgTSBzZ3
	zJEUqPFDWzEfVf+tlXaigfRvTnvcz5VPTiQbatRl2i4wSJFSCFJSzf9hO+dDVH3UCYG4
	vWSOcrxNiLwfbOuaroWlXabBKe0npuVZfe9zh+F2xlTb+SgwpYouLfQSPy4yTrkEsfCw
	AqG0uJkjxO16OZz9PGfoR+XdV47FWKSBzgPt7A6ZRJK82SG3WIdbUuOdllHSspEfXrMz
	LuOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=GIrf01GXBNeBTYc4uAgfFmzi9sgcyuGV5hTl7MOxUeg=;
	b=aGYvDQ2m834INiAukE7xrs0xKJLks+YUH+5vBJtQHt/oaup90UrEKRvAOJhxL1/VUS
	fXoMu+8a/WZQuuQ/CNrFnIzcjVaMPl0Z0XCauZNCll7UWNWKhHlAYEgxXF/Y+RwldKrM
	hMO6V6oCJjoOqEe3cCDTKXQzi2qqcp17n6znRJ+4jaDGp9UqyKBtHdUpASXUNEe+q65t
	zRwsC25Dfv6fKyfd/o3s5i/H+OPOObcusdZ/itvQo64l8Sf70hQ9MFKPETPBXwpoD0C7
	ASWdZF2xOi1WwK8AOM0ktxJpHJtU7C377UnVbo/a6qGVuUJ4E1P1groIpeoTqeSwOA+r
	AntA==
X-Gm-Message-State: AKGB3mLUg3eKNRSV0nFUGmdgVo7b2Lsvb1xZbY9l7aLeItAXDB+3nGQP
	kiQfwZGKzuMOUhpbVGS+idBjCA==
X-Google-Smtp-Source: ACJfBovoJFS7s92KsLqbb8o4KRt0IsSdZ+CCjVfUq7cORUUj9FWvQcOryLsJ2wZ2AAHEpLeYq//bxg==
X-Received: by 10.84.129.197 with SMTP id b63mr2956526plb.278.1513099405053;
	Tue, 12 Dec 2017 09:23:25 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c::c579])
	by smtp.gmail.com with ESMTPSA id
	k197sm18790329pga.42.2017.12.12.09.23.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Dec 2017 09:23:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Dec 2017 09:23:09 -0800
Message-Id: <20171212172317.601-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.15.1
Cc: Armin Kuster <akuster@mvista.com>
Subject: [PATCH 1/9] binutils: update to 2.29.1
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
X-List-Received-Date: Tue, 12 Dec 2017 17:23:24 -0000

From: Armin Kuster <akuster@mvista.com>

update to 2.29.1 to fix the following missing CVEs:

CVE-2017-15939, CVE-2017-15938, CVE-2017-15225, CVE-2017-15025,
CVE-2017-15024, CVE-2017-15023, CVE-2017-15022, CVE-2017-15021,
CVE-2017-15020, CVE-2017-14974, CVE-2017-14940, CVE-2017-14939,
CVE-2017-14938, CVE-2017-14934, CVE-2017-14933, CVE-2017-14932,
CVE-2017-14930, CVE-2017-14745, CVE-2017-14729, CVE-2017-14529,
CVE-2017-14333, CVE-2017-14130, CVE-2017-14129, CVE-2017-14128,
CVE-2017-13757, CVE-2017-13716, CVE-2017-13710, CVE-2017-12967,
CVE-2017-12799, CVE-2017-12459, CVE-2017-12458, CVE-2017-12457,
CVE-2017-12456, CVE-2017-12455, CVE-2017-12454, CVE-2017-12453,
CVE-2017-12452, CVE-2017-12451, CVE-2017-12450, CVE-2017-12449,
CVE-2017-12448

see Changelogs for additional information

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../binutils/{binutils-2.29.inc => binutils-2.29.1.inc}                 | 2 +-
 ...inutils-cross-canadian_2.29.bb => binutils-cross-canadian_2.29.1.bb} | 0
 .../binutils/{binutils-cross_2.29.bb => binutils-cross_2.29.1.bb}       | 0
 .../binutils/{binutils-crosssdk_2.29.bb => binutils-crosssdk_2.29.1.bb} | 0
 meta/recipes-devtools/binutils/{binutils_2.29.bb => binutils_2.29.1.bb} | 0
 5 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/binutils/{binutils-2.29.inc => binutils-2.29.1.inc} (97%)
 rename meta/recipes-devtools/binutils/{binutils-cross-canadian_2.29.bb => binutils-cross-canadian_2.29.1.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-cross_2.29.bb => binutils-cross_2.29.1.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-crosssdk_2.29.bb => binutils-crosssdk_2.29.1.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils_2.29.bb => binutils_2.29.1.bb} (100%)

diff --git a/meta/recipes-devtools/binutils/binutils-2.29.inc b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
similarity index 97%
rename from meta/recipes-devtools/binutils/binutils-2.29.inc
rename to meta/recipes-devtools/binutils/binutils-2.29.1.inc
index 27d46eb088..d92bbbce5d 100644
--- a/meta/recipes-devtools/binutils/binutils-2.29.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
@@ -18,7 +18,7 @@ BINUPV = "${@binutils_branch_version(d)}"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
-SRCREV = "37e991bb143ca2106330bcdc625590d53838b7a1"
+SRCREV = "90276f15379d380761fc499da2ba24cfb3c12a94"
 SRC_URI = "\
      git://sourceware.org/git/binutils-gdb.git;branch=binutils-${BINUPV}-branch;protocol=git \
      file://0003-configure-widen-the-regexp-for-SH-architectures.patch \
diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian_2.29.bb b/meta/recipes-devtools/binutils/binutils-cross-canadian_2.29.1.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-cross-canadian_2.29.bb
rename to meta/recipes-devtools/binutils/binutils-cross-canadian_2.29.1.bb
diff --git a/meta/recipes-devtools/binutils/binutils-cross_2.29.bb b/meta/recipes-devtools/binutils/binutils-cross_2.29.1.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-cross_2.29.bb
rename to meta/recipes-devtools/binutils/binutils-cross_2.29.1.bb
diff --git a/meta/recipes-devtools/binutils/binutils-crosssdk_2.29.bb b/meta/recipes-devtools/binutils/binutils-crosssdk_2.29.1.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-crosssdk_2.29.bb
rename to meta/recipes-devtools/binutils/binutils-crosssdk_2.29.1.bb
diff --git a/meta/recipes-devtools/binutils/binutils_2.29.bb b/meta/recipes-devtools/binutils/binutils_2.29.1.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils_2.29.bb
rename to meta/recipes-devtools/binutils/binutils_2.29.1.bb
-- 
2.15.1


