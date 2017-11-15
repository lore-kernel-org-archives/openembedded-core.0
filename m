Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id E5BA878519
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 03:43:51 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id v41so31429369qtv.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 19:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=TtcECuIQoMuIXqbzZnzLPBSpofXqoXDlghY+bPzpEag=;
	b=rd4O1fOfaIJMzqeJOMGB6b2UZVIGaBOaqp2roSbiMaUwQKVL88Btm9q8t7cobhroHc
	2xSdiN2KIjsviPda3Ss3k/cj6DcR9YIqlEyG6tkCA1euLSjaGZk0QSQ+3ucrlmVRN9na
	/iV5AIq6nLTi39JvlGO/QpPw6wR5vmWm7r0WwgtBGpjg7PP9iUcH8AXSdrS5dJbMrgDi
	uSnIjNTBI3vgRF2ok7y2yvfllYWYuzPAQF5ZBSZWrGm0F4OnBUne9rOuqwA88HjohvkI
	CnmqxEqhKAn9GxTJ+ykcCtpU9kA2e3vSRjVe4LOkHsGAx1Ej8en75EhxDd5rcQydR+E6
	SAZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=TtcECuIQoMuIXqbzZnzLPBSpofXqoXDlghY+bPzpEag=;
	b=Lq13iQ7Pb2qr1W6Ke2Q7QaYItzmq2hmeTlX3Ef80P7R/lMXuB2zirlt4gUIE7Vau7g
	anc3SSKmlbIs2PzMqPbxOvTbVGAjUKqlG5AbKYc6URwejxnZgIB0Nqh4IM2RgrTK0GyT
	rhGygDVLqjCb4IQQnfH+aZYYTrqZ7yHxhSZ16N5EhuJd5uRYNFWGvpllX/GCQn80Jwwx
	mBtKpAYrFlgs7itMtP2nKaJQZzCh1wWXo/2XzOo2f++yL55LggJE+/8WdIjxlnF2nRYR
	9pL6fB568kSLwTxumxMfcplzu7s/E67i64tKr3dzrbduXtuHa4NN/wPhJlvlhOz4KIWv
	dCtg==
X-Gm-Message-State: AJaThX61p97jLZekGwAJcs+TXBEDmZ2NXWVG12xvNj3j5tGDCSZTAUOo
	oWkoIGQySY5g63cZ7f3Uf++XQw==
X-Google-Smtp-Source: AGs4zMZ1C8kk8SV+PUw6N813W0YJxghIc3fIyz9wW41PLBBSYXRZWSUOC4z2YnYKK39w38M4yBGznQ==
X-Received: by 10.55.146.65 with SMTP id u62mr14645664qkd.358.1510717432492;
	Tue, 14 Nov 2017 19:43:52 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8882:b8c::a4a])
	by smtp.gmail.com with ESMTPSA id
	z75sm13407762qkb.30.2017.11.14.19.43.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Nov 2017 19:43:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Nov 2017 19:43:41 -0800
Message-Id: <20171115034342.42901-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.15.0
Cc: Armin Kuster <akuster@mvista.com>
Subject: [PATCH V2 2/8] binutils: update to 2.29.1
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
X-List-Received-Date: Wed, 15 Nov 2017 03:43:52 -0000

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
Changes in V2: Fix commit message to pass patchwork's test_cve_tag_format

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
2.15.0


