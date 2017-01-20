Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com
	[209.85.214.48])
	by mail.openembedded.org (Postfix) with ESMTP id 1CA68771DE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 13:38:55 +0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id c7so20061538itd.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 05:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=gRIdKrs7459Hqo6RdBi2tazwD/WZKGh9ePQ6Ggp/+MQ=;
	b=DFx3Rp/ZsHPDsW8KiZ3OKOr5fBBIU+kJsBGlmjVaGBC1XOMZsHW0/ZVa6OlAXGIL7L
	aG/iWBF8vf4uWbDQ4iDaPyw1NUqlUX7XsePs3Qb8EwKDOORmBoAfgOWuvDZ+zSVQIqsG
	uGf2/9/j4i/dTJnZYf7tB061jFwNcmXgjTs0oxJhqBjeK2a7G4Gk0WfklPJJ7Lh9z+Au
	3fS8/cHieNH7kkZyXdFm0qFFSfojVhUTEVIiocbPWVxK2GSgadf6XFKRUbdNRIqnjD4q
	CgbaLPW/XEK04mQi9kVR1mvYW+0Z/qCkpH/ZJZS78VdCGycjTxBd+TV/mBHZGlGVGj80
	7TYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=gRIdKrs7459Hqo6RdBi2tazwD/WZKGh9ePQ6Ggp/+MQ=;
	b=YJ/JwUcB3o8+x6iav3CwiHqbQ25/6IeOcv84SnsJRBFO8DIojQ+Mk6dG/Iu24ZCnlE
	s/Foon3kSOPUZwhnx6mdeHH1JqSG4/VpbTwqwF1ryR/FexI8t/X9xu7rgbA/A7rfD+1k
	g9xSs0BSQU0UtnLp+bI4bKxaQSrHXbyjcrfjUrBTDliVhPb9vwPYrfxyIhLG3X2NxqXW
	p90f1HHmjmVodAoOx7LMLf2v3HaurX08D1aPl+hwvDxVB2F2VhgEMnPOxZBbDrLqPScd
	04sPPwns692AVU6BtYnmcGDy/W4/2V9lZziNam8V4IBqJ5NR3dmE/1zRunFcuICgqyZv
	IwCQ==
X-Gm-Message-State: AIkVDXJKSulE1HgSEhSailHlMlCrvMF2m2gbgQ+Z3PC3WfFaJjHXdFY05PmQtKWAzWs+lQDO
X-Received: by 10.107.138.19 with SMTP id m19mr12412740iod.65.1484919535583;
	Fri, 20 Jan 2017 05:38:55 -0800 (PST)
Received: from pohly-desktop.fritz.box (p57A56DD5.dip0.t-ipconnect.de.
	[87.165.109.213])
	by smtp.gmail.com with ESMTPSA id e24sm1362361itd.6.2017.01.20.05.38.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 20 Jan 2017 05:38:54 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 14:38:09 +0100
Message-Id: <58fd39ded282149e2782e8d60773f11e546c0a82.1484919259.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.c4c1bf3452da11cfcc8b08c59ba9a17e2035b400.1484919259.git-series.patrick.ohly@intel.com>
References: <cover.c4c1bf3452da11cfcc8b08c59ba9a17e2035b400.1484919259.git-series.patrick.ohly@intel.com>
In-Reply-To: <cover.c4c1bf3452da11cfcc8b08c59ba9a17e2035b400.1484919259.git-series.patrick.ohly@intel.com>
References: <cover.c4c1bf3452da11cfcc8b08c59ba9a17e2035b400.1484919259.git-series.patrick.ohly@intel.com>
Subject: [PATCH v3 12/12] acpica: work around flex 2.6.2 code generation issue
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
X-List-Received-Date: Fri, 20 Jan 2017 13:38:57 -0000

Without this patch, linking fails with a missing implementation of
yy_scan_string. This looks like a regression in flex, because 2.6.0 generated
different code that called PrParser_scan_string
resp. DtParser_scan_string.

