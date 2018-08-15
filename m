Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f51.google.com (mail-pl0-f51.google.com
	[209.85.160.51])
	by mail.openembedded.org (Postfix) with ESMTP id CA419744E4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 21:51:58 +0000 (UTC)
Received: by mail-pl0-f51.google.com with SMTP id s17-v6so1033342plp.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 14:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7/b9Ivo5w242+86kjQERifRi0KL3BHQ0n9dvYn6Q77I=;
	b=YELq/VXPINFtrszGt3PWOP2P9wdrpp6kcgjQVeCw4z0YFBMZEv8zBlwNjy+S5mIJ83
	nI4Aft8vZtH3vDBCF0ZXdVr42rUAIgPXKIloBBlKuep7p7R5a1PYtFQbRHAYK/Xe+4av
	n322/115E2fHbhKccILiMsy+HeOcbWbEmETBnBqGgjnzBWl8Irgyw32x51IeybJy5/ha
	qd/h3L7gWyLKP/OUpQfSzsKeg/ma0BTPWHToj76ilQEeCg+JVtMdlZTzv+Hea+wQfoNx
	ZNBFR8x4EOSAccbLNWMk4/vnzf9tnLgpB9g1Ac8Bjvs/G9SAHUCLHQsh7Z/GAxIvqEB7
	KkJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7/b9Ivo5w242+86kjQERifRi0KL3BHQ0n9dvYn6Q77I=;
	b=qRXZKkisV4Os5/P/gwlh11Tft0xuNXqkQlToM/tFDOUeFUsxIZV/6nqjXxUVWYTaGw
	CuXvq13lg3udN0WLdPUN1zSs3Fucjo9NnvI31U1VFMwy+nXZSTFZP2GPwrj0vFV7l1Cc
	y1wKqSvdnhDAIoLTBt+ruKUQDUkLSkqgXsQWigwmjrfs/YsgEse6TVABw6yda1dCo6ML
	P5us2dWUY64cruo5HBDSu0fxqwlrT13pPhZBdRy7BcFJcvxCwSxRDpJd0gOGDViRIkcW
	P98fX0GOW4/oukfyNB+5rMFydQWm60j4u2eTqtHhh926hWQnMmYGNzaA6TljbTxHkqFu
	BEtA==
X-Gm-Message-State: AOUpUlEOIC7H5qL7HGP2NZR/ydeYF9t/zpkGB4DEoXI0/MejBKo8/CO3
	7QZFdfqPJu6zYI9yrk6t54wPjs5O
X-Google-Smtp-Source: AA+uWPzIOt/4cV6U7RJ/yoEYY9piPGHKH8AER8cTZS9PrmN13tF0+vRBmxGGSjKkIjYX+kLnqghM4A==
X-Received: by 2002:a17:902:18a:: with SMTP id
	b10-v6mr26357233plb.62.1534369919548; 
	Wed, 15 Aug 2018 14:51:59 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::f217])
	by smtp.gmail.com with ESMTPSA id
	m26-v6sm60076032pfi.102.2018.08.15.14.51.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Aug 2018 14:51:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Aug 2018 14:51:50 -0700
Message-Id: <20180815215150.13271-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180815215150.13271-1-raj.khem@gmail.com>
References: <20180815215150.13271-1-raj.khem@gmail.com>
Subject: [PATCH 3/3] re2c: Update to 1.0.1
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
X-List-Received-Date: Wed, 15 Aug 2018 21:51:58 -0000

Drop upstreamed patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/re2c/re2c/mkdir.patch    | 36 -------------------
 .../re2c/{re2c_0.16.bb => re2c_1.0.1.bb}      |  7 ++--
 2 files changed, 3 insertions(+), 40 deletions(-)
 delete mode 100644 meta/recipes-support/re2c/re2c/mkdir.patch
 rename meta/recipes-support/re2c/{re2c_0.16.bb => re2c_1.0.1.bb} (58%)

diff --git a/meta/recipes-support/re2c/re2c/mkdir.patch b/meta/recipes-support/re2c/re2c/mkdir.patch
deleted file mode 100644
index d59f01b36c..0000000000
--- a/meta/recipes-support/re2c/re2c/mkdir.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Upstream-Status: Submitted (https://github.com/skvadrik/re2c/pull/191)
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From bccc10c60523f88c8f81413151cdcd612eb16198 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Mon, 31 Jul 2017 15:43:41 +0100
-Subject: [PATCH] Makefile.am: create target directory before writing into it
-
-In some situations src/parse/ may not exist before a file is copied into the
-directory. Ensure that this doesn't happen by creating the directory first.
----
- re2c/Makefile.am | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/re2c/Makefile.am b/re2c/Makefile.am
-index 3b3b2c5e..0707fc5a 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -187,6 +187,7 @@ CLEANFILES = \
- 	$(DOC)
- 
- $(AUTOGEN_PARSER): $(CUSTOM_PARSER)
-+	$(AM_V_at)$(MKDIR_P) $(dir $@)
- 	$(AM_V_GEN) if test $(BISON) = "no"; \
- 	then \
- 		cp $(top_srcdir)/$(BOOTSTRAP_PARSER) $@ && \
-@@ -211,6 +212,7 @@ $(BOOTSTRAP_PARSER): $(CUSTOM_PARSER)
- 		$(top_srcdir)/$(CUSTOM_PARSER);
- 
- .re.cc:
-+	$(AM_V_at)$(MKDIR_P) $(dir $@)
- 	$(AM_V_GEN) if test -x $(RE2C); \
- 	then \
- 		$(top_builddir)/$(RE2C) $(RE2CFLAGS) -o $@ $< && \
--- 
-2.11.0
diff --git a/meta/recipes-support/re2c/re2c_0.16.bb b/meta/recipes-support/re2c/re2c_1.0.1.bb
similarity index 58%
rename from meta/recipes-support/re2c/re2c_0.16.bb
rename to meta/recipes-support/re2c/re2c_1.0.1.bb
index 50dd7b7d26..4ed8d257ac 100644
--- a/meta/recipes-support/re2c/re2c_0.16.bb
+++ b/meta/recipes-support/re2c/re2c_1.0.1.bb
@@ -5,10 +5,9 @@ SECTION = "devel"
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://README;beginline=146;md5=881056c9add17f8019ccd8c382ba963a"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
-           file://mkdir.patch"
-SRC_URI[md5sum] = "3bf508fabd52ed7334647d0ccb956e8d"
-SRC_URI[sha256sum] = "48c12564297641cceb5ff05aead57f28118db6277f31e2262437feba89069e84"
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
+SRC_URI[md5sum] = "e2c6cf52fc6a21595f21bc82db5324f8"
+SRC_URI[sha256sum] = "605058d18a00e01bfc32aebf83af35ed5b13180b4e9f279c90843afab2c66c7c"
 
 BBCLASSEXTEND = "native"
 
-- 
2.18.0


