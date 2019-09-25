Return-Path: <misla011@fiu.edu>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id D82817D667
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2019 23:59:01 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id o12so693649qtf.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2019 16:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=fiu-edu.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version:reply-to
	:content-transfer-encoding;
	bh=xRqQcCUX2EykijNf/09m5E7rfYI5UKHwTkWZgkszI9w=;
	b=nIqSZeb7WG5MT8pDYcJr7LKoLE/PaC+yVaI9N+Td+3DpkJZNUKEIRHoOSK4I3gLWVS
	O2sed8ydGaZ7DRfMHUapmceCJS0XMttVDx7fKgA0T078aoQYTARr3+lUXI1umME7x3wn
	Xl83VcKflKUNzLZI3QmAvZQgCSvstOUMWMccVy8G+gsNTUoH0a4WclJmbnvIxYWJ/WJ7
	NpTSOcd+f6gVFYo7wuX8Cmc1qtPLaqv9PY4rmE/bUIaujXb63H8S31/MThelwJkDfGhB
	ftwv1ksQWx13dhCYuWQV0JBWB24J3/zC/2+q4KkuvK8qijxOQg0iKWPnBODHWmWvFYjG
	g2IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:reply-to:content-transfer-encoding;
	bh=xRqQcCUX2EykijNf/09m5E7rfYI5UKHwTkWZgkszI9w=;
	b=k3DdXdGCTv6Bhmj8jEuEiHt0rr7RgcRGrhUwv4a4fOEOWqqN8lZhgR2BkJgqibM/h5
	hijK5brkiwUQT/SVTPjP/La757lVT5m6LcZBUOi7w3FDIHWC12XBEfThNYajRSQs43H8
	b7SJ5S0W2XboqRsCUG3IILE91RHex712eOk+jO3aE8DWKKjQmB4+f9Wb7uXP5ikOzuQ2
	Vqory1C0BMeJRrFCW4ltVZVUOl+CvELE2FCEDaM7ACz6GOaNMGhnMYvjqCoRrS15fk99
	Qm6AiU0mLTv0VIGP3THx9bUm/+zveHI1MMm7yhp2VYGymoAQKJnl7olV8DPelBJVJ9mh
	PsOQ==
X-Gm-Message-State: APjAAAUoxvRN8gQ0Pe1nMYp5med2HtrtTjxssw6tyQolSJFgjz+Que0/
	eV7prSxsGaW8P49a6T+iG7viGu/SE10=
X-Google-Smtp-Source: APXvYqw4zLQasd5NZLouvelxCWRbn7S6rCSkDWrl1xm6ZRn8Y8IYu1IBJmiVKixmNwTsqTsC6QF9Og==
X-Received: by 2002:a0c:eb4b:: with SMTP id c11mr402926qvq.154.1569455942468; 
	Wed, 25 Sep 2019 16:59:02 -0700 (PDT)
Received: from
	muislam-yocto.h0ebkyng4k5ejcojahceueqbfb.cx.internal.cloudapp.net
	([40.84.59.7])
	by smtp.gmail.com with ESMTPSA id l3sm341811qtc.33.2019.09.25.16.59.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 25 Sep 2019 16:59:01 -0700 (PDT)
From: Muminul Islam <misla011@fiu.edu>
X-Google-Original-From: Muminul Islam <muislam@microsoft.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Sep 2019 23:58:54 +0000
Message-Id: <20190925235854.78060-1-muislam@microsoft.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Reply-To: muislam@microsoft.com
Subject: [thud][PATCH] pango: Security fix for CVE <CVE-2019-1010238>
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
X-List-Received-Date: Wed, 25 Sep 2019 23:59:02 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Muminul Islam <muislam@microsoft.com>
---
 .../pango/pango/CVE-2019-1010238.patch        | 36 +++++++++++++++++++
 meta/recipes-graphics/pango/pango_1.42.4.bb   |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-graphics/pango/pango/CVE-2019-1010238.patch

diff --git a/meta/recipes-graphics/pango/pango/CVE-2019-1010238.patch b/meta/recipes-graphics/pango/pango/CVE-2019-1010238.patch
new file mode 100644
index 0000000000..6f51490c31
--- /dev/null
+++ b/meta/recipes-graphics/pango/pango/CVE-2019-1010238.patch
@@ -0,0 +1,36 @@
+From 9fbb967a52c6a38bc5bc8612427e805b8bf276bd Mon Sep 17 00:00:00 2001
+From: Matthias Clasen <mclasen@redhat.com>
+Date: Wed, 10 Jul 2019 20:26:23 -0400
+Subject: [PATCH] bidi: Be safer against bad input
+Reply-To: muislam@microsoft.com
+
+Don't run off the end of an array that we
+allocated to certain length.
+
+Closes: https://gitlab.gnome.org/GNOME/pango/issues/342
+Signed-off-by: Muminul Islam <muislam@microsoft.com>
+---
+ pango/pango-bidi-type.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/pango/pango-bidi-type.c b/pango/pango-bidi-type.c
+index a49e06d9..d169525e 100644
+--- a/pango/pango-bidi-type.c
++++ b/pango/pango-bidi-type.c
+@@ -179,8 +179,11 @@ pango_log2vis_get_embedding_levels (const gchar    *text,
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
+2.23.0
+
diff --git a/meta/recipes-graphics/pango/pango_1.42.4.bb b/meta/recipes-graphics/pango/pango_1.42.4.bb
index 22fe3af15d..34732fdd4b 100644
--- a/meta/recipes-graphics/pango/pango_1.42.4.bb
+++ b/meta/recipes-graphics/pango/pango_1.42.4.bb
@@ -15,6 +15,7 @@ inherit gnomebase gtk-doc ptest-gnome upstream-version-is-even gobject-introspec
 
 SRC_URI += "file://run-ptest \
             file://0001-Enforce-recreation-of-docs-pango.types-it-is-build-c.patch \
+            file://CVE-2019-1010238.patch \
 "
 SRC_URI[archive.md5sum] = "deb171a31a3ad76342d5195a1b5bbc7c"
 SRC_URI[archive.sha256sum] = "1d2b74cd63e8bd41961f2f8d952355aa0f9be6002b52c8aa7699d9f5da597c9d"
-- 
2.23.0


