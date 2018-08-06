Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f45.google.com (mail-pl0-f45.google.com
	[209.85.160.45])
	by mail.openembedded.org (Postfix) with ESMTP id C1A8A78BFA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Aug 2018 22:57:44 +0000 (UTC)
Received: by mail-pl0-f45.google.com with SMTP id w19-v6so4587471ply.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Aug 2018 15:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1FwelgiQS6+aCDDdMzoi3yrzRNE7f6u+y8MwpDcvHE4=;
	b=foMO0IJ0CYKEEwMS4au+/jgbLWHSRfPnCxUt+zaAYPtLdoGwCvjfwdkxegQnBIBeik
	/JGdmWE3YpFNl2oIJjJw74eli+SPoU7p82Y7mfh6jlPfq4OXtnFO8mWJ3mwnP1RHZFMn
	d+54uG1rkgz1pjc+BZ73/Vyq6UPJhiWX7+X9tCnmZuWISHjfmnMB7YyeM0xUqGjbIyXh
	bzx4sif73JFyMY3jN8dyeXa1dQW+o3C4x2ewF/Prg0t4VyE79zWVtwoPTdHAeDvg9fW5
	hS2eXUvBYTIzfPtEww/BHlyrwyGJDf0c05SK5Mv8DGCgpNwhzFzOO3/9uAs5qDo+Ol0Q
	mfWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=1FwelgiQS6+aCDDdMzoi3yrzRNE7f6u+y8MwpDcvHE4=;
	b=m9RKwQKCY2+lWdSJ57bxwZDgamlEaeArYFk0wfSIu2OV2jMW77x1XAnyQKKZ464k7C
	EM8jhLfzWdfeoDdinjnfCsmM+pAPoqf1zgGoxa0R9wvJPWExY6/6Kwd85OHc6KvHPa2C
	qUJ5THf4A4ZvJpzWCdvOzOLYGd3u06yRjkvDu5wPbwPtaZR4IXAuzFzs2r8ADrV1LYbl
	gFX8V5/zufT5bsZxSLTr7w8vOITa5Kxvdc8AzajvOi7QndN1MuwmV7aX5CX4i6/VRIz9
	hlmWzqWrJjLUJIjcq4oqerhTDAnJ0iQ7jbVRQWsAiWJEVorjol60dDu96SZKrHtQz22f
	nV9w==
X-Gm-Message-State: AOUpUlEtzbb6oDbliNOnvh0aHH5GTWzaPQrIj5l0k6ZIBdkyW6XkqXWP
	5mLyrIM/r10p9WLhwNKnZ6IHuLX2
X-Google-Smtp-Source: AAOMgpd4UUuepBxSTWcCTop0Is3WFlCIaocSwggOSgmHv08+GUuBE9JmsCKj75KJ7N/nE6whgrIrRQ==
X-Received: by 2002:a17:902:8d91:: with SMTP id
	v17-v6mr15748805plo.9.1533596265551; 
	Mon, 06 Aug 2018 15:57:45 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::1d00])
	by smtp.gmail.com with ESMTPSA id
	x1-v6sm11993137pgr.59.2018.08.06.15.57.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Aug 2018 15:57:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Aug 2018 15:57:14 -0700
Message-Id: <8c076c9eca8acdb757248576ffd0434a97048b17.1533595822.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1533595822.git.raj.khem@gmail.com>
References: <cover.1533595822.git.raj.khem@gmail.com>
Subject: [PATCH 17/18] ppp, libpam: Add missing dep on virtual/crypt
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
X-List-Received-Date: Mon, 06 Aug 2018 22:57:45 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-connectivity/ppp/ppp_2.4.7.bb | 2 +-
 meta/recipes-extended/pam/libpam_1.3.0.bb  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.7.bb b/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
index f4646bd693..644cde4562 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
@@ -4,7 +4,7 @@ the Point-to-Point Protocol (PPP) on Linux and Solaris systems."
 SECTION = "console/network"
 HOMEPAGE = "http://samba.org/ppp/"
 BUGTRACKER = "http://ppp.samba.org/cgi-bin/ppp-bugs"
-DEPENDS = "libpcap openssl"
+DEPENDS = "libpcap openssl virtual/crypt"
 LICENSE = "BSD & GPLv2+ & LGPLv2+ & PD"
 LIC_FILES_CHKSUM = "file://pppd/ccp.c;beginline=1;endline=29;md5=e2c43fe6e81ff77d87dc9c290a424dea \
                     file://pppd/plugins/passprompt.c;beginline=1;endline=10;md5=3bcbcdbf0e369c9a3e0b8c8275b065d8 \
diff --git a/meta/recipes-extended/pam/libpam_1.3.0.bb b/meta/recipes-extended/pam/libpam_1.3.0.bb
index 92ab72a42f..3aec2cdb4c 100644
--- a/meta/recipes-extended/pam/libpam_1.3.0.bb
+++ b/meta/recipes-extended/pam/libpam_1.3.0.bb
@@ -32,7 +32,7 @@ SRC_URI_append_libc-musl = " file://0001-Add-support-for-defining-missing-funcit
                              file://include_paths_header.patch \
                            "
 
-DEPENDS = "bison-native flex flex-native cracklib libxml2-native"
+DEPENDS = "bison-native flex flex-native cracklib libxml2-native virtual/crypt"
 
 EXTRA_OECONF = "--with-db-uniquename=_pam \
                 --includedir=${includedir}/security \
-- 
2.18.0


