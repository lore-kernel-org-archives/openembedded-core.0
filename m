Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6A83D78516
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 03:09:29 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id 1so31342949qtn.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 19:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KdaDL+A6ItnhQvHyT1qncnT4vEUjYYW6qVTfJUtH9OU=;
	b=tjLeD1Rkkiuu7yVi9O6dB5GR4LuSKbatjGV8WR8W06W2qPoW4dN0iANmP7mQbkuila
	IKd1q5I0jVeZU74uojnzdeHDcRyxGXcvQnRf7I5JFChgZa9EmV6fL+qvsO9RAmaUR+sk
	WE6PQId3RbeCmWheaumzPGekBUzX+FFQ5w+TC+Fn/EfIrvve/b7+oclvijZDpfA5Q9Fh
	t83k8mrLFUdBk8MpoWNoTlalYlTUW1IXwFLM+YFaC4PsfxhOujJKBFhK9TtmSOrkOcdI
	XNgPkqoFv8JHf8RS2OCQ58pPq7iVVDMXr7Y5wNFrw1Gl78Pz82MyxozsJcWgcWqMlPvE
	4qMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=KdaDL+A6ItnhQvHyT1qncnT4vEUjYYW6qVTfJUtH9OU=;
	b=AX2P1vf5XJ2R2z939XBxgu/0eRt9jPpRuz+/XMHin5xsQZHQljb1iVFmAwdIWldiIH
	4YVY5zPUK48c9utdkg3mDmG7zS+7laPmDqTtL/UPCU0CDno6SKP4WQWCKJjrpm2qzP/p
	2ZjridPpGqJeogAjVhl5v3IhNDdgeIUWZlUYl05+qRK+atgnjd+9NmBwhQsaMGQsHCaP
	KxtI0Pcv/1hHHbvH8PTsTD/6zNlVvyQzbrTV68I6nQ1HSHgJSiwdbTJFxyaQvwqd3mFj
	zb5/WsE6Ufr5Dznf14VEKC556bdWw+71+o/kBaqSzDMQcgWjB2oBw2YfzLfmDl7uUJAJ
	a0WA==
X-Gm-Message-State: AJaThX4x/BMfCL/AZpvljO48nUc+szW8lwMcpEWJJ8o01Nqo8SNg30E4
	XxqAnCdy5KXP/Ge0PqWA8ZaEtw==
X-Google-Smtp-Source: AGs4zMYEgD/1a74YYqaVKSNiD7lBykVNo21u/ThqqpZkV0fsmKoZu3DWH8M48Trk/jUOSTSwanxkGw==
X-Received: by 10.200.22.39 with SMTP id p36mr24060144qtj.336.1510715370269;
	Tue, 14 Nov 2017 19:09:30 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8882:b8c::a4a])
	by smtp.gmail.com with ESMTPSA id
	r21sm7319968qkh.89.2017.11.14.19.09.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Nov 2017 19:09:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Nov 2017 19:09:13 -0800
Message-Id: <d1ec100e5d4db7f68b896564a0362be9ba8f6f55.1510715185.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <cover.1510715185.git.raj.khem@gmail.com>
References: <cover.1510715185.git.raj.khem@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: [PATCH 2/8] binutils: update to 2.29.1
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
X-List-Received-Date: Wed, 15 Nov 2017 03:09:29 -0000

From: Armin Kuster <akuster@mvista.com>

update to 2.29.1 to fix the following missing CVE's

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
2.15.0