Working around that in acpica until this is better understood or fixed
in flex is the easiest solution for now.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/recipes-extended/acpica/acpica_20150515.bb                         |  1 +
 meta/recipes-extended/acpica/files/rename-yy_scan_string-manually.patch | 64 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-extended/acpica/files/rename-yy_scan_string-manually.patch

diff --git a/meta/recipes-extended/acpica/acpica_20150515.bb b/meta/recipes-extended/acpica/acpica_20150515.bb
index de897e1..c23b491 100644
--- a/meta/recipes-extended/acpica/acpica_20150515.bb
+++ b/meta/recipes-extended/acpica/acpica_20150515.bb
@@ -18,6 +18,7 @@ DEPENDS = "bison flex"
 
 SRC_URI = "https://acpica.org/sites/acpica/files/acpica-unix2-${PV}.tar.gz \
     file://no-werror.patch \
+    file://rename-yy_scan_string-manually.patch \
     "
 SRC_URI[md5sum] = "2bc4a7ccc82de9df9fa964f784ecb29c"
 SRC_URI[sha256sum] = "61204ec56d71bc9bfa2ee2ade4c66f7e8541772ac72ef8ccc20b3f339cc96374"
diff --git a/meta/recipes-extended/acpica/files/rename-yy_scan_string-manually.patch b/meta/recipes-extended/acpica/files/rename-yy_scan_string-manually.patch
new file mode 100644
index 0000000..b62ca25
--- /dev/null
+++ b/meta/recipes-extended/acpica/files/rename-yy_scan_string-manually.patch
@@ -0,0 +1,64 @@
+From 2ab61e6ad5a9cfcde838379bc36babfaaa61afb8 Mon Sep 17 00:00:00 2001
+From: Patrick Ohly <patrick.ohly@intel.com>
+Date: Fri, 20 Jan 2017 13:50:17 +0100
+Subject: [PATCH] rename yy_scan_string manually
+
+flex 2.6.0 used to generate code where yy_scan_string was mapped
+to <custom prefix>_scan_string directly in the generated .c code.
+
+For example, generate/unix/iasl/obj/prparserlex.c:
+
+int
+PrInitLexer (
+    char                    *String)
+{
+
+    LexBuffer = PrParser_scan_string (String);
+    return (LexBuffer == NULL);
+}
+
+flex 2.6.3 no longer does that, leading to a compiler warning
+and link error about yy_scan_string().
+
+Both versions generate a preamble in the beginning of prparserlex.c
+that maps several yy_* names, but yy_scan_string is not among those:
+
+...
+...
+
+Upstream-Status: Inappropriate [workaround for https://github.com/westes/flex/issues/164]
+Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
+---
+ source/compiler/dtparser.l | 2 +-
+ source/compiler/prparser.l | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/source/compiler/dtparser.l b/source/compiler/dtparser.l
+index 3f4c2f3..eaa43ff 100644
+--- a/source/compiler/dtparser.l
++++ b/source/compiler/dtparser.l
+@@ -120,7 +120,7 @@ DtInitLexer (
+     char                    *String)
+ {
+ 
+-    LexBuffer = yy_scan_string (String);
++    LexBuffer = DtParser_scan_string (String);
+     return (LexBuffer == NULL);
+ }
+ 
+diff --git a/source/compiler/prparser.l b/source/compiler/prparser.l
+index 10bd130..9cb3573 100644
+--- a/source/compiler/prparser.l
++++ b/source/compiler/prparser.l
+@@ -127,7 +127,7 @@ PrInitLexer (
+     char                    *String)
+ {
+ 
+-    LexBuffer = yy_scan_string (String);
++    LexBuffer = PrParser_scan_string (String);
+     return (LexBuffer == NULL);
+ }
+ 
+-- 
+2.11.0
+
-- 
git-series 0.9.1

