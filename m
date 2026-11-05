Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30082.1793868246605643417
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 00:44:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=kQ87LRNh;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48df54150dfso1074500f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 00:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793868245; x=1794473045; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HKL6iTPtb+Be1lksOqCsXglz3shWahHFpJ/HYdbxWTs=;
        b=kQ87LRNhEymJYhLEOu1/xSgQXWqW1SBb52uYFkuNqxS2/L04s9Tt8lZxjuTnKRBf5O
         fUt2oIWKtSemK57Jdx5GnEokOIdQ4R8SeTRNZG8MEwO6a7YvE/B+HMzIitFLRahXS3V/
         OvUIeZR2j8IOmyR/ZWZ2YErRZT8UqwxNQMWTv9zsbxOWrJ/CrbzTBVJClE05GlN0DRHS
         ig7qvvzv120/De+LXI59gOQc84rF5pCQPYEy7DOyRuSFGlG7aMS0raVPQQ6D/Sjj8x/D
         gqA1OtfhcTG3wGqJs2FddJlwKpLE9rbzJ75GlRe2ftsQRX7cLEdsqk2nGIVCW4mShy7h
         76ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868245; x=1794473045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HKL6iTPtb+Be1lksOqCsXglz3shWahHFpJ/HYdbxWTs=;
        b=CJ6Ai9yH7nyL+licrgxs87w1afR8xSsKs9Pe2Zvd12RBV7OjIRGzkFXnoe2KlTL67J
         Y81TUcsu3kDQJCUfaHIfbyBIRoK8A9Mvi3mjJH7RuaIvNY3VhudVQrw9JJKyNSivzHuR
         9QHc/AByvJwByqyw3KKcLoLjqqPPV7D1I746AY9qMK2XhVGft9jVhGQktoPmFwxa2p9X
         o9m/jNX9ma/2J6ZlTSLcWHmEVBuluImYzQ8hl84lSK3D/5oNvVlQa75I2Qh7TvxYQAg3
         0Q53t6WYy5Foo0UmIXxRbYhK6+UX34rhoeZYgsqsd5O6kjAKwkoZjqRjjmEsXuDoT7ss
         Qaww==
X-Gm-Message-State: APuU4Z/QdmgpLfgu9Ywl1xwNbRk0hjZGtXXpvZbFDzxjSFDxFDl49Wyh
	EoQtK3jOcn2FGLQZBlrfZD4O1zQY5drsOdssof4nCUC7BMdFC+8GnqZ9AXlG/YJaqGomjesv05Y
	D9+i28Qo=
X-Gm-Gg: AYBFou1S/70Tfv2YUTWlmHCFyU/LSDgAijkmnuCw1x59U+zjTKfscMX8nRzSaVyEEw/
	fbppbB9LuldJadwg0+VmOwE5Olu0UUEdtYjiXTPnEIqnI5K5iw6sMn3kViMlNxi3TjV87CZ1QGm
	vnsJLgvsBnNSr8udJeqgdgR0tSLNm41Mn5qwUpWdhGLZ4qhsngZo8SMf6Zc03b53bW6txVXkx/v
	GwAvf23TUM6HZq4IXc8zk07I42RApH9phUgT8a0P+h03N/Zbh3mmuJhJ/RoFC2stUSynoQGoF4f
	m9NUurLURFS1eoT9GbODRqjJIRVGtc+GsXQz0g0/DBFDuEVq05jo0LkxP1Ccz4HElT6/crW5MN9
	ZPz01xgIYtYKz4l+AMaez26kCQ7lrUcYL80yx+KNLG9E4piqDE8tXQJPNIlF7NPgSWJ+Gdg6r4l
	2zKI9fR47pkELxb4H1aKYXGpH2MzJiJULHERA2D7/Fk+IZhbH7aGkUbvH9M8JVk0XDEdEj7E6pu
	eLpDFYeOAASmvdcCSBLBPqHfdTO6PEFfJOIUmvr3qGY2+3KBXbXK+EmS34s6RPQMs9d+EN2EQyN
	oHu4PBQnEkM/C/XBTkcTNj+JExxsJY1bmNRGJGIBISV/Go+q38GhYxoKxHNAtxjvOlmsHpOFsPD
	qAGRNWBpsYPZu5X1dnDeNm7p12lxg
X-Received: by 2002:a05:6000:2c03:b0:48d:f034:7fcd with SMTP id ffacd0b85a97d-48e6e4fca93mr38037519f8f.51.1793868244761;
        Thu, 05 Nov 2026 00:44:04 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm9200620f8f.19.2026.11.05.00.44.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:44:04 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 50/60] piglit: Fix build with glibc 2.43+ and clang
Date: Thu,  5 Nov 2026 09:43:09 +0100
Message-ID: <b1a6151858b70f57a66ba2d785ddfe74998566e3.1793867929.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793867929.git.yoann.congal@smile.fr>
References: <cover.1793867929.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 08:44:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249509
Content-Type: text/plain; charset="utf-8"

From: Khem Raj <khem.raj@oss.qualcomm.com>

shader_runner assigns the result of strchr() on a const string to a
non-const pointer, which clang rejects now that glibc's strchr()
preserves const. Add a patch to declare the pointer const.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bf05652604a3d633e7da496d7fe96949829e55f0)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...ader_runner-Keep-strchr-result-const.patch | 31 +++++++++++++++++++
 meta/recipes-graphics/piglit/piglit_git.bb    |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-graphics/piglit/piglit/0001-shader_runner-Keep-strchr-result-const.patch

diff --git a/meta/recipes-graphics/piglit/piglit/0001-shader_runner-Keep-strchr-result-const.patch b/meta/recipes-graphics/piglit/piglit/0001-shader_runner-Keep-strchr-result-const.patch
new file mode 100644
index 00000000000..3e1a5796910
--- /dev/null
+++ b/meta/recipes-graphics/piglit/piglit/0001-shader_runner-Keep-strchr-result-const.patch
@@ -0,0 +1,31 @@
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Sat, 24 Oct 2026 10:00:00 -0700
+Subject: [PATCH] shader_runner: Keep strchr() result const
+
+The include path parsing walks a const char cursor and stores the
+result of strchr() in a plain char pointer. Since glibc 2.43, strchr()
+preserves the const qualifier of its argument when C23 features are
+enabled, which _GNU_SOURCE does, so clang fails the build:
+
+  tests/shaders/shader_runner.c:1665:10: error: initializing 'char *' with an expression of type 'const char *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
+
+line_end is only read, so declare it const.
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/piglit/-/merge_requests/1281]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ tests/shaders/shader_runner.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/shaders/shader_runner.c b/tests/shaders/shader_runner.c
+--- a/tests/shaders/shader_runner.c
++++ b/tests/shaders/shader_runner.c
+@@ -1662,7 +1662,7 @@ leave_state(enum states state, const char *line, const char *script_name)
+ 
+ 		cursor = shader_string;
+ 		for (unsigned i = 0; i < num_shader_include_paths; i++) {
+-			char *line_end = strchr(cursor, '\n');
++			const char *line_end = strchr(cursor, '\n');
+ 			unsigned path_len = line_end - cursor - 1;
+ 			char *path = malloc(path_len + 1);
+ 			path[path_len] = '\0';
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 50c4c40111f..8c3e9634f63 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -12,6 +12,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            file://0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch \
            file://0001-tests-no_error.py-modify-_command-and-not-command.patch \
            file://0001-tests-serializer-reproducible_mtime-should-be-an-int.patch \
+           file://0001-shader_runner-Keep-strchr-result-const.patch \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
