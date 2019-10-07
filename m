Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
	[209.85.210.174])
	by mail.openembedded.org (Postfix) with ESMTP id 9764F7F351
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 15:11:32 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id b128so8883589pfa.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Oct 2019 08:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=h35ci2H/+cb0xy9RjQGEwYkXDdYAOp+7zmzxLqNHerk=;
	b=IRG8B7RUtpAn00R8JmbHZqB84f4rFguu72BK2T7pBKgp0CnCIu6Q1+QP4bXOO4hPBr
	X/o6gIHlYZTt49JMAbVx2d+Izns60qp3r0TE+Jb5PrGwQtDjaNMd0xA1cEJYe8u7XeCA
	UkmS965TA5N/0utvakd0wW9Q3dRP0f7/7F9RP7Woa+A/BUlfhWpgM+nQrz37Jtpi47XY
	Ei95R4WtlopCP2xVOB7bVUXbQRQRul1k8dnEBXrUaaLnnRKMCQHC2+gXn3BHAiCvNVn/
	t1HYGpfhypGn1iqwbrrKNxZ9QhQxsv11jF79RG2j5h81emDk1r7OCTLSY9sNKYnhFb1e
	hmLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=h35ci2H/+cb0xy9RjQGEwYkXDdYAOp+7zmzxLqNHerk=;
	b=fQJVzB4Ied6E9uQm7AJ0+6cOWX8hlAlQsU1K9pJs9YXH59FoIg/epCGdyma3fVGBh1
	rw9iO5wHiKZuPfODhiVdMiaUIsIz6rS8u+i8WI0C9LkQVbKq+HAPC/MAj0IfCaZcqF01
	gARneu8Riuyw3AS1TXcd93e7keFpn0xLL5bTjMpCeFaA+96w12euzBZJl070CsrQ/Hw7
	VPvhFw+foC2j/jepdiI357XcqNuItxMAjeWIjGi29x3YtA2g/zUOxfT4L/gGtuDvdFQq
	tJyec/1o+r9ZRv/1/DEFbhvT9eezdX/1t+WrDHcH0GKnbr8TIikyTmVwsoN1iQCBTQCK
	fwKA==
X-Gm-Message-State: APjAAAXngtNbX+P6aDSVSg2nFt7X1fLE20rhWbJ4hZjCqOn+BDuzD8iv
	OsIRXiSuK9Ma25qMeERuFOAuGVS5oX4=
X-Google-Smtp-Source: APXvYqwEZnoAlJpdRWqp2s2Q8HgrmOtU96Zw19hNXPBgoOq4u+JEoztJ9UstM0l/Nty5bdZGIrUD5w==
X-Received: by 2002:a63:1420:: with SMTP id u32mr15990914pgl.62.1570461093336; 
	Mon, 07 Oct 2019 08:11:33 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:65e8:7322:d189:1d85])
	by smtp.gmail.com with ESMTPSA id
	m102sm12786928pje.5.2019.10.07.08.11.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 07 Oct 2019 08:11:32 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Oct 2019 08:11:02 -0700
Message-Id: <20b23cb40917b1c83b862817b13f0eefc8fa7a64.1570460789.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1570460789.git.akuster808@gmail.com>
References: <cover.1570460789.git.akuster808@gmail.com>
Subject: [thud 25/26] pango: fix CVE-2019-1010238
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
X-List-Received-Date: Mon, 07 Oct 2019 15:11:32 -0000

From: Anuj Mittal <anuj.mittal@intel.com>

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit 65631a048f57965745dc8cc23cb80c4c3a71ba94)
[Fix up for thud context]
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
index 22fe3af..f6a3a5a 100644
--- a/meta/recipes-graphics/pango/pango_1.42.4.bb
+++ b/meta/recipes-graphics/pango/pango_1.42.4.bb
@@ -15,7 +15,9 @@ inherit gnomebase gtk-doc ptest-gnome upstream-version-is-even gobject-introspec
 
 SRC_URI += "file://run-ptest \
             file://0001-Enforce-recreation-of-docs-pango.types-it-is-build-c.patch \
-"
+            file://CVE-2019-1010238.patch \
+            "
+
 SRC_URI[archive.md5sum] = "deb171a31a3ad76342d5195a1b5bbc7c"
 SRC_URI[archive.sha256sum] = "1d2b74cd63e8bd41961f2f8d952355aa0f9be6002b52c8aa7699d9f5da597c9d"
 
-- 
2.7.4


