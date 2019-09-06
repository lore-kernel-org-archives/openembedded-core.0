Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id 69F2D7F3B3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2019 13:57:58 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id o184so7214675wme.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Sep 2019 06:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7CDj+LK8hkEtMyNgoh6QNO6hoJW5Q4kZWYstLXXDTIM=;
	b=JChOScTOtToDokIchaTCAYUEr5JD8bYIp5b0UlDTewWrIctrAzoWkYT9bcOpdWK8U2
	0abw2LQH02ifTYH1/4zjGTkbhiaEGHekhNOaNQVxQGrEfmpNFkS2Q4F+3N1P9VENMt+0
	iOGk4SrP+cYw4o87fj8nE5JwS4SsMT4XGpFT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7CDj+LK8hkEtMyNgoh6QNO6hoJW5Q4kZWYstLXXDTIM=;
	b=TSNQKW+1ae9S+tEpDvW4KiZJ4d62IaM4AqCQ4y0uPcNq+H/8pRmBr+QqbcyMqHUXTk
	Oe7gUK9Z9jcZFvYaKYuioIIv9Jf7eJUlbMeR8otYbyz9OfqtPwf0heqhKOFZtbbM1wg1
	hLQJxQ5SJ6cxGO6PP7/+zxoJQYYldt28JGw3YzshcBQjdsPfd7evMWSpHqVycFTIUR8c
	WQwHbqg4rlWLl7GYL8aBMSO9ZDgb7yGfT93PabOv8lmVxUr35xwFqQIQeGVSwXrAk/Zc
	JWTmjfqkPWv7Li3q492aBYdRuSoEIOKmHK95qVNl37utzXQGgB4goE0SwqL90PbL8bmN
	8Iew==
X-Gm-Message-State: APjAAAUbZYwb7AaekZKFrX5qmpt2vAABAKdiPsgewjHWaa2hKw5KpcXk
	X3SWfZKNoYU2Lo9DvU/L68w0Rnn4Pvd1cQ==
X-Google-Smtp-Source: APXvYqxyKEo/pbNGurEov5BXrIotF/3YYrYfwdb9iJfoNCVDawa2DARer8pdmn9jVemtXquXdbchTA==
X-Received: by 2002:a7b:cf25:: with SMTP id m5mr7274302wmg.25.1567778278427;
	Fri, 06 Sep 2019 06:57:58 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o9sm7373282wrh.46.2019.09.06.06.57.57
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Sep 2019 06:57:57 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Sep 2019 14:57:56 +0100
Message-Id: <20190906135756.24180-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] pango: 1.44.6 upgrade
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
X-List-Received-Date: Fri, 06 Sep 2019 13:57:59 -0000
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@intel.com>

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../pango/{pango_1.44.5.bb => pango_1.44.6.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/pango/{pango_1.44.5.bb => pango_1.44.6.bb} (91%)

diff --git a/meta/recipes-graphics/pango/pango_1.44.5.bb b/meta/recipes-graphics/pango/pango_1.44.6.bb
similarity index 91%
rename from meta/recipes-graphics/pango/pango_1.44.5.bb
rename to meta/recipes-graphics/pango/pango_1.44.6.bb
index a143723c7c6..abe90c28d78 100644
--- a/meta/recipes-graphics/pango/pango_1.44.5.bb
+++ b/meta/recipes-graphics/pango/pango_1.44.6.bb
@@ -16,8 +16,8 @@ GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase gtk-doc ptest-gnome upstream-version-is-even gobject-introspection
 
 SRC_URI += "file://run-ptest"
-SRC_URI[archive.md5sum] = "b6bf689e3ce4f46b0fd887b64c850ea1"
-SRC_URI[archive.sha256sum] = "8527dfcbeedb4390149b6f94620c0fa64e26046ab85042c2a7556438847d7fc1"
+SRC_URI[archive.md5sum] = "db0a3243ba33e02aaa775412f8e5f412"
+SRC_URI[archive.sha256sum] = "3e1e41ba838737e200611ff001e3b304c2ca4cdbba63d200a20db0b0ddc0f86c"
 
 DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
 
-- 
2.20.1


