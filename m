Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id F0B8874834
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 01:49:36 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id 61-v6so9800262plb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Apr 2018 18:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=kY2JPdnkcv2DDoYNin4HUhISEE+HOdl7WjGLS6pYlgI=;
	b=GaNDHKwHTsUSa/Yn+BsInwzrAQ/23qI8lvL+6sjS9hkx4FAA9CtQCQKUVqzwKgeuK4
	G3ubpa9ejtvpC+jTeagYq11zzkYgANxmFfIU5iAyzfw0OZYiSadTGGurT70iwvcUR35s
	Cizi+RJrAtUtS/wjg08EWPhX4GbyC9886MGteYY1QNFl38Ib5zJyXzdP4Q+ZeOxVz/l+
	YaG681Xqs+gpAld2vS4zTWO0Qa9Rrd2rXcidV8zezXRwNS2vRSKB5U1k5mjO7pBhKzJa
	cyrPs8mU2Xks5Q90sFwksDpOXx+LWkwGirZCgvud53kakQsi5n3dg22qs4pOe/+Ls5BT
	xG7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=kY2JPdnkcv2DDoYNin4HUhISEE+HOdl7WjGLS6pYlgI=;
	b=Xn6foCBJTaM234VyIx2cUYaf2qWNsUEOt09CEpAYs0bkYDmro45+JtjbHa/Nt1bcUM
	W6WOOjckoXUukB5k1tLUpFi8dpyKoba/Z9XwUUMFZfM2a9fWQ9AgG3QdokuPNJ/LyGV5
	o71gnSReGHUntoHmUNIO34Ff80aZSjQNw8/D46054EuFrJi0Mq5W7IMYyqBDff8qoqXL
	c06frRPw/rDvLHWBsSFtVwRNyh1OcTgPMd9TnsJdk+SMjYksN5BNewp4DhkqNoW7v0Xf
	GwwVrsADTub2gnUfsmRsXHvqlrNjDy1f5//PPaGF6tDFdEPV0qWSpoRBJFHXC/N30XNI
	0CWg==
X-Gm-Message-State: ALQs6tBKODcjMXtX8LiMQTZpfRkac56Xj6a76ApRfHx3KiN6vb1DvjXe
	BW+3S8Ic4l+qHuXk/t0ZZeJgGA==
X-Google-Smtp-Source: AIpwx4/H7jue+ac9h09GG3I5PfH5TnpodAUDFRWu1Hy04s2Q8lBVfWj4EhhRXwml2qsZdQLT42c7mA==
X-Received: by 10.99.126.71 with SMTP id o7mr1956068pgn.366.1522806578132;
	Tue, 03 Apr 2018 18:49:38 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:a4f3:7c10:9123:63ea])
	by smtp.gmail.com with ESMTPSA id
	d8sm7485877pfh.177.2018.04.03.18.49.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 03 Apr 2018 18:49:37 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Tue,  3 Apr 2018 18:49:14 -0700
Message-Id: <cde9056566627d7ddbbc246a5c715b5bd436daef.1522806183.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1522806183.git.akuster808@gmail.com>
References: <cover.1522806183.git.akuster808@gmail.com>
Subject: [PATCH 15/21] libxcb: update to 1.13
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
X-List-Received-Date: Wed, 04 Apr 2018 01:49:37 -0000

From: Armin Kuster <akuster@mvista.com>

patch 0001-include-stdint.h-for-SSIZE_MAX-and-SIZE_MAX-definiti.patch remove
as it is included in update

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../Fix-inconsistent-use-of-tabs-vs.-space.patch   | 62 ----------------------
 .../xorg-lib/{libxcb_1.12.bb => libxcb_1.13.bb}    |  6 +--
 2 files changed, 3 insertions(+), 65 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libxcb/Fix-inconsistent-use-of-tabs-vs.-space.patch
 rename meta/recipes-graphics/xorg-lib/{libxcb_1.12.bb => libxcb_1.13.bb} (85%)

