Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9EA617F225
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Oct 2019 09:55:00 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id 5so2611972wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Oct 2019 02:55:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=IGsJbYgwORbDqvgzgv0OeFGQexVf/oimqxivu/7qeec=;
	b=s9BYXRs5p3l7xJuiy+VcMKyTqyleD2OfQksnDq7CssuoV7/NiLujjuql48lvgoB61E
	YJdROzzQ22GX2DEcx10/fl0d6W+jBEKsqTOdTvYI4OZrv3H2mw8YhaPqkYZjsIGg/vxd
	ZJOTVsiWyzXGj3HZIyGg65NYgay2ZoTINBalPeE4JsCGMqfaT79DeV82i35v3Kw9qvXE
	wM5iki3Nm8V4f4ytV38b20h9KcAZ63Gd7KVNk1gMAwWYtDCLFgXURNTPsW2DHgJfbcps
	LnKaps8rEOpVfM/eb7Svq2sO7eRX00i2OJWwMHtBkMQrnXLH2fbSNpn2cBkkI3kLcf+f
	29yw==
X-Gm-Message-State: APjAAAWQ9McizZMAekShnlpfnUPncQ4F/Ux0dR/zjAp0/CtsPFSR9gqc
	E0WEsa2ygFshWEOxxWZDVcGbwziC
X-Google-Smtp-Source: APXvYqxdxo8uh/Ln332j+vOPG0d/k4HiScxPFfn3wg/y+o6/vAA5n5RDdRURqp3YWD9m9QP614+gpw==
X-Received: by 2002:a1c:5fd6:: with SMTP id t205mr2879930wmb.124.1569923701119;
	Tue, 01 Oct 2019 02:55:01 -0700 (PDT)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	g185sm3070875wme.10.2019.10.01.02.55.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 01 Oct 2019 02:55:00 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Oct 2019 10:54:49 +0100
Message-Id: <20191001095452.37335-2-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20191001095452.37335-1-git@andred.net>
References: <20191001095452.37335-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v3 1/4] ruby: drop long-merged CVE patches
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
X-List-Received-Date: Tue, 01 Oct 2019 09:55:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

The CVE patches here address the original problem in
a different way to how upstream solved it, and are
superfluous.

Ruby updated to Onigmo v6.1.3+669ac999761 before its
v2.5.0 release, and both CVEs were fixed before Onigmo
v6.1.3:
    https://github.com/k-takata/Onigmo/releases/tag/Onigmo-6.1.3
    https://github.com/k-takata/Onigmo/commits/Onigmo-6.1.3
        https://github.com/k-takata/Onigmo/commit/40945546578004bf40e6f884834bcad4054c70f7
        https://github.com/k-takata/Onigmo/commit/783b7ef491e1422e4be7407ccc3e4305e5013507

Because the issues were fixed differently here and
in Ruby (Onigmo), patch never complained about
duplicatation during recipe updates.

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 .../ruby/ruby/ruby-CVE-2017-9226.patch        | 32 -----------------
 .../ruby/ruby/ruby-CVE-2017-9228.patch        | 34 -------------------
 meta/recipes-devtools/ruby/ruby_2.5.5.bb      |  2 --
 3 files changed, 68 deletions(-)
 delete mode 100644 meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-9226.patch
 delete mode 100644 meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-9228.patch

diff --git a/meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-9226.patch b/meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-9226.patch
deleted file mode 100644
index 89437bba74..0000000000
--- a/meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-9226.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From b4bf968ad52afe14e60a2dc8a95d3555c543353a Mon Sep 17 00:00:00 2001
-From: "K.Kosako" <kosako@sofnec.co.jp>
-Date: Thu, 18 May 2017 17:05:27 +0900
-Subject: [PATCH] fix #55 : check too big code point value for single byte
- value in next_state_val()
-
----
- regparse.c |    3 +++
- 1 file changed, 3 insertions(+)
-
---- end of original header
-
-CVE: CVE-2017-9226
-
-Add check for octal number bigger than 255.
-
-Upstream-Status: Pending
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
-
-
---- ruby-2.4.1.orig/regparse.c
-+++ ruby-2.4.1/regparse.c
-@@ -4450,6 +4450,9 @@ next_state_val(CClassNode* cc, CClassNod
-   switch (*state) {
-   case CCS_VALUE:
-     if (*type == CCV_SB) {
-+      if (*from > 0xff)
-+          return ONIGERR_INVALID_CODE_POINT_VALUE;
-+
-       BITSET_SET_BIT_CHKDUP(cc->bs, (int )(*from));
-       if (IS_NOT_NULL(asc_cc))
- 	BITSET_SET_BIT(asc_cc->bs, (int )(*from));
diff --git a/meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-9228.patch b/meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-9228.patch
deleted file mode 100644
index d8bfba486c..0000000000
--- a/meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-9228.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 3b63d12038c8d8fc278e81c942fa9bec7c704c8b Mon Sep 17 00:00:00 2001
-From: "K.Kosako" <kosako@sofnec.co.jp>
-Date: Wed, 24 May 2017 13:43:25 +0900
-Subject: [PATCH] fix #60 : invalid state(CCS_VALUE) in parse_char_class()
-
----
- regparse.c |    4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
---- end of original header
-
-CVE: CVE-2017-9228
-
-Upstream-Status: Inappropriate [not author]
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
-
-diff --git a/regparse.c b/regparse.c
-index 69875fa..1988747 100644
---- a/regparse.c
-+++ b/regparse.c
-@@ -4081,7 +4081,9 @@ next_state_class(CClassNode* cc, OnigCodePoint* vs, enum CCVALTYPE* type,
-     }
-   }
- 
--  *state = CCS_VALUE;
-+  if (*state != CCS_START)
-+    *state = CCS_VALUE;
-+
-   *type  = CCV_CLASS;
-   return 0;
- }
--- 
-1.7.9.5
-
diff --git a/meta/recipes-devtools/ruby/ruby_2.5.5.bb b/meta/recipes-devtools/ruby/ruby_2.5.5.bb
index 8ad59a7657..4082b02f14 100644
--- a/meta/recipes-devtools/ruby/ruby_2.5.5.bb
+++ b/meta/recipes-devtools/ruby/ruby_2.5.5.bb
@@ -1,8 +1,6 @@
 require ruby.inc
 
 SRC_URI += " \
-           file://ruby-CVE-2017-9226.patch \
-           file://ruby-CVE-2017-9228.patch \
            file://run-ptest \
            "
 
-- 
2.23.0.rc1


