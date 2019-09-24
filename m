Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id 1B5167F284
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 02:50:07 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id g3so345657pgs.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 19:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=fvUDpFi44QMFi2MN1XRqzTYpulu2pHOv5HzGABEdhwI=;
	b=a1osMvpMe5iL94E55XZOJCJaID7bNCzLpTvEc1imJaW6G05SVdzRaXrzH7vs5vsBWG
	/3ts2wQpv4uxhxcEPZU02u/F8iUa+jJHrWTyt+zQPdwwGnv1lXlaUfelGarTipiypdv0
	2BcER++BkVtxWI3mvyQrNqZObqUnU4DSw2PTbiEcirTnq30rVGy4gpxVinybnt+OwuYO
	y9zcLbV2A7t1mbg6T3YkXtYM/PT8lfjccdeNokKW1QooqIFbfspWJc2bSGzvj9hueXC2
	K6hLra7cHdhDPv3HLbpZFo05QTUPuaPc+mm9WwjuIVprJ5RmCgGl3no/HGqjSy/X5WXT
	MgZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=fvUDpFi44QMFi2MN1XRqzTYpulu2pHOv5HzGABEdhwI=;
	b=VuJ+nhhB4Uu0g0/wc7BlxsKs2AC9hlulj2z/UcLllwVMLqrbhxP/FFce1cX2rqLg5Q
	9oqfe7urJp5U0WNaWe9+LIkrv8YqwrifxXdl1SUVzeZHZ2LquPu3jnMJf5qBQ5bnAXhW
	P/F0lzg+DkpOGB301Tyf1/UBCyHmDxekeXm1OVKqy/yyYZ++2SrZv85S4AJHhMTG/eVr
	PmJ5qLSSkawmEP343ReVpwQQTo+NETKElbNxV3a1HMsjh9z46Hs0btqMjtb6R4mBQdK3
	83RSEkdifcc/3mz0nwd0kn5oyrMiMCBtynH2sKjxsTPK59/jRClptxaujuLUaV75MDQw
	HSRw==
X-Gm-Message-State: APjAAAWPo7y/rzLCbGQVBLfQaahHgchHXxLVMcOzQxTOvLhaam009Mkg
	pzjOhfVqC/7hSdMVU7Fzaz6pwDdkMCA=
X-Google-Smtp-Source: APXvYqyx8IugClAzQAj+UIouPMzoAYA4s5rssCx7eWW/r3oUr9M4RwpDLpp/tB8tdJnrT73bFDIS5Q==
X-Received: by 2002:a62:82c8:: with SMTP id w191mr678860pfd.99.1569293408090; 
	Mon, 23 Sep 2019 19:50:08 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:ec07:55c0:9c8c:b3de])
	by smtp.gmail.com with ESMTPSA id
	q204sm146791pfc.11.2019.09.23.19.50.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Sep 2019 19:50:07 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Sep 2019 19:49:14 -0700
Message-Id: <65631a048f57965745dc8cc23cb80c4c3a71ba94.1569292053.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569292053.git.akuster808@gmail.com>
References: <cover.1569292053.git.akuster808@gmail.com>
Subject: [warrior][ 34/50] pango: fix CVE-2019-1010238
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
X-List-Received-Date: Tue, 24 Sep 2019 02:50:07 -0000

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