diff --git a/meta/recipes-graphics/xorg-lib/libxcb/Fix-inconsistent-use-of-tabs-vs.-space.patch b/meta/recipes-graphics/xorg-lib/libxcb/Fix-inconsistent-use-of-tabs-vs.-space.patch
deleted file mode 100644
index 8992386..0000000
--- a/meta/recipes-graphics/xorg-lib/libxcb/Fix-inconsistent-use-of-tabs-vs.-space.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 8740a288ca468433141341347aa115b9544891d3 Mon Sep 17 00:00:00 2001
-From: Thomas Klausner <wiz@NetBSD.org>
-Date: Thu, 19 May 2016 17:31:18 +0200
-Subject: [PATCH] Fix inconsistent use of tabs vs. space.
-
-Needed for at least python-3.5.x.
-
-Signed-off-by: Thomas Klausner <wiz@NetBSD.org>
-Signed-off-by: Uli Schlachter <psychon@znc.in>
-
-Upstream-Status: Backport
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- src/c_client.py | 14 +++++++-------
- 1 file changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/src/c_client.py b/src/c_client.py
-index 57de3fb..043338d 100644
---- a/src/c_client.py
-+++ b/src/c_client.py
-@@ -1364,7 +1364,7 @@ def _c_serialize(context, self):
-             _c('    unsigned int xcb_align_to = 0;')
-         if self.is_switch:
-             _c('    unsigned int xcb_padding_offset = %d;',
--	       self.get_align_offset() )
-+               self.get_align_offset() )
-         prefix = [('_aux', '->', self)]
-         aux_ptr = 'xcb_out'
- 
-@@ -1390,7 +1390,7 @@ def _c_serialize(context, self):
-         _c('    unsigned int xcb_align_to = 0;')
-         if self.is_switch:
-             _c('    unsigned int xcb_padding_offset = %d;',
--	       self.get_align_offset() )
-+               self.get_align_offset() )
- 
-     elif 'sizeof' == context:
-         param_names = [p[2] for p in params]
-@@ -1930,14 +1930,14 @@ def _c_accessors_list(self, field):
-                     # from the request size and divide that by the member size
-                     return '(((R->length * 4) - sizeof('+ self.c_type + '))/'+'sizeof('+field.type.member.c_wiretype+'))'
-                 else:
--		    # use the accessor to get the start of the list, then
--		    # compute the length of it by subtracting it from
-+                    # use the accessor to get the start of the list, then
-+                    # compute the length of it by subtracting it from
-                     # the adress of the first byte after the end of the
-                     # request
--		    after_end_of_request = '(((char*)R) + R->length * 4)'
--		    start_of_list = '%s(R)' % (field.c_accessor_name)
-+                    after_end_of_request = '(((char*)R) + R->length * 4)'
-+                    start_of_list = '%s(R)' % (field.c_accessor_name)
-                     bytesize_of_list = '%s - (char*)(%s)' % (after_end_of_request, start_of_list)
--		    return '(%s) / sizeof(%s)' % (bytesize_of_list, field.type.member.c_wiretype)
-+                    return '(%s) / sizeof(%s)' % (bytesize_of_list, field.type.member.c_wiretype)
-             else:
-                 raise Exception(
-                     "lengthless lists with varsized members are not supported. Fieldname '%s'"
--- 
-2.9.0
-
diff --git a/meta/recipes-graphics/xorg-lib/libxcb_1.12.bb b/meta/recipes-graphics/xorg-lib/libxcb_1.13.bb
similarity index 85%
rename from meta/recipes-graphics/xorg-lib/libxcb_1.12.bb
rename to meta/recipes-graphics/xorg-lib/libxcb_1.13.bb
index a38bdea..04b58ea 100644
--- a/meta/recipes-graphics/xorg-lib/libxcb_1.12.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcb_1.13.bb
@@ -13,10 +13,10 @@ SRC_URI = "http://xcb.freedesktop.org/dist/libxcb-${PV}.tar.bz2 \
            file://xcbincludedir.patch \
            file://disable-check.patch \
            file://gcc-mips-pr68302-mips-workaround.patch \
-           file://Fix-inconsistent-use-of-tabs-vs.-space.patch \
           "
-SRC_URI[md5sum] = "28e552bd78bc1050b6b26ca1db0e5bb6"
-SRC_URI[sha256sum] = "4adfb1b7c67e99bc9c2ccb110b2f175686576d2f792c8a71b9c8b19014057b5b"
+
+SRC_URI[md5sum] = "c2b6cf928afa16b0047c974e7aaa783f"
+SRC_URI[sha256sum] = "188c8752193c50ff2dbe89db4554c63df2e26a2e47b0fa415a70918b5b851daa"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.7.4


