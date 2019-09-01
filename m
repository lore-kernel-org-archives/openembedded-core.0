Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id B7A627F4C9
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Sep 2019 14:36:55 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id t14so5404289plr.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Sep 2019 07:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=fvUDpFi44QMFi2MN1XRqzTYpulu2pHOv5HzGABEdhwI=;
	b=F/B3BfteDeuhbhZI/pml+mL4D9eciD/pMSxtftxVppDJSVGA4LDdb7uUH6tZJ8BVmC
	f69UNW16iP1Lob5081Fq+/Mp3szhUjO/BcQctxCDTiYc/CBs5J2GQ568m4N/H126LjWh
	78legXyk6+5iwMlEbCrWsT3Vu9Lvo3ipjmCOwDYCdA4mtmPOGfJ/aEEOa7JtcYypyIeS
	oocv6gLhOwoli87GxDcpLBdbjX5cg2W9txn/aIoc01ne0h8ItswYnlM/WJCowd+lsqbe
	j8dCbFNhhkQfMJ7EbDVjiqD25iEsFLisMxMhUAUbGQ3nqG5XqtAmLpVkoG4yWVI395xw
	mW0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=fvUDpFi44QMFi2MN1XRqzTYpulu2pHOv5HzGABEdhwI=;
	b=GfLUSCKlufQXrlQkQcYw9Z4uhkf0Lbo2W/0/C6qyvVUuXQ1cbCTMRBG4BZPagvuKT8
	LIFeivsN+iwsViSVA0pabF63RM9MKKt5Tf/iemAGZg959oDhn9Ytnzm2UQAcxbjCcddi
	GRUQ0/GsPb56oIvo/4efl/t/Y/eykHbzFCXzHLtremtnfZp3V2iYxpcvUMKWm91FA7qz
	UAmSjP518rhA/zU9X4PQOSpg0dgFXCW4f2lx3tCW4MnDQpuHwej831yp5QfrU/ZaS1SM
	9TpzMpL0U7Smn48KbJ5pnpUil7PixewoZ6iF/hJ7YxDNhtnEfE+QB9DratpKRqaqY3eb
	eRvA==
X-Gm-Message-State: APjAAAUHFh3zKpD+wpDdIK1w7B1yhqpY48NPMcE26+hp7UOKeowVIphi
	d7ykVBsMWdn91M3OCsiOLS65BYU0
X-Google-Smtp-Source: APXvYqxJ8siS9Hr0FFqJC0HuBHLkiuvl1QSR28oMHCRAlJ/eDUs1hJKB76k1q1dBmH3wWMrCvQ2mPA==
X-Received: by 2002:a17:902:9348:: with SMTP id
	g8mr25961097plp.18.1567348616763; 
	Sun, 01 Sep 2019 07:36:56 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:1d53:5246:e59:bfe9])
	by smtp.gmail.com with ESMTPSA id
	s16sm15911381pfs.6.2019.09.01.07.36.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 01 Sep 2019 07:36:56 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  1 Sep 2019 07:36:12 -0700
Message-Id: <65631a048f57965745dc8cc23cb80c4c3a71ba94.1567348433.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1567348433.git.akuster808@gmail.com>
References: <cover.1567348433.git.akuster808@gmail.com>
Subject: [warrior 34/43] pango: fix CVE-2019-1010238
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
X-List-Received-Date: Sun, 01 Sep 2019 14:36:56 -0000

From: Anuj Mittal <anuj.mittal@intel.com>

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../pango/pango/CVE-2019-1010238.patch             | 38 ++++++++++++++++++++++
 meta/recipes-graphics/pango/pango_1.42.4.bb        |  4 ++-
 2 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/pango/pango/CVE-2019-1010238.patch

diff --git a/meta/recipes-graphics/pango/pango/CVE-2019-1010238.patch b/meta/recipes-graphics/pango/pango/CVE-2019-1010238.patch
new file mode 100644
index 0000000..5b0c342
--- /dev/null
+++ b/meta/recipes-graphics/pango/pango/CVE-2019-1010238.patch
@@ -0,0 +1,38 @@
+From 490f8979a260c16b1df055eab386345da18a2d54 Mon Sep 17 00:00:00 2001
+From: Matthias Clasen <mclasen@redhat.com>
+Date: Wed, 10 Jul 2019 20:26:23 -0400
+Subject: [PATCH] bidi: Be safer against bad input
+
+Don't run off the end of an array that we
+allocated to certain length.
+
+Closes: https://gitlab.gnome.org/GNOME/pango/issues/342
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/pango/commit/490f8979a260c16b1df055eab386345da18a2d54]
+CVE: CVE-2019-1010238
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ pango/pango-bidi-type.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/pango/pango-bidi-type.c b/pango/pango-bidi-type.c
+index 3e46b66c..5c02dbbb 100644
+--- a/pango/pango-bidi-type.c
++++ b/pango/pango-bidi-type.c
+@@ -181,8 +181,11 @@ pango_log2vis_get_embedding_levels (const gchar    *text,
+   for (i = 0, p = text; p < text + length; p = g_utf8_next_char(p), i++)
+     {
+       gunichar ch = g_utf8_get_char (p);
+-      FriBidiCharType char_type;
+-      char_type = fribidi_get_bidi_type (ch);
++      FriBidiCharType char_type = fribidi_get_bidi_type (ch);
++
++      if (i == n_chars)
++        break;
++
+       bidi_types[i] = char_type;
+       ored_types |= char_type;
+       if (FRIBIDI_IS_STRONG (char_type))
+-- 
+2.21.0
+
diff --git a/meta/recipes-graphics/pango/pango_1.42.4.bb b/meta/recipes-graphics/pango/pango_1.42.4.bb
index f3be9f4..1e1a5b8 100644
--- a/meta/recipes-graphics/pango/pango_1.42.4.bb
+++ b/meta/recipes-graphics/pango/pango_1.42.4.bb
@@ -16,7 +16,9 @@ GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase gtk-doc ptest-gnome upstream-version-is-even gobject-introspection
 
 SRC_URI += "file://run-ptest \
-            file://insensitive-diff.patch"
+            file://insensitive-diff.patch \
+            file://CVE-2019-1010238.patch \
+            "
 
 SRC_URI[archive.md5sum] = "deb171a31a3ad76342d5195a1b5bbc7c"
 SRC_URI[archive.sha256sum] = "1d2b74cd63e8bd41961f2f8d952355aa0f9be6002b52c8aa7699d9f5da597c9d"
-- 
2.7.4


